//
//  EditProfileViewController.m
//  HomeWorkers
//
//  Created by apple on 04/05/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import "EditProfileViewController.h"
#import "Common.h"
@interface EditProfileViewController ()
{
    UIButton *buttonUser;
}

@end

@implementation EditProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = Localized(@"Edit Profile");
    [self.registerSubmitBtn setTitle:Localized(@"Submit") forState:UIControlStateNormal];
    self.registerSubmitBtn.backgroundColor = BUTTON_BG_COLOR;

    
    self.firstNameLbl.text=Localized(@"First Name");
    self.lastNameLbl.text=Localized(@"Last Name");
    self.registerEmailAddressLbl.text=Localized(@"Email Address");
   // self.registerPasswordLbl.text=Localized(@"Password");
    self.mobileNumber.text=Localized(@"Mobile Number");

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
    // Do any additional setup after loading the view.
    self.registerEmailAddressTxtfield.text=@"";
    self.firstNameTxtfield.text=@"";
    self.lastNameTxtfield.text=@"";
    self.mobileNumberTxtfield.text=@"";
    self.registerEmailAddressTxtfield.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Enter Email")
     attributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:233.0f/255.0f green:236.0f/255.0f blue:239.0f/255.0f alpha:1]}];
    
    self.firstNameTxtfield.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Enter First Name")
     attributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:233.0f/255.0f green:236.0f/255.0f blue:239.0f/255.0f alpha:1]}];
    self.lastNameTxtfield.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Enter Last Name")
     attributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:233.0f/255.0f green:236.0f/255.0f blue:239.0f/255.0f alpha:1]}];
    self.mobileNumberTxtfield.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Enter Mobile Number")
     attributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:233.0f/255.0f green:236.0f/255.0f blue:239.0f/255.0f alpha:1]}];
    self.registerSubmitBtn.layer.cornerRadius = self.registerSubmitBtn.frame.size.height/2;
    self.registerSubmitBtn.clipsToBounds = YES;
    self.registerSubmitBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    self.registerSubmitBtn.layer.borderWidth = 2;
    [self makePostCallForPage:MEMBER_DETAILS withParams:@{@"member_id":[Utils loggedInUserIdStr]} withRequestCode:1003];

}
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)parseResult:(id)result withCode:(int)reqeustCode {
    if(reqeustCode==1003){
        NSLog(@"%@",result);
        NSDictionary *user = result[0];
        _registerEmailAddressTxtfield.text=[NSString stringWithFormat:@"%@",[user valueForKey:@"email"]];
        _firstNameTxtfield.text=[NSString stringWithFormat:@"%@",[user valueForKey:@"fname"]];
        _lastNameTxtfield.text=[NSString stringWithFormat:@"%@",[user valueForKey:@"lname"]];
        _mobileNumberTxtfield.text=[NSString stringWithFormat:@"%@",[user valueForKey:@"phone"]];

    }else if ([[result valueForKey:@"status"] isEqualToString:@"Failed"]) {
        NSString *str=[result valueForKey:@"message"];
        [self showErrorAlertWithMessage:Localized(str)];
        
    } else {
        [self.navigationController popViewControllerAnimated:YES];

//        NSString *str=[result valueForKey:@"message"];
//        [self showSuccessMessage:Localized(str)];
        
    }
    
}
- (IBAction)registerSubmitBtnAction:(id)sender{
    [self makePostCallForPage:EDITMEMBER withParams:@{@"member_id":[Utils loggedInUserIdStr],@"fname":_firstNameTxtfield.text,
                                                     @"lname":_lastNameTxtfield.text,
                                                     @"email":_registerEmailAddressTxtfield.text,
                                                     
                                                     
                                                     @"phone":_mobileNumberTxtfield.text
                                                     
                                                     } withRequestCode:200];
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

@end
