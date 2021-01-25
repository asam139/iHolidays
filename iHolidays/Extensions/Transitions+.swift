//
//  Transitions+.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 25/1/21.
//

import UIKit
import XCoordinator

extension Transition {
    static func presentFullScreen(_ presentable: Presentable, animation: Animation? = nil) -> Transition {
        presentable.viewController?.modalPresentationStyle = .fullScreen
        return .present(presentable, animation: animation)
    }
}
