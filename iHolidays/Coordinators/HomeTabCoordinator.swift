//
//  HomeTabCoordinator.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 24/1/21.
//

import Swinject
import UIKit
import XCoordinator

enum HomeRoute: Route {
    case holidays
}

class HomeTabCoordinator: TabBarCoordinator<HomeRoute> {
    // MARK: Stored properties
    private let holidaysRouter: StrongRouter<HolidaysRoute>

    // MARK: Initialization

    convenience init(resolver: Resolver) {
        let holidaysCoordinator = HolidaysCoordinator(rootViewController: .init(), resolver: resolver)
        holidaysCoordinator.rootViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .recents, tag: 0)

        self.init(holidaysRouter: holidaysCoordinator.strongRouter)
    }

    init(holidaysRouter: StrongRouter<HolidaysRoute>) {
        self.holidaysRouter = holidaysRouter

        super.init(tabs: [holidaysRouter], select: holidaysRouter)
    }

    override func prepareTransition(for route: HomeRoute) -> TabBarTransition {
        switch route {
        case .holidays:
            return .select(holidaysRouter)
        }
    }
}
