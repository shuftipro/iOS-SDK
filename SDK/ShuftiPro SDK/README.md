# ShuftiPro SDK

Shufti Pro’s API supports verification with and without OCR. 
## Table of contents

* [Permissions](#permissions)
* [SDK Installation Guide](#sdk-installation-guide)
* [Request Parameters](#request-parameters)



## Permissions:
* ### Application Info.plist must contain an **Privacy - Camera Usage Description** , **Privacy - Microphone Usage Description** key with a explanation to end-user about how the app uses this data.

## SDK Installation Guide
   
 For Swift version 4 & 5

1. 
```sh
 pod 'Socket.IO-Client-Swift'
```
Please make sure to add the following post-install hook to your Podfile.

```
post_install do |installer|
  installer.pods_project.targets.each do |target|
    if ['iProov', 'Socket.IO-Client-Swift', 'Starscream'].include? target.name
      target.build_configurations.each do |config|
          config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
      end
    end
  end
end
```

2. Drop “ShuftiPro.framework” into your project folder.
2.  In xcode select your project -> your project under TARGETS -> General -> Embeded Binaries
3.  Add “ShuftiPro.framework” in Embeded Binaries.

# Request Parameters
Parameters are explained [here](https://github.com/shuftipro/iOS-SDK#auth-keys).