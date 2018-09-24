//
//  ElementShadow.swift
//  Sample
//
//  Created by Swift Developer on 22/02/2018.
//  Copyright © 2018 Programmers Force. All rights reserved.
//

import Foundation
import UIKit

class ElementShadow: NSObject {
    
    static let sharedInstance = ElementShadow()
    
    override init() {
        super.init()
    }
    
    //function to apply shadow on UIButtons
    //takes UIButton as an argument to apply style on
    func setShadowButton(button: UIButton){
        button.layer.shadowColor = UIColor.red.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        button.layer.masksToBounds = false
        button.layer.shadowRadius = 10.0
        button.layer.shadowOpacity = 0.5
    }
    
    //function to set shadow on UITextfields
    //takes UITextfield as an argument to apply style on
    func setShadowTextField(textField: UITextField) -> UITextField {
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        textField.layer.masksToBounds = false
        textField.layer.shadowRadius = 5.0
        textField.layer.shadowOpacity = 0.2
        return textField
    }
    
    //function to set shadow on UIViews
    //takes UIView as an argument to apply style on
    func setShadowOnView(view: UIView) -> UIView {
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        view.layer.masksToBounds = false
        view.layer.shadowRadius = 5.0
        view.layer.shadowOpacity = 1.0
        return view
    }
    
}
