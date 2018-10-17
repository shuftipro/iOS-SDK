[![](https://raw.githubusercontent.com/shuftipro/RESTful-API-v1.2/master/assets/banner.jpg)](https://www.shuftipro.com/)

# What Is This?
Shufti Pro is a SaaS, that provides quick and accurate digital identity and document verification. E-KYC using government-issued documents like ID card, passport, driving license and even credit/debit cards, etc. has never been easier. Shufti Pro allows for simple and easy ID checks online, securing the virtual trading platforms and FinTech institutions against scams, frauds and money launderers.

# Basic Setup
## General Requirements
Followings are minimum requirements for SDK:
- iOS 10.0 and higher
- Internet connection

Supported architectures in SDK:
- armv7 and arm64 for devices

## SDK Installation Guide
1. Copy “ShuftiPro.framework” into your project folder.
2.  In xcode select your project -> your project under TARGETS -> General -> Embeded Binaries
3.  Add “ShuftiPro.framework” in Embeded Binaries.

## Permissions:
Application Info.plist must contain an **Privacy - Camera Usage Description** key with a explanation to end-user about how the app uses this data.

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
## Sample request
```sh
let dataDictionary: [String: Any] = [
            "reference": "Unique reference",
            "country": "GB",
            "language": "EN",
            "email": "johndoe@example.com",
            "callback_url": "http://www.example.com",
            "face": true,
            "document": [
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
            ],
            "address": [
                "full_address": true,
                "name": true,
                "supported_types": [
                    "id_card",
                    "utility_bill",
                    "bank_statement"
                ],
            ],
            "consent": [
                "format":"printed",
                "text":"This is a customized text"
            ]
        ]
instance.verification(dataObject: dataDictionary){(result: Any) in
    print(result) // Callback response for verification verified/declined
    let reponse = result as! NSDictionary
    if reponse.value(forKey: "event") as! String == "verification.accepted" {
        // Verified: Do something
    }else{
        // Declined: Do something
    }
}
```


## Request Parameters 

It is important to note here that each service module is independent of other and each one of them is activated according to the nature of request received from you. There are a total of four services which include face, document, address and consent.

All verification services are optional. You can provide Shufti Pro a single service or mixture of several services for verifications. All keys are optional too.

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

  Send the 2 characters long [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2#Officially_assigned_code_elements) country code of where your customer is from. Please consult [Supported Countries](https://github.com/shuftipro/RESTful-API-v1.3/blob/master/off-site_with_ocr/countries.md) for country codes.

* ## language

  Required: **No**   
  Type: **string**  
  Length: **2 characters**

  Send the 2 characters long language code of your preferred language to display the verification screens accordingly. Please consult [Supported Languages](languages.md) for language codes. Default language english will be selected if this key is missing in the request.

* ## email

  Required: **No**  
  Type: **string**  
  Minimum: **6 characters**  
  Maximum: **128 characters**

  This field represents email of the end-user. If it is missing in a request, than Shuftpro will ask the user for its email in an on-site request.

* ## callback_url

  Required: **No**  
  Type: **string**  
  Minimum: **6 characters**  
  Maximum: **250 characters**

  During a verification request, we make several server to server calls to keep you updated about the verification state. This way you can update the request status at your end even if the customer is lost midway through the process.

* ## face

  The easiest of all verifications is done by authenticating the face of the users. In case of face verification, end-user will have to capture video of their face that essentially makes it a selfie verification. 
 For **face verification** just add the key "face" in data dictionary as **"face": true**

<!-- -------------------------------------------------------------------------------- -->

* ## document

  Shufti Pro provides document verification through various types of documents. The supported formats are passports, ID Cards, driving licenses and debit/credit cards. You can opt for more than 1 document type as well. 
 For **document verification** just add key "document" in data dictionary. Here are the additional keys for document
 
 * <h3>supported_types</h3>

    Required: **Yes**  
    Type: **Array**
 
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
  Type: **Boolean**

  In name object used in document service, first_name and last_name are extracted from the document provided if name is set to **true**. 
 
 
 * <h3>dob</h3>

  Required: **No**  
  Type: **Boolean**  

  Set **true** to perform dob extraction from provided proofs.

  * <h3>document_number</h3>

  Required: **No**  
  Type: **Boolean**  

  Set **true** to perform document number extraction from provided proofs.

  * <h3>issue_date</h3>

  Required: **No**  
  Type: **Boolean**  

  Set **true** to perform issue date extraction from provided proofs. 

  * <h3>expiry_date</h3>

  Required: **No**  
  Type: **Boolean**  

  Set **true** to perform expiry date extraction from provided proofs.
 

* ## address

  Address of an individual can be verified from the document. For **address verification** just add key "address" in data dictionary. Here are the additional keys for address
   
    * <h3>supported_types</h3>

    Required: **Yes**  
    Type: **Array**
 
    Supported Types      |
    ---------------------|
    id_card             |
    utiltiy_bill           |
    bank_statement   |

    **Example 1** [ "utility_bill" ]  
    **Example 2** [ "id_card", "bank_statement" ]
    
    * <h3>full_address</h3>

    Required: **No**  
    Type: **Boolean** 

    Set **true** to perform full address extraction from provided proofs. Allowed Characters are numbers, alphabets, dots, dashes, spaces, underscores, hashes and commas.

    * <h3>name</h3>

    Required: **No**  
    Format **Boolean**

    Set **true** to perform name extraction from provided proofs.
    
* ## consent
  
  Customised documents/notes can also be verified by Shufti Pro. Company documents, employee cards or any other personalised note can be authenticated by this module. You can choose handwritten or printed document format but only one form of document can be verified in this verification module. Text whose presence on the note/customized document is to be verified, is also needed to be provided.
 For **consent verification** just add key "consent" in data dictionary. Here are the additional keys for consent
 
   * <h3>format</h3>

    Required: **Yes**  
    Type: **string**

	Text provided in the consent verification can be verified by handwritten documents or printed documents. If “any” is mentioned in the format parameter, then user can verify provided note using either of these two documents. Mention only one format from the following list.

	Formats              |
	---------------------|
	handwritten          |
	printed            |
	any                |

	**Example 1**  "printed"  
	**Example 2**  "any"

   

    * <h3>text</h3>

    Required: **Yes**  
    Type: **string**  
    Minimum: **2 characters**  
    Maximum: **100 chracters**

  Provide text in the string format which will be verified from a given proof.
 



## Response Status Codes 
Shufti Pro Verification API uses conventional HTTP response codes to indicate the success or failure of an API request. Every response is generated in JSON with a specific HTTP code. 

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
------------------------|-----------------|---------------|------------------
request.pending         | Request parameters are valid and verification url is generated in case of on-site verification.|Yes|Yes
request.invalid         | Request parameters provided in request are invalid.|Yes|Yes
request.cancelled       | Request is cancelled by the user. This event occurs when end-user disagrees to terms and conditions before starting verifications.|Yes|Yes
request.timeout         | Request has timed out after a specific period of time.|No|Yes
request.unauthorized    | Request is unauthorized. The information provided in authorization header is invalid.|Yes|No
verification.accepted   | Request was valid and accepted after verification.|Yes|Yes
verification.declined   | Request was valid and declined after verification.|Yes|Yes


## Sample project setup
In ViewController.swift add your **Client ID** on line 14 and **Secret Key** on line 15, thats it!
> **Note:** Run project on real device.

## Test IDs
Shufti Pro provides the users with a number of test documents. Customers may use these to test the demo, instead of presenting their actual information. <br><br>


[![](https://raw.githubusercontent.com/shuftipro/integration-guide/master/assets/realFace.jpg?v=1)](https://raw.githubusercontent.com/shuftipro/integration-guide/master/assets/realFace.jpg?v=1) 

[![](https://raw.githubusercontent.com/shuftipro/RESTful-API-v1.3/master/assets/real-id-card.jpg)](https://raw.githubusercontent.com/shuftipro/RESTful-API-v1.3/master/assets/real-id-card.jpg)

[![](https://raw.githubusercontent.com/shuftipro/RESTful-API-v1.3/master/assets/fake-id-card.jpg)](https://raw.githubusercontent.com/shuftipro/RESTful-API-v1.3/master/assets/fake-id-card.jpg)

## Contact
If you have any questions/queries regarding implementation SDK please feel free to contact our [tech support](mailto:support@shuftipro.com).

## Copyright
2016-17 © Shufti Pro Ltd.
