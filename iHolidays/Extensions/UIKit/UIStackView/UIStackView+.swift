//
//  UIStackView+.swift
//  MeepUtilities
//
//  Created by Andres Felipe Alzate Restrepo on 30/09/2020.
//

import UIKit

public extension UIStackView {
    convenience init(_ axis: NSLayoutConstraint.Axis = .vertical, views: [UIView], spacing: CGFloat = 0) {
        self.init(arrangedSubviews: views)
        self.axis = axis
        self.spacing = spacing
    }

    convenience init(_ axis: NSLayoutConstraint.Axis = .vertical, views: UIView..., spacing: CGFloat = 0) {
        self.init(axis, views: views, spacing: spacing)
    }

    @discardableResult
    func withMargins(_ margins: UIEdgeInsets) -> UIStackView {
        layoutMargins = margins
        isLayoutMarginsRelativeArrangement = true
        return self
    }

    @discardableResult
    func padLeft(_ left: CGFloat) -> UIStackView {
        isLayoutMarginsRelativeArrangement = true
        layoutMargins.left = left
        return self
    }

    @discardableResult
    func padTop(_ top: CGFloat) -> UIStackView {
        isLayoutMarginsRelativeArrangement = true
        layoutMargins.top = top
        return self
    }

    @discardableResult
    func padRight(_ right: CGFloat) -> UIStackView {
        isLayoutMarginsRelativeArrangement = true
        layoutMargins.right = right
        return self
    }

    @discardableResult
    func padBottom(_ bottom: CGFloat) -> UIStackView {
        isLayoutMarginsRelativeArrangement = true
        layoutMargins.bottom = bottom
        return self
    }

    @discardableResult
    func removeAllArrangedSubviews() -> UIStackView {
        let removedSubviews = arrangedSubviews.reduce([]) { allSubviews, subview -> [UIView] in
            self.removeArrangedSubview(subview)
            return allSubviews + [subview]
        }
        NSLayoutConstraint.deactivate(removedSubviews.flatMap({ $0.constraints }))
        removedSubviews.forEach { $0.removeFromSuperview() }

        return self
    }
}
