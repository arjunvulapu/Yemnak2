//
//  LoginViewController.m
//  HomeWorkers
//
//  Created by apple on 25/04/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import "LoginViewController.h"
#import "ForgetPasswordViewController.h"
#import "ZHPopupView.h"
@interface LoginViewController ()
{
    UIButton *buttonUser;
    NSString *tcStatus;
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mobileNumberTxtfield.delegate=self;
    _tCLbl.text = Localized(@"Terms & Conditions");
    tcStatus= @"NO";
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
    self.navigationItem.title=Localized(@"Login/Register");
    [self.loginBtn setTitle:Localized(@"Login") forState:UIControlStateNormal];
    [self.registerBtn setTitle:Localized(@"Register") forState:UIControlStateNormal];
    [self.forgotpasswordBtn setTitle:Localized(@"Forgot Password") forState:UIControlStateNormal];
    [self.submitBtn setTitle:Localized(@"Submit") forState:UIControlStateNormal];
    [self.registerSubmitBtn setTitle:Localized(@"Submit") forState:UIControlStateNormal];
    self.submitBtn.backgroundColor = BUTTON_BG_COLOR;
    self.registerSubmitBtn.backgroundColor = BUTTON_BG_COLOR;

    
self.firstNameLbl.text=Localized(@"First Name");
    self.lastNameLbl.text=Localized(@"Last Name");
    self.registerEmailAddressLbl.text=Localized(@"Email Address");
    self.registerPasswordLbl.text=Localized(@"Password");
    self.mobileNumber.text=Localized(@"Mobile Number");

    
    
    
    self.emailLbl.text=Localized(@"Email Address");
    self.passwordLbl.text=Localized(@"Password");
    self.emailTxtField.text=@"";
    self.passwordTxtField.text=@"";
    self.emailTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Email Address")
     attributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:233.0f/255.0f green:236.0f/255.0f blue:239.0f/255.0f alpha:1]}];
    self.passwordTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Password")
     attributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:233.0f/255.0f green:236.0f/255.0f blue:239.0f/255.0f alpha:1]}];
    self.submitBtn.layer.cornerRadius = self.submitBtn.frame.size.height/2;
    self.submitBtn.clipsToBounds = YES;
    self.submitBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    self.submitBtn.layer.borderWidth = 2;
    
    self.registerEmailAddressTxtfield.text=@"";
    self.registerPasswordTxtField.text=@"";
     self.firstNameTxtfield.text=@"";
     self.lastNameTxtfield.text=@"";
     self.mobileNumberTxtfield.text=@"";
    self.registerEmailAddressTxtfield.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Email Address")
     attributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:233.0f/255.0f green:236.0f/255.0f blue:239.0f/255.0f alpha:1]}];
    self.registerPasswordTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Password")
     attributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:233.0f/255.0f green:236.0f/255.0f blue:239.0f/255.0f alpha:1]}];
    self.firstNameTxtfield.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"FirstName")
     attributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:233.0f/255.0f green:236.0f/255.0f blue:239.0f/255.0f alpha:1]}];
    self.lastNameTxtfield.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"LastName")
     attributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:233.0f/255.0f green:236.0f/255.0f blue:239.0f/255.0f alpha:1]}];
    self.mobileNumberTxtfield.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"PhoneNumber")
     attributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:233.0f/255.0f green:236.0f/255.0f blue:239.0f/255.0f alpha:1]}];
    self.registerSubmitBtn.layer.cornerRadius = self.submitBtn.frame.size.height/2;
    self.registerSubmitBtn.clipsToBounds = YES;
    self.registerSubmitBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    self.registerSubmitBtn.layer.borderWidth = 2;
    
    
    
    
    self.registerView.hidden=YES;
    self.loginView.hidden = NO;
    [self.loginBtn setBackgroundColor:[UIColor colorWithRed:50/255.0f green:50/255.0f blue:50/255.0f alpha:1]];
    [self.registerBtn setBackgroundColor:[UIColor colorWithRed:60/255.0f green:60/255.0f blue:60/255.0f alpha:1]];
    
    if([_from isEqual:@"signup"]){
        self.loginView.hidden=YES;
        self.registerView.hidden = NO;
        [self.registerBtn setBackgroundColor:[UIColor colorWithRed:50/255.0f green:50/255.0f blue:50/255.0f alpha:1]];
        [self.loginBtn setBackgroundColor:[UIColor colorWithRed:60/255.0f green:60/255.0f blue:60/255.0f alpha:1]];
    }else{
        self.registerView.hidden=YES;
        self.loginView.hidden = NO;
        [self.loginBtn setBackgroundColor:[UIColor colorWithRed:50/255.0f green:50/255.0f blue:50/255.0f alpha:1]];
        [self.registerBtn setBackgroundColor:[UIColor colorWithRed:60/255.0f green:60/255.0f blue:60/255.0f alpha:1]];
    }
}
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
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

