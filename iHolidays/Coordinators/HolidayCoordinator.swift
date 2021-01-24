//
//  HolidayCoordinator.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 24/1/21.
//

import UIKit
import XCoordinator
import XCoordinatorRx

enum HolidayRoute: Route {
    case holiday(String)
    case holidays
}

class HolidayCoordinator: NavigationCoordinator<HolidayRoute> {

    // MARK: Initialization

    init(holiday: String) {
        super.init(initialRoute: .holiday(holiday))
    }

    // MARK: Overrides

    override func prepareTransition(for route: HolidayRoute) -> NavigationTransition {
        switch route {
        case let .holiday(holiday):
            let viewController = HolidayViewController(nibName: "HolidayViewController", bundle: nil)
            let viewModel = HolidayViewModelImpl(router: unownedRouter, holiday: holiday)
            viewController.bind(to: viewModel)
            return .push(viewController)
        case .holidays:
            return .dismiss()
        }
    }
}
