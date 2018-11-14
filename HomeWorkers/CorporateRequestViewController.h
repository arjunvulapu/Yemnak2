//
//  CorporateRequestViewController.h
//  YEMNAK
//
//  Created by apple on 06/07/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "Common.h"
#import <JVFloatLabeledTextField/JVFloatLabeledTextView.h>
#import <JVFloatLabeledTextField/JVFloatLabeledTextField.h>
@interface CorporateRequestViewController : BaseViewController
- (IBAction)segmentAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *personalView;
@property (weak, nonatomic) IBOutlet UIView *currentEmployeeView;
@property (weak, nonatomic) IBOutlet UIView *qualifocationView;
@property (weak, nonatomic) IBOutlet UIView *employementHistoryView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
- (IBAction)previousBtnAction:(id)sender;
- (IBAction)nextBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewHeight;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property (weak, nonatomic) IBOutlet UIButton *previousBtn;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;


// personalView
- (IBAction)selectSubCategoryBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *selectSubcategoryTxtfiled;
@property (weak, nonatomic) IBOutlet UIButton *resumeBtn;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *resumeTxtField;
@property (weak, nonatomic) IBOutlet UIButton *resumeMainBtb;
- (IBAction)resumeBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *resumeImage;
@property (weak, nonatomic) IBOutlet UILabel *personalinformationLbl;
@property (weak, nonatomic) IBOutlet UILabel *firstnamelbl;
@property (weak, nonatomic) IBOutlet UITextField *firstNametxtField;
@property (weak, nonatomic) IBOutlet UILabel *middlenamelbl;
@property (weak, nonatomic) IBOutlet UITextField *middleNametxtField;
@property (weak, nonatomic) IBOutlet UILabel *familynamelbl;
@property (weak, nonatomic) IBOutlet UITextField *familytxtField;
@property (weak, nonatomic) IBOutlet UILabel *dateofBirthLbl;
@property (weak, nonatomic) IBOutlet UITextField *dateOfBirthTxtField;
- (IBAction)dateofBirthAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *placeOfBirthLbl;
@property (weak, nonatomic) IBOutlet UITextField *placeOfBirthTxtField;
@property (weak, nonatomic) IBOutlet UILabel *nationalityLbl;
@property (weak, nonatomic) IBOutlet UITextField *nationlaityTxtField;
- (IBAction)nationalityBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *residencyExpireDateLbl;
@property (weak, nonatomic) IBOutlet UITextField *residencyExpiryDateTxtfield;
- (IBAction)residencyExpiryAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *articleNumberLbl;
@property (weak, nonatomic) IBOutlet UITextField *articalNumberTxtfield;
@property (weak, nonatomic) IBOutlet UILabel *addressLbl;
@property (weak, nonatomic) IBOutlet UITextField *addressTextField;
@property (weak, nonatomic) IBOutlet UILabel *telephoneLbl;
@property (weak, nonatomic) IBOutlet UITextField *telephoneTxtField;
@property (weak, nonatomic) IBOutlet UILabel *mobileLbl;
@property (weak, nonatomic) IBOutlet UITextField *mobileTxtField;
@property (weak, nonatomic) IBOutlet UILabel *emailLbl;

@property (weak, nonatomic) IBOutlet UITextField *emailTxtField;
@property (weak, nonatomic) IBOutlet UILabel *postAppliedForLbl;
@property (weak, nonatomic) IBOutlet UITextField *postAppliedForTxtField;
- (IBAction)postappliedAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *maritalStatusLbl;
@property (weak, nonatomic) IBOutlet UITextField *maritalStatusTxtField;
- (IBAction)maritalStatusAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *doyouworkNowLbl;
@property (weak, nonatomic) IBOutlet UILabel *whenCanyouStartLbl;
@property (weak, nonatomic) IBOutlet UITextField *whenCanyouStartTxtField;
@property (weak, nonatomic) IBOutlet UILabel *yesLbl;
@property (weak, nonatomic) IBOutlet UILabel *noLbl;
@property (weak, nonatomic) IBOutlet UIButton *doyouworknowYesBtn;
@property (weak, nonatomic) IBOutlet UIButton *doyouworknowNoBtn;
- (IBAction)doyouworknowYesAction:(id)sender;

- (IBAction)doyouworknowNoAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *expectedSalaryLbl;
@property (weak, nonatomic) IBOutlet UITextField *expectedSalaryTxtField;
@property (weak, nonatomic) IBOutlet UIButton *whenCanyouStartBtn;
- (IBAction)whencanyouStartBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *genderLbl;
@property (weak, nonatomic) IBOutlet UILabel *maleLbl;
@property (weak, nonatomic) IBOutlet UILabel *femaleLbl;
@property (weak, nonatomic) IBOutlet UIButton *femaleBtn;
@property (weak, nonatomic) IBOutlet UIButton *maleBtn;
- (IBAction)femaleAction:(id)sender;
- (IBAction)maleAction:(id)sender;

