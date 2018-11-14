//
//  AppDelegate.m
//  HomeWorkers
//
//  Created by apple on 16/04/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import "AppDelegate.h"
#import "Utils.h"
#import "Common.h"
#import <OneSignal/OneSignal.h>
@interface UIFont (SystemFontOverride)
@end
@implementation UIFont (SystemFontOverride)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

+ (UIFont *)boldSystemFontOfSize:(CGFloat)fontSize {
    if ([[Utils getLanguage] isEqualToString:KEY_LANGUAGE_AR]) {
        return [UIFont fontWithName:@"Hacen Tunisia Bd" size:fontSize];
    }else{
        return [UIFont fontWithName:@"Oswald-Bold" size:fontSize];
    }
}

+ (UIFont *)systemFontOfSize:(CGFloat)fontSize {
    if ([[Utils getLanguage] isEqualToString:KEY_LANGUAGE_AR]) {
        return [UIFont fontWithName:@"Hacen Tunisia Bd" size:fontSize];
    }else{
        return [UIFont fontWithName:@"Oswald-Bold" size:fontSize];
    }
}

#pragma clang diagnostic pop

@end

@implementation UILabel (Helper)
- (void)setSubstituteFontName:(NSString *)name UI_APPEARANCE_SELECTOR {
    // NSLog(@"%@",name);
    self.font = [UIFont fontWithName:name size:self.font.pointSize];
    
}
@end
@implementation UITextView (Helper)
- (void)setSubstituteFontName:(NSString *)name UI_APPEARANCE_SELECTOR {
    // NSLog(@"%@",name);
    self.font = [UIFont fontWithName:name size:self.font.pointSize];
    
}
@end
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [OneSignal initWithLaunchOptions:launchOptions
                               appId:@"d4bfbbb0-2630-4ce2-b243-6b3884354b61"
            handleNotificationAction:nil
                            settings:@{kOSSettingsKeyAutoPrompt: @false}];
    OneSignal.inFocusDisplayType = OSNotificationDisplayTypeNotification;
    
    // Recommend moving the below line to prompt for push after informing the user about
    //   how your app will use them.
    [OneSignal promptForPushNotificationsWithUserResponse:^(BOOL accepted) {
        NSLog(@"User accepted notifications: %d", accepted);
    }];
