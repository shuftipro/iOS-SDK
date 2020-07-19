//
//  ViewController.swift
//  Shufti Pro Demo
//
//  Created by Swift Developer on 9/24/18.
//  Copyright © 2018 Programmers Force. All rights reserved.
//

import UIKit
import ShuftiPro

class ViewController: UIViewController {

    let clientIdStr = "" // your client id here
    let secretKeyStr = "" // your secret key here
    let accessTokenStr = "" // your access token here
    
    @IBOutlet weak var faceVerificationUIView: UIView!
    @IBOutlet weak var documentVerificationUIView: UIView!
    @IBOutlet weak var addressVerificationUIView: UIView!
    
    @IBOutlet weak var faceCheckImg: UIImageView!
    
    @IBOutlet weak var documentCheckImg: UIImageView!
    
    @IBOutlet weak var addressCheckImg: UIImageView!
    
    var faceVerification = false
    var documentVerification = false
    var addressVerification = false
    
    var dataDictionary = Dictionary<String, Any>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyDropShadows()
    }
    
    func applyDropShadows(){
        setShadowOnView(view: faceVerificationUIView)
        setShadowOnView(view: documentVerificationUIView)
        setShadowOnView(view: addressVerificationUIView)
    }
    
    @IBAction func faceVerifyBtnPressed(_ sender: Any) {
        if faceVerification == false {
            faceVerification = true
            faceCheckImg.image = UIImage(named: "checked")
        } else {
            faceVerification = false
            faceCheckImg.image = UIImage(named: "unChecked")
        }
    }
    
    @IBAction func documentVerifyBtnPressed(_ sender: Any) {
        if documentVerification == false {
            documentVerification = true
            documentCheckImg.image = UIImage(named: "checked")
        } else {
            documentVerification = false
            documentCheckImg.image = UIImage(named: "unChecked")
        }
    }
    
    @IBAction func addressVerifyBtnPressed(_ sender: Any) {
        if addressVerification == false {
            addressVerification = true
            addressCheckImg.image = UIImage(named: "checked")
        } else {
            addressVerification = false
            addressCheckImg.image = UIImage(named: "unChecked")
        }
    }
    
    @IBAction func continuedBtnPressed(_ sender: Any) {
        if faceVerification == true || documentVerification == true || addressVerification == true {
            
            dataDictionary = [
                "reference": "SDK-iOS-\(UIDevice.current.identifierForVendor!.uuidString)\(NSDate())",
                "country": "GB",
                "language": "EN",
                "email": "ad@example.com",
                "callback_url": "http://www.example.com",
                "verification_mode": "any",
            ]
            if faceVerification == true {
                dataDictionary["face"] = [
                    "proof": ""
                ]
            }
            if documentVerification == true {
                dataDictionary["document"] = [
                    "proof": "",
                    "supported_types": [
                        "passport",
                        "id_card",
                        "driving_license",
                        "credit_or_debit_card"
                    ],
                    "name": [
                        "first_name": "",
                        "last_name": "",
                        "middle_name": ""
                    ],
                    "dob": "",
                    "document_number": "",
                    "expiry_date": "",
                    "issue_date": "",
                    "fetch_enhanced_data": "1"
                ]
            }
            if addressVerification == true {
                dataDictionary["address"] = [
                    "proof": "",
                    "full_address": "",
                    "name": [
                        "first_name": "",
                        "last_name": "",
                        "middle_name": ""
                    ],
                    "supported_types": [
                        "id_card",
                        "utility_bill",
                        "bank_statement"
                    ],
                ]
            }
            
            let shufti = ShuftiPro(clientId: clientIdStr, secretKey: secretKeyStr, parentVC: self) // using with clientId and secretKey
            //let shufti = ShuftiPro(accessToken: accessTokenStr, parentVC: self) // using with access token
            //shufti.statusBarColor = ""
            shufti.verification(dataObject: dataDictionary){(result: Any) in
                print("Got response from sdk: \(result)")
            }
        } else {
            customAlertView(titleTxt: "", messageTxt: "Please choose method of verification.")
        }
    }
    
    //function to show alert view
    func customAlertView(titleTxt: String, messageTxt: String) {
        let alertController = UIAlertController(title: titleTxt, message: messageTxt, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
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

