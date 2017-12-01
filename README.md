# ShuftiPro
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
2.	In xcode select your project -> your project under TARGETS -> General -> Embeded Binaries
3.	Add “ShuftiPro.framework” in Embeded Binaries.

## Permissions:
Application Info.plist must contain an **NSCameraUsageDescription** key with a explanation to end-user about how the app uses this data.

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
For **Debit/Credit Card** verification
```sh
shufti.creditCardVerification(country: "your country",
                                      cardFirst6Digits: "your cardFirst6Digits",
                                      cardLast4Digits: "your cardLast4Digits",
                                      phoneNumber: "phoneNumber")
```

For **Document** verification (Methods: "**driving_license**" or "**passport**" or "**id_card**")
```sh
shufti.documentVerification(method: "type of method for verification",
                            firstName: "your first name",
                            lastName: "your last name",
                            dob: "yyyy-mm-dd",
                            country: "your country",
                            phoneNumber: "your phone number")
```

> **Note:** Run project on real device.

## Parameters 

| Parameter | Card Verification | Documents Verification | Description
| ------ | ------ | ------ | ------ |
| method | Not required | Required | Which type of verification would you like for your   customers? <br> Possible   values: <br> <ul><li> passport </li><li> driving_license </li><li> id_card</li></ul> |
| clientId | Required | Required | Client’s ID provided by Shufti Pro. |
| secretKey | Required | Required | Secret Key provided by Shufti Pro. |
| parentVC | Required | Required | Your viewController from where you want to open Shufti Pro |
| cardFirst6Digits | Required | Not required | First 6 digits of the customer’s credit/debit card number. The maximum and the minimum length required is 6 digits. |
| cardLast4Digits | Required | Not required | Last 4 digits of the customer’s credit/debit card number. The maximum and the minimum length required is 4 digits. |
| firstName | Not required | Required | Customer’s First Name. The maximum length of the string is 32 characters and minimum required length is 2 characters. |
| lastName | Not required | Required | Customer’s Last Name. The maximum length of the string is 32 characters and minimum required length is 2 characters. |
| dob | Not required | Required | Customer’s date of birth (YYYY-MM-DD). Example: 1980-01-31 |
| country | Required | Required | Full Country name or ISO2 Code . Example: United Kingdom or GB. |
| phoneNumber | Required | Required | Customer’s phone number with country code.Example: +440000000000 |

## Contact
If you have any questions/queries regarding implementation SDK please feel free to contact ShuftiPro customer service

## Copyright
2016-17 © ShuftiPro Ltd.
