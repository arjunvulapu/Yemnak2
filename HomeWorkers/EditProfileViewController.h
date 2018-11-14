//
//  EditProfileViewController.h
//  HomeWorkers
//
//  Created by apple on 04/05/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface EditProfileViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UIView *registerView;
@property (weak, nonatomic) IBOutlet UILabel *firstNameLbl;
@property (weak, nonatomic) IBOutlet UILabel *lastNameLbl;
@property (weak, nonatomic) IBOutlet UILabel *registerEmailAddressLbl;
@property (weak, nonatomic) IBOutlet UILabel *mobileNumber;
@property (weak, nonatomic) IBOutlet UIButton *registerSubmitBtn;
@property (weak, nonatomic) IBOutlet UITextField *firstNameTxtfield;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTxtfield;
@property (weak, nonatomic) IBOutlet UITextField *registerEmailAddressTxtfield;
@property (weak, nonatomic) IBOutlet UITextField *mobileNumberTxtfield;
- (IBAction)registerSubmitBtnAction:(id)sender;
@end
