//
//  HolidayCoordinator.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 24/1/21.
//

import iHolidaysDomain
import Swinject
import UIKit
import XCoordinator

enum HolidayRoute: Route {
    case home(Holiday)
    case holidays
}

class HolidayCoordinator: NavigationCoordinator<HolidayRoute> {
    private let resolver: Resolver

    // MARK: Initialization
    init(rootViewController: UINavigationController, holiday: Holiday, resolver: Resolver) {
        self.resolver = resolver
        super.init(rootViewController: rootViewController, initialRoute: nil)
        trigger(.home(holiday))
    }

    override func prepareTransition(for route: HolidayRoute) -> NavigationTransition {
        switch route {
        case let .home(holiday):
            let viewController = HolidayViewController()
            let viewModel = HolidayViewModel(holiday: holiday, router: unownedRouter)
            viewController.bind(to: viewModel)
            return .push(viewController, animation: .pushWithCurveEaseOut)
        case .holidays:
            return .pop()
        }
    }
}
