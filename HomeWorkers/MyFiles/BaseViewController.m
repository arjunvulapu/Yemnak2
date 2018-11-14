//
//  BaseViewController.m
//  StreetWhere
//
//  Created by Amit Kulkarni on 10/04/15.
//  Copyright (c) 2015 Mobentia. All rights reserved.
//

#import "BaseViewController.h"
#import "AFNetworking.h"
#import "SVProgressHUD.h"
#import "Utils.h"
#import "Common.h"
#import "GiFHUD.h"
@interface BaseViewController () <UIGestureRecognizerDelegate>

@end

@implementation BaseViewController
/*
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

void reloadRTLViewAndSubviews(UIView *view)
{
    //view.transform = CGAffineTransformMakeRotation(180 * 0.0174532925);
    reloadRTLViews(@[view]);
    reloadRTLViews([view subviews]);
}

void reloadRTLViews(NSArray *views)
{
    if (isRTL())
    {
        [views enumerateObjectsUsingBlock:^(UIView* view,
                                            NSUInteger idx,
                                            BOOL * stop)
         {
             view.semanticContentAttribute = UISemanticContentAttributeForceRightToLeft;
         }];
    }
    else
    {
        [views enumerateObjectsUsingBlock:^(UIView* view,
                                            NSUInteger idx,
                                            BOOL * stop)
         {
             view.semanticContentAttribute = UISemanticContentAttributeForceLeftToRight;
         }];
    }
}

BOOL isRTL()
{
    return isRTL_app();
}

BOOL isRTL_device()
{
    BOOL isRTL = ([NSLocale characterDirectionForLanguage:[[NSLocale preferredLanguages] objectAtIndex:0]] == NSLocaleLanguageDirectionRightToLeft);
    
    return isRTL;
}

BOOL isRTL_scheme()
{
    BOOL isRTL = ([UIView userInterfaceLayoutDirectionForSemanticContentAttribute:[UIView new].semanticContentAttribute] == UIUserInterfaceLayoutDirectionRightToLeft);
    
    return isRTL;
}

BOOL isRTL_app()
{
    return [[Utils getLanguage] isEqualToString:KEY_LANGUAGE_AR];
}


- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer {
    ECSlidingViewController *slidingViewController = self.slidingViewController;
    if ([[Utils getLanguage] isEqualToString:KEY_LANGUAGE_EN]) {
        if (slidingViewController.currentTopViewPosition == ECSlidingViewControllerTopViewPositionAnchoredRight) {
            return YES;
        }
    } else {
        if (slidingViewController.currentTopViewPosition == ECSlidingViewControllerTopViewPositionAnchoredLeft) {
            return YES;
        }
    }
    
    CGFloat velocityX = [gestureRecognizer velocityInView:self.slidingViewController.view].x;

    BOOL isMovingRight = velocityX > 0;
    if ([[Utils getLanguage] isEqualToString:KEY_LANGUAGE_EN]) {
        return isMovingRight;
    } else {
        return !isMovingRight;
    }
}
*/

