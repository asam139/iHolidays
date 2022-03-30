//
//  UIView+.swift
//  MeepUtilities
//
//  Created by Alvaro Blazquez Montero on 22/06/2020.
//  Copyright © 2020 David Gutiérrez Galán. All rights reserved.
//

import UIKit

public extension UIView {
    convenience init(backgroundColor: UIColor = .clear) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
    }

    @discardableResult
    func withBorder(width: CGFloat, color: UIColor) -> UIView {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
        return self
    }

    @discardableResult
    func setupShadow(opacity: Float = 0,
                     radius: CGFloat = 0,
                     offset: CGSize = .zero,
                     color: UIColor = .black) -> UIView {
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        return self
    }

    enum LinePosition {
        case leading
        case top
        case bottom
        case trailing
    }

    func addLine(position: LinePosition = .bottom, color: UIColor,
                 thickness: CGFloat = 1) {
        let lineView = UIView(backgroundColor: color)
        addSubview(lineView)

        switch position {
        case .leading:
            lineView
                .withHeightTo(heightAnchor)
                .anchor(top: topAnchor, leading: leadingAnchor, size: CGSize(width: thickness, height: 0))
        case .trailing:
            lineView
                .withHeightTo(heightAnchor)
                .anchor(top: topAnchor, trailing: trailingAnchor, size: CGSize(width: thickness, height: 0))
        case .top:
            lineView
                .withWidthTo(widthAnchor)
                .anchor(top: topAnchor, leading: leadingAnchor, size: CGSize(width: 0, height: thickness))
        case .bottom:
            lineView
                .withWidthTo(widthAnchor)
                .anchor(leading: leadingAnchor, bottom: bottomAnchor, size: CGSize(width: 0, height: thickness))
        }
    }

    func roundCorners(_ corners: CACornerMask, radius: CGFloat) {
        clipsToBounds = true
        layer.cornerRadius = radius
        layer.maskedCorners = corners
//        let maskPath = UIBezierPath(
//            roundedRect: bounds,
//            byRoundingCorners: corners,
//            cornerRadii: CGSize(width: radius, height: radius))
//
//        let shape = CAShapeLayer()
//        shape.path = maskPath.cgPath
//        layer.mask = shape
    }
}
