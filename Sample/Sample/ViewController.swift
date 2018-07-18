//
//  ViewController.swift
//  Sample
//
//  Created by Swift Developer on 21/02/2018.
//  Copyright © 2018 Programmers Force. All rights reserved.
//

import UIKit
import ShuftiPro

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextViewDelegate {
    
    let clientIdString: String = "" //your Client ID here
    let secretKeyString: String = "" //your Secret key here
    
    var selectedMethod: String = ""
    
    @IBOutlet weak var verificationHeadingLabel: UILabel!
    
    @IBOutlet weak var cardSixDigits: UITextField!
    @IBOutlet weak var card4Digits: UITextField!
    @IBOutlet weak var countryField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    
    
    @IBOutlet weak var fnameField: UITextField!
    @IBOutlet weak var lnameField: UITextField!
    @IBOutlet weak var dobField: UITextField!
    @IBOutlet weak var countryFieldForDoc: UITextField!
    @IBOutlet weak var phoneFieldForDoc: UITextField!
    
    
    @IBOutlet weak var methodIconImage: UIImageView!
    @IBOutlet weak var methodIconView: CustomBtns!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var docView: UIView!
    
    var dobDate: Date? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        docView.isHidden = true
        chkView()
        ElementShadow.sharedInstance.setShadowOnView(view: methodIconView)
        
    }
    
    
    @IBAction func cardVerificationBtnClicked(_ sender: Any) {
        let varify = Shuftipro(clientId: clientIdString, secretKey: secretKeyString, parentVC: self)
        varify.topBarColor = "" //Hex Color Code
        varify.topBarTextColor = "" //Hex Color Code
        varify.bottomBarColor = "" //Hex Color Code
        varify.bottomBarTextColor = "" //Hex Color Code
        varify.progressBarColor = "" //Hex Color Code
        varify.activityIndicatorColor = "" //Hex Color Code
        varify.async = "" //true or false
        varify.creditCardVerification(country: countryField.text!, cardFirst6Digits: cardSixDigits.text!, cardLast4Digits: card4Digits.text!, phoneNumber: phoneField.text!){
            (result: Any) in
            
            print(result) // Callback response for verification verified/declined
            let reponse = result as! NSDictionary
            if reponse.value(forKey: "status_code") as! String == "SP1" {
                // Verified: Do something
            }else{
                // Declined: Do something
            }
        }
    }
    
    
    @IBAction func docVerificationBtnClicked(_ sender: Any) {
        
        let varify = Shuftipro(clientId: clientIdString, secretKey: secretKeyString, parentVC: self)
        varify.topBarColor = "" //Hex Color Code
        varify.topBarTextColor = "" //Hex Color Code
        varify.bottomBarColor = "" //Hex Color Code
        varify.bottomBarTextColor = "" //Hex Color Code
        varify.progressBarColor = "" //Hex Color Code
        varify.activityIndicatorColor = "" //Hex Color Code
        varify.async = "" //true or false
        varify.documentVerification(method: selectedMethod, firstName: fnameField.text!, lastName: lnameField.text!, dob: dobField.text!, country: countryFieldForDoc.text!, phoneNumber: phoneFieldForDoc.text!){
            (result: Any) in
            
            print(result) // Callback response for verification verified/declined
            let reponse = result as! NSDictionary
            if reponse.value(forKey: "status_code") as! String == "SP1" {
                // Verified: Do something
            }else{
                // Declined: Do something
            }
        }
    }
    
    func chkView(){
        if selectedMethod == "id_card"{
            verificationHeadingLabel.text = "ID Card Verification"
            methodIconImage.image = UIImage(named: "card_Id")
            hideCardView()
        }else if selectedMethod == "driving_license" {
            verificationHeadingLabel.text = "Driving Licence Verification"
            methodIconImage.image = UIImage(named: "Card_Driving")
            hideCardView()
        }else if selectedMethod == "passport" {
            verificationHeadingLabel.text = " Passport Verification"
            methodIconImage.image = UIImage(named: "Passport")
            hideCardView()
        }else{
            verificationHeadingLabel.text = "Credit/Debit Card Verification"
            methodIconImage.image = UIImage(named: "Credit")
            hideDocView()
        }
    }
    
    
    func hideDocView(){
        docView.isHidden = true
        cardView.isHidden = false
    }
    
    func hideCardView(){
        cardView.isHidden = true
        docView.isHidden = false
    }
    
    
    
    @IBAction func dobFieldTapped(_ sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        
        var components = DateComponents()
        components.year = -100
        let minDate = Calendar.current.date(byAdding: components, to: Date())
        
        components.year = 0
        let maxDate = Calendar.current.date(byAdding: components, to: Date())
        
        datePickerView.minimumDate = minDate
        datePickerView.maximumDate = maxDate
        
        //datePickerView.maximumDate = NSDate() as Date
        datePickerView.datePickerMode = UIDatePickerMode.date
        
        sender.inputView = datePickerView
        
        datePickerView.addTarget(self, action: #selector(datePickerValueChanged), for: UIControlEvents.valueChanged)
        if dobDate != nil {
            datePickerView.date = dobDate!
        }
    }
    
    @IBAction func dismissView(_ sender: Any) {
        self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    //function that put selected date into dob field
    @objc func datePickerValueChanged(sender:UIDatePicker) {
        let str = getCurrentDate(date: sender.date)
        dobField.text = str
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let result = formatter.date(from: str)
        dobDate = result
    }
    
    //function that gets current date
    func getCurrentDate(date: Date) ->String{
        
        let date = date
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let result = formatter.string(from: date)
        return result
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 0
    }
    
}

