//
//  DesignableUITextField.swift
//  Sample
//
//  Created by Swift Developer on 22/02/2018.
//  Copyright © 2018 Programmers Force. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableUITextField: UITextField {
    
    // Provides left padding for images
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding
        return textRect
    }
    
    //adding left image option in storyboard interface builder
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    //adding an option for leftpadding in storyboard interface builder
    @IBInspectable var leftPadding: CGFloat = 0
    
    //adding an option for color in storyboard interface builder
    @IBInspectable var PlaceholderTextColor: UIColor = UIColor.lightGray {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    
    
    /*function that updates the view of textfields by adding image icon
     1. applying image positions
     2. color to the image icon
     3. space between image and text in textfield
     4. placeholder text color*/
    func updateView() {
        if let image = leftImage {
            leftViewMode = UITextFieldViewMode.always
            let imageView = UIImageView(frame: CGRect(x: leftPadding, y: 0, width: 20, height: 20))
            imageView.image = image
            // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
            imageView.tintColor = PlaceholderTextColor
            var width = leftPadding + 30
            
            if borderStyle == UITextBorderStyle.none || borderStyle == UITextBorderStyle.line {
                width = width + 5
            }
            let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 20))
            view.addSubview(imageView)
            
            leftView = view
        } else {
            leftViewMode = UITextFieldViewMode.never
            leftView = nil
        }
        
        // Placeholder text color
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedStringKey.foregroundColor: PlaceholderTextColor])
    }
}

