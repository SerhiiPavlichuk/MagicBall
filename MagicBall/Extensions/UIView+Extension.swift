//
//  UIView+Extension.swift
//  MagicBall
//
//  Created by admin on 26.01.2022.
//

import UIKit

extension UIView {

    func shake() {
        self.transform = CGAffineTransform(translationX: 40, y: 0)
        UIView.animate(withDuration: 1.8, delay: 0, usingSpringWithDamping: 0.1,
                       initialSpringVelocity: 2.2,
                       options: .curveLinear,
                       animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }
}
