//
//  HolidayViewModal.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 24/1/21.
//

import Foundation
import RxSwift
import XCoordinator
import iHolidaysDomain

class HolidayViewModel: ViewModelType {
    
    let disposeBag = DisposeBag()

    // MARK: Inputs
    private lazy var dismissTrigger = PublishSubject<Void>()
        
    lazy var input: HolidayViewModelInput = {
        HolidayViewModelInput(
            dismissTrigger: dismissTrigger.asObserver()
        )
    }()
    
    // MARK: Outputs
    private var holiday: Observable<Holiday>
    
    lazy var output: HolidayViewModelOutput = {
        transformInput()
    }()
    
    // MARK: Transform
    func transformInput() -> HolidayViewModelOutput {
        
        dismissTrigger
            .flatMap { [router] in router.rx.trigger(.holidays)}
            .subscribe()
            .disposed(by: disposeBag)
        
        return HolidayViewModelOutput(holiday: holiday)
    }

    // MARK: Stored properties

    private let router: UnownedRouter<HolidayRoute>

    // MARK: Initialization
    
    init(holiday: Holiday, router: UnownedRouter<HolidayRoute>) {
        self.router = router
        self.holiday = .just(holiday)
    }

    deinit {
        print("Deinit \(self)")
    }
}