// 2nd view
@property (weak, nonatomic) IBOutlet UILabel *currentEmployeeLbl;
@property (weak, nonatomic) IBOutlet UILabel *areyouEmployeedLbl;

@property (weak, nonatomic) IBOutlet UILabel *areyouemployeedYesLbl;
@property (weak, nonatomic) IBOutlet UILabel *areyouEmployeedNoLbl;
@property (weak, nonatomic) IBOutlet UIButton *areyouEmployeedYesBtn;
@property (weak, nonatomic) IBOutlet UIButton *areyouEmployeedNoBtn;
- (IBAction)areyouEmployeedYesAction:(id)sender;
- (IBAction)areyouEmployeedNoAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *companyNameLbl;
@property (weak, nonatomic) IBOutlet UITextField *companyNameTxtField;
@property (weak, nonatomic) IBOutlet UILabel *mayweContactyourCurrentEmployerLbl;
@property (weak, nonatomic) IBOutlet UILabel *mayweContactyourCurrentEmployerYesLbl;
@property (weak, nonatomic) IBOutlet UILabel *mayweContactyourCurrentEmployerNoLbl;
@property (weak, nonatomic) IBOutlet UIButton *mayweContactyourCurrentEmployerYesBtn;
@property (weak, nonatomic) IBOutlet UIButton *mayweContactyourCurrentEmployerNoBtn;
- (IBAction)mayweContactyourCurrentEmployerYesBtnAction:(id)sender;
- (IBAction)mayweContactyourCurrentEmployerNoBtnAction:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *refence1Lbl;
@property (weak, nonatomic) IBOutlet UILabel *fullName1Lbl;
@property (weak, nonatomic) IBOutlet UITextField *fullname1Txtfield;
@property (weak, nonatomic) IBOutlet UILabel *occupation1Lbl;
@property (weak, nonatomic) IBOutlet UITextField *occupation1txtfield;
@property (weak, nonatomic) IBOutlet UILabel *company1Lbl;
@property (weak, nonatomic) IBOutlet UITextField *company1Txtfield;
@property (weak, nonatomic) IBOutlet UILabel *contactDetails1Lbl;
@property (weak, nonatomic) IBOutlet UITextField *contactDetails1Txtfield;

@property (weak, nonatomic) IBOutlet UILabel *refence2Lbl;
@property (weak, nonatomic) IBOutlet UILabel *fullName2Lbl;
@property (weak, nonatomic) IBOutlet UITextField *fullname2Txtfield;
@property (weak, nonatomic) IBOutlet UILabel *occupation2Lbl;
@property (weak, nonatomic) IBOutlet UITextField *occupation2txtfield;
@property (weak, nonatomic) IBOutlet UILabel *company2Lbl;
@property (weak, nonatomic) IBOutlet UITextField *company2Txtfield;
@property (weak, nonatomic) IBOutlet UILabel *contactDetails2Lbl;
@property (weak, nonatomic) IBOutlet UITextField *contactDetails2Txtfield;


@property (weak, nonatomic) IBOutlet UILabel *refence3Lbl;
@property (weak, nonatomic) IBOutlet UILabel *fullName3Lbl;
@property (weak, nonatomic) IBOutlet UITextField *fullname3Txtfield;
@property (weak, nonatomic) IBOutlet UILabel *occupation3Lbl;
@property (weak, nonatomic) IBOutlet UITextField *occupation3txtfield;
@property (weak, nonatomic) IBOutlet UILabel *company3Lbl;
@property (weak, nonatomic) IBOutlet UITextField *company3Txtfield;
@property (weak, nonatomic) IBOutlet UILabel *contactDetails3Lbl;
@property (weak, nonatomic) IBOutlet UITextField *contactDetails3Txtfield;

@property (weak, nonatomic) IBOutlet UILabel *beforeappliedLbl;
@property (weak, nonatomic) IBOutlet UILabel *beforeappliedYesLbl;
@property (weak, nonatomic) IBOutlet UILabel *beforeappliedNoLbl;
@property (weak, nonatomic) IBOutlet UIButton *beforeappliedYesBtn;
@property (weak, nonatomic) IBOutlet UIButton *beforeappliedNoBtn;
- (IBAction)beforeappliedYesBtnAction:(id)sender;
- (IBAction)beforeappliedNoBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *whenLbl;
@property (weak, nonatomic) IBOutlet UITextField *whenTxtfiled;
- (IBAction)whenAction:(id)sender;


