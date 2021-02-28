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
    private let assembler: Assembler

    // MARK: Initialization
    init(rootViewController: UINavigationController, holiday: Holiday, assembler: Assembler) {
        self.assembler = assembler
        super.init(rootViewController: rootViewController, initialRoute: nil)
        trigger(.home(holiday))
    }

    // MARK: Overrides

    override func prepareTransition(for route: HolidayRoute) -> NavigationTransition {
        switch route {
        case let .home(holiday):
            let viewController = HolidayViewController(nib: R.nib.holidayViewController)
            let viewModel = assembler.resolver.resolve(HolidayViewModel.self, arguments: holiday, unownedRouter)!
            viewController.bind(to: viewModel)
            return .push(viewController, animation: .navigation)
        case .holidays:
            return .pop()
        }
    }
}
