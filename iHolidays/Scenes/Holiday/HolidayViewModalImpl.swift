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
    private lazy var dismissTrigger = PublishSubject<Void>()
        
    lazy var input: HolidayViewModelInput = {
        HolidayViewModelInput(
            dismissTrigger: dismissTrigger.asObserver()
        )
    }()
    
    // MARK: Outputs
    private var holiday: Observable<String>
    
    lazy var output: HolidayViewModelOutput = {
        transformInput()
    }()
    
    // MARK: Actions
    
    private lazy var route = Action<HolidayRoute, Void> { [router] in
        router.rx.trigger($0)
    }
    
    // MARK: Transform
    func transformInput() -> HolidayViewModelOutput {
        
        dismissTrigger
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
