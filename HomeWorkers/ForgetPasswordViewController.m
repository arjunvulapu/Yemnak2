//
//  ForgetPasswordViewController.m
//  Minwain
//
//  Created by Amit Kulkarni on 28/05/16.
//  Copyright © 2016 Amit Kulkarni. All rights reserved.
//

#import "ForgetPasswordViewController.h"

@interface ForgetPasswordViewController ()
{
    UIButton *buttonUser;
}
@property (weak, nonatomic) IBOutlet UIImageView *tick;
@property (weak, nonatomic) IBOutlet UITextField *editCode;
@property (weak, nonatomic) IBOutlet UIButton *buttonSubmit;
@property (weak, nonatomic) IBOutlet UILabel *emailLbl;

@end

@implementation ForgetPasswordViewController


- (void)textFieldDidEndEditing:(UITextField *)textField {
    if ([textField.text length] > 0) {
        self.tick.hidden = NO;
    } else {
        self.tick.hidden = YES;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
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
//    self.tick.hidden = YES;
    self.emailLbl.text=Localized(@"Email Address");
//    self.editCode.placeholder = Localized(@"");
//    self.buttonSubmit.layer.cornerRadius = 10;
//    self.buttonSubmit.clipsToBounds = YES;
    [self.buttonSubmit setTitle:Localized(@"Submit") forState:UIControlStateNormal];
    self.navigationItem.title = Localized(@"Forgot Password");
    self.editCode.text = @"";
    self.editCode.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"")
     attributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:233.0f/255.0f green:236.0f/255.0f blue:239.0f/255.0f alpha:1]}];
    self.buttonSubmit.layer.cornerRadius = self.buttonSubmit.frame.size.height/2;
    self.buttonSubmit.clipsToBounds = YES;
    self.buttonSubmit.layer.borderColor = [UIColor whiteColor].CGColor;
    self.buttonSubmit.layer.borderWidth = 2;
    self.buttonSubmit.backgroundColor = BUTTON_BG_COLOR;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)submit:(id)sender {
    if ([self.editCode.text length] == 0) {
        [self showErrorAlertWithMessage:Localized(@"empty_code")];
    } else {
        [self makePostCallForPage:PAGE_FORGOT_PASSWORD withParams:@{@"email":self.editCode.text} withRequestCode:10];
    }
}
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)parseResult:(id)result withCode:(int)reqeustCode {
    if ([[result valueForKey:@"status"] isEqualToString:@"Failed"]) {
        [self showErrorAlertWithMessage:[result valueForKey:@"message"]];
    } else {
        UIAlertController *controller = [UIAlertController alertControllerWithTitle:nil message:Localized(@"forgot_password_sent") preferredStyle:UIAlertControllerStyleAlert];
        [controller addAction:[UIAlertAction actionWithTitle:Localized(@"ok") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            [self.navigationController popViewControllerAnimated:YES];
            
        }]];
        [self presentViewController:controller animated:YES completion:nil];
    }
}

@end
