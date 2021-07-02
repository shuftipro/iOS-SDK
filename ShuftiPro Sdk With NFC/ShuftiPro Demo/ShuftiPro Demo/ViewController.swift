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
    
    let clientIdStr = "2c624232cdd221771294dfbb310aca000a0df6ac8b66b696d90ef06fdefb64a3" // your client id here
    let secretKeyStr = "zwa3CZLMGYLoRMW6y87tjb2absbM4WBe" // your secret key here
    let accessToken = "xxx-xxx-xxx" // your accessToken here
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

//NFC SubList Views
    @IBOutlet weak var docNfcView: DesignableView!
    @IBOutlet weak var docTwoNfcView: DesignableView!
    @IBOutlet weak var AddressNfcView: DesignableView!
    
//Allow NFC Verification check boxes
    @IBOutlet weak var docNfcCheckImg: UIImageView!
    @IBOutlet weak var docTwoNfcCheckImg: UIImageView!
    @IBOutlet weak var addressNfcCheckImg: UIImageView!
    
//Allow NFC Verification Buttons
    @IBOutlet weak var allowAddressNfcBtn: UIButton!
    @IBOutlet weak var allowDocTwoNfcBtn: UIButton!
    @IBOutlet weak var allowDocNfcBtn: UIButton!
    
    
    var faceVerification = false
    var documentVerification = false
    var documentTwoVerification = false
    var addressVerification = false
    var concentVerification = false
    var twoFactorVerification = false
    var backgroundVerification = false
    
    var documentNFCVerification = false
    var documentTwoNFCVerification = false
    var addressNFCVerification = false


    @IBOutlet weak var docNfcSwitchBtn: UISwitch!
    @IBOutlet weak var docTwoNfcSwitchBtn: UISwitch!
    @IBOutlet weak var addressNfcSwitchBtn: UISwitch!
 


    
    
    
    var dataDictionary = Dictionary<String, Any>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        
       // docNfcSwitchBtn.center = docNfcView.center
        docNfcSwitchBtn.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
        docTwoNfcSwitchBtn.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
        addressNfcSwitchBtn.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)

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
        
        
        
        docNfcView.isHidden = true
        docTwoNfcView.isHidden = true
        AddressNfcView.isHidden = true
        
        
        documentNFCVerification = false
        docNfcSwitchBtn.isOn = false
    
       
        documentTwoNFCVerification = false
        docTwoNfcSwitchBtn.isOn = false
        
        addressNFCVerification = false
        addressNfcSwitchBtn.isOn = false
        
        
        
    }
    
    
    @IBAction func docNfcBtnPressed(_ sender: Any) {
        
        if documentNFCVerification == false {
            documentNFCVerification = true
            docNfcSwitchBtn.isOn = true
        } else {
            documentNFCVerification = false
            docNfcSwitchBtn.isOn = false
        }
        
    }
    
    
    
    @IBAction func docTwoNfcBtnPressed(_ sender: Any) {
        
        if documentTwoNFCVerification == false {
            documentTwoNFCVerification = true
            docTwoNfcSwitchBtn.isOn = true
        } else {
            documentTwoNFCVerification = false
            docTwoNfcSwitchBtn.isOn = false
        }

    }
    
    @IBAction func addressNfcBtnPressed(_ sender: Any) {
        
        if addressNFCVerification == false {
            addressNFCVerification = true
            addressNfcSwitchBtn.isOn = true
        } else {
            addressNFCVerification = false
            addressNfcSwitchBtn.isOn = false
        }

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
            
            //Closing Subviews
            docNfcView.isHidden = false
            docTwoNfcView.isHidden = true
            
            AddressNfcView.isHidden = true
            
            documentCheckImg.image = UIImage(named: "check_radio")
        } else {
            documentVerification = false
            documentCheckImg.image = UIImage(named: "uncheck_radio")
            
            docNfcSwitchBtn.isOn = false
            docNfcView.isHidden = true
        }
    }
    @IBAction func documentTwoVerifyBtnPressed(_ sender: Any) {
        if documentTwoVerification == false {
            documentTwoVerification = true
            
            //Closing Subviews
            docTwoNfcView.isHidden = false
            docNfcView.isHidden = true
            
            AddressNfcView.isHidden = true
            
            documentTwoCheckImg.image = UIImage(named: "check_radio")
        } else {
            documentTwoVerification = false
            documentTwoCheckImg.image = UIImage(named: "uncheck_radio")
            
            docTwoNfcSwitchBtn.isOn = false
            docTwoNfcView.isHidden = true
        }
    }
    @IBAction func addressVerifyBtnPressed(_ sender: Any) {
        if addressVerification == false {
            addressVerification = true
            
            //Closing Subviews
            docNfcView.isHidden = true
            docTwoNfcView.isHidden = true
            
            AddressNfcView.isHidden = false
            
            addressCheckImg.image = UIImage(named: "check_radio")
        } else {
            addressVerification = false
            addressCheckImg.image = UIImage(named: "uncheck_radio")
            addressNfcSwitchBtn.isOn = false
            AddressNfcView.isHidden = true
        }
    }
    @IBAction func consentVerifyBtnPressed(_ sender: Any) {
        if concentVerification == false {
            concentVerification = true
            consentCheckImg.image = UIImage(named: "check_radio")
            
            //Closing Subviews
            docNfcView.isHidden = true
            docTwoNfcView.isHidden = true
            AddressNfcView.isHidden = true
                        
        } else {
            concentVerification = false
            consentCheckImg.image = UIImage(named: "uncheck_radio")

        }
    }
    @IBAction func twoFactorVerifyBtnPressed(_ sender: Any) {
        if twoFactorVerification == false {
            twoFactorVerification = true
            twoFactorCheckImg.image = UIImage(named: "check_radio")
            
            //Closing Subviews
            docNfcView.isHidden = true
            docTwoNfcView.isHidden = true
            AddressNfcView.isHidden = true
                        
        } else {
            twoFactorVerification = false
            twoFactorCheckImg.image = UIImage(named: "uncheck_radio")

        }
    }
    
    @IBAction func backgroundChecksBtnPressed(_ sender: Any) {
        if backgroundVerification == false {
            backgroundVerification = true
            backgroundCheckImg.image = UIImage(named: "check_radio")
            
            
            //Closing Subviews
            docNfcView.isHidden = true
            docTwoNfcView.isHidden = true
            AddressNfcView.isHidden = true
                        
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
                "country": "",
                "language": "EN",
                "email": "ad@example.com",
                "callback_url": "http://www.example.com",
                "show_results": "1",
                "redirect_url" : "https://www.mydummy.shuftipro.com/",
                "show_privacy_policy": "1",
                "show_consent": "1",
                "verification_Mode" : "image",
                
                
            ]
            //MARK:- Ocr

            if faceVerification == true {
                dataDictionary["face"] = [
                    "proof": ""
                ]
            }
            if documentVerification == true && documentNFCVerification  == true {
                
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
                    "backside_proof_required": "0",
                    "dob": "",
                    "document_number": "",
                    "expiry_date": "",
                    "issue_date": "",
                    "fetch_enhanced_data": "",
                    "nfc_verification" : "true",

                ]
            }
            
            if documentVerification == true && documentNFCVerification  == false {
                
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
                    "backside_proof_required": "0",
                    "dob": "",
                    "document_number": "",
                    "expiry_date": "",
                    "issue_date": "",
                    "fetch_enhanced_data": "",
                    "nfc_verification" : "false",

                ]
            }

            if documentTwoVerification == true && documentTwoNFCVerification == true {
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
                    "nfc_verification" : "true",

                    
                ]
            }
            
            if documentTwoVerification == true && documentTwoNFCVerification == false {
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
        
            
            if addressVerification == true && addressNFCVerification == true {
                dataDictionary["address"] = [
                    "full_address": "",
                    "name": "",
                    "backside_proof_required": "0",
                    "nfc_verification" : "true",

                    "supported_types": [
                        "id_card",
                        "utility_bill",
                        "bank_statement"
                    ],
                ]
            }
            
            if addressVerification == true && addressNFCVerification == false {
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
                "openWebView" : "false",
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

