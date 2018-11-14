//
//  LoginViewController.h
//  HomeWorkers
//
//  Created by apple on 25/04/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"
#import "BaseViewController.h"
#import "Utils.h"
@interface LoginViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (weak, nonatomic) IBOutlet UILabel *emailLbl;
@property (weak, nonatomic) IBOutlet UILabel *passwordLbl;
@property (weak, nonatomic) IBOutlet UITextField *emailTxtField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTxtField;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;
- (IBAction)loginBtnAction:(id)sender;
- (IBAction)registerBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *forgotpasswordBtn;
- (IBAction)forgotpasswordBtnAction:(id)sender;
- (IBAction)loginSubmitBtnAction:(id)sender;
@property(nonatomic,strong)NSString *from;
@property (weak, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet UIView *registerView;
@property (weak, nonatomic) IBOutlet UILabel *firstNameLbl;
@property (weak, nonatomic) IBOutlet UILabel *lastNameLbl;
@property (weak, nonatomic) IBOutlet UILabel *registerEmailAddressLbl;
@property (weak, nonatomic) IBOutlet UILabel *registerPasswordLbl;
@property (weak, nonatomic) IBOutlet UILabel *mobileNumber;
@property (weak, nonatomic) IBOutlet UIButton *registerSubmitBtn;
@property (weak, nonatomic) IBOutlet UITextField *firstNameTxtfield;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTxtfield;
@property (weak, nonatomic) IBOutlet UITextField *registerEmailAddressTxtfield;
@property (weak, nonatomic) IBOutlet UITextField *registerPasswordTxtField;
@property (weak, nonatomic) IBOutlet UITextField *mobileNumberTxtfield;
- (IBAction)registerSubmitBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *tcBtn;
- (IBAction)tcBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *tCLbl;

@end
