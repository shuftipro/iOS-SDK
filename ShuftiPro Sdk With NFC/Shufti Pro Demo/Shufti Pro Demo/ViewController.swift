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

    let clientIdStr = "xxx-xxx-xxx" // your client id here
    let secretKeyStr = "xxx-xxx-xxx" // your secret key here
    let accessToken = "" // your accessToken here
    var referenceKey = ""
    var showRatingScreen = false
    var authKeys = Dictionary<String, String>()
    var configs = Dictionary<String, Any>()

    @IBOutlet weak var faceCheckImg: UIImageView!
    @IBOutlet weak var documentCheckImg: UIImageView!
    @IBOutlet weak var documentTwoCheckImg: UIImageView!
    @IBOutlet weak var addressCheckImg: UIImageView!
    @IBOutlet weak var consentCheckImg: UIImageView!
    @IBOutlet weak var twoFactorCheckImg: UIImageView!
    @IBOutlet weak var backgroundCheckImg: UIImageView!



    
    var faceVerification = false
    var documentVerification = false
    var documentTwoVerification = false
    var addressVerification = false
    var concentVerification = false
    var twoFactorVerification = false
    var backgroundVerification = false


    
    @IBOutlet weak var allowOnlineBtn: UIButton!
    @IBOutlet weak var allowOfflineBtn: UIButton!
    @IBOutlet weak var showPrivacyBtn: UIButton!
    @IBOutlet weak var showConsentBtn: UIButton!
    @IBOutlet weak var showResultBtn: UIButton!
    @IBOutlet weak var backSideBtn: UIButton!
    @IBOutlet weak var openWebviewBtn: UIButton!
    @IBOutlet weak var bgServiceBtn: UIButton!


    
    
    
    var dataDictionary = Dictionary<String, Any>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {

    }
    

    override func viewDidAppear(_ animated: Bool) {
        
        faceVerification = false
        faceCheckImg.image = UIImage(named: "uncheck_radio")
        addressVerification = false
        documentCheckImg.image = UIImage(named: "uncheck_radio")
        documentVerification = false
        documentTwoCheckImg.image = UIImage(named: "uncheck_radio")
        documentTwoVerification = false
        addressCheckImg.image = UIImage(named: "uncheck_radio")
        concentVerification = false
        consentCheckImg.image = UIImage(named: "uncheck_radio")
        twoFactorVerification = false
        twoFactorCheckImg.image = UIImage(named: "uncheck_radio")
        backgroundVerification = false
        backgroundCheckImg.image = UIImage(named: "uncheck_radio")
        
    }


    // Orignal button
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
    @IBAction func documentTwoVerifyBtnPressed(_ sender: Any) {
        if documentTwoVerification == false {
            documentTwoVerification = true
            documentTwoCheckImg.image = UIImage(named: "check_radio")
        } else {
            documentTwoVerification = false
            documentTwoCheckImg.image = UIImage(named: "uncheck_radio")
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
    @IBAction func consentVerifyBtnPressed(_ sender: Any) {
        if concentVerification == false {
            concentVerification = true
            consentCheckImg.image = UIImage(named: "check_radio")
                        
        } else {
            concentVerification = false
            consentCheckImg.image = UIImage(named: "uncheck_radio")

        }
    }
    @IBAction func twoFactorVerifyBtnPressed(_ sender: Any) {
        if twoFactorVerification == false {
            twoFactorVerification = true
            twoFactorCheckImg.image = UIImage(named: "check_radio")
                        
        } else {
            twoFactorVerification = false
            twoFactorCheckImg.image = UIImage(named: "uncheck_radio")

        }
    }
    
    @IBAction func backgroundChecksBtnPressed(_ sender: Any) {
        if backgroundVerification == false {
            backgroundVerification = true
            backgroundCheckImg.image = UIImage(named: "check_radio")
                        
        } else {
            backgroundVerification = false
            backgroundCheckImg.image = UIImage(named: "uncheck_radio")

        }
    }
    @IBAction func continuedBtnPressed(_ sender: Any) {
        
        showRatingScreen = true

        if faceVerification == true || documentVerification == true || documentTwoVerification == true || addressVerification == true || concentVerification == true || twoFactorVerification == true || backgroundVerification == true{
            referenceKey = "SDK-iOS-\(UIDevice.current.identifierForVendor!.uuidString)\(NSDate())"
            
        

            dataDictionary = [
                "reference": referenceKey,
                "country": "PK",
                "language": "EN",
                "email": "ad@example.com",
                "callback_url": "http://www.example.com",
                "show_results": "1",
                "redirect_url" : "https://www.mydummy.shuftipro.com/",
                "show_privacy_policy": "1",
                "show_consent": "1",
                "verification_Mode" : "video",
                
                
            ]
            //MARK:- Ocr

            if faceVerification == true {
                dataDictionary["face"] = [
                    "proof": ""
                ]
            }
            if documentVerification == true {
                
                dataDictionary["document"] = [
                    "supported_types": [
                        "passport",
                        "id_card",
                        "driving_license",
                        "credit_or_debit_card"
                    ],
                    "proof": "",
                    "additional_proof" :"",

                    "name": ["first_name": "",
                              "middle_name": "",
                              "last_name" : ""
                    ],
                    "backside_proof_required": "1",
                    "dob": "",
                    "document_number": "",
                    "expiry_date": "",
                    "issue_date": "",
                    "fetch_enhanced_data": "",
                    "nfc_verification" : "true",

                ]
            }

            if documentTwoVerification == true  {
                dataDictionary["document_two"] = [
                    "supported_types": [
                        "passport",
                        "id_card",
                        "driving_license",
                        "credit_or_debit_card"
                    ],
                    "proof": "",
                    "additional_proof" :"",

                    "name": ["first_name": "",
                              "middle_name": "",
                              "last_name" : ""
                    ],
                    "backside_proof_required": "0",
                    "dob": "",
                    "document_number": "",
                    "expiry_date": "",
                    "issue_date": "",
                    "fetch_enhanced_data": "",
                    "nfc_verification" : "false",

                    
                ]
            }
        
            
            if addressVerification == true {
                dataDictionary["address"] = [
                    "full_address": "",
                    "name": "",
                    "backside_proof_required": "0",
                    "nfc_verification" : "false",

                    "supported_types": [
                        "id_card",
                        "utility_bill",
                        "bank_statement"
                    ],
                ]
            }
            
            if concentVerification == true {
                dataDictionary["consent"] = [
                    "proof": "",
                    "text" : "text",
                    "supported_types": [
                        "printed"
                  ],
                ]
            }
            if twoFactorVerification == true {
                dataDictionary["phone"] = ""

            }
            if backgroundVerification == true {
                dataDictionary["background_checks"] = ""

            }


            authKeys = [
                "auth_type" : "basic_auth",
                "client_id" : clientIdStr,
                "secret_key": secretKeyStr
            ]
            
            configs = [
                "openWebView" : "true",
                "async" : "false"
            ]
            
            let shufti = ShuftiPro()

            shufti.shuftiProVerification(requestObject: dataDictionary, authKeys: authKeys, parentVC: self, configs: configs) {(result) in
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
 
}
