//
//  HomeTabCoordinator.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 24/1/21.
//

import UIKit
import XCoordinator

enum HomeRoute: Route {
    case holidays
}

class HomeTabCoordinator: TabBarCoordinator<HomeRoute> {

    // MARK: Stored properties

    private let holidaysRouter: StrongRouter<HolidaysRoute>
    //private let userListRouter: StrongRouter<UserListRoute>

    // MARK: Initialization

    convenience init() {
        let holidaysCoordinator = HolidaysCoordinator(rootViewController: .init())
        holidaysCoordinator.rootViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .recents, tag: 0)

        self.init(holidaysRouter: holidaysCoordinator.strongRouter)
    }

    init(holidaysRouter: StrongRouter<HolidaysRoute>) {
        self.holidaysRouter = holidaysRouter

        super.init(tabs: [holidaysRouter], select: holidaysRouter)
    }

    // MARK: Overrides

    override func prepareTransition(for route: HomeRoute) -> TabBarTransition {
        switch route {
        case .holidays:
            return .select(holidaysRouter)
        }
    }

}
