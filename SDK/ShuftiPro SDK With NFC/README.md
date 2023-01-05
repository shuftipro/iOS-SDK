[![](https://raw.githubusercontent.com/shuftipro/RESTful-API-v1.2/master/assets/banner.jpg)](https://www.shuftipro.com/)

# ShuftiPro NFC SDK

Shufti Pro’s API supports verification with and without OCR also user can perform NFC verfication of their documents. 
## Table of contents
* [Permissions](#permissions)
* [SDK Installation Guide](#sdk-installation-guide)

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
>### Installation through Cocoapods

 Add this dependency into your project's Podfile.
```
  pod 'ShuftiProNFC', :tag => '3.4.1', :git => "https://github.com/shuftipro/ios-nfc-binary-pod.git"
```
Please make sure to add the following post-install hook to your Podfile.

```
post_install do |installer|
  installer.pods_project.targets.each do |target|
    if ['lottie-ios', 'Socket.IO-Client-Swift', 'Starscream','NFCPassportReader'].include? target.name
      target.build_configurations.each do |config|
          config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
      end
    end
  end
end
```

## SDK Version:
Currently our updated SDK version is 3.4.1

# Request Parameters
Parameters are explained [here](https://github.com/shuftipro/iOS-SDK#auth-keys).
