//
//  PartimeWorkersViewController.h
//  HomeWorkers
//
//  Created by apple on 16/04/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import <JVFloatLabeledTextField/JVFloatLabeledTextView.h>
@interface PartimeWorkersViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UITextField *enterAddressTxtField;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextView *specialReqTxtview;
@property (weak, nonatomic) IBOutlet UILabel *areaL;
@property (weak, nonatomic) IBOutlet UITextField *selectAreaTxtField;
- (IBAction)selectAreaBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *dayL;
@property (weak, nonatomic) IBOutlet UITextField *selectDayTxtField;
- (IBAction)selectDayBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *selectQuantityOfmembers;
- (IBAction)selectQuantityAction:(id)sender;
- (IBAction)morningShiftAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *fullShiftLbl;
@property (weak, nonatomic) IBOutlet UIButton *fullShiftBtn;
- (IBAction)fullShiftBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *fullShiftTimeLbl;
- (IBAction)eveningShiftAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *morningShiftL;
@property (weak, nonatomic) IBOutlet UILabel *evenignShiftL;
@property (weak, nonatomic) IBOutlet UILabel *morningShiftTimeL;
@property (weak, nonatomic) IBOutlet UILabel *eveningShiftTimeL;
@property (weak, nonatomic) IBOutlet UIButton *morningShiftBtn;
@property (weak, nonatomic) IBOutlet UIButton *evngshiftBtn;
@property (weak, nonatomic) IBOutlet UITextField *blockTxtField;
@property (weak, nonatomic) IBOutlet UITextField *streetTxtField;
@property (weak, nonatomic) IBOutlet UITextField *juddaTxtField;
@property (weak, nonatomic) IBOutlet UITextField *houseTxtFiled;
@property (weak, nonatomic) IBOutlet UILabel *blockL;
@property (weak, nonatomic) IBOutlet UILabel *streetLbl;
@property (weak, nonatomic) IBOutlet UILabel *juddaLbl;
@property (weak, nonatomic) IBOutlet UILabel *houseLbl;
@property (weak, nonatomic) IBOutlet UILabel *specialRequestL;
@property (weak, nonatomic) IBOutlet UIButton *bookandPayBtn;
- (IBAction)bookandPayBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *qunatityLbl;
@property (weak, nonatomic) IBOutlet UILabel *chooseLbl;

@property (weak, nonatomic) IBOutlet UILabel *serviceLbl;
@property (weak, nonatomic) IBOutlet UITextField *serviceTxtField;
- (IBAction)serviceBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *genderLbl;
@property (weak, nonatomic) IBOutlet UILabel *maleLbl;
@property (weak, nonatomic) IBOutlet UILabel *femaleLbl;
@property (weak, nonatomic) IBOutlet UIButton *mailBtn;
@property (weak, nonatomic) IBOutlet UIButton *femalebtn;
- (IBAction)maleBtnAction:(id)sender;
- (IBAction)femaleBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *serviceCharges;
@property (weak, nonatomic) IBOutlet UILabel *AmountLbl;
@property (weak, nonatomic) IBOutlet UIButton *serviceBtn;
@property (weak, nonatomic) IBOutlet UIButton *selectAreaBtn;
@property (weak, nonatomic) IBOutlet UIButton *selectDateBtn;
@property (weak, nonatomic) IBOutlet UIButton *selectQuantityBtn;

// to shoe details
@property (strong, nonatomic)  NSString *from;
@property (strong, nonatomic)  NSMutableDictionary *details;

@end