@property (weak, nonatomic) IBOutlet UILabel *relitivesinCompanyLbl;
@property (weak, nonatomic) IBOutlet UILabel *relitivesinCompanyYesLbl;
@property (weak, nonatomic) IBOutlet UILabel *relitivesinCompanyNoLbl;
@property (weak, nonatomic) IBOutlet UIButton *relitivesinCompanyYesBtn;
@property (weak, nonatomic) IBOutlet UIButton *relitivesinCompanyNoBtn;
- (IBAction)relitivesinCompanyYesBtnAction:(id)sender;
- (IBAction)relitivesinCompanyNoBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *nameandRelationShip;
@property (weak, nonatomic) IBOutlet UITextField *nameandRelationshipTxtfield;


// 3rd View
@property (weak, nonatomic) IBOutlet UILabel *qualificationLbl;
@property (weak, nonatomic) IBOutlet UILabel *educationLbl;
@property (weak, nonatomic) IBOutlet UILabel *elementrylbl;
@property (weak, nonatomic) IBOutlet UILabel *nameoftheSchoolLbl;
@property (weak, nonatomic) IBOutlet UITextField *nameoftheSchoolTxtField;
@property (weak, nonatomic) IBOutlet UILabel *yearsAttendLbl;
@property (weak, nonatomic) IBOutlet UITextField *yearsAttendedTxtField;
@property (weak, nonatomic) IBOutlet UILabel *dateGraduatedLbl;
@property (weak, nonatomic) IBOutlet UITextField *dateGraduatedTxtField;
@property (weak, nonatomic) IBOutlet UILabel *certificateLbl;
@property (weak, nonatomic) IBOutlet UITextField *cartificateTxtField;
@property (weak, nonatomic) IBOutlet UILabel *secondaryLbl;

@property (weak, nonatomic) IBOutlet UILabel *nameoftheSchool2Lbl;
@property (weak, nonatomic) IBOutlet UITextField *nameoftheSchool2TxtField;
@property (weak, nonatomic) IBOutlet UILabel *yearsAttend2Lbl;
@property (weak, nonatomic) IBOutlet UITextField *yearsAttended2TxtField;
@property (weak, nonatomic) IBOutlet UILabel *dateGraduated2Lbl;
@property (weak, nonatomic) IBOutlet UITextField *dateGraduated2TxtField;
@property (weak, nonatomic) IBOutlet UILabel *certificate2Lbl;
@property (weak, nonatomic) IBOutlet UITextField *cartificate2TxtField;
@property (weak, nonatomic) IBOutlet UILabel *universityLbl;

@property (weak, nonatomic) IBOutlet UILabel *nameoftheSchool3Lbl;
@property (weak, nonatomic) IBOutlet UITextField *nameoftheSchool3TxtField;
@property (weak, nonatomic) IBOutlet UILabel *yearsAttend3Lbl;
@property (weak, nonatomic) IBOutlet UITextField *yearsAttended3TxtField;
@property (weak, nonatomic) IBOutlet UILabel *dateGraduated3Lbl;
@property (weak, nonatomic) IBOutlet UITextField *dateGraduated3TxtField;
@property (weak, nonatomic) IBOutlet UILabel *certificate3Lbl;
@property (weak, nonatomic) IBOutlet UITextField *cartificate3TxtField;

@property (weak, nonatomic) IBOutlet UILabel *professionalLbl;

@property (weak, nonatomic) IBOutlet UILabel *nameoftheSchool4Lbl;
@property (weak, nonatomic) IBOutlet UITextField *nameoftheSchool4TxtField;
@property (weak, nonatomic) IBOutlet UILabel *yearsAttend4Lbl;
@property (weak, nonatomic) IBOutlet UITextField *yearsAttended4TxtField;
@property (weak, nonatomic) IBOutlet UILabel *dateGraduated4Lbl;
@property (weak, nonatomic) IBOutlet UITextField *dateGraduated4TxtField;
@property (weak, nonatomic) IBOutlet UILabel *certificate4Lbl;
@property (weak, nonatomic) IBOutlet UITextField *cartificate4TxtField;

@property (weak, nonatomic) IBOutlet UILabel *spokenLanguagesLbl;

@property (weak, nonatomic) IBOutlet UILabel *englishLbl;
@property (weak, nonatomic) IBOutlet UITextField *englishTxtfield;
- (IBAction)englishAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *arabicLbl;
@property (weak, nonatomic) IBOutlet UITextField *arabicTxtField;
- (IBAction)arabicAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *otherLbl;
@property (weak, nonatomic) IBOutlet UITextField *otherTxtField;
- (IBAction)otherAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *msofficeLbl;
@property (weak, nonatomic) IBOutlet UITextField *msofficeTxtFied;
- (IBAction)msofficeAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *typingLbl;
@property (weak, nonatomic) IBOutlet UITextField *typingTxtfield;
- (IBAction)typingAction:(id)sender;
- (IBAction)graduatedDateAction:(id)sender;
- (IBAction)graduatedDateAction2:(id)sender;
- (IBAction)graduatedDateAction3:(id)sender;
- (IBAction)graduatedDateAction4:(id)sender;

