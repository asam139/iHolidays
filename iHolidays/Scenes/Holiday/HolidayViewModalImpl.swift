//
//  HolidayViewModalImpl.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 24/1/21.
//

import Foundation
import RxSwift
import Action
import XCoordinator
import XCoordinatorRx

class HolidayViewModelImpl: HolidayViewModel {
    
    let disposeBag = DisposeBag()

    // MARK: Inputs
    private lazy var action = PublishSubject<HolidayViewModelAction>()
    
    private lazy var route = Action<HolidayRoute, Void> { [router] in
        router.rx.trigger($0)
    }
    
    lazy var input: HolidayViewModelInput = {
        let input = HolidayViewModelInput(action: action.asObserver())
        return input
    }()
    
    // MARK: Outputs
    private var holiday: Observable<String>
    
    lazy var output: HolidayViewModelOutput = {
        transformInput()
    }()
    
    // MARK: Transform
    func transformInput() -> HolidayViewModelOutput {
        
        action.filter { $0 == .done }
            .map { _ in HolidayRoute.holidays }
            .bind(to: route.inputs)
            .disposed(by: disposeBag)
        
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
