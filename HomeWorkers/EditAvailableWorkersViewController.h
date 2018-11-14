//
//  EditAvailableWorkersViewController.h
//  HomeWorkers
//
//  Created by apple on 03/05/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import <JVFloatLabeledTextField/JVFloatLabeledTextField.h>
@interface EditAvailableWorkersViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UILabel *nameL;
@property (weak, nonatomic) IBOutlet UILabel *ageL;
@property (weak, nonatomic) IBOutlet UILabel *nationalityL;
@property (weak, nonatomic) IBOutlet UILabel *reigionL;
@property (weak, nonatomic) IBOutlet UILabel *salaryL;
@property (weak, nonatomic) IBOutlet UILabel *amountL;
@property (weak, nonatomic) IBOutlet UILabel *experienceL;
@property (weak, nonatomic) IBOutlet UIButton *SubmitBtn;
- (IBAction)submitBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *nameTxtField;
@property (weak, nonatomic) IBOutlet UITextField *ageNameTxtField;
@property (weak, nonatomic) IBOutlet UITextField *nationalityTxtField;
@property (weak, nonatomic) IBOutlet UITextField *religionTxtField;
@property (weak, nonatomic) IBOutlet UITextField *salaryTxtField;
@property (weak, nonatomic) IBOutlet UITextField *amountTxtField;
@property (weak, nonatomic) IBOutlet UITextField *experienceTxtfied;
- (IBAction)nationalityBtnAction:(id)sender;
- (IBAction)religionBtnAction:(id)sender;
- (IBAction)ageBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *userImage;
- (IBAction)selectUserImage:(id)sender;
@property (strong, nonatomic)  UIImagePickerController *userPicker;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *phoneNumberTxtField;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *emailTxtField;
@property (weak, nonatomic) IBOutlet UILabel *serviceCharges;
@property (weak, nonatomic) IBOutlet UILabel *AmountLbl;
@property (weak, nonatomic) IBOutlet UILabel *genderLbl;
@property (weak, nonatomic) IBOutlet UILabel *maleLbl;
@property (weak, nonatomic) IBOutlet UILabel *femaleLbl;
@property (weak, nonatomic) IBOutlet UIButton *maleBtn;
@property (weak, nonatomic) IBOutlet UIButton *femalebtn;
- (IBAction)maleBtnAction:(id)sender;
- (IBAction)femaleBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *userimageBtn;

@property (weak, nonatomic) IBOutlet UIButton *religionBtn;
@property (weak, nonatomic) IBOutlet UIButton *nationalityBtn;
@property (weak, nonatomic) IBOutlet UIButton *AgeBtn;
// to shoe details
@property (strong, nonatomic)  NSString *from;
@property (strong, nonatomic)  NSMutableDictionary *details;
@end
