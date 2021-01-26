//
//  HolidaysViewModel.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 24/1/21.
//

import Foundation
import RxSwift
import XCoordinator
import Swinject
import iHolidaysDomain

class HolidaysViewModel: ViewModelType {
    let disposeBag = DisposeBag()

    // MARK: Inputs
    private lazy var fetchHolidays = PublishSubject<Void>()
    private lazy var selectHoliday = PublishSubject<Holiday>()
    
    lazy var input: HolidaysViewModelInput = {
        HolidaysViewModelInput(
            fetchHolidaysTrigger: fetchHolidays.asObserver(),
            selectHoliday: selectHoliday.asObserver()
        )
    }()
    
    // MARK: Outputs
    private lazy var holidaysSub = PublishSubject<[Holiday]>()
    
    lazy var output: HolidaysViewModelOutput = {
        transformInput()
    }()
    
    // MARK: Transform
    func transformInput() -> HolidaysViewModelOutput {
        
        fetchHolidays
            .flatMap { [userUseCase] in userUseCase.getHolidays(country: "ES", year: 2020) }
            .bind(to: holidaysSub)
            .disposed(by: disposeBag)
        
        selectHoliday
            .flatMap { [router] in router.rx.trigger(.holiday($0)) }
            .subscribe().disposed(by: disposeBag)

        return HolidaysViewModelOutput(holidays: holidaysSub.asObservable())
    }

    // MARK: Stored properties

    private let router: UnownedRouter<HolidaysRoute>
    private let userUseCase: UserUseCase

    // MARK: Initialization

    init(router: UnownedRouter<HolidaysRoute>, resolver: Resolver) {
        self.router = router
        self.userUseCase = resolver.resolve(UserUseCase.self)!
    }
    
    deinit {
        print("Deinit \(self)")
    }
}
