//
//  ViewController.swift
//  ShuftiPro Non OCR
//
//  Created by Swift Developer on 11/6/18.
//  Copyright © 2018 Programmers Force. All rights reserved.
//

import UIKit
import ShuftiPro

class ViewController: UIViewController{
    
    let clientIdStr = "" // your client id here
    let secretKeyStr = "" // your secret key here
    let accessToken = "" // your accessToken here
    
    var faceVerification = false
    var documentVerification = false
    var addressVerification = false
    var concentVerification = false
    
    @IBOutlet weak var faceCheckImage: UIImageView!
    @IBOutlet weak var documentCheckImage: UIImageView!
    @IBOutlet weak var addressCheckImage: UIImageView!
    @IBOutlet weak var concentCheckImage: UIImageView!
    @IBOutlet weak var expandDocumentImage: UIImageView!
    @IBOutlet weak var expandAddressImage: UIImageView!
    @IBOutlet weak var expandConcentImage: UIImageView!


    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var dobTextField: UITextField!
    @IBOutlet weak var documentNoTextField: UITextField!
    
    @IBOutlet weak var issueDateTextField: UITextField!
    @IBOutlet weak var expiryDateTextField: UITextField!
    
    @IBOutlet weak var addressTextField: UITextView!
    @IBOutlet weak var concentTextField: UITextField!
    
