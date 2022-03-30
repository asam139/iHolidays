//
//  UIView+Layout.swift
//  MeepUtilities
//
//  Created by Saul Moreno Abril on 28/10/20.
//

import UIKit

public struct AnchoredConstraints {
    public var top, bottom,
               leading, trailing,
               width, height,
               centerX, centerY: NSLayoutConstraint?

    public func toArray() -> [NSLayoutConstraint] {
        [top, leading, bottom, trailing, width, height, centerX, centerY].compactMap { $0 }
    }
}

public extension UIView {
    @discardableResult
    func addSubviews(_ views: [UIView]) -> Self {
        views.forEach(addSubview)
        return self
    }

    @discardableResult
    func addSubviews(_ views: UIView...) -> Self {
        addSubviews(views)
        return self
    }

    @discardableResult
    func withSize(size: CGSize) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: size.width).isActive = true
        heightAnchor.constraint(equalToConstant: size.height).isActive = true
        return self
    }

    @discardableResult
    func withHeight(_ height: CGFloat) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }

    @discardableResult
    func withWidth(_ width: CGFloat) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        return self
    }

    @discardableResult
    func anchors(
        top: NSLayoutYAxisAnchor? = nil,
        leading: NSLayoutXAxisAnchor? = nil,
        bottom: NSLayoutYAxisAnchor? = nil,
        trailing: NSLayoutXAxisAnchor? = nil,
        padding: UIEdgeInsets = .zero,
        size: CGSize = .zero,
        activate: Bool = true
    ) -> AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()

        if let top = top {
            anchoredConstraints.top = topAnchor.constraint(equalTo: top, constant: padding.top)
        }

        if let leading = leading {
            anchoredConstraints.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        }

        if let bottom = bottom {
            anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
        }

        if let trailing = trailing {
            anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
        }

        if size.width != 0 {
            anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
        }

        if size.height != 0 {
            anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
        }

        if activate {
            NSLayoutConstraint.activate(anchoredConstraints.toArray())
        }
        return anchoredConstraints
    }

    @discardableResult
    func anchor(
        top: NSLayoutYAxisAnchor? = nil,
        leading: NSLayoutXAxisAnchor? = nil,
        bottom: NSLayoutYAxisAnchor? = nil,
        trailing: NSLayoutXAxisAnchor? = nil,
        padding: UIEdgeInsets = .zero,
        size: CGSize = .zero,
        activate: Bool = true
    ) -> Self {
        anchors(
            top: top,
            leading: leading,
            bottom: bottom,
            trailing: trailing,
            padding: padding,
            size: size,
            activate: activate
        )
        return self
    }

    @discardableResult
    func withHeightTo(_ height: NSLayoutDimension, multiplier: CGFloat = 1) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalTo: height, multiplier: multiplier).isActive = true
        return self
    }

    @discardableResult
    func withWidthTo(_ width: NSLayoutDimension, multiplier: CGFloat = 1) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalTo: width, multiplier: multiplier).isActive = true
        return self
    }

    @discardableResult
    func anchorsFillingSuperview(padding: UIEdgeInsets = .zero) -> AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()

        if let superviewTopAnchor = superview?.topAnchor {
            anchoredConstraints.top = topAnchor.constraint(equalTo: superviewTopAnchor,
                                                           constant: padding.top)
        }

        if let superviewBottomAnchor = superview?.bottomAnchor {
            anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: superviewBottomAnchor,
                                                                 constant: -padding.bottom)
        }

        if let superviewLeadingAnchor = superview?.leadingAnchor {
            anchoredConstraints.leading = leadingAnchor.constraint(equalTo: superviewLeadingAnchor,
                                                                   constant: padding.left)
        }

        if let superviewTrailingAnchor = superview?.trailingAnchor {
            anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: superviewTrailingAnchor,
                                                                     constant: -padding.right)
        }

        NSLayoutConstraint.activate(anchoredConstraints.toArray())
        return anchoredConstraints
    }

    @discardableResult
    func fillSuperview(padding: UIEdgeInsets = .zero) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        anchorsFillingSuperview(padding: padding)
        return self
    }

    @discardableResult
    func addSubviewFully(_ subview: UIView) -> UIView {
        addSubview(subview)
        return subview.fillSuperview()
    }

    @discardableResult
    func anchorsCentering(size: CGSize = .zero) -> AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()

        if let superviewCenterXAnchor = superview?.centerXAnchor {
            anchoredConstraints.centerX = centerXAnchor.constraint(equalTo: superviewCenterXAnchor)
        }

        if let superviewCenterYAnchor = superview?.centerYAnchor {
            anchoredConstraints.centerY = centerYAnchor.constraint(equalTo: superviewCenterYAnchor)
        }

        if size.width != 0 {
            anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
        }

        if size.height != 0 {
            anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
        }

        NSLayoutConstraint.activate(anchoredConstraints.toArray())
        return anchoredConstraints
    }

    @discardableResult
    func center(size: CGSize = .zero) -> Self {
        anchorsCentering(size: size)
        return self
    }

    @discardableResult
    func anchorsAligningX(constant: CGFloat = 0, size: CGSize = .zero) -> AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()

        if let superviewCenterXAnchor = superview?.centerXAnchor {
            anchoredConstraints.centerX = centerXAnchor.constraint(equalTo: superviewCenterXAnchor,
                                                                   constant: constant)
        }

        if size.width != 0 {
            anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
        }

        if size.height != 0 {
            anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
        }

        anchoredConstraints.toArray().forEach { $0.isActive = true }
        return anchoredConstraints
    }

    @discardableResult
    func alignX(constant: CGFloat = 0, size: CGSize = .zero) -> Self {
        anchorsAligningX(constant: constant, size: size)
        return self
    }

    @discardableResult
    func anchorsAligningY(constant: CGFloat = 0, size: CGSize = .zero) -> AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()

        if let superviewCenterYAnchor = superview?.centerYAnchor {
            anchoredConstraints.centerY = centerYAnchor.constraint(equalTo: superviewCenterYAnchor,
                                                                   constant: constant)
        }

        if size.width != 0 {
            anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
        }

        if size.height != 0 {
            anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
        }

        NSLayoutConstraint.activate(anchoredConstraints.toArray())
        return anchoredConstraints
    }

    @discardableResult
    func alignY(constant: CGFloat = 0, size: CGSize = .zero) -> Self {
        anchorsAligningY(constant: constant, size: size)
        return self
    }
}

// UIView+StackView
public extension UIView {
    @discardableResult
    func stack(_ axis: NSLayoutConstraint.Axis = .vertical, views: [UIView], spacing: CGFloat = 0) -> UIStackView {
        let stackView = UIStackView(axis, views: views, spacing: spacing)
        addSubview(stackView)
        stackView.fillSuperview()
        return stackView
    }

    @discardableResult
    func stack(_ axis: NSLayoutConstraint.Axis = .vertical, views: UIView..., spacing: CGFloat = 0) -> UIStackView {
        stack(axis, views: views, spacing: spacing)
    }
}
