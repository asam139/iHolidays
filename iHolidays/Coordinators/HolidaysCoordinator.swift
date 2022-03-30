//
//  HolidaysCoordinator.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 24/1/21.
//

import iHolidaysDomain
import Swinject
import UIKit
import XCoordinator

enum HolidaysRoute: Route {
    case home
    case holiday(Holiday)
}

class HolidaysCoordinator: NavigationCoordinator<HolidaysRoute> {
    private let resolver: Resolver

    // MARK: Initialization

    init(rootViewController: UINavigationController, resolver: Resolver) {
        self.resolver = resolver
        super.init(rootViewController: rootViewController, initialRoute: nil)
        trigger(.home)
    }

    // MARK: Overrides

    override func prepareTransition(for route: HolidaysRoute) -> NavigationTransition {
        switch route {
        case .home:
            let viewController = HolidaysViewController(nib: R.nib.holidaysViewController)
            let viewModel = resolver.resolve(HolidaysViewModel.self, argument: unownedRouter)!
            viewController.bind(to: viewModel)
            return .push(viewController, animation: .pushWithCurveEaseOut)
        case .holiday(let holiday):
            let coordinator = HolidayCoordinator(rootViewController: rootViewController, holiday: holiday, resolver: resolver)
            addChild(coordinator)
            return .none() // .present(coordinator, animation: .pushWithCurveEaseOut)
        }
    }

    // MARK: Actions

}
