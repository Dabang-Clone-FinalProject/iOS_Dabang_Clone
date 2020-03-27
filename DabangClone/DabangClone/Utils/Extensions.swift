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
    
}


extension UITextField {
  func addLeftPadding(_ width: CGFloat = 10) {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
    self.leftView = paddingView
    self.leftViewMode = ViewMode.always
  }
}
extension UITextView {
  func addLeftPadding() {
    self.textContainerInset = UIEdgeInsets(top: 12, left: 8, bottom: 0, right: 0)
    
  }
}

extension String {
  
  public func validateEmail() -> Bool {
      let emailRegEx = "^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$"
      
      let predicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
      return predicate.evaluate(with: self)
  }
  
  // Password validation
  public func validatePassword() -> Bool {
      let passwordRegEx = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z])(?=.*[$@$!%*#?&]).{8,}$"
      let predicate = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
      return predicate.evaluate(with: self)
  }
  
 
  
  //MARK: usage
  /*
   if emailTextField.text?.validateEmail() == true {
     print("올바른 이메일")
   } else {
     print("올바르지 않은 이메일")
   }
   
   if pwTextField.text?.validatePassword() == true {
     print("올바른 패스워드")
   } else {
     print("올바르지 않은 패스워드")
   }
   */
}

extension UILabel {
  
  func addCharacterSpacing(kernValue: Double = -1) {
    if let labelText = text, labelText.count > 0 {
      let attributedString = NSMutableAttributedString(string: labelText)
      attributedString.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: attributedString.length - 1))
      attributedText = attributedString
    }
  }
}

extension UIButton {
  
  func addCharacterSpacing(kernValue: Double = -1) {
    if let labelText = self.titleLabel?.text, labelText.count > 0 {
      let attributedString = NSMutableAttributedString(string: labelText)
      attributedString.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: attributedString.length - 1))
      self.titleLabel?.attributedText = attributedString
    }
  }
}

extension NSMutableAttributedString {

    func bold(_ text: String, fontSize: CGFloat) -> NSMutableAttributedString {
      let attrs: [NSAttributedString.Key: Any] = [.font: UIFont.boldSystemFont(ofSize: fontSize)]
        self.append(NSMutableAttributedString(string: text, attributes: attrs))
        return self
    }

    func normal(_ text: String, fontSize: CGFloat) -> NSMutableAttributedString {
      let attrs: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: fontSize)]
        self.append(NSMutableAttributedString(string: text, attributes: attrs))
        return self

    }
  
  func semiBold(_ text: String, fontSize: CGFloat) -> NSMutableAttributedString {
    let attrs: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: fontSize, weight: .semibold)]
      self.append(NSMutableAttributedString(string: text, attributes: attrs))
      return self
  }
  
  func medium(_ text: String, fontSize: CGFloat) -> NSMutableAttributedString {
    let attrs: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: fontSize, weight: .medium)]
      self.append(NSMutableAttributedString(string: text, attributes: attrs))
      return self
  }

}



