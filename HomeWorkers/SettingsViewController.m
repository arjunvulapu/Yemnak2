//
//  SettingsViewController.m
//  HomeWorkers
//
//  Created by apple on 07/05/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import "SettingsViewController.h"
#import "EditProfileViewController.h"
#import "MyBookingsViewController.h"
#import "SettingsTableViewCell.h"
#import "ContactUsTableViewCell.h"
#import "ContactUsViewController.h"
#import "AboutUsViewController.h"
#import <MessageUI/MessageUI.h>
#import "CorporateRequestsListViewController.h"
#import "ForgetPasswordViewController.h"
#import "ContactUsViewController.h"
@interface SettingsViewController ()
{
    UIButton *buttonUser;
    NSMutableArray *mysettings;
    NSMutableArray *support;
    NSMutableArray *headers;

}
@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    mysettings=[[NSMutableArray alloc]init];
    support=[[NSMutableArray alloc]init];
    headers=[[NSMutableArray alloc]init];
    
    
    // Do any additional setup after loading the view.
    [self addtolayerTO:_editProfileBtn];
    [self addtolayerTO:_myOrderBtn];
    [self addtolayerTO:_logOutBtn];
    [self addtolayerTO:_changeLanguageBtn];
    
   

}
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)viewWillAppear:(BOOL)animated{
    self.navigationItem.title = Localized(@"Settings");
    //mysettings = [NSMutableArray arrayWithObjects:Localized(@"My Bookings"),Localized(@"Edit Profile"),Localized(@"LogOut"), nil];
    mysettings = [NSMutableArray arrayWithObjects:
                  Localized(@"Home Worker Requests"),
                  Localized(@"Available Home Workers"),
                  Localized(@"Part Time Request"), Localized(@"Corporate Request"),
                  Localized(@"Employee Requests"),
               nil];

//    support = [NSMutableArray arrayWithObjects:                  Localized(@"Corporate Request"),
//               Localized(@"Employee Requests"), nil];
    //headers = [NSMutableArray arrayWithObjects:Localized(@"LANGUAGE"),Localized(@"MY SETTINGS"), Localized(@"SUPPORT"),Localized(@"CONTACT US"),nil];
    headers = [NSMutableArray arrayWithObjects:Localized(@"LANGUAGE"),Localized(@"YOUR REQUESTS"),Localized(@"CORPORATE"),nil];

    [self.editProfileBtn setTitle:Localized(@"Edit Profile") forState:UIControlStateNormal];
    [self.myOrderBtn setTitle:Localized(@"My Orders") forState:UIControlStateNormal];
    [self.logOutBtn setTitle:Localized(@"LogOut") forState:UIControlStateNormal];
    [self.changeLanguageBtn setTitle:Localized(@"Change Language") forState:UIControlStateNormal];
    buttonUser = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [buttonUser setImage:[UIImage imageNamed:@"leftarrow-black90"] forState:UIControlStateNormal];
    if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
        [buttonUser setImage:[UIImage imageNamed:@"right-arrow"] forState:UIControlStateNormal];
        
    }else{
        [buttonUser setImage:[UIImage imageNamed:@"left-arrow"] forState:UIControlStateNormal];
    }
    buttonUser.frame = CGRectMake(0, 0, 30, 30);
    [buttonUser addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *customBarRightBtn = [[UIBarButtonItem alloc] initWithCustomView:buttonUser];
    customBarRightBtn.tintColor=[UIColor blueColor];
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    [negativeSpacer setWidth:0];
    
    //    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer,customBarRightBtn,nil];
    UIView *backButtonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
        backButtonView.bounds = CGRectOffset(backButtonView.bounds, -10, 0);
    }else{
        backButtonView.bounds = CGRectOffset(backButtonView.bounds, 10, 0);
    }
    [backButtonView addSubview:buttonUser];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backButtonView];
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.leftBarButtonItem = backButton;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)editProfileBtnAction:(id)sender {
    EditProfileViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"EditProfileViewController"];
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)myorderBtnAction:(id)sender {
    MyBookingsViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"MyBookingsViewController"];
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)logoutBtnAction:(id)sender {
     [Utils logoutUser];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)changeLanguageBtnAction:(id)sender {
    
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

//    NSArray *windows = [UIApplication sharedApplication].windows;
//    for (UIWindow *window in windows) {
//        for (UIView *view in window.subviews) {
//            [view removeFromSuperview];
//            [window addSubview:view];
//        }
//    }

    [APP_DELEGATE setToStart];


    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section==0){
        return 3;
    }else if(section==1){
        return mysettings.count;
    }else if(section==2){
        return support.count;
    }else{
    return 1;
    }
}



- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0){
        if(indexPath.row==0){
        SettingsTableViewCell *cell = [self.settingsTableView dequeueReusableCellWithIdentifier:@"SettingsTableViewCell"] ;
        if ([[Utils getLanguage] isEqualToString:KEY_LANGUAGE_AR]) {
            [cell.pbutton setImage:[UIImage imageNamed:@"previous"] forState:UIControlStateNormal];
            cell.pName.text=Localized(@"ENGLISH");

        }else{
            [cell.pbutton setImage:[UIImage imageNamed:@"next"] forState:UIControlStateNormal];
            cell.pName.text=Localized(@"ARABIC");

        }
        cell.btnAction = ^{
            if ([[Utils getLanguage] isEqualToString:KEY_LANGUAGE_AR]) {
                [Utils setLanguage:KEY_LANGUAGE_EN];
                [[MCLocalization sharedInstance] setLanguage:KEY_LANGUAGE_EN];
            } else {
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
            _settingsTableView.reloadData;
        };
        
        return cell;
        }else  if(indexPath.row==1){
            SettingsTableViewCell *cell = [self.settingsTableView dequeueReusableCellWithIdentifier:@"SettingsTableViewCell"] ;
            if ([[Utils getLanguage] isEqualToString:KEY_LANGUAGE_AR]) {
                [cell.pbutton setImage:[UIImage imageNamed:@"previous"] forState:UIControlStateNormal];
                cell.pName.text=Localized(@"Contact Us");
                
            }else{
                [cell.pbutton setImage:[UIImage imageNamed:@"next"] forState:UIControlStateNormal];
                cell.pName.text=Localized(@"Contact Us");
                
            }
            cell.btnAction = ^{
                ContactUsViewController *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"ContactUsViewController"];
                [self.navigationController pushViewController:vc animated:YES];
            };
            
            return cell;
        }else  {
            SettingsTableViewCell *cell = [self.settingsTableView dequeueReusableCellWithIdentifier:@"SettingsTableViewCell"] ;
            if ([[Utils getLanguage] isEqualToString:KEY_LANGUAGE_AR]) {
                [cell.pbutton setImage:[UIImage imageNamed:@"previous"] forState:UIControlStateNormal];
                cell.pName.text=Localized(@"YOUR REQUESTS");
                
            }else{
                [cell.pbutton setImage:[UIImage imageNamed:@"next"] forState:UIControlStateNormal];
                cell.pName.text=Localized(@"YOUR REQUESTS");
                
            }
            cell.btnAction = ^{
                CorporateRequestsListViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"CorporateRequestsListViewController"];
                controller.from = @"10";
                [self.navigationController pushViewController:controller animated:YES];
            };
            
            return cell;
        }
    }
    else if(indexPath.section==4){
        ContactUsTableViewCell *cell = [self.settingsTableView dequeueReusableCellWithIdentifier:@"ContactUsTableViewCell"] ;
        cell.calling = ^{
            NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
            NSData *data = [currentDefaults objectForKey:@"SETTINGS"];
            NSDictionary *dict = [NSKeyedUnarchiver unarchiveObjectWithData:data];
            NSString *phNo = [dict valueForKey:@"phone"];
            NSURL *phoneUrl = [NSURL URLWithString:[NSString  stringWithFormat:@"telprompt:%@",phNo]];
            
            if ([[UIApplication sharedApplication] canOpenURL:phoneUrl]) {
                [[UIApplication sharedApplication] openURL:phoneUrl];
            } else
            {
                UIAlertView *calert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Call facility is not available!!!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
                [calert show];
            }
        };
        cell.Email = ^{
            if ([MFMailComposeViewController canSendMail]) {
                MFMailComposeViewController *composeViewController = [[MFMailComposeViewController alloc] initWithNibName:nil bundle:nil];
                [composeViewController setMailComposeDelegate:self];
                    NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
            NSData *data = [currentDefaults objectForKey:@"SETTINGS"];
            NSDictionary *dict = [NSKeyedUnarchiver unarchiveObjectWithData:data];
                NSString *email = [dict valueForKey:@"email"];

                [composeViewController setToRecipients:@[email]];
                [composeViewController setSubject:@"HomeWorkers"];
                [self presentViewController:composeViewController animated:YES completion:nil];
            }
        };
        
        return cell;
    }else if(indexPath.section==1){
        SettingsTableViewCell *cell = [self.settingsTableView dequeueReusableCellWithIdentifier:@"SettingsTableViewCell"] ;
        cell.pName.text=[mysettings objectAtIndex:indexPath.row];
        
        if ([[Utils getLanguage] isEqualToString:KEY_LANGUAGE_AR]) {
            [cell.pbutton setImage:[UIImage imageNamed:@"previous"] forState:UIControlStateNormal];
            
        }else{
            [cell.pbutton setImage:[UIImage imageNamed:@"next"] forState:UIControlStateNormal];
            
        }
        
        return cell;
    }else if(indexPath.section==2){
        SettingsTableViewCell *cell = [self.settingsTableView dequeueReusableCellWithIdentifier:@"SettingsTableViewCell"] ;
        cell.pName.text=[support objectAtIndex:indexPath.row];

        if ([[Utils getLanguage] isEqualToString:KEY_LANGUAGE_AR]) {
            [cell.pbutton setImage:[UIImage imageNamed:@"previous"] forState:UIControlStateNormal];
            
        }else{
            [cell.pbutton setImage:[UIImage imageNamed:@"next"] forState:UIControlStateNormal];
            
        }
        
        return cell;
    }else{
       SettingsTableViewCell *cell = [self.settingsTableView dequeueReusableCellWithIdentifier:@"SettingsTableViewCell"] ;
        cell.pName.text=[support objectAtIndex:indexPath.row];

        if ([[Utils getLanguage] isEqualToString:KEY_LANGUAGE_AR]) {
            [cell.pbutton setImage:[UIImage imageNamed:@"previous"] forState:UIControlStateNormal];
            
        }else{
            [cell.pbutton setImage:[UIImage imageNamed:@"next"] forState:UIControlStateNormal];
            
        }
    
    return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 60;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if ([[Utils getLanguage] isEqualToString:KEY_LANGUAGE_AR]) {
        UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 60)];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 25, tableView.frame.size.width, 25)];
    /* Create custom view to display section header... */
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(-20, 0, tableView.frame.size.width, 25)];
    [label setFont:[UIFont boldSystemFontOfSize:15]];
        [label setTextColor:[UIColor lightGrayColor]];
    NSString *string =[headers objectAtIndex:section];
    /* Section header is in 0th index... */
    [label setText:string];
    [view addSubview:label];
        [view1 addSubview:view];
    [view setBackgroundColor:[UIColor colorWithRed:50/255.0f green:50/255.0f blue:50/255.0f alpha:1]]; //your background color...
        [view1 setBackgroundColor:[UIColor colorWithRed:50/255.0f green:50/255.0f blue:50/255.0f alpha:1]]; //your background color...

    return view1;
    }else{
        UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 60)];

        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 25, tableView.frame.size.width, 25)];
        /* Create custom view to display section header... */
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, tableView.frame.size.width, 25)];
         [label setTextColor:[UIColor lightGrayColor]];
        [label setFont:[UIFont boldSystemFontOfSize:15]];
        NSString *string =[headers objectAtIndex:section];
        /* Section header is in 0th index... */
        [label setText:string];
        [view addSubview:label];
        [view1 addSubview:view];

        [view setBackgroundColor:[UIColor colorWithRed:50/255.0f green:50/255.0f blue:50/255.0f alpha:1]]; //your background color...
        [view1 setBackgroundColor:[UIColor colorWithRed:50/255.0f green:50/255.0f blue:50/255.0f alpha:1]]; //your background color...

        return view1;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0){
        if(indexPath.row==0){
        if ([[Utils getLanguage] isEqualToString:KEY_LANGUAGE_AR]) {
            [Utils setLanguage:KEY_LANGUAGE_EN];
            [[MCLocalization sharedInstance] setLanguage:KEY_LANGUAGE_EN];
        } else {
            [Utils setLanguage:KEY_LANGUAGE_AR];
            [[MCLocalization sharedInstance] setLanguage:KEY_LANGUAGE_AR];
                    }
        [APP_DELEGATE reloadUIForLanguageChange];
            [APP_DELEGATE setToStart];
        _settingsTableView.reloadData;
        }
        else if(indexPath.row==1){
            ContactUsViewController *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"ContactUsViewController"];
            [self.navigationController pushViewController:vc animated:YES];
        }else if(indexPath.row==2){
        CorporateRequestsListViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"CorporateRequestsListViewController"];
        controller.from = @"10";
        [self.navigationController pushViewController:controller animated:YES];
        }
        else{
            ForgetPasswordViewController *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"ForgetPasswordViewController"];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    else if(indexPath.section==1){
        if(indexPath.row==0){
            CorporateRequestsListViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"CorporateRequestsListViewController"];
            controller.from = @"10";
            [self.navigationController pushViewController:controller animated:YES];
        }else if(indexPath.row==1){
            CorporateRequestsListViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"CorporateRequestsListViewController"];
            controller.from = @"11";
            [self.navigationController pushViewController:controller animated:YES];
        }else if(indexPath.row==2){
            CorporateRequestsListViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"CorporateRequestsListViewController"];
            controller.from = @"12";
            [self.navigationController pushViewController:controller animated:YES];
        }if(indexPath.row==3){
            CorporateRequestsListViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"CorporateRequestsListViewController"];
            controller.from = @"20";
            [self.navigationController pushViewController:controller animated:YES];
        }else if(indexPath.row==4){
            CorporateRequestsListViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"CorporateRequestsListViewController"];
            controller.from = @"21";
            [self.navigationController pushViewController:controller animated:YES];
        }
    }else
    if(indexPath.section==2){
        if(indexPath.row==0){
            CorporateRequestsListViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"CorporateRequestsListViewController"];
            controller.from = @"20";
            [self.navigationController pushViewController:controller animated:YES];
        }else if(indexPath.row==1){
            CorporateRequestsListViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"CorporateRequestsListViewController"];
            controller.from = @"21";
            [self.navigationController pushViewController:controller animated:YES];
        }
    }
}
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    //Add an alert in case of failure
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