//4th view
@property (weak, nonatomic) IBOutlet UILabel *employeeHistoryLbl;
@property (weak, nonatomic) IBOutlet UILabel *nameofemployerLbl;
@property (weak, nonatomic) IBOutlet UITextField *nameofemployerTxtField;
@property (weak, nonatomic) IBOutlet UILabel *lastPositionLbl;
@property (weak, nonatomic) IBOutlet UITextField *lastPositionTxtField;
@property (weak, nonatomic) IBOutlet UILabel *employementDatesLbl;
@property (weak, nonatomic) IBOutlet UILabel *fromLbl;
@property (weak, nonatomic) IBOutlet UITextField *fromTxtField;
- (IBAction)fromAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *toLbl;
@property (weak, nonatomic) IBOutlet UITextField *totextField;
- (IBAction)toAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *totalSalaryLbl;
@property (weak, nonatomic) IBOutlet UILabel *startLbl;
@property (weak, nonatomic) IBOutlet UITextField *startTxtField;
- (IBAction)startAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lastLbl;
@property (weak, nonatomic) IBOutlet UITextField *lastTxtField;
- (IBAction)lastBtnAction:(id)sender;



@property (weak, nonatomic) IBOutlet UILabel *nameofemployer2Lbl;
@property (weak, nonatomic) IBOutlet UITextField *nameofemployer2TxtField;
@property (weak, nonatomic) IBOutlet UILabel *lastPosition2Lbl;
@property (weak, nonatomic) IBOutlet UITextField *lastPosition2TxtField;
@property (weak, nonatomic) IBOutlet UILabel *employementDates2Lbl;
@property (weak, nonatomic) IBOutlet UILabel *from2Lbl;
@property (weak, nonatomic) IBOutlet UITextField *from2TxtField;
- (IBAction)from2Action:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *to2Lbl;
@property (weak, nonatomic) IBOutlet UITextField *to2textField;
- (IBAction)to2Action:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *totalSalary2Lbl;
@property (weak, nonatomic) IBOutlet UILabel *start2Lbl;
@property (weak, nonatomic) IBOutlet UITextField *start2TxtField;
- (IBAction)start2Action:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *last2Lbl;
@property (weak, nonatomic) IBOutlet UITextField *last2TxtField;
- (IBAction)last2BtnAction:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *nameofemployer3Lbl;
@property (weak, nonatomic) IBOutlet UITextField *nameofemployer3TxtField;
@property (weak, nonatomic) IBOutlet UILabel *lastPosition3Lbl;
@property (weak, nonatomic) IBOutlet UITextField *lastPosition3TxtField;
@property (weak, nonatomic) IBOutlet UILabel *employementDates3Lbl;
@property (weak, nonatomic) IBOutlet UILabel *from3Lbl;
@property (weak, nonatomic) IBOutlet UITextField *from3TxtField;
- (IBAction)from3Action:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *to3Lbl;
@property (weak, nonatomic) IBOutlet UITextField *to3textField;
- (IBAction)to3Action:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *total3SalaryLbl;
@property (weak, nonatomic) IBOutlet UILabel *start3Lbl;
@property (weak, nonatomic) IBOutlet UITextField *start3TxtField;
- (IBAction)start3Action:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *last3Lbl;
@property (weak, nonatomic) IBOutlet UITextField *last3TxtField;
- (IBAction)last3BtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextView *reasonForLeavingTxtView;
@property (weak, nonatomic) IBOutlet UISwitch *universitySwitch;
- (IBAction)unversitySwitchAction:(id)sender;
@property (weak, nonatomic) IBOutlet UISwitch *professionalSwitch;
- (IBAction)professionalSwitchAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *unversityView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightUniversityView;
@property (weak, nonatomic) IBOutlet UIView *professionalView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *professionalViewHeight;
@property (weak, nonatomic) IBOutlet UIView *referenceView2;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *referenceView2Height;
@property (weak, nonatomic) IBOutlet UIView *referenceView3;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *referenceView3Height;
@property (weak, nonatomic) IBOutlet UIView *reference1View;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *referenceView1Height;
@property (weak, nonatomic) IBOutlet UIView *areyouEmployeedYesView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *areyouemployeeedViewHeight;
@property (weak, nonatomic) IBOutlet UIView *relitivesYesView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *relitivesViewHeight;


@property (weak, nonatomic) IBOutlet UIView *areYouAppliedYesView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *areyouAppliedYesViewHeight;












// to shoe details
@property (strong, nonatomic)  NSString *from;
@property (strong, nonatomic)  NSMutableDictionary *details;


@end