- (IBAction)loginBtnAction:(id)sender {
    self.registerView.hidden=YES;
    self.loginView.hidden = NO;
//    [self.loginBtn setBackgroundColor:[UIColor colorWithRed:27/255.0f green:27/255.0f blue:27/255.0f alpha:1]];
//    [self.registerBtn setBackgroundColor:[UIColor blackColor]];
    [self.loginBtn setBackgroundColor:[UIColor colorWithRed:50/255.0f green:50/255.0f blue:50/255.0f alpha:1]];
    [self.registerBtn setBackgroundColor:[UIColor colorWithRed:60/255.0f green:60/255.0f blue:60/255.0f alpha:1]];
}

- (IBAction)registerBtnAction:(id)sender {
    self.loginView.hidden=YES;
    self.registerView.hidden = NO;
//    [self.registerBtn setBackgroundColor:[UIColor colorWithRed:27/255.0f green:27/255.0f blue:27/255.0f alpha:1]];
//    [self.loginBtn setBackgroundColor:[UIColor blackColor]];
    [self.registerBtn setBackgroundColor:[UIColor colorWithRed:50/255.0f green:50/255.0f blue:50/255.0f alpha:1]];
    [self.loginBtn setBackgroundColor:[UIColor colorWithRed:60/255.0f green:60/255.0f blue:60/255.0f alpha:1]];
}
- (IBAction)forgotpasswordBtnAction:(id)sender {
    ForgetPasswordViewController *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"ForgetPasswordViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)loginSubmitBtnAction:(id)sender {
    if(_emailTxtField.text.length == 0){
        [self showErrorAlertWithMessage:Localized(@"Please Enter Email")];
    }else if(_passwordTxtField.text.length == 0){
        [self showErrorAlertWithMessage:Localized(@"Please Enter Password")];
    }
    else{
        [self makePostCallForPage:LOGIN withParams:@{@"email":_emailTxtField.text,@"password":_passwordTxtField.text} withRequestCode:100];
    }
}
- (IBAction)registerSubmitBtnAction:(id)sender {
    if(_firstNameTxtfield.text.length == 0){
        [self showErrorAlertWithMessage:Localized(@"Please Enter FirstName")];
    }else if(_lastNameTxtfield.text.length == 0){
        [self showErrorAlertWithMessage:Localized(@"Please Enter LastName")];
    }
    else if(_registerEmailAddressTxtfield.text.length == 0){
        [self showErrorAlertWithMessage:Localized(@"Please Enter EmailAddress")];
    }
    else if(_registerPasswordTxtField.text.length == 0){
        [self showErrorAlertWithMessage:Localized(@"Please Enter Password")];
    }else if(_mobileNumberTxtfield.text.length == 0){
        [self showErrorAlertWithMessage:Localized(@"Please Enter MobileNumber")];
    }
    else if ([tcStatus isEqualToString:@"NO"]){
        [self showErrorAlertWithMessage:Localized(@"Accept Terms and Conditions")];
    }
    else{
    [self makePostCallForPage:ADDMEMBER withParams:@{@"fname":_firstNameTxtfield.text,
                                                    @"lname":_lastNameTxtfield.text,
                                                    @"email":_registerEmailAddressTxtfield.text,
                                                    @"password":_registerPasswordTxtField.text,
                                         
                                                    @"phone":_mobileNumberTxtfield.text
                                                    
                                                    } withRequestCode:200];
    }
    
}


