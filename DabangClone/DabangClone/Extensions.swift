//
//  Extensions.swift
//  DabangClone
//
//  Created by 정의석 on 2020/03/20.
//  Copyright © 2020 pandaman. All rights reserved.
//

import Foundation
import UIKit


//MARK: UIView Extensions
extension UIView {
    
    func addSubviews(_ views: [UIView]) {
        views.forEach { addSubview($0) }
    }
    
    func addInnerShadow() {
        let innerShadow = CALayer()
        innerShadow.frame = bounds
        
        // Shadow path (1pt ring around bounds)
        let radius = self.frame.size.height/2
        let path = UIBezierPath(roundedRect: innerShadow.bounds.insetBy(dx: -1, dy:-1), cornerRadius:radius)
        let cutout = UIBezierPath(roundedRect: innerShadow.bounds, cornerRadius:radius).reversing()
        
        
        path.append(cutout)
        innerShadow.shadowPath = path.cgPath
        innerShadow.masksToBounds = true
        // Shadow properties
        innerShadow.shadowColor = UIColor.black.cgColor
        innerShadow.shadowOffset = CGSize(width: 0, height: 3)
        innerShadow.shadowOpacity = 0.15
        innerShadow.shadowRadius = 3
//        innerShadow.cornerRadius = self.frame.size.height/2
        innerShadow.cornerRadius = 4
        layer.addSublayer(innerShadow)
    }
    
}

extension UITextField {
  func addLeftPadding() {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
    self.leftView = paddingView
    self.leftViewMode = ViewMode.always
  }
}

