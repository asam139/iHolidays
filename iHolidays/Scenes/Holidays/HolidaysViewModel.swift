//
//  HolidaysViewModel.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 24/1/21.
//

import Foundation
import iHolidaysDomain
import RxSwift
import Swinject
import XCoordinator

class HolidaysViewModel: ViewModelType {
    private let disposeBag = DisposeBag()

    // MARK: Inputs
    private lazy var fetchHolidays = PublishSubject<Void>()
    private lazy var selectHoliday = PublishSubject<Holiday>()

    lazy var input: Input = {
        Input(
            fetchHolidaysTrigger: fetchHolidays.asObserver(),
            selectHoliday: selectHoliday.asObserver()
        )
    }()

    // MARK: Outputs
    private lazy var sectionsSub = PublishSubject<[Section]>()

    lazy var output: Output = {
        transformInput()
    }()

    // MARK: Transform
    func transformInput() -> Output {
        fetchHolidays
            .flatMap { [fetchHolidaysUseCase] in fetchHolidaysUseCase.getHolidays(country: "ES", year: 2020) }
            .flatMap { [fetchPicsumUseCase] array -> Single<[HolidayWithImage]> in
                let array = array.map {
                    Observable.combineLatest(
                        Observable.just($0),
                        fetchPicsumUseCase.getRandomImage().asObservable()
                    ).map { HolidayWithImage(holiday: $0.0, imageURL: $0.1) }
                }
                return Observable.from(array).merge().toArray()
            }
            .map { [Section(header: "", items: $0)] }
            .bind(to: sectionsSub)
            .disposed(by: disposeBag)

        selectHoliday
            .flatMap { [router] in router.rx.trigger(.holiday($0)) }
            .subscribe().disposed(by: disposeBag)

        return Output(sections: sectionsSub.asObservable())
    }

    // MARK: Stored properties

    private let router: UnownedRouter<HolidaysRoute>
    private let fetchHolidaysUseCase: FetchHolidaysUseCase
    private let fetchPicsumUseCase: FetchPicsumUseCase

    // MARK: Initialization

    init(router: UnownedRouter<HolidaysRoute>, resolver: Resolver) {
        self.router = router
        self.fetchHolidaysUseCase = resolver.resolve(FetchHolidaysUseCase.self)!
        self.fetchPicsumUseCase = resolver.resolve(FetchPicsumUseCase.self)!
    }

    deinit {
        print("Deinit \(self)")
    }
}
