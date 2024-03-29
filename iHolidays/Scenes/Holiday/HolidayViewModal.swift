//
//  HolidayViewModal.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 24/1/21.
//

import Foundation
import iHolidaysDomain
import RxCocoa
import RxSwift
import XCoordinator

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
    private var holiday: BehaviorRelay<Holiday>

    lazy var output: HolidayViewModelOutput = {
        transformInput()
    }()

    // MARK: Transform
    private func transformInput() -> HolidayViewModelOutput {
        dismissTrigger
            .flatMap { [router] in router.rx.trigger(.holidays) }
            .subscribe()
            .disposed(by: disposeBag)

        return HolidayViewModelOutput(holiday: holiday.asDriver())
    }

    // MARK: Stored properties

    private let router: UnownedRouter<HolidayRoute>

    // MARK: Initialization

    init(holiday: Holiday, router: UnownedRouter<HolidayRoute>) {
        self.router = router
        self.holiday = .init(value: holiday)
    }

    deinit {
        print("Deinit \(self)")
    }
}