-(void)parseResult:(id)result withCode:(int)reqeustCode{
    NSLog(@"%@",result);
    //    NSDictionary* userInfo = @{@"selectedId": @(0)};
    //
    //    NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
    //    [nc postNotificationName:@"MovingNotification" object:self userInfo:userInfo];
//    if(reqeustCode == 101){
//        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//        [defaults setObject:result[0] forKey:@"USER"];
//        if([_from isEqual:@"productdetails"]){
//            self.completionBlock();
//            [self dismissViewControllerAnimated:YES completion:nil];
//        }else{
//            [self.navigationController popViewControllerAnimated:YES];
//        }
//    }
//    else
    
        if (reqeustCode == 100) {
        if ([[result valueForKey:@"status"] isEqualToString:@"Failure"]) {
            NSString *str=[result valueForKey:@"message"];
            [self showErrorAlertWithMessage:Localized(str)];
        } else {
            [Utils loginUserWithMemberId:[result valueForKey:@"member_id"] withType:@"User"];
            // NSString *deviceToken = [[NSUserDefaults standardUserDefaults] valueForKey:@"TOKEN"];
            // [self makePostCallForPage:PAGE_REGISTER_TOKEN withParams:@{@"device_token":deviceToken, @"member_id":[result valueForKey:@"member_id"]} withRequestCode:100];
            //            TabbarViewController *newView = [self.storyboard instantiateViewControllerWithIdentifier:@"TabbarViewController"];
            //            [self.navigationController pushViewController:newView animated:YES];
            //            [APP_DELEGATE reloadUI];
            
            
            //[self makePostCallForPage:MEMBERDETAILS withParams:@{@"member_id":[Utils loggedInUserIdStr]} withRequestCode:101];
            
                        [self.navigationController popViewControllerAnimated:YES];

        }
    } else
        if ([[result valueForKey:@"status"] isEqualToString:@"Failed"]) {
            NSString *str=[result valueForKey:@"message"];
            [self showErrorAlertWithMessage:Localized(str)];
            
        } else {
            [Utils loginUserWithMemberId:[result valueForKey:@"member_id"] withType:@"User"];
            // NSString *deviceToken = [[NSUserDefaults standardUserDefaults] valueForKey:@"TOKEN"];
            // [self makePostCallForPage:PAGE_REGISTER_TOKEN withParams:@{@"device_token":deviceToken, @"member_id":[result valueForKey:@"member_id"]} withRequestCode:100];
            //            TabbarViewController *newView = [self.storyboard instantiateViewControllerWithIdentifier:@"TabbarViewController"];
            //            [self.navigationController pushViewController:newView animated:YES];
            // [APP_DELEGATE reloadUI];
            //[self.navigationController popViewControllerAnimated:YES];
           // [self makePostCallForPage:MEMBERDETAILS withParams:@{@"member_id":[Utils loggedInUserIdStr]} withRequestCode:101];
                        [self.navigationController popViewControllerAnimated:YES];

        }
    
}
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    if(textField==self.mobileNumberTxtfield){
//        NSString *currentString = [textField.text stringByReplacingCharactersInRange:range withString:string];
//        int length = [currentString length];
//        if (length > 8) {
//            return NO;
//        }
//    }
//    return YES;
//    
//}
- (IBAction)tcBtnAction:(id)sender {
    if([tcStatus isEqualToString:@"NO"]){
        tcStatus = @"YES";
        [_tcBtn setImage:[UIImage imageNamed:@"checked.png"] forState:UIControlStateNormal];
    }else{
        tcStatus = @"NO";
        [_tcBtn setImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateNormal];
    }
    
}
- (IBAction)tcShowAction:(id)sender {
    
    //NSDictionary *dict = [[NSUserDefaults standardUserDefaults] valueForKey:@"SETTINGS"];
    NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [currentDefaults objectForKey:@"SETTINGS"];
    NSDictionary *dict = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    NSAttributedString *str = @"";
//    if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
//        str = [dict valueForKey:@"terms_ar"];
//    }else{
//        str = [dict valueForKey:@"terms"];
//
//    }
    if ([[Utils getLanguage] isEqualToString:KEY_LANGUAGE_EN]) {
        NSString *htmlString = [dict valueForKey:@"terms"];
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]
                                                       initWithData: [htmlString dataUsingEncoding:NSUnicodeStringEncoding]
                                                       options: @{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType }
                                                       documentAttributes: nil
                                                       error: nil
                                                       ];
        str = attributedString;
        
    } else {
        NSString *htmlString = [dict valueForKey:@"terms_ar"];
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]
                                                       initWithData: [htmlString dataUsingEncoding:NSUnicodeStringEncoding]
                                                       options: @{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType }
                                                       documentAttributes: nil
                                                       error: nil
                                                       ];
        str = attributedString;

        
    }
    ZHPopupView *popupView = [ZHPopupView popupNomralAlertViewInView:nil backgroundStyle:ZHPopupViewBackgroundType_SimpleOpacity title:Localized(@"Terms & Conditions") content:str buttonTitles:@[Localized(@"Cancel"), Localized(@"Confirm")] confirmBtnTextColor:nil otherBtnTextColor:nil buttonPressedBlock:^(NSInteger btnIdx) {
        if(btnIdx == 1){
            tcStatus = @"YES";
            [_tcBtn setImage:[UIImage imageNamed:@"checked.png"] forState:UIControlStateNormal];
        }
        
    }];
     [popupView present];
    
   
}
@end
