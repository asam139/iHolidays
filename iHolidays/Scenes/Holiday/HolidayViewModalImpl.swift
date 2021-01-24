//
//  HolidayViewModalImpl.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 24/1/21.
//

import Foundation
import RxSwift
import XCoordinator
import XCoordinatorRx

class HolidayViewModelImpl: HolidayViewModel, TransformableType {
    
    let disposeBag = DisposeBag()

    // MARK: Inputs
    private lazy var action = PublishSubject<HolidayViewModelAction>()
    
    lazy var input: HolidayViewModelInput = {
        let input = HolidayViewModelInput(action: action.asObserver())
        return input
    }()
    
    // MARK: Outputs
    private var holiday: Observable<String>
    
    lazy var output: HolidayViewModelOutput = {
        transform(input: input)
    }()
    
    // MARK: Transform
    func transform(input: HolidayViewModelInput) -> HolidayViewModelOutput {
        return HolidayViewModelOutput(holiday: holiday)
    }

    // MARK: Stored properties

    private let router: UnownedRouter<HolidayRoute>

    // MARK: Initialization
    
    init(router: UnownedRouter<HolidayRoute>, holiday: String) {
        self.router = router
        self.holiday = .just(holiday)
    }

}
