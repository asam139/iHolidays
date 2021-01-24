//
//  HolidaysCoordinator.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 24/1/21.
//

import UIKit
import XCoordinator

enum HolidaysRoute: Route {
    case home
}

class HolidaysCoordinator: NavigationCoordinator<HolidaysRoute> {
    
    // MARK: Initialization
    
    init(rootViewController: UINavigationController) {
        super.init(rootViewController: rootViewController, initialRoute: nil)
        trigger(.home)
    }

    // MARK: Overrides
    
    override func prepareTransition(for route: HolidaysRoute) -> NavigationTransition {
        switch route {
        case .home:
            let viewController = HolidaysViewController(nibName: "HolidaysViewController", bundle: nil)
            let viewModel = HolidaysViewModelImpl(router: unownedRouter)
            viewController.bind(to: viewModel)
            return .push(viewController)
        }
    }

    // MARK: Actions


}
