//
//  SBRateApp.h
//  Busta
//
//  Created by Santiago Bustamante on 11/30/13.
//  Copyright (c) 2013 Busta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SBRateApp : NSObject <UIAlertViewDelegate>
{
    NSUInteger useCount_;
}

//necessary
@property (nonatomic, assign) NSUInteger appStoreID;
@property (nonatomic, assign) NSUInteger usesUntilPrompt;

//message text, you may wish to customise these
@property (nonatomic, strong) NSString *applicationName;
@property (nonatomic, strong) NSString *messageTitle;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *cancelButtonLabel;
@property (nonatomic, strong) NSString *remindButtonLabel;
@property (nonatomic, strong) NSString *rateButtonLabel;

+ (SBRateApp *)sharedInstance;
- (void) rateNow;

@end
