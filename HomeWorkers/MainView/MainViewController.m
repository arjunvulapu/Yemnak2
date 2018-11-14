//
//  MainViewController.m
//  HomeWorkers
//
//  Created by apple on 16/04/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import "MainViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "MainTableViewCell.h"
#import "Utils.h"
#import "Common.h"
#import "HomeWorkersViewController.h"
#import "PartimeWorkersViewController.h"
#import "AvailableWorkersViewController.h"
#import "ContactUsViewController.h"
#import "AboutUsViewController.h"
#import "SWRevealViewController.h"
#import "LoginViewController.h"
#import "EditProfileViewController.h"
#import "SettingsViewController.h"
#import "MyBookingsViewController.h"
#import "AddAvailableWorkersViewController.h"
#import "HomeWorkersRequestViewController.h"
#import "CorporateRequestViewController.h"
#import "EmployeeRequestViewController.h"
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"
#import "SelectFormViewController.h"
#import "UIViewController+MJPopupViewController.h"
#import "PopViewControllerDelegate.h"
@interface MainViewController ()<SWRevealViewControllerDelegate,UIAlertViewDelegate,PopViewControllerDelegate>
{
    UIButton *rightbutton;
    UIButton *leftbutton;
    NSMutableArray *mainCat;
}
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // Do any additional setup after loading the view.
    [self addtolayerTO:self.contactUsBtn];
    [self addtolayerTO:self.aboutUsBtn];[self addtolayerTO:self.settingsBtn];
    [self customSetup];
    [APP_DELEGATE reloadUIForLanguageChange];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveTestNotification:)
                                                 name:@"TestNotification"
                                               object:nil];
    [self.navigationController.navigationBar setBackgroundImage: [UIImage new]
                                       forBarMetrics: UIBarMetricsDefault];
    
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}
- (void) receiveTestNotification:(NSNotification *) notification
{
    // [notification name] should always be @"TestNotification"
    // unless you use this method for observation of other notifications
    // as well.
    //    self.navigationController.navigationBar.translucent = NO;
    //    [self.tabBarController setSelectedIndex:0];
    if ([[notification name] isEqualToString:@"TestNotification"])
    {
        NSDictionary* userInfo = notification.userInfo;
        NSNumber* selectedId = (NSNumber*)userInfo[@"selectedId"];
        NSNumber* sectionId = (NSNumber*)userInfo[@"sectionId"];
        
        NSLog (@"Successfully received the test notification!,%@",selectedId);
//        if([sectionId isEqual:@0]){
//            if([Utils loggedInUserId] != -1){
//                if([selectedId  isEqual: @0]){
//                    MyOrderListViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"MyOrderListViewController"];
//                    [self.navigationController pushViewController:controller animated:YES];
//                }else if([selectedId isEqual:@1]){
//                    WishListViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"WishListViewController"];
//                    [self.navigationController pushViewController:controller animated:YES];
//                }else if([selectedId isEqual:@2]){
//                    MyaddressesViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"MyaddressesViewController"];
//                    [self.navigationController pushViewController:controller animated:YES];
//                }
//            }else{
//                
//                if([selectedId isEqual:@0]){
//                    CustomerCareViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"CustomerCareViewController"];
//                    [self.navigationController pushViewController:controller animated:YES];
//                }else  if([selectedId isEqual:@1]){
//                    ContactUsViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"ContactUsViewController"];
//                    [self.navigationController pushViewController:controller animated:YES];
//                }else if([selectedId isEqual:@2]){
//                    AboutUsViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"AboutUsViewController"];
//                    [self.navigationController pushViewController:controller animated:YES];
//                }
//                
//            }
//        }else if([sectionId isEqual:@2]){
//            LoginViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
//            controller.from=@"signup";
//            [self.navigationController pushViewController:controller animated:YES];
//        }else if([sectionId isEqual:@3]){
//            LoginViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
//            
//            [self.navigationController pushViewController:controller animated:YES];
//        }else if([sectionId isEqual:@4]){
//            //            self.tabBarController.selectedIndex=3;
//            AccountViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"AccountViewController"];
//            [self.navigationController pushViewController:controller animated:YES];
//        }else
            
           // if([sectionId isEqual:@1]){
        if([Utils loggedInUserId] != -1){
            if([selectedId isEqual:@0]){
                if([Utils loggedInUserId] != -1){
                    MyBookingsViewController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"MyBookingsViewController"];
                    [self.navigationController pushViewController:obj animated:YES];
                    
                }else{
                    LoginViewController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
                    [self.navigationController pushViewController:obj animated:YES];
                }
            }else if([selectedId isEqual:@1]){
                EditProfileViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"EditProfileViewController"];
                //controller.from=@"signup";
                [self.navigationController pushViewController:controller animated:YES];
            }
            else if([selectedId isEqual:@2]){
                [Utils logoutUser];
            }else  if([selectedId isEqual:@3]){
                ContactUsViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"ContactUsViewController"];
                [self.navigationController pushViewController:controller animated:YES];
            }else if([selectedId isEqual:@4]){
                AboutUsViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"AboutUsViewController"];
                [self.navigationController pushViewController:controller animated:YES];
            }
        }
             else{
       if([selectedId isEqual:@0]){
            LoginViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
            
            [self.navigationController pushViewController:controller animated:YES];
        }else if([selectedId isEqual:@1]){
            LoginViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
            controller.from=@"signup";
            [self.navigationController pushViewController:controller animated:YES];
        }
           else if([selectedId isEqual:@2]){
                ContactUsViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"ContactUsViewController"];
                [self.navigationController pushViewController:controller animated:YES];
            }else  if([selectedId isEqual:@3]){
                ContactUsViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"ContactUsViewController"];
                [self.navigationController pushViewController:controller animated:YES];
            }else if([selectedId isEqual:@4]){
                AboutUsViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"AboutUsViewController"];
                [self.navigationController pushViewController:controller animated:YES];
            }
        }
    }
        if ([[Utils getLanguage] isEqualToString:KEY_LANGUAGE_AR]) {
            [self.revealViewController rightRevealToggleAnimated:YES];
        }else{
            [self.revealViewController revealToggleAnimated:YES];
            
        }
        
   // }
}
-(void)addtolayerTO:(UIButton *)button{
    button.layer.cornerRadius = button.frame.size.height/2;
   button.clipsToBounds = YES;
    button.layer.borderWidth = 1.0f;
   button.layer.borderColor = [UIColor whiteColor].CGColor;

}
-(void)setNavigation{
    leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [leftbutton setBackgroundImage:[UIImage imageNamed:@"button_background_icon.png"] forState:UIControlStateNormal];
    
    rightbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [leftbutton setBackgroundImage:[UIImage imageNamed:@"button_background_icon.png"] forState:UIControlStateNormal];
    [rightbutton setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];

    if([[Utils getLanguage] isEqualToString:KEY_LANGUAGE_AR]){
        //[leftbutton setImage:[UIImage imageNamed:@"wedding-english-lang"] forState:UIControlStateNormal];
        [leftbutton setImage:[UIImage imageNamed:@"lag-english"] forState:UIControlStateNormal];
//        leftbutton.frame = CGRectMake(0, 0, 30, 30);
//        rightbutton.frame = CGRectMake(33, 0, 30, 30);

    }
    else{
       
//        leftbutton.frame = CGRectMake(33, 0, 30, 30);
//        rightbutton.frame = CGRectMake(0, 0, 30, 30);
        [leftbutton setImage:[UIImage imageNamed:@"lang"] forState:UIControlStateNormal];
    }
    
    leftbutton.frame = CGRectMake(0, 0, 30, 30);

//    leftbutton.frame = CGRectMake(33, 0, 30, 30);
    [leftbutton addTarget:self action:@selector(changeLanguageAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *customBarleftItem = [[UIBarButtonItem alloc] initWithCustomView:leftbutton];
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    [negativeSpacer setWidth:0];
    
    //    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer,customBarleftItem,nil];
    UIView *backButtonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    backButtonView.bounds = CGRectOffset(backButtonView.bounds, 0, 0);
    [backButtonView addSubview:leftbutton];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backButtonView];
    //self.navigationItem.rightBarButtonItem = backButton;
    
    
//
//    rightbutton = [UIButton buttonWithType:UIButtonTypeCustom];
//    //    [leftbutton setBackgroundImage:[UIImage imageNamed:@"button_background_icon.png"] forState:UIControlStateNormal];
//    [rightbutton setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    
   
//    rightbutton.frame = CGRectMake(0, 0, 30, 30);
    //[leftbutton addTarget:self action:@selector(showSideMenu) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *customBarRightItem = [[UIBarButtonItem alloc] initWithCustomView:rightbutton];
    UIView *backButtonView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    backButtonView2.bounds = CGRectOffset(backButtonView2.bounds, 0, 0);
    //[backButtonView2 addSubview:rightbutton];
    [backButtonView2 addSubview:leftbutton];
    UIBarButtonItem *backButton2 = [[UIBarButtonItem alloc] initWithCustomView:backButtonView2];
    self.navigationItem.leftBarButtonItems= nil;
    
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects: backButton2, nil];
    //self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer,customBarleftItem,customBarRightItem,nil];

    
}
- (void)customSetup
{
    [rightbutton removeTarget:nil
                       action:NULL
             forControlEvents:UIControlEventAllEvents];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        //        UITapGestureRecognizer *tap = [revealViewController tapGestureRecognizer];
        //        tap.delegate = self;
        //
        //        [self.view addGestureRecognizer:tap];
        if ([[Utils getLanguage] isEqualToString:KEY_LANGUAGE_AR]) {
            [rightbutton addTarget:self.revealViewController action:@selector(rightRevealToggle:) forControlEvents:UIControlEventTouchUpInside] ;
        }else{
            [rightbutton addTarget:self.revealViewController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside] ;
            
        }
        //        [self.revealButtonItem setTarget: self.revealViewController];
        //        [self.revealButtonItem setAction: @selector( revealToggle: )];
        //[self.navigationController.navigationBar addGestureRecognizer: self.revealViewController.panGestureRecognizer];
    }
}
-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController.navigationBar setBackgroundImage: [UIImage new]
                                                  forBarMetrics: UIBarMetricsDefault];
    
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    mainCat =[NSMutableArray arrayWithObjects:Localized(@"HOME WORKERS"),Localized(@"AVAILABLE WORKERS"),Localized(@"PART TIME WORKERS"),Localized(@"CORPORATE"), nil];

  //  self.navigationItem.title = Localized(@"Main");
    UIImageView *navigationImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 98, 34)];
    navigationImage.image=[UIImage imageNamed:@"Yemnak"];
    navigationImage.contentMode=UIViewContentModeScaleAspectFit;
    UIImageView *workaroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 98, 34)];
    [workaroundImageView addSubview:navigationImage];
    workaroundImageView.contentMode=UIViewContentModeScaleAspectFit;
    
   // self.navigationItem.rightBarButtonItem=workaroundImageView;
    UIBarButtonItem *mailbutton =[[UIBarButtonItem alloc] initWithCustomView:workaroundImageView];
    self.navigationItem.rightBarButtonItem=mailbutton;
     self.navigationController.navigationBar.translucent = NO;
    [self.contactUsBtn setTitle:Localized(@"CONTACT US") forState:UIControlStateNormal];
    [self.aboutUsBtn setTitle:Localized(@"ABOUT US") forState:UIControlStateNormal];
    [self.settingsBtn setTitle:Localized(@"SETTINGS") forState:UIControlStateNormal];
    if ([[Utils getLanguage] isEqualToString:KEY_LANGUAGE_AR]) {
        self.contactUsBtn.titleEdgeInsets=UIEdgeInsetsMake(0, -8, 0, 0);
        self.aboutUsBtn.titleEdgeInsets=UIEdgeInsetsMake(0, -8, 0, 0);
        self.settingsBtn.titleEdgeInsets=UIEdgeInsetsMake(0, -8, 0, 0);

    }else{
         self.contactUsBtn.titleEdgeInsets=UIEdgeInsetsMake(0, 8, 0, 0);
        self.aboutUsBtn.titleEdgeInsets=UIEdgeInsetsMake(0, 8, 0, 0);
        self.settingsBtn.titleEdgeInsets=UIEdgeInsetsMake(0, 8, 0, 0);
    }
    [self setNavigation];
    [self customSetup];
    _mainTable.reloadData;
}
- (void)changeLanguageAction:(id)sender {
  
    if ([[Utils getLanguage] isEqualToString:KEY_LANGUAGE_AR]) {
        //[self.changeLanguageBtn setTitle:@"English" forState:UIControlStateNormal];
        [Utils setLanguage:KEY_LANGUAGE_EN];
        [[MCLocalization sharedInstance] setLanguage:KEY_LANGUAGE_EN];
        
    } else {
        // [self.changeLanguageBtn setTitle:@"Arabic" forState:UIControlStateNormal];
        
        [Utils setLanguage:KEY_LANGUAGE_AR];
        [[MCLocalization sharedInstance] setLanguage:KEY_LANGUAGE_AR];
        
        
    }
    
    [APP_DELEGATE reloadUIForLanguageChange];
    
    NSArray *windows = [UIApplication sharedApplication].windows;
    for (UIWindow *window in windows) {
        for (UIView *view in window.subviews) {
            [view removeFromSuperview];
            [window addSubview:view];
        }
    }
    
    
   
    _mainTable.reloadData;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return mainCat.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MainTableViewCell *cell = [self.mainTable dequeueReusableCellWithIdentifier:@"MainTableViewCell"];
    //cell.mainimage.image =[UIImage imageNamed:[NSString stringWithFormat:@"image%ld",indexPath.row+1]];
    NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [currentDefaults objectForKey:@"SETTINGS"];
    NSDictionary *dict = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    //NSDictionary *dict=[[NSUserDefaults standardUserDefaults] valueForKey:@"SETTINGS"];
    //NSString *phNo = [dict valueForKey:@"phone"];
    [cell.mainimage setImageWithURL:[dict valueForKey:[NSString stringWithFormat:@"image%ld",indexPath.row+1]] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    cell.catName.text=[mainCat objectAtIndex:indexPath.row];
    cell.addBtn.hidden=YES;
    if(indexPath.row==1){
        [cell.addBtn setTitle:Localized(@"Add AvailableWorkers") forState:UIControlStateNormal];

        cell.addBtn.hidden=NO;
        cell.addBtn.layer.cornerRadius = cell.addBtn.frame.size.height/2;
        cell.addBtn.clipsToBounds = YES;
        cell.addBtn.layer.borderWidth = 1.0f;
        cell.addBtn.layer.borderColor = [UIColor whiteColor].CGColor;

        UIColor *color =  cell.addBtn.currentTitleColor;
         cell.addBtn.titleLabel.layer.shadowColor = [color CGColor];
         cell.addBtn.titleLabel.layer.shadowRadius = 4.0f;
         cell.addBtn.titleLabel.layer.shadowOpacity = .9;
         cell.addBtn.titleLabel.layer.shadowOffset = CGSizeZero;
         cell.addBtn.titleLabel.layer.masksToBounds = NO;

//        [UIView animateWithDuration:1.5  delay:1
//                            options:UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionRepeat |UIViewAnimationOptionCurveEaseOut
//                         animations:^
//            {
//               cell.addBtn.transform = CGAffineTransformMakeScale(1.1, 1.1);
//
//            }
//         completion:^(BOOL finished)
//                {
//
//                     cell.addBtn.transform = CGAffineTransformMakeScale(1, 1);
//
//
//        }];
        cell.Add = ^{
           
            if([Utils loggedInUserId] != -1){
                AddAvailableWorkersViewController *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"AddAvailableWorkersViewController"];
                [self.navigationController pushViewController:vc animated:YES];
                
            }else{
                LoginViewController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
                [self.navigationController pushViewController:obj animated:YES];
            }
        };
    }else if(indexPath.row==0){
        [cell.addBtn setTitle:Localized(@"Request Home Workers") forState:UIControlStateNormal];

        cell.addBtn.hidden=NO;
        cell.addBtn.layer.cornerRadius = cell.addBtn.frame.size.height/2;
        cell.addBtn.clipsToBounds = YES;
        cell.addBtn.layer.borderWidth = 1.0f;
        cell.addBtn.layer.borderColor = [UIColor whiteColor].CGColor;
        
        UIColor *color =  cell.addBtn.currentTitleColor;
        cell.addBtn.titleLabel.layer.shadowColor = [color CGColor];
        cell.addBtn.titleLabel.layer.shadowRadius = 4.0f;
        cell.addBtn.titleLabel.layer.shadowOpacity = .9;
        cell.addBtn.titleLabel.layer.shadowOffset = CGSizeZero;
        cell.addBtn.titleLabel.layer.masksToBounds = NO;
        
//        [UIView animateWithDuration:1.5  delay:1
//                            options:UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionRepeat |UIViewAnimationOptionCurveEaseOut
//                         animations:^
//         {
//             cell.addBtn.transform = CGAffineTransformMakeScale(1.1, 1.1);
//
//         }
//                         completion:^(BOOL finished)
//         {
//
//             cell.addBtn.transform = CGAffineTransformMakeScale(1, 1);
//
//
//         }];
        cell.Add = ^{
            
            if([Utils loggedInUserId] != -1){
                HomeWorkersRequestViewController *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"HomeWorkersRequestViewController"];
                [self.navigationController pushViewController:vc animated:YES];
                
            }else{
                LoginViewController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
                [self.navigationController pushViewController:obj animated:YES];
            }
        };
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
    ;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row==2){
        PartimeWorkersViewController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"PartimeWorkersViewController"];
        [self.navigationController pushViewController:obj animated:YES];

    }else   if(indexPath.row==1){
        AvailableWorkersViewController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"AvailableWorkersViewController"];
        [self.navigationController pushViewController:obj animated:YES];
        
    }else   if(indexPath.row==3){
//        UIAlertController *controller = [UIAlertController alertControllerWithTitle:nil message:Localized(@"Select Type of Request") preferredStyle:UIAlertControllerStyleAlert];
//        controller.view.tintColor=[UIColor blackColor];
//
//        [controller addAction:[UIAlertAction actionWithTitle:Localized(@"Corporate Request") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//            dispatch_async(dispatch_get_main_queue(), ^{
//                // Push view controller here
//
//            EmployeeRequestViewController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"EmployeeRequestViewController"];
//            [self.navigationController pushViewController:obj animated:YES];
//                });
//        }]];
//        [controller addAction:[UIAlertAction actionWithTitle:Localized(@"Employee Request") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//
//            //[self.navigationController popViewControllerAnimated:YES];
//            dispatch_async(dispatch_get_main_queue(), ^{
//                // Push view controller here
//
//            CorporateRequestViewController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"CorporateRequestViewController"];
//            [self.navigationController pushViewController:obj animated:YES];
//                   });
//        }]];
//        [controller addAction:[UIAlertAction actionWithTitle:Localized(@"Cancel") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//
//        }]];
//
//        [self presentViewController:controller animated:YES completion:nil];

        /*
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:Localized(@"Select Type of Request")
                                                        message:@""
                                                       delegate:self
                                              cancelButtonTitle:Localized(@"Cancel")
                                              otherButtonTitles:Localized(@"Corporate Request"),Localized(@"Employee Request"), nil];
        [alert show];*/
        SelectFormViewController *vc = [[SelectFormViewController alloc] initWithNibName:@"SelectFormViewController" bundle:nil];
        vc.delegate=self;
        //    [self.navigationController pushViewController:vc animated:YES];
        vc.completionBlock = ^(NSString *area) {
            NSLog(@"%@",area);
//            snationality= area;
//            self.nationalityTxtfiled.text = [area valueForKey:@"title"];
            if ([area  isEqual: @"1"]) {
                // do something here...
                EmployeeRequestViewController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"EmployeeRequestViewController"];
                [self.navigationController pushViewController:obj animated:YES];
            }else if([area  isEqual: @"2"]){
                CorporateRequestViewController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"CorporateRequestViewController"];
                [self.navigationController pushViewController:obj animated:YES];
            }
        };
        
        [self presentPopupViewController:vc animationType:MJPopupViewAnimationSlideBottomTop dismissed:nil];

    }
    
    else{
    HomeWorkersViewController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeWorkersViewController"];
    [self.navigationController pushViewController:obj animated:YES];
     
    }
}
- (void)cancelButtonClicked:(UIViewController *)secondDetailViewController {
    [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationSlideTopBottom];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    // the user clicked OK
    if (buttonIndex == 1) {
        // do something here...
        EmployeeRequestViewController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"EmployeeRequestViewController"];
        [self.navigationController pushViewController:obj animated:YES];
    }else if(buttonIndex ==2){
                    CorporateRequestViewController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"CorporateRequestViewController"];
                    [self.navigationController pushViewController:obj animated:YES];
    }
}
- (IBAction)contactUsBtnAction:(id)sender {
    ContactUsViewController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"ContactUsViewController"];
    [self.navigationController pushViewController:obj animated:YES];
    
}

- (IBAction)settingsBtnAction:(id)sender {
    if([Utils loggedInUserId] != -1){
        SettingsViewController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"SettingsViewController"];
        [self.navigationController pushViewController:obj animated:YES];
    
    }else{
        LoginViewController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        [self.navigationController pushViewController:obj animated:YES];
    }
}

- (IBAction)aboutUsBtnAction:(id)sender {
    AboutUsViewController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"AboutUsViewController"];
    [self.navigationController pushViewController:obj animated:YES];
}
- (void)willPresentAlertView:(UIAlertView *)alertView {
    NSLog(@"Show alert");
}
@end
