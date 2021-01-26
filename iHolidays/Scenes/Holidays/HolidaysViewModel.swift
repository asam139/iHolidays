//
//  HolidaysViewModel.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 24/1/21.
//

import Foundation
import RxSwift
import Action
import XCoordinator
import iHolidaysDomain
import Swinject

class HolidaysViewModel: ViewModelType {
    let disposeBag = DisposeBag()

    // MARK: Inputs
    private lazy var fetchHolidays = PublishSubject<Void>()
    
    lazy var input: HolidaysViewModelInput = {
        HolidaysViewModelInput(
            fetchHolidaysTrigger: fetchHolidays.asObserver(),
            selectHoliday: selectHolidayAction.inputs
        )
    }()
    
    // MARK: Actions
    
    lazy var selectHolidayAction = Action<Holiday, Void> { [unowned self] holiday in
        self.router.rx.trigger(.holiday(holiday.name))
    }
    
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
}
