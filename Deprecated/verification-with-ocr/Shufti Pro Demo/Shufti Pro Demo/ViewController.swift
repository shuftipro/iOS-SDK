//
//  ViewController.swift
//  Shufti Pro Demo 
//  OCR
//  Created by Swift Developer on 9/24/18.
//  Copyright © 2018 Programmers Force. All rights reserved.
//

import UIKit
import ShuftiPro

class ViewController: UIViewController {

    let clientIdStr = "" // your client id here
    let secretKeyStr = "" // your secret key here
    let accessToken = "" // your accessToken here
    
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
       // applyDropShadows()
    }
    
    func applyDropShadows(){
        setShadowOnView(view: faceVerificationUIView)
        setShadowOnView(view: documentVerificationUIView)
        setShadowOnView(view: addressVerificationUIView)
    }
    
    
    @IBAction func faceVerifyBtnPressed(_ sender: Any) {
        if faceVerification == false {
            faceVerification = true
            faceCheckImg.image = UIImage(named: "check_radio")
        } else {
            faceVerification = false
            faceCheckImg.image = UIImage(named: "uncheck_radio")
        }
    }
    
    @IBAction func documentVerifyBtnPressed(_ sender: Any) {
        if documentVerification == false {
            documentVerification = true
            documentCheckImg.image = UIImage(named: "check_radio")
        } else {
            documentVerification = false
            documentCheckImg.image = UIImage(named: "uncheck_radio")
        }
    }
    
    @IBAction func addressVerifyBtnPressed(_ sender: Any) {
        if addressVerification == false {
            addressVerification = true
            addressCheckImg.image = UIImage(named: "check_radio")
        } else {
            addressVerification = false
            addressCheckImg.image = UIImage(named: "uncheck_radio")
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
            ]
            if faceVerification == true {
                dataDictionary["face"] = true
            }
            if documentVerification == true {
                dataDictionary["document"] = [
                    "supported_types": [
                        "passport",
                        "id_card",
                        "driving_license",
                        "credit_or_debit_card"
                    ],
                    "name": true,
                    "dob": true,
                    "document_number": true,
                    "expiry_date": true,
                    "issue_date": true,
                    "fetch_enhanced_data": true
                ]
            }
            if addressVerification == true {
                dataDictionary["address"] = [
                    "full_address": true,
                    "name": true,
                    "supported_types": [
                        "id_card",
                        "utility_bill",
                        "bank_statement"
                    ],
                ]
            }
            
            let shufti = ShuftiPro(clientId: clientIdStr, secretKey: secretKeyStr, parentVC: self)
            //let shufti = ShuftiPro(accessToken: accessToken, parentVC: self) //To use with Access Token
            shufti.async = "" //or true
            shufti.verificationMode = "image" //default "video"
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
    func setShadowOnView(view: UIView) {

        view.layer.masksToBounds = true
        view.layer.cornerRadius = 6.0
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor

       
    }


}

