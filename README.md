[![](https://raw.githubusercontent.com/shuftipro/RESTful-API-v1.2/master/assets/banner.jpg)](https://www.shuftipro.com/)

# What Is This?
Shufti Pro is a SaaS provider. We provides quick and accurate digital identity and document verification. E-KYC using government-issued documents like ID card, passport, driving license and even credit/debit cards, etc. has never been easier. Shufti Pro allows for simple and easy ID checks online, securing the virtual trading platforms and FinTech institutions against scams, frauds and money launderers.

**Shufti Pro’s AI & HI hybrid technology ensures 99.6% accurate results and quickest response time.**

Shufti Pro’s API supports verification with and without OCR. 
## Table of contents
* [General Requirements](#general-requirements)
* [Permissions](#permissions)
* [SDK Installation Guide](#sdk-installation-guide)
* [Verifications](#verification)
* [Integration](#Integration)
* [JSON Object](#Json-Object-With-Ocr)
* [AuthKey Object Parameters ](#AuthKey-Object-Parameters)
* [Config Object Parameters ](#Config-Object-Parameters)
* [Sample Request](#Sample-Request)
* [JSON Object Parameters](#Request-Parameters)
* [HTTP Codes](#HTTP-Codes)
* [Status Response](#status-response)
* [Test IDs](#test-ids)
* [Contact](#contact)
* [Copyright](#copyright)


# Basic Setup
## General Requirements
Followings are minimum requirements for SDK:
- iOS 13.0 and higher
- Internet connection

Supported architectures in SDK:
- armv7 and arm64 for devices

## Permissions:
* ### Application Info.plist must contain an **Privacy - Camera Usage Description** , **Privacy - Microphone Usage Description**  and  **Privacy - NFC Scan Usage Description**key with a explanation to end-user about how the app uses this data.
* ### And Open your Info.plist file as Source Code add these lines inside dict tag.
```
<key>com.apple.developer.nfc.readersession.iso7816.select-identifiers</key>
<array>
    <string>00000000000000</string>
    <string>A0000002471001</string>
</array>
```
* ### In your Project target add under Signing and Capabilities section tap on Capabilities and add Near Field communication Tag Reading.
For more guidance watch this guided image. [here](nfcGuide.png)


## SDK Installation Guide
1. Add these dependencies into your project's pod file.
```
    pod 'NFCPassportReader', git:'https://github.com/AndyQ/NFCPassportReader.git'
    pod 'GoogleMLKit/TextRecognition'
```
2. Copy “ShuftiPro.framework” into your project folder.
3.  In xcode select your project -> your project under TARGETS -> General -> Embeded Binaries
4.  Add “ShuftiPro.framework” in Embeded Binaries.
5. Make sure your in your xcode project build settings "Validate Workspace" is set to "Yes"


## Verification
In order to get verified, customers will have themselves verified through their mobile phones. They will do it through the merchant's mobile application. Merchant will collect the information and send us the data for verification. The Merchant shall provide us with the proofs(Videos). We will not collect them directly from the user.
  
* ### With OCR
In verification with OCR, it means that the merchant has not provided us proofs (images/videos) and also no data in some keys. In this verification Shufti Pro will perform extraction of data from those proofs and finally verify the data. 
Consult [This Document](verification-with-ocr) for the Verification with OCR. 
  
* ### Without OCR
In verification without OCR, merchant gives us the data in keys as well as all the proofs required then Shufti Pro just have to verify the data. No customer interaction takes place in this kind of verification.

Consult [This Document](verification-without-ocr) for the Verification without OCR.

* ### Verification through Hybrid view
If you opt for mobile verification with Shufti Pro’s hybrid view, a web-view built upon HTML 5 will be displayed to the end-user. All data points and fields are adequately defined in the hybrid view. The format for sending verification data will be a JSON object, similar to other mobile verification formats (OCR and Non-OCR). If your send true in [openWebView](#openwebview) parameter then verification through hybrid view will be started else verification with OCR or without OCR (based upon JSON object) will be triggered.

For more details on technical requirements for Verification with Rest API, kindly visit Shufti Pro’s resource page here.  

## Integration: 
See the sample project provided to learn the most common use. Make sure to build on real device.
```sh
import ShuftiPro
```
## JSON Object With Ocr
```sh
let requestObject: [String: Any] = [
            "reference": "Unique reference",
            "country": "GB",
            "language": "EN",
            "email": "johndoe@example.com",
            "callback_url": "http://www.example.com",
            "phone" = "",
            "show_results" = "",
            "show_consent" = "",
            "show_privacy_policy" = "",
            "verification_mode": "",
            "background_checks" = "",

            "face": ["proof": ""
            ],

            "document": [
                 "proof": "",
                 "additional_proof" :"",

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
                "backside_proof_required": "0",
                 "dob": "",
                 "document_number": "",
                 "expiry_date": "",
                 "issue_date": "",
                 "nfc_verification": "false",
                 "fetch_enhanced_data": "1"
             ],
            "document_two": [
                 "proof": "",
                 "additional_proof" :"",

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
                "backside_proof_required": "0",
                 "dob": "",
                 "document_number": "",
                 "expiry_date": "",
                 "issue_date": "",
                 "nfc_verification": "false",
                 "fetch_enhanced_data": "1"
             ],
             "address": [
                 "proof": "",
                 "full_address": "",
                 "name": [
                     "first_name": "",
                     "last_name": "",
                     "middle_name": "",
                     "fuzzy_match": ""
                 ],
                 "nfc_verification": "false",
                 "supported_types": [
                     "id_card",
                     "utility_bill",
                     "bank_statement"
                 ],
             ],
             "consent":[
               "proof" : "",
               "text" : "",
               "supported_types" :[
                 "printed"
               ]
             ]
        ]
```
## JSON Object Without Ocr
```sh
let requestObject: [String: Any] = [
            "reference": "Unique reference",
            "country": "GB",
            "language": "EN",
            "email": "johndoe@example.com",
            "callback_url": "http://www.example.com",
            "phone" = "",
            "show_results" = "",
            "show_consent" = "",
            "show_privacy_policy" = "",
            "verification_mode": "",
            "background_checks" = "",

            "face": ["proof": ""
            ],

            "document": [
                 "proof": "",
                 "additional_proof" :"",

                 "supported_types": [
                     "passport",
                     "id_card",
                     "driving_license",
                     "credit_or_debit_card"
                    ],
                 "name": [
                     "first_name": "John",
                     "last_name": "Carter",
                     "middle_name": "Doe"
                ],
                "backside_proof_required": "0",
                 "dob": "1992-10-10",
                 "document_number": "2323-5629-5465-9990",
                 "expiry_date": "2025-10-10",
                 "issue_date": "2015-10-10",
                 "nfc_verification": "false",
                 "fetch_enhanced_data": "1"
             ],

                "document_two": [
                 "proof": "",
                 "additional_proof" :"",

                 "supported_types": [
                     "passport",
                     "id_card",
                     "driving_license",
                     "credit_or_debit_card"
                    ],
                 "name": [
                     "first_name": "John",
                     "last_name": "Carter",
                     "middle_name": "Doe"
                ],
                 "backside_proof_required": "0",
                 "dob": "1992-10-10",
                 "document_number": "2323-5629-5465-9990",
                 "expiry_date": "2025-10-10",
                 "issue_date": "2015-10-10",
                 "nfc_verification": "false",
                 "fetch_enhanced_data": "1"
             ],
             "address": [
                 "proof": "",
                 "full_address": "3339 Maryland Avenue, Largo, Florida",
                 "name": [
                     "first_name": "John",
                     "last_name": "Carter",
                     "middle_name": "Doe",
                     "fuzzy_match": ""
                 ],
                 "nfc_verification": "false",
                 "supported_types": [
                     "id_card",
                     "utility_bill",
                     "bank_statement"
                 ],
             ],
             "consent":[
               "proof" : "",
               "text" : "This is a customized text",
               "supported_types" :[
                 "printed"
               ]
             ]
        ]
```
## Auth Keys
Auth keys can be made in two ways. First is by using **clientId** and **secretKey**, other one is by providing **accessToken**.<br>
You can read more about **accessToken** [here](https://api.shuftipro.com/api/docs/#access-token)
```sh

 let authKeys = [
                "auth_type" : "basic_auth",
                "client_id" : "xxxxx-xxxxx-xxxxx",
                "secret_key": "xxxxx-xxxxx-xxxxx"

  ]

 "Or"

 let authKeys = [
                "auth_type"  : "access_token",
                "access_token" : "xxxxx-xxxxx-xxxxx"
  ]
```
## Configs
```sh
  let configs = [
                "openWebView" : "false",
                "aysnc" : "false",
                "captureEnabled" : "false",
  ]
```

## Sample Request
Make an instance <br>

```sh
let instance = ShuftiPro()
```
```sh
instance.shuftiProVerification(requestObject: "your-request-object",
                               authKeys: "authentication-keys-object",parentVC: your viewController from where you want to open ShuftiPro, 
                               configs: "configuration-object"){(result) in 

    print(result) // Callback response for verification verified/declined
    let reponse = result as! NSDictionary
    if reponse.value(forKey: "event") as! String == "verification.accepted" {
        // Verified: Do something
    }else{
        // Declined: Do something
    }

}
                                                  
```


# Verification Request

Whenever a request for verification from a user is received, Shufti Pro’s intelligent system determines the nature of verification through parameters given below. These parameters enable Shufti Pro to:

1. Identify its customers
2. Check authenticity of client’s credentials
3. Read client’s data
4. Decide what information is being sent to perform that verification 
# AuthKey Object Parameters
In this object, we add authorization Key in verification request.
* ## Basic Auth
   Shufti Pro provides Authorization to clients through the Basic Auth header. Your Client ID will serve as your Username while the Secret Key will serve as your Password. The API will require this header for every request.

* ## Access Token
   Shufti Pro provides Bearer Access Token Authorization method. The client can generate temporary access token using new access token endpoint. The shared token will be used to authorize API requests. The token shared with the client will be valid for 10 minutes and can be used once only.

# Config Object Parameters
In this object, we add extra configuration of verification that the user wants.
* ## async
   Required: **No**  
  Type: **string**  
  Accepted Values: **, "true", "false"**

   If async value is set to true you'll instantly get the user's control back so you don't have to wait for the verification results. When a request is completed you'll automatically get a callback. 
   
* ## openWebView

  Required: **No**  
  Type: **string**  
  Accepted Values: **"true", "false"**

  This boolean type of parameter is used to identify if you want to perform verification in its hybrid view.
  If open_webview is true, it means that the user wants verification in **hybrid view**. If false, then the user wants verification with **OCR or Without OCR**. The value is false by default.
  
  * ## captureEnabled

      Required: **No**  
      Type: **boolean** <br>
    Accepted Values: **true**, **false**    

      This boolean type of parameter is used to identify whether the user wants to open native camera in Iframe or not. A true value means user wants to open native otherwise not. 



# Request Parameters

It is important to note here that each service module is independent of other and each one of them is activated according to the nature of request received from you. There are a total of six services which include face, document, address, consent, phone and background_checks.

All verification services are optional. You can provide Shufti Pro a single service or mixture of several services for verifications. All keys are optional too. If a key is given in document or address sevice and no value is provided then OCR will be performed for those keys. 

* ## reference

  Required: **Yes**  
  Type: **string**  
  Minimum: **6 characters**  
  Maximum: **250 characters**

  This is the unique reference ID of request, which we will send you back with each response, so you can verify the request. Only alphanumeric values are allowed. This reference can be used to get status of already performed verification requests.


* ## country

  Required: **Yes**  
  Type: **string**  
  Length: **2 characters**

  Send the 2 characters long [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2#Officially_assigned_code_elements) country code of where your customer is from. Please consult [Supported Countries](https://github.com/shuftipro/RESTful-API-v1.3/blob/master/off-site_without_ocr/countries.md) for country codes.

* ## language

  Required: **No**  
  Type: **string**  
  Length: **2 characters**

  Send the 2 characters long language code of your preferred language to display the verification screens accordingly. Please consult [Supported Languages](https://github.com/shuftipro/RESTful-API-v1.3/blob/master/off-site_without_ocr/languages.md) for language codes. Default language english will be selected if this key is missing in the request.

* ## email

  Required: **No**  
  Type: **string**  
  Minimum: **6 characters**  
  Maximum: **128 characters**

  This field represents email of the end-user. If it is missing in a request, than Shufti Pro will ask the user for its email in an on-site request.

* ## callback_url

  Required: **No**  
  Type: **string**  
  Minimum: **6 characters**  
  Maximum: **250 characters**

  During a verification request, we make several server to server calls to keep you updated about the verification state. This way you can update the request status at your end even if the customer is lost midway through the process.

* ## verification_mode

  Required: **No**  
  Type: **string**  
  Accepted Values: **any, image_only, video_only**

  Verification mode defines what types of proofs are allowed for a verification. In case of 'video_only' user will upload videos and images if verification mode is 'image_only'. 

* ## show_privacy_policy

  Required:  **No**  
  Type: **string** <Br>
  Accepted Values: **"0",   "1"**
  This key specifies if privacy policy will be shown to user or not. If show_privacy_policy is  “0”, then privacy policy is not shown. If “1”, then privacy policy is shown to result screen. 

  
* ## show_results

  Required: **No**  <Br>
  Type: **string** <Br>
  Accepted Values: **"0",   "1"**
  
  This key specifies that is verification result show to user or not.If show_results is "0" than verification result  not show to user and send to merchant.If show_results is "1" than verification result show to user.

* ## show_consent

  Required: **No**  <Br>
  Type: **string** <Br>
  Accepted Values: **"0",   "1"**
  
  This parameter displays a screen to collect consent from end-user before the verification process starts. If the value is set 1, the screen will be displayed to end-user. If the value is set 0, the consent screen will not be displayed.


 
* ## background_checks

  Required: **No**  
  Type: **string**  
  Accepted Values: **"0", "1"**

   It is a verification process that will require you to send us the full Name of end-user in addition to the date of birth. Shufti Pro will perform AML based background checks based on this information. Please note that the name and dob keys will be extracted from document service if these keys are empty. 

 
* ## phone

  Required: **No**  
  Type: **string**  
  Accepted Values: **"0", "1"**

  This service key corresponds to Phone Verification service of Shufti Pro. A customized code is sent to end-user on their phone number, that is sent back by end-user to verify their identity.   

<!-- -------------------------------------------------------------------------------- -->
* ## Face

  The easiest of all verifications is done by authenticating the face of the users. In case of on-site verification, end-user will have to show their face in front of a webcam or camera of their phone that essentially makes it a selfie verification.

<!-- -------------------------------------------------------------------------------- -->
* ## Document or Document 2

  Shufti Pro provides document verification through various types of documents. The supported formats are passports, ID Cards, driving licenses and debit/credit cards. You can opt for more than 1 document type as well. In that case, Shufti Pro will give an option to end-users to verify their data from any of the given document types.  
    * <h3>proof</h3>

  Required: **No**  
  Type: **string** <br>
  Image Format: JPG, JPEG, PNG, PDF Maximum: 16MB <br>
  Video Format: MP4/MOV Maximum: 20MB

  Provide valid BASE64 encoded string. Leave empty for an on-site verification.

    * <h3>additional_proof</h3>

  Required: **No**  
  Type: **string** <br>
  Image Format: JPG, JPEG, PNG, PDF Maximum: 16MB <br>
  Video Format: MP4/MOV Maximum: 20MB

  Provide valid BASE64 encoded string. Leave empty for an on-site verification.

  * <h3>supported_types</h3>

  Required: **Yes**  
  Type: **Array**

  You can provide any one, two or more types of documents to verify the identity of user. For example, if you opt for both passport and driving license, then your user will be given an opportunity to verify data from either of these two documents. All supported types are listed below.
    * <h3>backside_proof_required</h3>

  Required: **No**  <br>
  Type: **string** <br>
  Accepted value: **"1", "0"**

  If the value of this parameter is set to 1, Shufti Pro will require the end-user to capture/upload both sides of the document to verify the identity.

  Supported Types      |
  ---------------------|
  passport             |
  id_card            |
  driving_license    |
  credit_or_debit_card |

  **Example 1** ["driving_license"]  
  **Example 2** ["id_card", "credit_or_debit_card", "passport"]

  * <h3>name</h3>

  Required: **No**  
  Type: **object**

  In name object used in document service, first_name and last_name are extracted from the document uploaded if name is empty. 

  * <h4>first_name</h4>
  Required: **No**  
  Type: **string**  
  Minimum: **2 characters**  
  Maximum: **32 chracters** 

  Allowed Characters are alphabets, - (dash), comma, space, dot and single quotation mark. 
  Example **John'O Harra**

  * <h4>middle_name</h4>

  Required: **No**  
  Type: **string**  
  Minimum: **2 characters**  
  Maximum: **32 chracters**

  Allowed Characters are alphabets, - (dash), comma, space, dot and single quotation mark.  
  Example **Carter-Joe**

  * <h4>last_name</h4>

  Required: **No**  
  Type: **string**  
  Minimum: **2 characters**  
  Maximum: **32 chracters**

  Allowed Characters are alphabets, - (dash), comma, space, dot and single quotation mark. 
  Example **John, Huricane Jr.**

  * <h4>fuzzy_match</h4>

  Required: **No**  
  Type: **string**  
  Value Accepted: **1**

  Provide 1 for enabling a fuzzy match of the name. Enabling fuzzy matching attempts to find a match which is not a 100% accurate.

  * <h3>dob</h3>

  Required: **No**  
  Type: **string**  
  Format: **yyyy-mm-dd**

  Leave empty to perform data extraction from uploaded proofs. Provide a valid date. Please note that the date should be before today. 
  Example 1990-12-31

  * <h3>document_number</h3>

  Required: **No**  
  Type: **string**  
  Minimum: **2 characters**  
  Maximum: **100 chracters**

  Leave empty to perform data extraction from the proof which will be uploaded by end-users. Allowed Characters are numbers, alphabets, dots, dashes, spaces, underscores and commas. 
  Examples 35201-0000000-0, ABC1234XYZ098

  * <h3>issue_date</h3>

  Required: **No**  
  Type: **string**  
  Format: **yyyy-mm-dd**

  Leave empty to perform data extraction from the proof which will be uploaded by end-users. Provide a valid date. Please note that the date should be before today. 
  Example 2015-12-31

  * <h3>expiry_date</h3>

  Required: **No**  
  Type: **string**  
  Format: **yyyy-mm-dd**

  Leave empty to perform data extraction from the proof which will be uploaded by end-users. Provide a valid date. Please note that the date should be after today. 
  Example 2025-12-31
  
  * <h3>nfc_verification</h3>

  Required: **No**  
  Type: **boolean**  
  Accepted values:  **true**, **false**  

Near Field Communication (NFC) is a set of short-range wireless technologies. NFC allows sharing small payloads of data between an NFC tag and an NFC-supported device. NFC Chips found in modern passports and similar identity documents contain additional encrypted information about the owner. This information is very useful in verifying the originality of a document. NFC technology helps make the verification process simple, quicker and more secure. This also provides the user with contactless and input less verification. ShuftiPros's NFC verification feature detects MRZ from the document to authenticate NFC chip and retrieve data from it, so the authenticity and originality of the provided document could be verified, if set to TRUE. nfc_verification parameter should be added into the service object(document, document_two, address) for which you want to perform nfc verification. Nfc verification is allowed only on e-id cards, e-passports, e-credit/ e-debit cards and e-driving licences under document, document_two and address service only. The nfc service is not available in hybrid webview for now.
  
  * <h3>fetch_enhanced_data</h3>

  Required: **No**  
  Type: **string**  
  Accepted value: **1**

  Provide 1 for enabling enhanced data extraction for the document. Shufti Pro provides its customers with the facility of extracting enhanced data features using OCR technology. Now, instead of extracting just personal information input fields, Shufti Pro can fetch all the additional information comprising more than 100 data points from the official ID documents supporting 150 languages. For example height, place_of_birth, nationality, marital_status, weight, etc.(additional charges apply)
Extrated data will be returned in object under the key additional_data in case of verification.accepted or verification.declined.
For Details on additional_data object go to [Additional Data](https://api.shuftipro.com/api/docs/#additional-data)

<!-- -------------------------------------------------------------------------------- -->
* ## document_two 
  Document Two Service is provided to verify the personal details of a user from more than 1 document e.g. If you have verified the DOB & Name of a user from their ID Card, you can use Document Two Service to verify the Credit Card Number of your customer.

  Just like the “Document Service”, the supported formats for this service are also passports, ID Cards, driving licenses and debit/credit cards and more than one document type can be selected as well. In that case, Shufti Pro will give an option to end-users to verify their data from any of the given document types.  
* ## Address

  Address of an individual can be verified from the document but they have to enter it before it can be verified from an applicable document image.
    * <h3>proof</h3>

  Required: **No**  
  Type: **string** <br>
  Image Format: JPG, JPEG, PNG, PDF Maximum: 16MB <br>
  Video Format: MP4/MOV Maximum: 20MB

  Provide valid BASE64 encoded string. Leave empty for an on-site verification.

  * <h3>supported_types</h3>

  Required: **Yes**  
  Type: **Array**

  Provide any one, two or more document types in supported_types parameter in Address verification service. For example, if you choose id_card and utility_bill, then the user will be able to verify data using either of these two documents. Following is the list of supported types for address verification.

  Supported Types      |
  ---------------------|
  id_card              |
  passport             |
  driving_license      |
  utility_bill         |
  bank_statement       |
  rent_agreement       |
  employer_letter      |
  insurance_agreement  |
  tax_bill             |

  **Example 1** [ "utility_bill" ]  
  **Example 2** [ "id_card", "bank_statement" ]

* <h3>nfc_verification</h3>

Required: **No**  
Type: **boolean**  
Accepted values:  **true**, **false**  

Near Field Communication (NFC) is a set of short-range wireless technologies. NFC allows sharing small payloads of data between an NFC tag and an NFC-supported device. NFC Chips found in modern passports and similar identity documents contain additional encrypted information about the owner. This information is very useful in verifying the originality of a document. NFC technology helps make the verification process simple, quicker and more secure. This also provides the user with contactless and input less verification. ShuftiPros's NFC verification feature detects MRZ from the document to authenticate NFC chip and retrieve data from it, so the authenticity and originality of the provided document could be verified, if set to TRUE. nfc_verification parameter should be added into the service object(document, document_two, address) for which you want to perform nfc verification. Nfc verification is allowed only on e-id cards, e-passports, e-credit/ e-debit cards and e-driving licences under document, document_two and address service only. The nfc service is not available in hybrid webview for now.

  * <h3>full_address</h3>

  Required: **No**  
  Type: **string**  
  Minimum: **2 characters**  
  Maximum: **250 chracters**

  Leave empty to perform data extraction from the uploaded proof. Allowed Characters are numbers, alphabets, dots, dashes, spaces, underscores, hashes and commas.

  * <h3>name</h3>

  Required: **No**  
  Format **object**

  In name object used in address service, first_name is required if you don't want to perform OCR of the name parameter. Other fields are optional.

  * <h4>first_name</h4>

  Required: **No**  
  Type: **string**  
  Minimum: **2 characters**  
  Maximum: **32 chracters**

  Allowed Characters are alphabets, - (dash), comma, space, dot and single quotation mark. 
  Example **John'O Harra**

  * <h4>middle_name</h4>

  Required: **No**  
  Type: **string**  
  Minimum: **2 characters**  
  Maximum: **32 chracters**

  Allowed Characters are alphabets, - (dash), comma, space, dot and single quotation mark.  
  Example **Carter-Joe**

  * <h4>last_name</h4>

  Required: **No**  
  Type: **string**  
  Minimum: **2 characters**  
  Maximum: **32 chracters**

  Allowed Characters are alphabets, - (dash), comma, space, dot and single quotation mark. 
  Example **John, Huricane Jr.**

  * <h4>fuzzy_match</h4>

  Required: **No**  
  Type: **string**  
  Value Accepted: **1**

  Provide 1 for enabling a fuzzy match of the name. Enabling fuzzy matching attempts to find a match which is not a 100% accurate.

<!-- -------------------------------------------------------------------------------- -->
* ## consent
  
  Customised documents/notes can also be verified by Shufti Pro. Company documents, employee cards or any other personalised note can be authenticated by this module. You can choose handwritten or printed document format but only one form of document can be verified in this verification module. Text, whose presence on the note/customised document is to be verified, is also required.

  * <h3>proof</h3>

  Required: **Yes**  
  Type: **string**  
  Image Format: **JPG, JPEG, PNG, PDF** Maximum: **16MB**  
  Video Format: **MP4/MOV** Maximum: **20MB**
  
  * <h3>supported_types</h3>

  Required: **Yes**  
  Type: **array**

  Text provided in the consent verification can be verified by handwritten documents or printed documents.

  Supported Types              |
  ---------------------|
  handwritten          |
  printed            |

  **Example 1**  ["printed"]  
  **Example 2**  ["printed", "handwritten"]

  * <h3>text</h3>

  Required: **Yes**  
  Type: **string**  
  Minimum: **2 characters**  
  Maximum: **100 chracters**

  Provide text in the string format which will be verified from the document which the end-user will provide us.

  <!-- -------------------------------------------------------------------------------- -->
* ## Phone

  Verify the phone number of end-users by sending a random code to their number from Shufti Pro. Once the sent code is entered into the provided field by end-user, phone number will stand verified. It is primarily an on-site verification and you have to provide phone number of the end-user to us, in addition to the verification code and the message that is to be forwarded to the end-user. Shufti Pro will be responsible only to send the message along with verification code to the end user and verify the code entered by the end-user.

  * <h3>phone_number</h3>

  Required: **No**  
  Type: **string**  
  Minimum: **2 characters**  
  Maximum: **64 chracters**

  Allowed Characters: numbers and plus sign at the beginning. Provide a valid customer’s phone number with country code. Shufti Pro will directly ask the end-user for phone number if this field is missing or empty.

  * <h3>random_code</h3>

  Required: **No**  
  Type: **string**  
  Minimum: **2 characters**  
  Maximum: **10 chracters**

  Provide a random code. If this field is missing or empty. Shufti Pro will generate a random code.

  * <h3>text</h3>

  Required: **No**  
  Type: **string**  
  Minimum: **2 characters**  
  Maximum: **100 chracters**

  Provide a short description and random code in this field. This message will be sent to customers. ***This field should contain random_code***. If random_code field is empty, then Shufti Pro will generate a random code

<!-- -------------------------------------------------------------------------------- -->
* ## background_checks

  It is a verification process that will require you to send us the full Name of end user in addition to date of birth. Shufti Pro will perform AML based background checks based on this information. Please note that the name and dob keys will be extracted from document service if these keys are empty.

  * <h3>name</h3>

  Required: **No**  
  Format: **object**

  In name object used in background checks service, first_name is required and other fields are optional.

  * <h4>first_name</h4>

  Required: **No**  
  Type: **string**  
  Minimum: **2 characters**  
  Maximum: **32 chracters**

  Allowed Characters are alphabets, - (dash), comma, space, dot and single quotation mark. 
  Example **John'O Harra**

  * <h4>middle_name</h4>

  Required: **No**  
  Type: **string**  
  Minimum: **2 characters**  
  Maximum: **32 chracters**

  Allowed Characters are alphabets, - (dash), comma, space, dot and single quotation mark.  
  Example **Carter-Joe**

  * <h4>last_name</h4>

  Required: **No**  
  Type: **string**  
  Minimum: **2 characters**  
  Maximum: **32 chracters**

  Allowed Characters are alphabets, - (dash), comma, space, dot and single quotation mark. 
  Example **John, Huricane Jr.**

  * <h3>dob</h3>

  Required: **No**  
  Type: **string**  
  Format: **yyyy-mm-dd**

  Provide a valid date. Please note that the date should be before today. 
  Example 1990-12-31

 

## HTTP Codes

Following is a list of HTTP codes which are generated in responses by Shufti Pro Verification API.

HTTP code     | HTTP message         | Message        |                                   
--------------|----------------------| -------------- |
200           | OK                 | success                                    
400           | Bad Request          | bad request: one or more parameter is invalid or missing
401           | Unauthorized         | unauthorized: invalid signature key provided in the request
402           | Request Failed       | invalid request data: missing required parameters
403           | Forbidden            | forbidden: service not allowed
404           | Not Found            | resource not found
409           | Conflict             | conflicting data: already exists
500           | Server Error         | internal server error


## Events

Events are sent in responses which show the status of request. These events are sent in both HTTP and callback responses.


Event               | description     | HTTP Response | Callback Response
------------------------|-----------------|---------------|---------------
request.pending         | Request parameters are valid and verification url is generated in case of on-site verification.|Yes|Yes
request.invalid         | Request parameters provided in request are invalid.|Yes|Yes
request.cancelled       | Request is cancelled by the user. This event occurs when end-user disagrees to terms and conditions before starting verifications.|Yes|Yes
request.timeout         | Request has timed out after a specific period of time.|No|Yes
request.unauthorized    | Request is unauthorized. The information provided in authorization header is invalid.|Yes|No
verification.accepted   | Request was valid and accepted after verification.|Yes|Yes
verification.declined   | Request was valid and declined after verification.|Yes|Yes


## Sample project setup
In ViewController.swift add your **Client ID**  and **Secret Key**, thats it!
> **Note:** Run project on real device.
## Status Response
The Shufti Pro Verification API will send a JSON response if a status request is made.


* <h3>reference</h3>

    This is the user’s unique request reference provided at the time of request, in order for the unique response to be identified. 


* <h3>event</h3>

    The request event shows the status of user’s request, and is different for every response. For more information, click
    [here](status_codes.md)

<aside class="notice">
Note: <b>request.invalid</b> response with <b>HTTP status code 400</b> means the request is invalid.
</aside>

>Sample Response  

```json
{
  "reference": "17374217",
  "event": "request.declined",
  "error": "",
  "verification_url": ""
}

```

## Supported Document Types

Address | Document | 
--------------- | ------------ | 
id_card | id_card 
passport  | passport  
driving_license | driving_lisence
utility_bill | credit_or_debit_card 
bank_statement |
rent_agreement |
employer_letter |
insurance_agreement | 
tax_bill |

<br>

## Test IDs
Shufti Pro provides the users with a number of test documents. Customers may use these to test the demo, instead of presenting their actual information. <br><br>


[![](https://raw.githubusercontent.com/shuftipro/integration-guide/master/assets/realFace.jpg?v=1)](https://raw.githubusercontent.com/shuftipro/integration-guide/master/assets/realFace.jpg?v=1) 

[![](https://raw.githubusercontent.com/shuftipro/RESTful-API-v1.3/master/assets/real-id-card.jpg)](https://raw.githubusercontent.com/shuftipro/RESTful-API-v1.3/master/assets/real-id-card.jpg)

[![](https://raw.githubusercontent.com/shuftipro/RESTful-API-v1.3/master/assets/fake-id-card.jpg)](https://raw.githubusercontent.com/shuftipro/RESTful-API-v1.3/master/assets/fake-id-card.jpg)

## Contact
If you have any questions/queries regarding implementation SDK please feel free to contact our [tech support](mailto:support@shuftipro.com).

## Copyright
2017- 21 © Shufti Pro Ltd.

Date            | Description 
--------------- | ------------
12 Apr 2019    | Updated SDK swift version to swift 5.
18 May 2019    | Added support to install through cocoapods.
21 May 2019    | Added support to install SDK  swift version 4 through cocoapods.
23 May 2019    | Added support to install SDK  swift version 3 through cocoapods.
21 Oct 2019    | Updated SDK swift version to swift 5.1
1 Nov 2019     | Updated SDK swift version to swift 5.1.2
31 Mar 2020    | Added Access Token
4 Apr 2020     | Updated request data (Added key fetch_enhanced_data)
5 May 2020     | Updated binary bitcode
12 May 2020    | Updated SDK swift version to swift 5.2.2
21 May 2020    | Minor UI Improvements
10 Jun 2020    | Fixed issue to open privacy policy link
19 Jul 2020    | Added option for status bar background color
31 Jul 2020    | Added cancel button and UI color changes options
23 Sep 2020    | Added swift 5.3 compiled binaries
