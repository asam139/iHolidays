//
//  UIEdgeInsets+.swift
//  MeepDomain
//
//  Created by Saul Moreno Abril on 27/10/20.
//

import UIKit

public extension UIEdgeInsets {
    init(side: CGFloat) {
        self.init(top: side, left: side, bottom: side, right: side)
    }

    init(top: CGFloat) {
        self.init(top: top, left: 0, bottom: 0, right: 0)
    }

    init(left: CGFloat) {
        self.init(top: 0, left: left, bottom: 0, right: 0)
    }

    init(bottom: CGFloat) {
        self.init(top: 0, left: 0, bottom: bottom, right: 0)
    }

    init(right: CGFloat) {
        self.init(top: 0, left: 0, bottom: 0, right: right)
    }

    init(horizontal: CGFloat) {
        self.init(top: 0, left: horizontal, bottom: horizontal, right: horizontal)
    }

    init(vertical: CGFloat) {
        self.init(top: vertical, left: 0, bottom: vertical, right: 0)
    }
}
