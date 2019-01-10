//
//  EmployeeRequestViewController.h
//  YEMNAK
//
//  Created by apple on 10/07/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JVFloatLabeledTextField/JVFloatLabeledTextField.h>
#import <JVFloatLabeledTextField/JVFloatLabeledTextView.h>

#import "Common.h"
#import "BaseViewController.h"
@interface EmployeeRequestViewController : BaseViewController

@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *companyNameTxtfield;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *phoneNumberTxtField;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *addressTxtField;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *contactPersonTxtField;
@property (weak, nonatomic) IBOutlet UIButton *addyourRequirementBtn;
@property (weak, nonatomic) IBOutlet UILabel *noteLbl;
@property (weak, nonatomic) IBOutlet UILabel *otherTCLbl;
- (IBAction)AddyourReqiurementAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *entercomapanyDetails;


@property (weak, nonatomic) IBOutlet UILabel *manpowerLbl;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *selectCategoriesTxtfield;
- (IBAction)categoriesAction:(id)sender;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *numberOfWorkersTxtfield;
- (IBAction)numberofWorkersAction:(id)sender;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *salaryTxtfield;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *otherBenfits;
@property (weak, nonatomic) IBOutlet UITextView *disclimarTxtView;
@property (weak, nonatomic) IBOutlet UIButton *uploadDocBtn;
- (IBAction)uploadDocBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *categoryBtn;
@property (weak, nonatomic) IBOutlet UIButton *numberOfWorkersBtn;
@property (weak, nonatomic) IBOutlet UILabel *genderLbl;
@property (weak, nonatomic) IBOutlet UILabel *maleLbl;
@property (weak, nonatomic) IBOutlet UILabel *femaleLbl;
@property (weak, nonatomic) IBOutlet UIButton *femaleBtn;
@property (weak, nonatomic) IBOutlet UIButton *maleBtn;
- (IBAction)femaleAction:(id)sender;
- (IBAction)maleAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *localityLbl;
@property (weak, nonatomic) IBOutlet UILabel *localLbl;
@property (weak, nonatomic) IBOutlet UILabel *overseasLbl;
@property (weak, nonatomic) IBOutlet UIButton *localBtn;
@property (weak, nonatomic) IBOutlet UIButton *overseasBtn;
- (IBAction)locationBtnAction:(id)sender;
- (IBAction)overseasBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *agetxtfiled;
- (IBAction)ageBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *subCategoryTxtField;
- (IBAction)selectSubcategoryAction:(id)sender;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *otherSubcategoryTxtField;
@property (weak, nonatomic) IBOutlet UILabel *otherSubcatLbl;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *numberWorkersTop;


@property (weak, nonatomic) IBOutlet UILabel *reqiureDocumentsLbl;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *tradeLicensetxtField;
- (IBAction)tradeLicenseAction:(id)sender;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *authourizedSignatoryTxtField;
- (IBAction)authourizedSignatoryAction:(id)sender;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *civilIDCopyTxtField;
- (IBAction)civilIDAction:(id)sender;
- (IBAction)visaAction:(id)sender;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *emailAddresstxtFiedl;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *contactNumberTxtField;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *companyAddressTxtField;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *visaQuota;
@property (weak, nonatomic) IBOutlet UITextView *disclaimarTxtView;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;
- (IBAction)submitBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *licenseImage;
@property (weak, nonatomic) IBOutlet UIButton *licenceBtn;
@property (weak, nonatomic) IBOutlet UIImageView *authorisedImage;
@property (weak, nonatomic) IBOutlet UIButton *authorisedBtn;
@property (weak, nonatomic) IBOutlet UIImageView *civilImage;
@property (weak, nonatomic) IBOutlet UIButton *civilBtn;
@property (weak, nonatomic) IBOutlet UIButton *licenseMainBtn;
@property (weak, nonatomic) IBOutlet UIButton *authorisedMainBtn;
@property (weak, nonatomic) IBOutlet UIButton *civilMainBtn;
@property (weak, nonatomic) IBOutlet UIImageView *visaImage;
@property (weak, nonatomic) IBOutlet UIButton *visaBtn;
@property (weak, nonatomic) IBOutlet UIButton *visaMainBtn;

@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view3;


// to shoe details
@property (strong, nonatomic)  NSString *from;
@property (strong, nonatomic)  NSMutableDictionary *details;
@property (weak, nonatomic) IBOutlet UILabel *serviceChargeLbl;
@property (weak, nonatomic) IBOutlet UILabel *servicePriceLbl;
@property (weak, nonatomic) IBOutlet UILabel *bothGenderLbl;
@property (weak, nonatomic) IBOutlet UIButton *bothGenderBtn;
- (IBAction)bothGenderBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextView *addCommentTxtView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
