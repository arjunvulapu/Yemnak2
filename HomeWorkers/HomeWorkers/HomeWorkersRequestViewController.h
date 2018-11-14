//
//  HomeWorkersRequestViewController.h
//  YEMNAK
//
//  Created by apple on 04/07/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface HomeWorkersRequestViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UILabel *genderlbl;
@property (weak, nonatomic) IBOutlet UILabel *maleLbl;
- (IBAction)mailBtnAction:(id)sender;
- (IBAction)femalebtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *femaleLbl;
@property (weak, nonatomic) IBOutlet UIButton *malebtn;
@property (weak, nonatomic) IBOutlet UIButton *femaleBtn;
@property (weak, nonatomic) IBOutlet UILabel *religionLbl;
- (IBAction)selectReligionAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *religionTxtfield;
@property (weak, nonatomic) IBOutlet UILabel *nationalitylbl;
@property (weak, nonatomic) IBOutlet UIButton *selectNationalityBtn;
- (IBAction)selectnationalityBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *nationlaityTxtField;
@property (weak, nonatomic) IBOutlet UILabel *ageLbl;
@property (weak, nonatomic) IBOutlet UITextField *ageTxtfiled;
@property (weak, nonatomic) IBOutlet UILabel *experiencelbl;
@property (weak, nonatomic) IBOutlet UILabel *yesLbl;
@property (weak, nonatomic) IBOutlet UILabel *noLbl;
@property (weak, nonatomic) IBOutlet UIButton *yesBtn;
@property (weak, nonatomic) IBOutlet UIButton *nobtn;
- (IBAction)yesBtnAction:(id)sender;
- (IBAction)noBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *serviceLbl;
- (IBAction)serviceAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *serviceTxtField;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumebrLbl;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTxtField;
@property (weak, nonatomic) IBOutlet UILabel *amountLbl;
@property (weak, nonatomic) IBOutlet UIButton *bookandpayBtn;
- (IBAction)bookandPayAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *serviceChargesLbl;
@property (weak, nonatomic) IBOutlet UIButton *religionBtn;
@property (weak, nonatomic) IBOutlet UIButton *nationalityBtn;
@property (weak, nonatomic) IBOutlet UIButton *seriveBtn;
@property (weak, nonatomic) IBOutlet UIButton *AgeBtn;


// to shoe details
@property (strong, nonatomic)  NSString *from;

@property (strong, nonatomic)  NSMutableDictionary *details;


@end
