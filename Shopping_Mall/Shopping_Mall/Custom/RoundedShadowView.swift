//
//  RoundedShadowView.swift
//  Shopping_Mall
//
//  Created by Norayr Grigoryan on 5/17/21.
//

import UIKit

@IBDesignable
final class RoundedShadowView: UIView {

    @IBInspectable var radius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    @IBInspectable var shadowRadius: CGFloat {
        set {
            layer.shadowRadius = newValue
        }
        get {
            return layer.shadowRadius
        }
    }
    @IBInspectable var shadowColor: CGColor {
        set {
            layer.shadowColor = newValue
        }
        get {
            return layer.shadowColor ?? #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.shadowRadius = 5
        layer.cornerRadius = 10
        layer.shadowColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        //layer.shadowColor = UIColor(red: 0.87, green: 0.87, blue: 0.87, alpha: 1).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowOpacity = 0.8
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
    }
}
