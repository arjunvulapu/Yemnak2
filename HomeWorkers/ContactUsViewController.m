//
//  ContactUsViewController.m
//  Minwain
//
//  Created by Amit Kulkarni on 17/05/16.
//  Copyright © 2016 Amit Kulkarni. All rights reserved.
//

#import "ContactUsViewController.h"
#import "SZTextView.h"
#import <JVFloatLabeledTextField/JVFloatLabeledTextView.h>
#import <MessageUI/MessageUI.h>
@interface ContactUsViewController () <UITextFieldDelegate,MFMailComposeViewControllerDelegate>{
    NSDictionary *Settings;
}
@property (nonatomic, weak) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UITextField *editName;
@property (weak, nonatomic) IBOutlet UITextField *editEmail;
@property (weak, nonatomic) IBOutlet UITextField *editNumber;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextView *editMessage;
@property (weak, nonatomic) IBOutlet UIButton *buttonSend;
@property (weak, nonatomic) IBOutlet UILabel *nameLbl;
@property (weak, nonatomic) IBOutlet UILabel *emailLbl;
@property (weak, nonatomic) IBOutlet UILabel *mobileLbl;
@property (weak, nonatomic) IBOutlet UILabel *messageLbl;

@property (weak, nonatomic) IBOutlet UIImageView *tickName;
@property (weak, nonatomic) IBOutlet UIImageView *tickEmail;
@property (weak, nonatomic) IBOutlet UIImageView *tickNo;

@end



@implementation ContactUsViewController

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (textField == self.editName) {
        if ([textField.text length] > 0) {
            self.tickName.hidden = NO;
        } else {
            self.tickName.hidden = YES;
        }
    } else if (textField == self.editEmail) {
        if ([textField.text length] > 0) {
            self.tickEmail.hidden = NO;
        } else {
            self.tickEmail.hidden = YES;
        }
    } else if (textField == self.editNumber) {
        if ([textField.text length] > 0) {
            self.tickNo.hidden = NO;
        } else {
            self.tickNo.hidden = YES;
        }
    }
}

- (void)viewWillAppear:(BOOL)animated {
    self.webView.backgroundColor = [UIColor clearColor];
//    [self.navigationController.navigationBar setTitleTextAttributes:
//     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
        UIButton *buttonUser = [UIButton buttonWithType:UIButtonTypeCustom];
    if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
        [buttonUser setImage:[UIImage imageNamed:@"right-arrow"] forState:UIControlStateNormal];
        
    }else{
        [buttonUser setImage:[UIImage imageNamed:@"left-arrow"] forState:UIControlStateNormal];
    }
        [buttonUser addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        // [viewButtons addSubview:buttonUser];
    
        buttonUser.frame = CGRectMake(0, 0, 30, 30);
        //buttonUser.titleLabel.font = [UIFont systemFontOfSize:10.0];
        UIBarButtonItem *customBarRightBtn = [[UIBarButtonItem alloc] initWithCustomView:buttonUser];
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        [negativeSpacer setWidth:0];
    
//        self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer,customBarRightBtn,nil];
    UIView *backButtonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
   if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
    backButtonView.bounds = CGRectOffset(backButtonView.bounds, -10, 0);
     }else{
         backButtonView.bounds = CGRectOffset(backButtonView.bounds, 10, 0);
     }
    [backButtonView addSubview:buttonUser];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backButtonView];
    self.navigationItem.leftBarButtonItem = backButton;
//
    }
    -(void)back
    {
        [self.navigationController popViewControllerAnimated:YES];
    }


