//
//  ViewController.swift
//  Shufti Pro Demo
//
//  Created by Swift Developer on 9/24/18.
//  Copyright © 2018 Programmers Force. All rights reserved.
//

import UIKit
import Shuftipro

class ViewController: UIViewController {

    
    @IBOutlet weak var faceVerificationUIView: UIView!
    @IBOutlet weak var documentVerificationUIView: UIView!
    @IBOutlet weak var addressVerificationUIView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        applyDropShadows()
    }
    
    func applyDropShadows(){
        setShadowOnView(view: faceVerificationUIView)
        setShadowOnView(view: documentVerificationUIView)
        setShadowOnView(view: addressVerificationUIView)
    }

    
    @IBAction func continuedBtnPressed(_ sender: Any) {
        
    }
    
    
    //function to set shadow on UIViews
    //takes UIView as an argument to apply style on
    func setShadowOnView(view: UIView) -> UIView {
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        view.layer.masksToBounds = false
        view.layer.shadowRadius = 5.0
        view.layer.shadowOpacity = 0.4
        return view
    }


}

