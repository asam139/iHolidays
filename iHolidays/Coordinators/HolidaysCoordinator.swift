//
//  HolidaysCoordinator.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 24/1/21.
//

import UIKit
import XCoordinator
import XCoordinatorRx
import Swinject

enum HolidaysRoute: Route {
    case home
    case holiday(String)
}

class HolidaysCoordinator: NavigationCoordinator<HolidaysRoute> {
    private let assembler: Assembler
    
    // MARK: Initialization
    
    init(rootViewController: UINavigationController, assembler: Assembler) {
        self.assembler = assembler
        super.init(rootViewController: rootViewController, initialRoute: nil)
        trigger(.home)
    }

    // MARK: Overrides
    
    override func prepareTransition(for route: HolidaysRoute) -> NavigationTransition {
        switch route {
        case .home:
            let viewController = HolidaysViewController(nibName: "HolidaysViewController", bundle: nil)
            let viewModel = assembler.resolver.resolve(HolidaysViewModel.self, argument: unownedRouter)!
            viewController.bind(to: viewModel)
            return .push(viewController)
        case .holiday(let holiday):
            let coordinator = HolidayCoordinator(rootViewController: rootViewController, holiday: holiday, assembler: assembler)
            addChild(coordinator)
            return .none()
            //return .present(coordinator, animation: .default)
        }
    }

    // MARK: Actions


}