- (void)viewDidLoad {
    [super viewDidLoad];
    [self addtolayerTO:self.buttonSend];
    
    NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [currentDefaults objectForKey:@"SETTINGS"];
    Settings = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    //Settings=[[NSUserDefaults standardUserDefaults] valueForKey:@"SETTINGS"];

//    if ([[Utils getLanguage] isEqualToString:KEY_LANGUAGE_EN]) {
//    } else {
//        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu.png"] style:UIBarButtonItemStyleDone target:self action:@selector(showSideMenu)];
//    }
//    [self.editName setBorderStyle:UITextBorderStyleNone];
//    self.editName.layer.cornerRadius = 5.0;
//    self.editName.layer.borderWidth = 2.0;
//    self.editName.layer.borderColor = [UIColor blackColor].CGColor;
//    self.editName.layer.masksToBounds = YES;
//    [self.editEmail setBorderStyle:UITextBorderStyleNone];
//    self.editEmail.layer.cornerRadius = 5.0;
//    self.editEmail.layer.borderWidth = 2.0;
//    self.editEmail.layer.borderColor = [UIColor blackColor].CGColor;
//    self.editEmail.layer.masksToBounds = YES;
//    [self.editNumber setBorderStyle:UITextBorderStyleNone];
//    self.editNumber.layer.cornerRadius = 5.0;
//    self.editNumber.layer.borderWidth = 2.0;
//    self.editNumber.layer.borderColor = [UIColor blackColor].CGColor;
//    self.editNumber.layer.masksToBounds = YES;
//    self.editMessage.layer.cornerRadius = 5.0;
//    self.editMessage.layer.borderWidth = 2.0;
//    self.editMessage.layer.borderColor = [UIColor blackColor].CGColor;
    self.editNumber.delegate=self;
    CALayer *border = [CALayer layer];
    CGFloat borderWidth = 2;
    border.borderColor = [UIColor grayColor].CGColor;
    border.frame = CGRectMake(0, self.editMessage.frame.size.height - borderWidth, self.editMessage.frame.size.width, self.editMessage.frame.size.height);
    border.borderWidth = borderWidth;
   // [self.editMessage.layer addSublayer:border];
    self.editMessage.layer.masksToBounds = YES;
//    [self SetTextFieldBorder:self.editName];
//    [self SetTextFieldBorder:self.editNumber];
//    [self SetTextFieldBorder:self.editEmail];
    
    self.editMessage.layer.masksToBounds = YES;
    self.navigationItem.title =Localized(@"Contact Us");
    self.nameLbl.text =Localized(@"Name");
    self.emailLbl.text = Localized(@"Email");
    self.mobileLbl.text = Localized(@"Phone");
    self.messageLbl.text = Localized(@"Message");
    self.editMessage.text = @"";
    self.editName.text = @"";
    self.editNumber.text = @"";
    self.editEmail.text = @"";
    //self.editMessage.placeholder = @"";
    _editMessage.placeholder = Localized(@"Message");
    _editMessage.placeholderTextColor = [UIColor whiteColor];
    self.editName.placeholder = @"";
    self.editNumber.placeholder = @"";
    self.editEmail.placeholder = @"";
    self.editName.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Name")
     attributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:233.0f/255.0f green:236.0f/255.0f blue:239.0f/255.0f alpha:1]}];
    self.editEmail.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Email")
     attributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:233.0f/255.0f green:236.0f/255.0f blue:239.0f/255.0f alpha:1]}];
    self.editNumber.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Mobile Number")
     attributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:233.0f/255.0f green:236.0f/255.0f blue:239.0f/255.0f alpha:1]}];

    
    
   // self.editName.placeholder =Localized(@"Enter Name");
   // self.editEmail.placeholder = Localized(@"Enter Email");
    // self.editNumber.placeholder = Localized(@"Enter Mobile Number");
    //self.editMessage.placeholder =Localized(@"");
    [self.buttonSend setTitle:Localized(@"Send") forState:UIControlStateNormal];
    self.buttonSend.layer.cornerRadius=self.buttonSend.frame.size.height/2;
    self.buttonSend.clipsToBounds=YES;
    
    [self.calBtn setTitle:Localized(@"Call") forState:UIControlStateNormal];
    self.calBtn.layer.cornerRadius=self.calBtn.frame.size.height/2;
    self.calBtn.clipsToBounds=YES;
    
    
    [self.emailBtn setTitle:Localized(@"Email") forState:UIControlStateNormal];
    self.emailBtn.layer.cornerRadius=self.emailBtn.frame.size.height/2;
    self.emailBtn.clipsToBounds=YES;
    
    
    [self.instagramBtn setTitle:Localized(@"Instagram") forState:UIControlStateNormal];
    self.instagramBtn.layer.cornerRadius=self.instagramBtn.frame.size.height/2;
    self.instagramBtn.clipsToBounds=YES;
}
-(void)SetTextFieldBorder :(UITextField *)textField{
    
    CALayer *border = [CALayer layer];
    CGFloat borderWidth = 2;
    border.borderColor = [UIColor grayColor].CGColor;
    border.frame = CGRectMake(0, textField.frame.size.height - borderWidth, textField.frame.size.width, textField.frame.size.height);
    border.borderWidth = borderWidth;
    [textField.layer addSublayer:border];
    textField.layer.masksToBounds = YES;
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    textField.leftView = paddingView;
    textField.leftViewMode = UITextFieldViewModeAlways;
    
}
//-(void)addPadding:(UITextField *)txt{
//    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
//    self.chooseYourDateTxtField.leftView = paddingView;
//    self.chooseYourDateTxtField.leftViewMode = UITextFieldViewModeAlways;
//}
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    if(textField==self.editNumber){
//        NSString *currentString = [textField.text stringByReplacingCharactersInRange:range withString:string];
//        int length = [currentString length];
//        if (length > 8) {
//            return NO;
//        }
//    }
//    return YES;
//    
//}
- (IBAction)sendMessage:(id)sender {
    if ([self.editName.text length] == 0) {
        [self showErrorAlertWithMessage:@"Please Enter Name"];
    } else if ([self.editEmail.text length] == 0) {
        [self showErrorAlertWithMessage:@"Please Enter Email"];
    }else if (![self validateEmailWithString:self.editEmail.text]){
        [self showErrorAlertWithMessage:@"Please Enter ValidEmail"];
    }
    else if ([self.editNumber.text length] == 0) {
        [self showErrorAlertWithMessage:@"Please Enter PhoneNumber"];
    } else if ([self.editMessage.text length] == 0) {
        [self showErrorAlertWithMessage:@"Please Enter Message"];
    } else {
        
        [self.editName resignFirstResponder];
        [self.editEmail resignFirstResponder];
        [self.editNumber resignFirstResponder];
        [self.editMessage resignFirstResponder];
        
        [self makePostCallForPage:CONTACTUS
                       withParams:@{
                                        @"name":self.editName.text,
                                        @"email":self.editEmail.text,
                                        @"phone":self.editNumber.text,
                                        @"message":self.editMessage.text
                                   }
                  withRequestCode:200];
        
    }
}

- (void)parseResult:(id)result withCode:(int)reqeustCode {
    if (requestCode == 200) {
        //self.navigationController.viewControllers = @[[APP_DELEGATE homeVC]];
        [self.navigationController popViewControllerAnimated:YES];

        [self showSuccessMessage:@"Request Sent Sucessfully"];
        self.editMessage.text = @"";
        self.editName.text = @"";
        self.editNumber.text = @"";
        self.editEmail.text = @"";

    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)emailBtnAction:(id)sender {
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *composeViewController = [[MFMailComposeViewController alloc] initWithNibName:nil bundle:nil];
        [composeViewController setMailComposeDelegate:self];
        NSString *email = [Settings  valueForKey:@"email"];
        
        [composeViewController setToRecipients:@[email]];
        [composeViewController setSubject:@"example subject"];
        [self presentViewController:composeViewController animated:YES completion:nil];
    }
}

- (IBAction)calBtnAction:(id)sender {
    
    NSString *phNo = [Settings  valueForKey:@"phone"];
    NSURL *phoneUrl = [NSURL URLWithString:[NSString  stringWithFormat:@"telprompt:%@",phNo]];
    
    if ([[UIApplication sharedApplication] canOpenURL:phoneUrl]) {
        [[UIApplication sharedApplication] openURL:phoneUrl];
    } else
    {
        UIAlertView *calert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Call facility is not available!!!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [calert show];
    }
}
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    //Add an alert in case of failure
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)instagramBtnAction:(id)sender {
    NSString *insta = [Settings  valueForKey:@"instagram"];
    NSURL *instaurl = [NSURL URLWithString:[NSString  stringWithFormat:insta]];
    
    if ([[UIApplication sharedApplication] canOpenURL:instaurl]) {
        [[UIApplication sharedApplication] openURL:instaurl];
    } else
    {
        UIAlertView *calert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Not available!!!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [calert show];
    }
}


@end
