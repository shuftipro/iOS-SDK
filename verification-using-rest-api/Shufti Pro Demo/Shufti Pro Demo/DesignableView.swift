//
//  DesignableView.swift
//  Shufti Pro Demo
//
//  Created by Zaid Ahmed IoS on 09/10/2020.
//  Copyright © 2020 Programmers Force. All rights reserved.
//

import Foundation


import UIKit

@IBDesignable
class DesignableView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.masksToBounds = true
    }
 
}
