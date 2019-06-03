//
//  ViewController.swift
//  ShuftiPro Non OCR
//
//  Created by Swift Developer on 11/6/18.
//  Copyright © 2018 Programmers Force. All rights reserved.
//

import UIKit
import ShuftiPro

class ViewController: UIViewController {
    
    let clientIdStr = "" // your client id here
    let secretKeyStr = "" // your secret key here
    
    var faceVerification = false
    var documentVerification = false
    var addressVerification = false
    
    @IBOutlet weak var faceCheckImage: UIImageView!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var dobTextField: UITextField!
    @IBOutlet weak var documentNoTextField: UITextField!
    
    @IBOutlet weak var issueDateTextField: UITextField!
    @IBOutlet weak var expiryDateTextField: UITextField!
    
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBOutlet weak var faceVerificationCheckUIView: UIView!
    @IBOutlet weak var documentRowUIView1: UIView!
    @IBOutlet weak var documentRowUIView2: UIView!
    
    @IBOutlet weak var documentRowUIView3: UIView!
    
    @IBOutlet weak var addressRowUIView1: UIView!
    
    
    var dataDictionary = Dictionary<String, Any>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        applyShadow()
    }
    
    
    @IBAction func faceVerificationBtnPressed(_ sender: Any) {
        if faceVerification == false {
            faceVerification = true
            faceCheckImage.image = UIImage(named: "checked")
        } else {
            faceVerification = false
            faceCheckImage.image = UIImage(named: "unChecked")
        }
    }
    
    func chkVerifications(){
        if firstNameTextField.text != "" || lastNameTextField.text != "" || dobTextField.text != "" || documentNoTextField.text != "" || issueDateTextField.text != "" || expiryDateTextField.text != "" {
            documentVerification = true
        } else {
            documentVerification = false
        }
        if addressTextField.text != "" {
            addressVerification = true
        } else {
            addressVerification = false
        }
    }
    
    func createJsonObj() {
        chkVerifications()
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
                    "name": [
                        "first_name": firstNameTextField.text as! String,
                        "last_name": lastNameTextField.text as! String,
                        "middle_name": ""
                    ],
                    "dob": dobTextField.text as! String,
                    "document_number": documentNoTextField.text as! String,
                    "expiry_date": expiryDateTextField.text as! String,
                    "issue_date": issueDateTextField.text as! String,
                ]
            }
            if addressVerification == true {
                dataDictionary["address"] = [
                    "full_address": addressTextField.text as! String,
                    "name": [
                        "first_name": firstNameTextField.text as! String,
                        "last_name": lastNameTextField.text as! String,
                        "middle_name": "",
                        "fuzzy_match": "1"
                    ],
                    "supported_types": [
                        "id_card",
                        "utility_bill",
                        "bank_statement"
                    ]
                ]
            }
            //
            let shufti = ShuftiPro(clientId: clientIdStr, secretKey: secretKeyStr, parentVC: self)
            shufti.async = "" //or "true"
            shufti.verificationMode = "image" // default "video"
            shufti.verification(dataObject: dataDictionary){(result: Any) in
                print("Got response from sdk: \(result)")
            }
            
        } else {
            customAlertView(titleTxt: "", messageTxt: "Please choose or fill in your details for verification.")
        }
    }
    
    
    @IBAction func proceedBtnPressed(_ sender: Any) {
        createJsonObj()
    }
    
    
    
    //function to show alert view
    func customAlertView(titleTxt: String, messageTxt: String) {
        let alertController = UIAlertController(title: titleTxt, message: messageTxt, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func applyShadow() {
        setShadowOnView(view: faceVerificationCheckUIView)
        setShadowOnView(view: documentRowUIView1)
        setShadowOnView(view: documentRowUIView2)
        setShadowOnView(view: documentRowUIView3)
        setShadowOnView(view: addressRowUIView1)
    }
    
    func setShadowOnView(view: UIView) -> UIView {
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        view.layer.masksToBounds = false
        view.layer.shadowRadius = 5.0
        view.layer.shadowOpacity = 0.4
        return view
    }


}