//    for(NSString *fontfamilyname in [UIFont familyNames])
//    {
//        NSLog(@"family:'%@'",fontfamilyname);
//        for(NSString *fontName in [UIFont fontNamesForFamilyName:fontfamilyname])
//        {
//            NSLog(@"\tfont:'%@'",fontName);
//        }
//        NSLog(@"-------------");
//    }
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [[UINavigationBar appearance] setBarTintColor: [UIColor colorWithRed:60/255.0f green:60/255.0f blue:60/255.0f alpha:1]];
    [[UINavigationBar appearance] setTranslucent:false];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [[UITextView appearance] setTextContainerInset:UIEdgeInsetsZero];
    [UITextView appearance].textContainer.lineFragmentPadding = 0;
    [self downloadStringsFile];
    [self downloadSettings];
    // Override point for customization after application launch.
    if ([[Utils getLanguage] isEqualToString:KEY_LANGUAGE_AR]) {
        [[UILabel appearance] setSubstituteFontName:@"Hacen Tunisia Lt"];
        [[UITextView appearance] setSubstituteFontName:@"Hacen Tunisia Lt"];

        [[UILabel appearance] setTextAlignment:NSTextAlignmentRight];
        [[UITextField appearance] setTextAlignment:NSTextAlignmentRight];
        
        [[UITextView appearance] setTextAlignment:NSTextAlignmentRight];
        [[UIView appearance] setSemanticContentAttribute:UISemanticContentAttributeForceRightToLeft];
        [[UIButton appearance] titleLabel].font = [UIFont fontWithName:@"Hacen Tunisia Lt" size:17];
        [UITextField appearance].font=[UIFont fontWithName:@"Hacen Tunisia Lt" size:17];
        //[UITextView appearance].font=[UIFont fontWithName:@"Hacen Tunisia Lt" size:17];
        
    } else {
        //[[UILabel appearance] setSubstituteFontName:@"Avenir Next Condensed"];
        [[UILabel appearance] setSubstituteFontName:@"Oswald-Regular"];
        [[UITextView appearance] setSubstituteFontName:@"Oswald-Regular"];

        [[UILabel appearance] setTextAlignment:NSTextAlignmentLeft];
        [[UITextField appearance] setTextAlignment:NSTextAlignmentLeft];
        [[UITextView appearance] setTextAlignment:NSTextAlignmentLeft];
        [[UIView appearance] setSemanticContentAttribute:UISemanticContentAttributeForceLeftToRight];
        [[UIButton appearance] titleLabel].font = [UIFont fontWithName:@"Oswald-Regular" size:17];
        [UITextField appearance].font=[UIFont fontWithName:@"Oswald-Regular" size:17];
        //[UITextView appearance].font=[UIFont fontWithName:@"Oswald-Regular" size:17];
        
        
    }
    return YES;
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (void)downloadStringsFile {
    NSData *data2 = [NSData dataWithContentsOfURL:[Utils createURLForPage:WORDS withParameters:@{}]];
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data2 options:NSJSONReadingMutableContainers error:nil];
    NSData *data = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:nil];
    NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
    NSURL *filePath = [documentsDirectoryURL URLByAppendingPathComponent:@"strings.json"];
    NSLog(@"file: %@", filePath);
    
    [data writeToURL:filePath atomically:YES];
    
    [MCLocalization loadFromURL:filePath defaultLanguage:KEY_LANGUAGE_EN];
    if ([[Utils getLanguage] length] != 0) {
        [[MCLocalization sharedInstance] setLanguage:[Utils getLanguage]];
        [[MCLocalization sharedInstance] reloadStrings];
    }
}
- (void)downloadSettings {
    NSData *data2 = [NSData dataWithContentsOfURL:[Utils createURLForPage:SETTINGS withParameters:@{}]];
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data2 options:NSJSONReadingMutableContainers error:nil];
//    [[NSUserDefaults standardUserDefaults] setValue:dictionary forKey:@"SETTINGS"];
//    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:dictionary];
    [currentDefaults setObject:data forKey:@"SETTINGS"];
}
- (void)reloadUIForLanguageChange {
//    [[UINavigationBar appearance] setBarTintColor: [UIColor colorWithRed:29/255.0f green:42/255.0f blue:56/255.0f alpha:1]];
//    
//    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    if ([[Utils getLanguage] isEqualToString:KEY_LANGUAGE_AR]) {
        [[UILabel appearance] setSubstituteFontName:@"Hacen Tunisia Lt"];
        [[UILabel appearance] setTextAlignment:NSTextAlignmentRight];
        [[UITextField appearance] setTextAlignment:NSTextAlignmentRight];
        [[UITextView appearance] setSubstituteFontName:@"Hacen Tunisia Lt"];

        [[UITextView appearance] setTextAlignment:NSTextAlignmentRight];
        [[UIView appearance] setSemanticContentAttribute:UISemanticContentAttributeForceRightToLeft];
        [[UIButton appearance] titleLabel].font = [UIFont fontWithName:@"Hacen Tunisia Lt" size:17];
        [UITextField appearance].font=[UIFont fontWithName:@"Hacen Tunisia Lt" size:17];
        //[UITextView appearance].font=[UIFont fontWithName:@"Hacen Tunisia Lt" size:17];
        
    } else {
        //[[UILabel appearance] setSubstituteFontName:@"Avenir Next Condensed"];
        [[UILabel appearance] setSubstituteFontName:@"Oswald-Regular"];
        [[UITextView appearance] setSubstituteFontName:@"Oswald-Regular"];

        [[UILabel appearance] setTextAlignment:NSTextAlignmentLeft];
        [[UITextField appearance] setTextAlignment:NSTextAlignmentLeft];
        [[UITextView appearance] setTextAlignment:NSTextAlignmentLeft];
        [[UIView appearance] setSemanticContentAttribute:UISemanticContentAttributeForceLeftToRight];
        [[UIButton appearance] titleLabel].font = [UIFont fontWithName:@"Oswald-Regular" size:17];
        [UITextField appearance].font=[UIFont fontWithName:@"Oswald-Regular" size:17];
       // [UITextView appearance].font=[UIFont fontWithName:@"Oswald-Regular" size:17];
        
    }
    
}
@end