    @IBOutlet weak var concentUIView: UIView!
    @IBOutlet weak var addressUIView: UIView!
    @IBOutlet weak var documentUIView: UIView!
    
    
    var dataDictionary = Dictionary<String, Any>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageTapGestures()
        datePickerGestures()
    }
    func imageTapGestures() {
        let documentTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(documentImageTapped(tapGestureRecognizer:)))
         documentCheckImage.isUserInteractionEnabled = true
        documentCheckImage.addGestureRecognizer(documentTapGestureRecognizer)
        
        let addressTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(addressImageTapped(tapGestureRecognizer:)))
         addressCheckImage.isUserInteractionEnabled = true
        addressCheckImage.addGestureRecognizer(addressTapGestureRecognizer)
        
        let concentTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(concentImageTapped(tapGestureRecognizer:)))
         concentCheckImage.isUserInteractionEnabled = true
        concentCheckImage.addGestureRecognizer(concentTapGestureRecognizer)
    }
    func datePickerGestures() {
        dobTextField.addInputViewDatePicker(target: self, selector: #selector(doneDobPressed))
        issueDateTextField.addInputViewDatePicker(target: self, selector: #selector(doneIssueDatePressed))
        expiryDateTextField.addInputViewDatePicker(target: self, selector: #selector(doneExpiryDatePressed))

    }
    @objc func documentImageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        if firstNameTextField.text != "" || lastNameTextField.text != "" || dobTextField.text != "" || documentNoTextField.text != "" || issueDateTextField.text != "" || expiryDateTextField.text != "" {
        if documentCheckImage.image ==  #imageLiteral(resourceName: "uncheck_radio") {
            documentCheckImage.image = #imageLiteral(resourceName: "check_radio")
            documentVerification = true
        }else if documentCheckImage.image == #imageLiteral(resourceName: "check_radio"){
            documentCheckImage.image =  #imageLiteral(resourceName: "uncheck_radio")
            documentVerification = false
            firstNameTextField.text = ""
            lastNameTextField.text = ""
            dobTextField.text = ""
            documentNoTextField.text = ""
            issueDateTextField.text = ""
            expiryDateTextField.text = ""
            
        }
        }
    }
    @objc func addressImageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        if addressTextField.text != "" {
         
         if addressCheckImage.image ==  #imageLiteral(resourceName: "uncheck_radio") {
             addressCheckImage.image = #imageLiteral(resourceName: "check_radio")
             self.addressVerification = true
         }else if addressCheckImage.image == #imageLiteral(resourceName: "check_radio"){
             addressCheckImage.image =  #imageLiteral(resourceName: "uncheck_radio")
             self.addressVerification = false
             addressTextField.text = ""
         }
     }

    }
    @objc func concentImageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        if concentTextField.text != "" {
        if concentCheckImage.image ==  #imageLiteral(resourceName: "uncheck_radio") {
            concentCheckImage.image = #imageLiteral(resourceName: "check_radio")
            self.concentVerification = true
        }else if concentCheckImage.image == #imageLiteral(resourceName: "check_radio"){
            concentCheckImage.image =  #imageLiteral(resourceName: "uncheck_radio")
            self.concentVerification = false
            concentTextField.text = ""
        }
        }
    }
    //MARK:- Date Picker

    @objc func doneDobPressed() {
       if let  datePicker = self.dobTextField.inputView as? UIDatePicker {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "yyyy-MM-dd"
        //   dateFormatter.dateStyle = .medium
           self.dobTextField.text = dateFormatter.string(from: datePicker.date)
          // self.expiryDate = dateFormatter.string(from: datePicker.date)
            //print("expiry date :\(expiryDate)")
       }
       self.dobTextField.resignFirstResponder()
    }
    
    @objc func doneIssueDatePressed() {
       if let  datePicker = self.issueDateTextField.inputView as? UIDatePicker {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "yyyy-MM-dd"
        //   dateFormatter.dateStyle = .medium
           self.issueDateTextField.text = dateFormatter.string(from: datePicker.date)
          // self.expiryDate = dateFormatter.string(from: datePicker.date)
            //print("expiry date :\(expiryDate)")
       }
       self.issueDateTextField.resignFirstResponder()
    }
    @objc func doneExpiryDatePressed() {
       if let  datePicker = self.expiryDateTextField.inputView as? UIDatePicker {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "yyyy-MM-dd"
        //   dateFormatter.dateStyle = .medium
           self.expiryDateTextField.text = dateFormatter.string(from: datePicker.date)
          // self.expiryDate = dateFormatter.string(from: datePicker.date)
            //print("expiry date :\(expiryDate)")
       }
       self.expiryDateTextField.resignFirstResponder()
    }
    @IBAction func faceVerificationBtnPressed(_ sender: Any) {
        if faceVerification == false {
            faceVerification = true
            faceCheckImage.image = UIImage(named: "check_radio")
        } else {
            faceVerification = false
            faceCheckImage.image = UIImage(named: "uncheck_radio")
        }
    }
    @IBAction func documentVerificationBtnPressed(_ sender: Any) {
        if documentVerification == false {
            documentVerification = true
            expandDocumentImage.image = UIImage(named: "un-expand")
            documentUIView.isHidden = false
        } else {
            documentVerification = false
            expandDocumentImage.image = UIImage(named: "expand")
            documentUIView.isHidden = true
        }
        if firstNameTextField.text != "" || lastNameTextField.text != "" || dobTextField.text != "" || documentNoTextField.text != "" || issueDateTextField.text != "" || expiryDateTextField.text != "" {
            documentCheckImage.image = #imageLiteral(resourceName: "check_radio")
        }else {
            documentCheckImage.image = #imageLiteral(resourceName: "uncheck_radio")
        }
    }
    @IBAction func addressVerificationBtnPressed(_ sender: Any) {
        if addressVerification == false {
            addressVerification = true
            expandAddressImage.image = UIImage(named: "un-expand")
            addressUIView.isHidden = false
        } else {
            addressVerification = false
            expandAddressImage.image = UIImage(named: "expand")
            addressUIView.isHidden = true
        }
        if addressTextField.text != "" {
            addressCheckImage.image = #imageLiteral(resourceName: "check_radio")
        }else {
            addressCheckImage.image = #imageLiteral(resourceName: "uncheck_radio")
        }
    }
    @IBAction func concentVerificationBtnPressed(_ sender: Any) {
        if concentVerification == false {
            concentVerification = true
            expandConcentImage.image = UIImage(named: "un-expand")
            concentUIView.isHidden = false
        } else {
            concentVerification = false
            expandConcentImage.image = UIImage(named: "expand")
            concentUIView.isHidden = true
        }
        if  concentTextField.text != "" {
            concentCheckImage.image = #imageLiteral(resourceName: "check_radio")
        }else {
            concentCheckImage.image = #imageLiteral(resourceName: "uncheck_radio")
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
        if concentTextField.text != "" {
            concentVerification = true
        }else {
            concentVerification = false
        }
    }
    
    func createJsonObj() {
        chkVerifications()
        if faceVerification == true || documentVerification == true || addressVerification == true || concentVerification == true {
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
                    "fetch_enhanced_data": "1"
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
            if concentVerification == true {
                dataDictionary["consent"] = [
                    "text": concentTextField.text as! String,
                    "supported_types": [
                        "printed"
                    ]
                ]
            }
            
            let shufti = ShuftiPro(clientId: clientIdStr, secretKey: secretKeyStr, parentVC: self)
            //let shufti = ShuftiPro(accessToken: accessToken, parentVC: self) //To use with Access Token
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
    


}

extension UITextField {

    //Date Picker
    func addInputViewDatePicker(target: Any, selector: Selector) {

       let screenWidth = UIScreen.main.bounds.width

       //Add DatePicker as inputView
       let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216))
       datePicker.datePickerMode = .date
       self.inputView = datePicker

       //Add Tool Bar as input AccessoryView
       let toolBar = UIToolbar()
        toolBar.sizeToFit()
       let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
       let doneBarButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: selector)
        let cancelBarButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelPressed))

       toolBar.setItems([cancelBarButton, flexibleSpace, doneBarButton], animated: false)

       self.inputAccessoryView = toolBar
    }

      @objc func cancelPressed() {
        self.resignFirstResponder()
      }
}
