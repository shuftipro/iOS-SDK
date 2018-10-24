[![](https://raw.githubusercontent.com/shuftipro/RESTful-API-v1.2/master/assets/banner.jpg)](https://www.shuftipro.com/)

# Introduction

Shufti Pro has designed this Verification API document for its customers that have signed up for our next-generation service pack. This document will explain various kinds of verification services included in this service pack, how they are provided and what kind of data is required from our clients to perform these verifications successfully.

**Shufti Pro’s AI & HI hybrid technology ensures 99.6% accurate results and quickest response time.**

Shufti Pro’s API supports two verification types, i.e. on-site and off-site. 


## Verification
Off-site verification means that the customer will not come on Shufti Pro’s site to get verified. They will do it through the merchant’s platform. Merchant will collect the information and send us the data for verification. Merchant provides us with the proofs (images/videos). We will not collect them directly from the user. 

    
* ### With OCR
In off-site verification with OCR means that the merchant has not provided us proofs (images/videos) and also no data in some keys. In this verification Shufti Pro will perform extraction of data from those proofs and finally verify the data. 
Consult [This Document](off-site_with_ocr/off-site_with_ocr.md) for complete Off-site Verification with OCR. 
	
* ### Without OCR
If Merchant gives us the data in keys as well as all the proofs required then Shufti Pro just have to verify the data. No customer interaction takes place in this kind of verification.
Consult [This Document](off-site_without_ocr/off-site_without_ocr.md) for complete Off-site Verification without OCR.