//
//  FirstViewController.swift
//  Sample
//
//  Created by Swift Developer on 22/02/2018.
//  Copyright © 2018 Programmers Force. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var headView: UIView!
    @IBOutlet weak var centeredVerticalView: UIView!
    @IBOutlet weak var centeredHorizontalView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //applying shadow to the horizontal and vertical views
        ElementShadow.sharedInstance.setShadowOnView(view: centeredVerticalView)
        ElementShadow.sharedInstance.setShadowOnView(view: centeredHorizontalView)
    }
    
    
    @IBAction func idCardBtnClicked(_ sender: Any) {
        goToForm(method: "id_card")
    }
    
    
    @IBAction func drivingLicenceBtnClicked(_ sender: Any) {
        goToForm(method: "driving_license")
    }
    
    
    @IBAction func passportBtnClicked(_ sender: Any) {
        goToForm(method: "passport")
    }
    
    
    @IBAction func creditDebitBtnClicked(_ sender: Any) {
        goToForm(method: "card")
    }
    
    
    func goToForm(method: String){
        let viewController = (self.storyboard?.instantiateViewController(withIdentifier: "ViewController"))! as! ViewController
        viewController.selectedMethod = method
        self.present(viewController, animated: true, completion: nil)
    }

}
