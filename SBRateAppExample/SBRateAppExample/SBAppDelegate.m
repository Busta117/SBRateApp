//
//  SBAppDelegate.m
//  SBRateAppExample
//
//  Created by Santiago Bustamante on 11/30/13.
//  Copyright (c) 2013 Busta. All rights reserved.
//

#import "SBAppDelegate.h"
#import "SBRateApp.h"

@implementation SBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [SBRateApp rateApp].appStoreID = 123456; //real AppStore ID from itunes
    [SBRateApp rateApp].usesUntilPrompt = 5; //times until prompt the alert
    
    //you can custom all about message, these options are optional
    [SBRateApp rateApp].applicationName = @"My App"; //Optional
    
//    [SBRateApp rateApp].messageTitle = [NSString  stringWithFormat:@"custom title %@",[SBRateApp rateApp].applicationName];
//    [SBRateApp rateApp].message = @"Custom Message";
//    [SBRateApp rateApp].cancelButtonLabel = @"cancel custom";
//    [SBRateApp rateApp].remindButtonLabel = @"remind later custom";
//    [SBRateApp rateApp].rateButtonLabel = @"Rate now custom";
    
    //you can execute this method to fire the rate action wherever you want
//    [[SBRateApp rateApp] rateNow];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
