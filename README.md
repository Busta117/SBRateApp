SBRateApp
=========

iOS easy framework to Rate AppStore application

based on **iRate** but more simple.

USE
=========
the use es too simple, you only need insert this following code in the **AppDelegate** of your app, the two first lines are necessary, the other ones are optional.
  


    [SBRateApp sharedInstance].appStoreID = 123456; //real AppStore ID from itunes
    [SBRateApp sharedInstance].usesUntilPrompt = 5; //times until prompt the alert
    
    //you can custom all about message, these options are optional
    [SBRateApp sharedInstance].applicationName = @"My App"; //Optional
    
    [SBRateApp sharedInstance].messageTitle = @"title custom";
    [SBRateApp sharedInstance].message = @"Custom Message";
    [SBRateApp sharedInstance].cancelButtonLabel = @"cancel custom";
    [SBRateApp sharedInstance].remindButtonLabel = @"remind later custom";
    [SBRateApp sharedInstance].rateButtonLabel = @"Rate now custom";