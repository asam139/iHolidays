//
//  HolidaysViewModelImpl.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 24/1/21.
//

import Foundation
import RxSwift
import Action
import XCoordinator
import XCoordinatorRx

class HolidaysViewModelImpl: HolidaysViewModel {
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
    
    lazy var selectHolidayAction = Action<String, Void> { [unowned self] holiday in
        self.router.rx.trigger(.holiday(holiday))
    }
    
    // MARK: Outputs
    private lazy var holidaysSub = PublishSubject<[String]>()
    
    lazy var output: HolidaysViewModelOutput = {
        transformInput()
    }()
    
    // MARK: Transform
    func transformInput() -> HolidaysViewModelOutput {
        
        fetchHolidays
            .map { _ in ["1", "2", "3"]}
            .bind(to: holidaysSub)
            .disposed(by: disposeBag)

        
        return HolidaysViewModelOutput(holidays: holidaysSub.asObservable())
    }

    // MARK: Stored properties

    private let router: UnownedRouter<HolidaysRoute>

    // MARK: Initialization

    init(router: UnownedRouter<HolidaysRoute>) {
        self.router = router
    }

}
