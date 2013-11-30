//
//  SBRateApp.m
//  Busta
//
//  Created by Santiago Bustamante on 11/30/13.
//  Copyright (c) 2013 Busta. All rights reserved.
//

#import "SBRateApp.h"

#define SBRateAppUsesCountKey @"SBRateAppUsesCountKey"
#define SBRateAppAlreadyRatedKey @"SBRateAppAlreadyRatedKey"
#define SBRateAppNeverRateKey @"SBRateAppNeverRateKey"

static NSString *const SBRateiOSAppStoreURLFormat = @"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@";
static NSString *const SBRateiOS7AppStoreURLFormat = @"itms-apps://itunes.apple.com/app/id%@";


@implementation SBRateApp

+ (SBRateApp *)sharedInstance
{
    static SBRateApp *sharedInstance = nil;
    if (sharedInstance == nil)
    {
        sharedInstance = [[SBRateApp alloc] init];
    }
    return sharedInstance;
}



- (id) init{
    
    if ((self = [super init])) {
        
        BOOL alreadyPro = [[NSUserDefaults standardUserDefaults] boolForKey:SBRateAppAlreadyRatedKey];
        BOOL neverPro = [[NSUserDefaults standardUserDefaults] boolForKey:SBRateAppNeverRateKey];
        
        if (!alreadyPro && !neverPro) {
            if (&UIApplicationWillEnterForegroundNotification)
            {
                [self incrementUseCount];
                [[NSNotificationCenter defaultCenter] addObserver:self
                                                         selector:@selector(applicationWillEnterForeground)
                                                             name:UIApplicationWillEnterForegroundNotification
                                                           object:nil];
            }
        }
    }
    return self;
}


- (NSString *) applicationName{
    if (!_applicationName) {
        _applicationName = @"";
    }
    return _applicationName;
}

- (NSString *) messageTitle{
    if (_messageTitle) {
        _messageTitle = [NSString stringWithFormat:@"Rate %@",self.applicationName];
    }
    return _messageTitle;
}

- (NSString *)message
{
    if (!_message)
    {
        _message = @"If you enjoy using %@, would you mind taking a moment to rate it? It won’t take more than a minute. Thanks for your support!";
        _message = [_message stringByReplacingOccurrencesOfString:@"%@" withString:self.applicationName];
    }
    return _message;
}

- (NSString *)cancelButtonLabel
{
    return _cancelButtonLabel ?: @"No, Thanks";
}

- (NSString *)rateButtonLabel
{
    return _rateButtonLabel ?: @"Rate It Now";
}

- (NSString *)remindButtonLabel
{
    return _remindButtonLabel ?: @"Remind Me Later";
}


- (NSURL *)ratingURL
{
    return [NSURL URLWithString:[NSString stringWithFormat:([[UIDevice currentDevice].systemVersion floatValue] >= 7.0f)? SBRateiOS7AppStoreURLFormat: SBRateiOSAppStoreURLFormat, @(self.appStoreID)]];
}



- (void)applicationWillEnterForeground
{
    if ([UIApplication sharedApplication].applicationState == UIApplicationStateBackground)
    {
        [self incrementUseCount];
        
        if (useCount_ >= self.usesUntilPrompt) {
            [self prompt];
        }
        
    }
}

-(void) incrementUseCount{
    useCount_ ++ ;
    [[NSUserDefaults standardUserDefaults] setInteger:useCount_ forKey:SBRateAppUsesCountKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void) prompt{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:self.messageTitle message:self.message delegate:self cancelButtonTitle:nil otherButtonTitles:self.rateButtonLabel,self.remindButtonLabel, self.cancelButtonLabel, nil];
    [alert show];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) { //RATE
        if ([[UIApplication sharedApplication] canOpenURL:self.ratingURL])
        {
            [[UIApplication sharedApplication] openURL:self.ratingURL];
        }
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:SBRateAppAlreadyRatedKey];
    }else if (buttonIndex == 1){ //REMIND
        useCount_ = 0;
        [[NSUserDefaults standardUserDefaults] setInteger:useCount_ forKey:SBRateAppUsesCountKey];
        
    }else{ //NEVER
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:SBRateAppNeverRateKey];
        
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