- (void)viewDidLoad {
    [super viewDidLoad];
    [self preferredStatusBarStyle];
    
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
//                                                  forBarMetrics:UIBarMetricsDefault]; //UIImageNamed:@"transparent.png"
//    self.navigationController.navigationBar.shadowImage = [UIImage new];////UIImageNamed:@"transparent.png"
//    self.navigationController.navigationBar.translucent = YES;
//    self.navigationController.view.backgroundColor = [UIColor clearColor];
    [GiFHUD setGifWithImageName:@"loader.gif"];

 self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.tintColor = [UIColor blackColor];
    [self.refreshControl addTarget:self
                            action:@selector(refreshItems)
                  forControlEvents:UIControlEventValueChanged];
    
//    self.navigationController.navigationBar.barTintColor = [UIColor clearColor];;
//    self.navigationController.navigationBar.translucent = YES;

    
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchAds)];

    //self.navigationController.navigationBar.opaque = YES;
    self.navigationController.navigationBar.translucent = NO;
    
    //self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    //self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
  
    
    /*
    if ([[Utils getLanguage] isEqualToString:KEY_LANGUAGE_EN]) {
        [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, [UIFont boldSystemFontOfSize:17], NSFontAttributeName, nil]];
        
    } else if ([[Utils getLanguage] isEqualToString:KEY_LANGUAGE_AR]) {
        [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, [UIFont fontWithName:@"GE Flow" size:17], NSFontAttributeName, nil]];
    }
    */
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
  
    
//    [[UITableViewCell appearance] setTintColor:[UIColor colorWithRed:0.161  green:0.569  blue:0.718 alpha:1]];
    
    self.dismissProgress = YES;
    
}
-(void)viewWillAppear:(BOOL)animated{
//    [[UINavigationBar appearance] setBarTintColor:[UIColor blackColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
}
-(UITextField *)addBottomBoreder:(UITextField *)textField{
CALayer *border = [CALayer layer];
CGFloat borderWidth = 1;
border.borderColor = [UIColor lightGrayColor].CGColor;
border.frame = CGRectMake(-38, textField.frame.size.height - borderWidth, textField.frame.size.width+38, textField.frame.size.height);
border.borderWidth = borderWidth;
[textField.layer addSublayer:border];
textField.layer.masksToBounds = YES;
    return textField;
}
- (void)animateControllerFromBottomToTop
{
    CATransition *animation = [CATransition animation];
    [animation setDelegate:self];
    [animation setType:kCATransitionPush];
    [animation setSubtype:kCATransitionFromTop];
    [animation setDuration:0.65f];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [[self.navigationController.view layer] addAnimation:animation forKey:@"AnimationFromBottomToTop"];
}
- (void)animateControllerFromBottomToLeft
{
    CATransition *animation = [CATransition animation];
    [animation setDelegate:self];
    [animation setType:kCATransitionPush];
    [animation setSubtype:kCATransitionFromTop];
    [animation setDuration:0.65f];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [[self.navigationController.view layer] addAnimation:animation forKey:@"AnimationFromBottomToLeft"];
}
-(void)deleteHistory{
    
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    NSArray       *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString  *documentsDirectory = [paths objectAtIndex:0];
    
    
    NSArray *fileArray = [fileMgr contentsOfDirectoryAtPath:documentsDirectory error:nil];
    
    NSArray *searchPaths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* documentsPath = [searchPaths objectAtIndex: 0];
    
    NSError* error = nil;
    NSArray* filesArray = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:documentsPath error:&error];
    if(error != nil) {
        NSLog(@"Error in reading files: %@", [error localizedDescription]);
        return;
    }
    
    // sort by creation date
    NSMutableArray* filesAndProperties = [NSMutableArray arrayWithCapacity:[filesArray count]];
    for(NSString* file in filesArray) {
        NSString* filePath = [documentsDirectory stringByAppendingPathComponent:file];
        NSDictionary* properties = [[NSFileManager defaultManager]
                                    attributesOfItemAtPath:filePath
                                    error:&error];
        NSDate* modDate = [properties objectForKey:NSFileModificationDate];
        
        if(error == nil)
        {
            [filesAndProperties addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                                           file, @"path",
                                           modDate, @"lastModDate",
                                           nil]];
        }
    }
    
    // sort using a block
    // order inverted as we want latest date first
    NSArray* sortedFiles = [filesAndProperties sortedArrayUsingComparator:
                            ^(id path1, id path2)
                            {
                                // compare
                                NSComparisonResult comp = [[path1 objectForKey:@"lastModDate"] compare:
                                                           [path2 objectForKey:@"lastModDate"]];
                                // invert ordering
                                if (comp == NSOrderedDescending) {
                                    comp = NSOrderedAscending;
                                }
                                else if(comp == NSOrderedAscending){
                                    comp = NSOrderedDescending;
                                }
                                return comp;
                            }];
    NSLog(@"%@",sortedFiles);
    
    if(sortedFiles.count>50){
        for(int i=0;i<sortedFiles.count-50;i++){
            //for (NSString *filename in fileArray)  {
            NSString *filename=[sortedFiles[sortedFiles.count-i-1] valueForKey:@"path"];
            NSLog(@"%@-----------------------File deleted !",filename);
            
            [fileMgr removeItemAtPath:[documentsDirectory stringByAppendingPathComponent:filename] error:NULL];
        }
        NSArray* filesArray = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:documentsPath error:&error];
        NSLog(@"wehave----%@",filesArray);
        
    }
}



- (void)refreshItems {
}

