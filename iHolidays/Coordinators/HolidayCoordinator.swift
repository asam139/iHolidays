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
    case home(String)
    case holidays
}

class HolidayCoordinator: NavigationCoordinator<HolidayRoute> {

    // MARK: Initialization
    init(rootViewController: UINavigationController, holiday: String) {
        super.init(rootViewController: rootViewController, initialRoute: nil)
        trigger(.home(holiday))
    }

    // MARK: Overrides

    override func prepareTransition(for route: HolidayRoute) -> NavigationTransition {
        switch route {
        case let .home(holiday):
            let viewController = HolidayViewController(nibName: "HolidayViewController", bundle: nil)
            let viewModel = HolidayViewModelImpl(router: unownedRouter, holiday: holiday)
            viewController.bind(to: viewModel)
            return .push(viewController)
        case .holidays:
            return .pop()
        }
    }
}
