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


## Contact
If you have any questions/queries regarding implementation SDK please feel free to contact ShuftiPro customer service

## Copyright
2016-17 © ShuftiPro Ltd.