/*
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar1 {
    [searchBar resignFirstResponder];
    searchBar.hidden = YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar1 {
    [searchBar resignFirstResponder];
    searchBar.hidden = YES;

//    SearchViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"searchads"];
//    vc.searchTerm = searchBar.text;
//    [self.navigationController pushViewController:vc animated:YES];
}

- (void)searchAds {
    if (!searchBar) {
        searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
        [searchBar setDelegate:self];
        [searchBar setShowsCancelButton:YES animated:YES];
        [self.view addSubview:searchBar];
        [self.view bringSubviewToFront:searchBar];
        
        // Remove the icon, which is located in the left view
        [UITextField appearanceWhenContainedIn:[UISearchBar class], nil].leftView = nil;
        
        // Give some left padding between the edge of the search bar and the text the user enters
        searchBar.searchTextPositionAdjustment = UIOffsetMake(10, 0);
    }
    searchBar.hidden = NO;
    [searchBar becomeFirstResponder];
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) makePostCallForPage:(NSString *)page
                  withParams:(NSDictionary *)params
             withRequestCode:(int)code {
    
    if (![Utils isOnline]) {
        [Utils showErrorAlertWithMessage:[MCLocalization stringForKey:@"internet_error"]];
        return;
    }
    
    requestCode = code;
    
    [self performSelectorOnMainThread:@selector(showHUD:) withObject:nil waitUntilDone:YES];
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] initWithDictionary:params];
    [dictionary setValue:[[MCLocalization sharedInstance] language] forKey:@"lang"];
    [dictionary setValue:@"iPhone" forKey:@"device_type"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:[[Utils createURLForPage:page withParameters:dictionary] absoluteString] parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        [self parseResult:responseObject withCode:requestCode];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.refreshControl endRefreshing];
            if (self.dismissProgress) [self hideHUD];
        });
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        if (self.dismissProgress) [self hideHUD];
        NSLog(@"Error: %@", error);
    }];
}

- (void) makePostWithOutHUDCallForPage:(NSString *)page
                  withParams:(NSDictionary *)params
             withRequestCode:(int)code {
    
    if (![Utils isOnline]) {
        [Utils showErrorAlertWithMessage:[MCLocalization stringForKey:@"internet_error"]];
        return;
    }
    
    requestCode = code;
    //[self performSelectorOnMainThread:@selector(showHUD:) withObject:nil waitUntilDone:YES];
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] initWithDictionary:params];
    [dictionary setValue:[[MCLocalization sharedInstance] language] forKey:@"lang"];
     [dictionary setValue:@"iPhone" forKey:@"device_type"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:[[Utils createURLForPage:page withParameters:dictionary] absoluteString] parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        [self parseResult:responseObject withCode:requestCode];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.refreshControl endRefreshing];
            if (self.dismissProgress) [self hideHUD];
        });
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        if (self.dismissProgress) [self hideHUD];
        NSLog(@"Error: %@", error);
    }];
}


- (void) makeGetCallForPage:(NSString *)page
                  withParams:(NSDictionary *)params
             withRequestCode:(int)code {
    
    if (![Utils isOnline]) {
        [Utils showErrorAlertWithMessage:[MCLocalization stringForKey:@"internet_error"]];
        return;
    }
    
    requestCode = code;
    [self performSelectorOnMainThread:@selector(showHUD:) withObject:nil waitUntilDone:YES];
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] initWithDictionary:params];
    [dictionary setValue:[[MCLocalization sharedInstance] language] forKey:@"lang"];
     [dictionary setValue:@"iPhone" forKey:@"device_type"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:[[Utils createURLForPage:page withParameters:dictionary] absoluteString] parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        [self parseResult:responseObject withCode:requestCode];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.refreshControl endRefreshing];
            if (self.dismissProgress) [self hideHUD];
        });
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        if (self.dismissProgress) [self hideHUD];
        NSLog(@"Error: %@", error);
    }];
}

- (void) parseResult:(id) result withCode:(int)reqeustCode {
}

#pragma mark - textfield

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Alerts
//-(void)toastMessage:(NSString *)message
//{
//    
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil
//                                                                   message:message
//                                                            preferredStyle:UIAlertControllerStyleAlert];
//    
//    [self presentViewController:alert animated:YES completion:nil];
//    
//    int duration = 1; // duration in seconds
//    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, duration * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
//        [alert dismissViewControllerAnimated:YES completion:nil];
//    });
//}
-(void)viewWillDisappear:(BOOL)animated{
    [GiFHUD dismiss];
    [self hideHUD];
}

- (void) showSuccessMessage:(NSString *)message {
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    [controller addAction:[UIAlertAction actionWithTitle:Localized(@"ok") style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:controller animated:YES completion:nil];
}

- (void) showErrorAlertWithMessage:(NSString *)message {
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    [controller addAction:[UIAlertAction actionWithTitle:Localized(@"ok") style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:controller animated:YES completion:nil];
}

#pragma mark - HUD

- (void) showHUD:(NSString *)labelText {
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeGradient];
    //[GiFHUD show];
    self.view.userInteractionEnabled=NO;
}

- (void) hideHUD {
    self.view.userInteractionEnabled=YES;
   // [GiFHUD dismiss];
    [SVProgressHUD dismissWithDelay:(NSTimeInterval) 0.2f];
}

- (void) makePostCallForPage:(NSString *)page
                  withParams:(NSDictionary *)params
                withCallback:(void (^)(id))resultCallback {
    
    if (![Utils isOnline]) {
        [Utils showErrorAlertWithMessage:[MCLocalization stringForKey:@"internet_error"]];
        return;
    }
    
    [self performSelectorOnMainThread:@selector(showHUD:) withObject:nil waitUntilDone:YES];
    
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] initWithDictionary:params];
    [dictionary setValue:[[MCLocalization sharedInstance] language] forKey:@"lang"];
     [dictionary setValue:@"iPhone" forKey:@"device_type"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:[[Utils createURLForPage:page withParameters:dictionary] absoluteString] parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        [self.refreshControl endRefreshing];
        if (self.dismissProgress) [self hideHUD];
        resultCallback(responseObject);
        
        //[self parseResult:responseObject withCode:requestCode];
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        if (self.dismissProgress) [self hideHUD];
        NSLog(@"Error: %@", error);
    }];
}

-(UIView*)addborderAndRoundRectTo:(UIView*)view;
{
    view.layer.borderWidth = 1;
        view.layer.borderColor = [UIColor blackColor ].CGColor;
        view.layer.cornerRadius=5;
       view.clipsToBounds=YES;
    return view;
}
-(void)addPushAnimation{
    CATransition* transition = [CATransition animation];
    transition.duration = 0.7;
    transition.type = kCATransitionMoveIn;
    transition.subtype = kCATransitionFromRight;
    [transition setTimingFunction: [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
}
-(void)addPopAnimation{
    CATransition* transition = [CATransition animation];
    transition.duration = 0.7;
    transition.type = kCATransitionMoveIn;
    transition.subtype = kCATransitionFromLeft;
    [transition setTimingFunction: [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
}

-(NSAttributedString *)base64ToDecoding:(NSString *)str{
    NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:str options:0];
    NSString *decodedString = [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];
    NSAttributedString *attributedString = [[NSAttributedString alloc]
                                            initWithData: [decodedString dataUsingEncoding:NSUnicodeStringEncoding]
                                            options: @{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType }
                                            documentAttributes: nil
                                            error: nil
                                            ];
    return attributedString;
}


-(NSMutableAttributedString*)addblackShadowToLabel:(NSString *)str{
    NSMutableAttributedString * mutableAttriStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",str]];
    NSShadow * shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor blackColor];
    shadow.shadowBlurRadius = 10.0;
    shadow.shadowOffset = CGSizeMake(1.0, 1.0);
    NSDictionary * attris = @{NSShadowAttributeName:shadow};
    [mutableAttriStr setAttributes:attris range:NSMakeRange(0,mutableAttriStr.length)];
    return mutableAttriStr;
}
-(void)animation:(UIButton *)buttonUser2{
    [UIView animateWithDuration:0.5
                     animations:^{
                         // animations go here
                         buttonUser2.transform=CGAffineTransformMakeScale(1.2,1.2);
                     }
                     completion:^(BOOL finished) {
                         // block fires when animation has finished
                         [UIView animateWithDuration:0.5
                                          animations:^{
                                              // animations go here
                                              buttonUser2.transform=CGAffineTransformMakeScale(1.0,1.0);
                                          }
                                          completion:^(BOOL finished) {
                                              [self animation:buttonUser2];
                                          }
                          ];
                     }];
    
}
-(void)addtolayerTO:(UIButton *)button{
    button.layer.cornerRadius = button.frame.size.height/2;
    button.clipsToBounds = YES;
    button.layer.borderWidth = 2.0f;
    button.layer.borderColor = [UIColor whiteColor].CGColor;
    
}
- (BOOL)validateEmailWithString:(NSString*)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
@end
