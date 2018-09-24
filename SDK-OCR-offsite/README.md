[![](https://raw.githubusercontent.com/shuftipro/ShuftiProSDK/master/shufti_pro_sdk.png)](https://www.shuftipro.com/)

# What Is This?
Shufti Pro is a SaaS, that provides quick and accurate digital identity and document verification. E-KYC using government-issued documents like ID card, passport, driving license and even credit/debit cards, etc. has never been easier. Shufti Pro allows for simple and easy ID checks online, securing the virtual trading platforms and FinTech institutions against scams, frauds and money launderers.

# Table of contents
* [Basic Setup](#basic-setup)
* [General Requirements](#general-requirements)
* [SDK Installation Guide](#sdk-installation-guide)
* [Permissions](#permissions)
* [Integration](#integration)
* [Verifications](#verifications)
  * [Card Present Verification](#card-present-verification)
  * [Identity Verification](#identity-verification)
* [Customize Colors](#customize-colors)
* [Asyncronous Feedback](#asyncronous-feedback)
* [Response Status Codes](#response-status-codes)
* [Sample Project Setup](#sample-project-setup)
* [Contact](#contact)
* [Copyright](#copyright)

# Basic Setup
## General Requirements
Followings are minimum requirements for SDK:
- iOS 8.0 and higher
- Internet connection

Supported architectures in SDK:
- armv7 and arm64 for devices

## SDK Installation Guide
1. Copy “ShuftiPro.framework” into your project folder.
2.  In xcode select your project -> your project under TARGETS -> General -> Embeded Binaries
3.  Add “ShuftiPro.framework” in Embeded Binaries.

## Permissions:
Application Info.plist must contain an **Privacy - Camera Usage Description** key with a explanation to end-user about how the app uses this data.

## Verifications:
Shufti Pro supports two modes of verification:<br />
**1. Identity Verification**<br />
**2. Card Present Verification**

## Integration: 
See the sample project provided to learn the most common use. Make sure to build on real device.
```sh
import ShuftiPro
```
Make an instance 
```sh
let instance = Shuftipro(clientId: "your-clientId",
                               secretKey: "your-secretKey",
                               parentVC: your viewController from where you want to open ShuftiPro)
```
## Card Present Verification
For **Card Present** verification
```sh
instance.creditCardVerification(country: "your country",
                                      cardFirst6Digits: "your cardFirst6Digits",
                                      cardLast4Digits: "your cardLast4Digits",
                                      phoneNumber: "phoneNumber") { 
    (result: Any) in
    print(result) // Callback response for verification verified/declined
    let reponse = result as! NSDictionary
    if reponse.value(forKey: "status_code") as! String == "SP1" {
        // Verified: Do something
    }else{
        // Declined: Do something
    }
}
```


#### Request Parameters 

| Parameter | Description |
| ------ | ------ |
| cardFirst6Digits | First 6 digits of the customer’s credit/debit card number. |
| cardLast4Digits | Last 4 digits of the customer’s credit/debit card number.  |
| country | Full Country name or ISO2 Code . Example: United Kingdom or GB. |
| phoneNumber | Customer’s phone number with country code. Example: +440000000000 |

## Identity Verification
For **Identity** verification using ID documents (Methods: "**driving_license**" or "**passport**" or "**id_card**")
```sh
instance.documentVerification(method: "type of method for verification",
                            firstName: "your first name",
                            lastName: "your last name",
                            dob: "yyyy-mm-dd",
                            country: "your country",
                            phoneNumber: "your phone number") { 
    (result: Any) in
    print(result) // Callback response for verification verified/declined
    let reponse = result as! NSDictionary
    if reponse.value(forKey: "status_code") as! String == "SP1" {
        // Verified: Do something
    }else{
        // Declined: Do something
    }
}
```

> **Note:** Run project on real device.

#### Request Parameters 

| Parameter | Description |
| ------ | ------ |
| method | Which type of verification would you like for your   customers? <br> Possible   values: <br> <ul><li> passport </li><li> driving_license </li><li> id_card</li></ul> |
| firstName | Customer’s First Name. The maximum length of the string is 32 characters and minimum required length is 2 characters. |
| lastName | Customer’s Last Name. The maximum length of the string is 32 characters and minimum required length is 2 characters. |
| dob | Customer’s date of birth (YYYY-MM-DD). Example: 1980-01-31 |
| country | Full Country name or ISO2 Code. Example: United Kingdom or GB. |
| phoneNumber | Customer’s phone number with country code. Example: +440000000000 |

## Customize Colors
You can customize SDK colors by using their **Hex Color Codes**
```sh
instance.topBarColor = "#C62B2A" // Color for top bars except camera view
instance.topBarTextColor = "#FFFFFF" // Color for text in top bars except camera view
instance.bottomBarColor = "#C62B2A" // Color for bottom bar except camera view
instance.bottomBarTextColor = "#FFFFFF" // Color for text in bottom bars
instance.progressBarColor = "#01A95B" // Color for Progress bar
instance.activityIndicatorColor = "#C62B2A" // color for activity indicator
```

## Asyncronous Feedback
If async value is set to true then you'll instantly get the user's control back so you don't have to wait for the verification results. When a request is verified you'll automatically get a callback and you can also check the verification status by making a separate [RESTful API call](https://github.com/shuftipro/integration-guide#get-request-status). 

```sh
instance.async = "true"
```

## Response Status Codes 
| Status Code | Description |
| ------ | ------ |
| SP0 | Not Verified |
| SP1 | Verified |
| SP2 | Success! -- Contains the redirect url in message parameter |
| SP11 | Length Validation -- [parameter_name] maximum and minimum length limit is [parameter_name] characters. |
| SP14 | Duplicate reference -- If a duplicate reference is provided. |
| SP15 | Invalid client id -- Client id is invalid or not found. |
| SP16 | Missing required parameter -- ["parameter_name"] is required but either missing or empty |
| SP17 | Invalid format -- ["parameter_name"] is not in the correct format. |
| SP18 | Invalid signature -- Invalid request signature. |
| SP19 | Invalid country code -- Invalid country code or country is not supported. |
| SP20 | Invalid Phone No -- Invalid phone number is provided. |
| SP21 | Invalid Method Name -- Given verification method is not supported. |
| SP23 | Invalid DOB -- Date of birth is not valid. |
| SP24 | Blocked Client -- Your account is not active. |
| SP25 | Request Timeout -- Send in callback when request timeout |
| SP26 | User has been landed on verification page |
| SP27 | Request is already processed |

## Sample project setup
In ViewController.swift add your **Client ID** on line 14 and **Secret Key** on line 15, thats it!
> **Note:** Run project on real device.

## Contact
If you have any questions/queries regarding implementation SDK please feel free to contact our [tech support](mailto:support@shuftipro.com).

## Copyright
2016-17 © Shufti Pro Ltd.
