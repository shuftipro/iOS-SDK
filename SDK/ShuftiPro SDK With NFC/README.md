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
1. Add these dependencies into your project's pod file.
```
    pod 'NFCPassportReader', git:'https://github.com/AndyQ/NFCPassportReader.git'
    pod 'Socket.IO-Client-Swift'
```
Please make sure to add the following post-install hook to your Podfile.

```
post_install do |installer|
  installer.pods_project.targets.each do |target|
    if ['iProov', 'Socket.IO-Client-Swift', 'Starscream','NFCPassportReader'].include? target.name
      target.build_configurations.each do |config|
          config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
      end
    end
  end
end
```

2. Copy “ShuftiPro.framework” into your project folder.
3. In xcode select your project -> your project under TARGETS -> General -> Embeded Binaries
4. Drop “ShuftiPro.framework” in Embeded Binaries.
5. Make sure your in your xcode project build settings "Validate Workspace" is set to "Yes"


## SDK Version:
Currently our updated SDK version is 3.4.0

# Request Parameters
Parameters are explained [here](https://github.com/shuftipro/iOS-SDK#auth-keys).
