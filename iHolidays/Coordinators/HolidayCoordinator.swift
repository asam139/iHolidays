//
//  HolidayCoordinator.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 24/1/21.
//

import UIKit
import XCoordinator
import Swinject

enum HolidayRoute: Route {
    case home(String)
    case holidays
}

class HolidayCoordinator: NavigationCoordinator<HolidayRoute> {
    
    private let assembler: Assembler

    // MARK: Initialization
    init(rootViewController: UINavigationController, holiday: String, assembler: Assembler) {
        self.assembler = assembler
        super.init(rootViewController: rootViewController, initialRoute: nil)
        trigger(.home(holiday))
    }

    // MARK: Overrides

    override func prepareTransition(for route: HolidayRoute) -> NavigationTransition {
        switch route {
        case let .home(holiday):
            let viewController = HolidayViewController(nibName: "HolidayViewController", bundle: nil)
            let viewModel = assembler.resolver.resolve(HolidayViewModel.self, arguments: unownedRouter, holiday)!
            viewController.bind(to: viewModel)
            return .push(viewController)
        case .holidays:
            return .pop()
        }
    }
}
