//
//  Extension.swift
//  SevenDays
//
//  Created by Giuliano Accorsi on 22/11/22.
//

import UIKit

extension UIView {
    func addGradient(firstColor: UIColor, secondColor: UIColor) {
        let gradient = CAGradientLayer()
            gradient.colors = [UIColor(red: 0.18, green: 0.075, blue: 0.443, alpha: 1.0).cgColor, UIColor(red: 0.075, green: 0.043, blue: 0.169, alpha: 1.0).cgColor]
            gradient.locations = [0.0, 1.0]
            gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
            gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
            gradient.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
            self.layer.insertSublayer(gradient, at: 0)
    }
}
