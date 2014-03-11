SBRateApp
=========

iOS easy framework to Rate AppStore application

based on **iRate** but simpler.

### Installation with CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like SBPickerSelector in your projects.

#### Podfile

```ruby
platform :ios, '5.0'
pod "SBRateApp", "~> 0.1.1"
```

### Installation without CocoaPods
- import in your project the folder "SBRateApp"


###USE

- in your code import SBRateApp.h
```objective-c
#import "SBRateApp.h"
```

- the use es too simple, you only need insert this following code in the **AppDelegate** of your app, the two first lines are necessary, the other ones are optional.
  

```objective-c
[SBRateApp sharedInstance].appStoreID = 123456; //real AppStore ID from itunes
[SBRateApp sharedInstance].usesUntilPrompt = 5; //times until prompt the alert

//you can custom all about message, these options are optional
[SBRateApp sharedInstance].applicationName = @"My App"; //Optional

[SBRateApp sharedInstance].messageTitle = @"title custom";
[SBRateApp sharedInstance].message = @"Custom Message";
[SBRateApp sharedInstance].cancelButtonLabel = @"cancel custom";
[SBRateApp sharedInstance].remindButtonLabel = @"remind later custom";
[SBRateApp sharedInstance].rateButtonLabel = @"Rate now custom";

//you can execute this method to fire the rate action wherever you want
[[SBRateApp sharedInstance] rateNow];
```
