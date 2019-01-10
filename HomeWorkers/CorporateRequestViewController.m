//
//  CorporateRequestViewController.m
//  YEMNAK
//
//  Created by apple on 06/07/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import "CorporateRequestViewController.h"
#import "SelectAreaViewController.h"
#import "UIViewController+MJPopupViewController.h"
#import "AllPopViewController.h"
#import "SVProgressHUD.h"
#import "AFNetworking.h"
#import "QuestionsViewController.h"
#import "PECropViewController.h"
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"
#import "LoginViewController.h"
@interface CorporateRequestViewController ()<PopViewControllerDelegate>
{
    int i;
    UIButton *rightbutton;
    UIDatePicker *datePicker;
     UIBarButtonItem *dpTitle;
    NSString *dateFrom;
    NSString *gender;
    NSDictionary *SelectedPost;
    NSDictionary *SelectedSubPost;

    NSString *selectedImage;
    //radio Buttons
    BOOL doYouWorkNow;
     BOOL haveRelatives;
     BOOL areyouappliedBefore;
     BOOL mayContactyourPrevious;
    BOOL areyouEmployed;
    
    UIColor *placeholderColor;
}
@property (strong, nonatomic) IBOutlet UIImagePickerController *userPicker;

@end

@implementation CorporateRequestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    placeholderColor=PLACEHOLDER_COLOR
    //intial radio buttons
    doYouWorkNow = YES;
     haveRelatives = YES;
     areyouappliedBefore = YES;
     mayContactyourPrevious = YES;
    areyouEmployed= YES;
    
    gender = @"male";

    
    
    i = 1;
    [_dateOfBirthTxtField setUserInteractionEnabled:YES];
      [_residencyExpiryDateTxtfield setUserInteractionEnabled:YES];
    [_fromTxtField setUserInteractionEnabled:YES];
    [_from2TxtField setUserInteractionEnabled:YES];
    [_from3TxtField setUserInteractionEnabled:YES];
    [_totextField setUserInteractionEnabled:YES];
    [_to2textField setUserInteractionEnabled:YES];
    [_to3textField setUserInteractionEnabled:YES];
    [_whenTxtfiled setUserInteractionEnabled:YES];
    [_whenCanyouStartTxtField setUserInteractionEnabled:YES];
    _whenCanyouStartTxtField.delegate=self;

    _telephoneTxtField.delegate=self;
    _mobileTxtField.delegate=self;
    [self FirstViewIntialization];
    [self secondViewIntial];
    [self ThirdViewIntialization];
    [self fourthIntial];
//    _personalView.hidden=NO;
//    _currentEmployeeView.hidden=YES;
//    _qualifocationView.hidden=YES;
//    _employementHistoryView.hidden =YES;
    _personalView.alpha=1;
    _currentEmployeeView.alpha=1;
    _qualifocationView.alpha=1;
    _employementHistoryView.alpha=1;
//    _viewHeight.constant=_personalView.frame.size.height;
//    _scrollview.contentSize= CGSizeMake(_scrollview.frame.size.width, _personalView.frame.size.height);
    [self showView];
    // Do any additional setup after loading the view.
    
    
    
    datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    datePicker.datePickerMode = UIDatePickerModeDate;
   // datePicker.minimumDate=[NSDate date];
    

    [datePicker addTarget:self action:@selector(dateTextField:) forControlEvents:UIControlEventValueChanged];
    // add inputviews as datepicekr
    [_dateOfBirthTxtField setInputView:datePicker];
    [_residencyExpiryDateTxtfield setInputView:datePicker];
    [_fromTxtField setInputView:datePicker];
    [_from2TxtField setInputView:datePicker];
    [_from3TxtField setInputView:datePicker];
    [_totextField setInputView:datePicker];
    [_to2textField setInputView:datePicker];
    [_to3textField setInputView:datePicker];
    [_whenTxtfiled setInputView:datePicker];
    [_whenCanyouStartTxtField setInputView:datePicker];

    [_dateGraduatedTxtField setInputView:datePicker];
    [_dateGraduated2TxtField setInputView:datePicker];
    [_dateGraduated3TxtField setInputView:datePicker];
    [_dateGraduated4TxtField setInputView:datePicker];

    UIToolbar *toolBar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    [toolBar setTintColor:[UIColor blackColor]];
    dpTitle = [[UIBarButtonItem alloc] initWithTitle:Localized(@"Choose Date")
                                               style:UIBarButtonItemStylePlain
                                              target:nil
                                              action:nil];
    UIBarButtonItem *doneBtn=[[UIBarButtonItem alloc]initWithTitle:Localized(@"Done") style:UIBarButtonItemStyleBordered target:self action:@selector(showSelectedDate)];
    UIBarButtonItem *cancelBtn=[[UIBarButtonItem alloc]initWithTitle:Localized(@"Cancel") style:UIBarButtonItemStyleBordered target:self action:@selector(cancelSelectedDate)];
    
    UIBarButtonItem *space=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    [toolBar setItems:[NSArray arrayWithObjects:cancelBtn,space,dpTitle,space,doneBtn, nil]];
    // add toolbar as datepicekr

    [_dateOfBirthTxtField setInputAccessoryView:toolBar];
    [_residencyExpiryDateTxtfield setInputAccessoryView:toolBar];
    [_fromTxtField setInputAccessoryView:toolBar];
    [_from2TxtField setInputAccessoryView:toolBar];
    [_from3TxtField setInputAccessoryView:toolBar];
    [_totextField setInputAccessoryView:toolBar];
    [_to2textField setInputAccessoryView:toolBar];
    [_to3textField setInputAccessoryView:toolBar];
    [_whenTxtfiled setInputAccessoryView:toolBar];
    [_whenCanyouStartTxtField setInputAccessoryView:toolBar];

    [_dateGraduatedTxtField setInputAccessoryView:toolBar];
    [_dateGraduated2TxtField setInputAccessoryView:toolBar];
    [_dateGraduated3TxtField setInputAccessoryView:toolBar];
    [_dateGraduated4TxtField setInputAccessoryView:toolBar];

    _fromTxtField.delegate=self;
    _from2TxtField.delegate=self;
    _from3TxtField.delegate=self;
    _totextField.delegate=self;
    _to2textField.delegate=self;
    _to3textField.delegate=self;
    _whenTxtfiled.delegate=self;
    _whenCanyouStartTxtField.delegate=self;
    _dateOfBirthTxtField.delegate=self;
    _residencyExpiryDateTxtfield.delegate=self;
    _dateGraduatedTxtField.delegate=self;
    _dateGraduated2TxtField.delegate=self;
    _dateGraduated3TxtField.delegate=self;
    _dateGraduated4TxtField.delegate=self;

   
    
    
    
    _currentEmployeeLbl.text =Localized(@"Current employment and references");
    
    self.navigationItem.title=Localized(@"Employee Request");

    rightbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [buttonUser setImage:[UIImage imageNamed:@"leftarrow-black90"] forState:UIControlStateNormal];
    if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
        [rightbutton setImage:[UIImage imageNamed:@"right-arrow"] forState:UIControlStateNormal];
        
    }else{
        [rightbutton setImage:[UIImage imageNamed:@"left-arrow"] forState:UIControlStateNormal];
    }
    rightbutton.frame = CGRectMake(0, 0, 30, 30);
    [rightbutton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *customBarRightBtn = [[UIBarButtonItem alloc] initWithCustomView:rightbutton];
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
    [backButtonView addSubview:rightbutton];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backButtonView];
    self.navigationItem.leftBarButtonItem = backButton;
}

 -(void)textFieldDidBeginEditing:(UITextField *)textField {
   [datePicker setDate:[NSDate date]];
 }
-(void)showSelectedDate{
    
    UIDatePicker *picker = (UIDatePicker*)_dateOfBirthTxtField.inputView;
    // [picker setMaximumDate:[NSDate date]];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    NSDate *eventDate = picker.date;
    [dateFormat setDateFormat:@"dd-MM-yyyy"];
    
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    if([dateFrom isEqual: @"DOB"]){
        
        _dateOfBirthTxtField.text = [NSString stringWithFormat:@"%@",dateString];
        
        [_dateOfBirthTxtField resignFirstResponder];
      
    }else if([dateFrom  isEqual: @"RED"]){
        _residencyExpiryDateTxtfield.text = [NSString stringWithFormat:@"%@",dateString];
        [_residencyExpiryDateTxtfield resignFirstResponder];
        
    }else if([dateFrom  isEqual: @"WHEN"]){
        _whenTxtfiled.text = [NSString stringWithFormat:@"%@",dateString];
        [_whenTxtfiled resignFirstResponder];
        
    }else if([dateFrom  isEqual: @"WHENYOUSTART"]){
        _whenCanyouStartTxtField.text = [NSString stringWithFormat:@"%@",dateString];
        [_whenCanyouStartTxtField resignFirstResponder];
        
    }else if([dateFrom  isEqual: @"FROM1"]){
        _fromTxtField.text = [NSString stringWithFormat:@"%@",dateString];
        [_fromTxtField resignFirstResponder];
        
    }else if([dateFrom  isEqual: @"FROM2"]){
        _from2TxtField.text = [NSString stringWithFormat:@"%@",dateString];
        [_from2TxtField resignFirstResponder];
        
    }else if([dateFrom  isEqual: @"FROM3"]){
        _from3TxtField.text = [NSString stringWithFormat:@"%@",dateString];
        [_from3TxtField resignFirstResponder];
        
    }else if([dateFrom  isEqual: @"TO1"]){
        _totextField.text = [NSString stringWithFormat:@"%@",dateString];
        [_totextField resignFirstResponder];
        
    }else if([dateFrom  isEqual: @"TO2"]){
        _to2textField.text = [NSString stringWithFormat:@"%@",dateString];
        [_to2textField resignFirstResponder];
        
    }else if([dateFrom  isEqual: @"TO3"]){
        _to3textField.text = [NSString stringWithFormat:@"%@",dateString];
        [_to3textField resignFirstResponder];
        
    }else if([dateFrom  isEqual: @"G1"]){
        _dateGraduatedTxtField.text = [NSString stringWithFormat:@"%@",dateString];
        [_dateGraduatedTxtField resignFirstResponder];
        
    }else if([dateFrom  isEqual: @"G2"]){
        _dateGraduated2TxtField.text = [NSString stringWithFormat:@"%@",dateString];
        [_dateGraduated2TxtField resignFirstResponder];
        
    }else if([dateFrom  isEqual: @"G3"]){
        _dateGraduated3TxtField.text = [NSString stringWithFormat:@"%@",dateString];
        [_dateGraduated3TxtField resignFirstResponder];
        
    }else if([dateFrom  isEqual: @"G4"]){
        _dateGraduated4TxtField.text = [NSString stringWithFormat:@"%@",dateString];
        [_dateGraduated4TxtField resignFirstResponder];
        
    }
}
-(void) dateTextField:(id)sender
{
  
    
    
}
-(void)cancelSelectedDate{
    [_dateOfBirthTxtField resignFirstResponder];
    [_residencyExpiryDateTxtfield resignFirstResponder];
    [_fromTxtField resignFirstResponder];
    [_from2TxtField resignFirstResponder];
    [_from3TxtField resignFirstResponder];
    [_totextField resignFirstResponder];
    [_to2textField resignFirstResponder];
    [_to3textField resignFirstResponder];
    [_whenTxtfiled resignFirstResponder];
    [_whenCanyouStartTxtField resignFirstResponder];
    
    [_dateGraduatedTxtField resignFirstResponder];
    [_dateGraduated2TxtField resignFirstResponder];
    [_dateGraduated3TxtField resignFirstResponder];
    [_dateGraduated4TxtField resignFirstResponder];
}
-(void)back{
    if(i==1){
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:nil message:Localized(@"The Entire Data will be lossed ") preferredStyle:UIAlertControllerStyleAlert];
    [controller addAction:[UIAlertAction actionWithTitle:Localized(@"ok") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self.navigationController popViewControllerAnimated:YES];
        
    }]];
    [controller addAction:[UIAlertAction actionWithTitle:Localized(@"Cancel") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
    }]];
    [self presentViewController:controller animated:YES completion:nil];
    }else{
        i = i-1;
        [self showView];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)FirstViewIntialization{
    self.resumeTxtField.text=@"";
    self.resumeTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Resume")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    _personalinformationLbl.text=Localized(@"Personal information");
    _firstnamelbl.text=Localized(@"First Name");
    _firstNametxtField.text=@"";
    self.firstNametxtField.attributedPlaceholder =[[NSAttributedString alloc] initWithString:Localized(@"FirstName")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    _middlenamelbl.text=Localized(@"Middle Name");
    self.middleNametxtField.text=@"";
    self.middleNametxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"MiddleName")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    self.familynamelbl.text=Localized(@"Family Name");
     self.familytxtField.text=@"";
    self.familytxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"FamilyName")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    self.dateofBirthLbl.text=Localized(@"Date Of Birth");
    self.dateOfBirthTxtField.text=@"";
    self.dateOfBirthTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Date Of Birth")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    self.placeOfBirthLbl.text=Localized(@"Place Of Birth");
    self.placeOfBirthTxtField.text=@"";
    self.placeOfBirthTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Place Of Birth")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    self.nationalityLbl.text=Localized(@"Nationality");
    self.nationlaityTxtField.text=@"";
    self.nationlaityTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Nationality")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    self.otherNationalityTxtField.text=@"";

    self.otherNationalityTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Other Nationality")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    _otherNationalityTxtField.hidden=YES;
    _otherNationalityLbl.hidden=YES;
    _residancyTop.constant=13;
    
    self.residencyExpireDateLbl.text=Localized(@"Residency Expire Date");
    self.residencyExpiryDateTxtfield.text=@"";
    self.residencyExpiryDateTxtfield.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Residency Expire Date")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    self.articleNumberLbl.text=Localized(@"Article No.");
    self.articalNumberTxtfield.text=@"";
    self.articalNumberTxtfield.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Article Number")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    self.addressLbl.text=Localized(@"Address");
    self.addressTextField.text=@"";
    self.addressTextField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Address")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    
    self.telephoneLbl.text=Localized(@"Telephone");
    self.telephoneTxtField.text=@"";
    self.telephoneTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Telephone Number")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    self.mobileLbl.text=Localized(@"Mobile");
    self.mobileTxtField.text=@"";
    self.mobileTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Mobile Number")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    self.emailLbl.text=Localized(@"Email");
    self.emailTxtField.text=@"";
    self.emailTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"EmailAddress")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
  
    
    self.emailLbl.text=Localized(@"Email");
    self.emailTxtField.text=@"";
    self.emailTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"EmailAddress")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    self.postAppliedForLbl.text=Localized(@"Post Applied For");
    self.postAppliedForTxtField.text=@"";
    self.postAppliedForTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Selected Post")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    self.selectSubcategoryTxtfiled.text=@"";
    self.selectSubcategoryTxtfiled.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Selected SubPost")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    self.otherSubCategoryTxtFiled.text=@"";
    self.otherSubCategoryTxtFiled.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Other SubPost")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    _whencanYouStartTop.constant=20;
    _otherSubCategoryLbl.hidden=YES;
    _otherSubCategoryTxtFiled.hidden=YES;
    self.doyouworkNowLbl.text=Localized(@"Do you work now?");
    self.yesLbl.text=Localized(@"Yes");
    self.noLbl.text=Localized(@"No");
    
    
    self.whenCanyouStartLbl.text=Localized(@"When can you start?");
    self.whenCanyouStartTxtField.text=@"";
    self.whenCanyouStartTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"When can you start")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    self.expectedSalaryLbl.text=Localized(@"Expected salary");
    self.expectedSalaryTxtField.text=@"";
    self.expectedSalaryTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Expected Salary")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    self.genderLbl.text=Localized(@"Gender");
    self.maleLbl.text =Localized(@"Male");
    self.femaleLbl.text=Localized(@"Female");
    
    self.maritalStatusLbl.text=Localized(@"Marital status");
    self.maritalStatusTxtField.text=@"";
    self.maritalStatusTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"MatitalStatus")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    
}

-(void)secondViewIntial{
    // to hide ref2 and ref3
    
    [self.referenceView2 setHidden:YES];
    self.referenceView2Height.constant=0;
    [self.referenceView3 setHidden:YES];
    self.referenceView3Height.constant=0;
    
    
    
    _currentEmployeeLbl.text=Localized(@"Current employement & references");
    _areyouEmployeedLbl.text=Localized(@"Are you Employeed?");

    _areyouemployeedYesLbl.text=Localized(@"Yes");
    _areyouEmployeedNoLbl.text=Localized(@"No");
    self.companyNameLbl.text=Localized(@"Marital status");
    self.companyNameTxtField.text=@"";
    self.companyNameTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"CompanyName")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    _mayweContactyourCurrentEmployerLbl.text=Localized(@"May we contact your current employer?");
  
    _mayweContactyourCurrentEmployerYesLbl.text=Localized(@"Yes");
    _mayweContactyourCurrentEmployerNoLbl.text=Localized(@"No");
//    _refence1Lbl.text=Localized(@"Reference1");
     _refence1Lbl.text=Localized(@"Reference");
    self.fullName1Lbl.text=Localized(@"Full Name");
    self.fullname1Txtfield.text=@"";
    self.fullname1Txtfield.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"FullName")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    self.occupation1Lbl.text=Localized(@"Occupation");
    self.occupation1txtfield.text=@"";
    self.occupation1txtfield.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Occupation")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    self.company1Lbl.text=Localized(@"Company");
    self.company1Txtfield.text=@"";
    self.company1Txtfield.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"CompanyName")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    self.contactDetails1Lbl.text=Localized(@"Contact Details");
    self.contactDetails1Txtfield.text=@"";
    self.contactDetails1Txtfield.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"ContactDetails")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    _refence2Lbl.text=Localized(@"Reference2");
    self.fullName2Lbl.text=Localized(@"Full Name");
    self.fullname2Txtfield.text=@"";
    self.fullname2Txtfield.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"FullName")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    self.occupation2Lbl.text=Localized(@"Occupation");
    self.occupation2txtfield.text=@"";
    self.occupation2txtfield.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Occupation")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    self.company2Lbl.text=Localized(@"Company");
    self.company2Txtfield.text=@"";
    self.company2Txtfield.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"CompanyName")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    self.contactDetails2Lbl.text=Localized(@"Contact Details");
    self.contactDetails2Txtfield.text=@"";
    self.contactDetails2Txtfield.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"ContactDetails")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    _refence3Lbl.text=Localized(@"Reference3");
    self.fullName3Lbl.text=Localized(@"Full Name");
    self.fullname3Txtfield.text=@"";
    self.fullname3Txtfield.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"FullName")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    
    
    self.occupation3Lbl.text=Localized(@"Occupation");
    self.occupation3txtfield.text=@"";
    self.occupation3txtfield.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Occupation")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    self.company3Lbl.text=Localized(@"Company");
    self.company3Txtfield.text=@"";
    self.company3Txtfield.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"CompanyName")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    self.contactDetails3Lbl.text=Localized(@"Contact Details");
    self.contactDetails3Txtfield.text=@"";
    self.contactDetails3Txtfield.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"ContactDetails")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    _beforeappliedLbl.text = Localized(@"Have you ever applied before in this company?");
    
    _beforeappliedNoLbl.text = Localized(@"No");
    _beforeappliedYesLbl.text = Localized(@"Yes");
    
    
    self.whenLbl.text=Localized(@"When?");
    self.whenTxtfiled.text=@"";
    self.whenTxtfiled.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"When?")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    _relitivesinCompanyLbl.text=Localized(@"Do you have relatives working in this company");
    _relitivesinCompanyNoLbl.text = Localized(@"No");
    _relitivesinCompanyYesLbl.text = Localized(@"Yes");
    self.nameandRelationShip.text=Localized(@"Name & relationship");
    self.nameandRelationshipTxtfield.text=@"";
    self.nameandRelationshipTxtfield.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Name & Relationship")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];

}
-(void)ThirdViewIntialization{
    if(!_universitySwitch.isOn){
        _heightUniversityView.constant=0;
        _unversityView.hidden=YES;
    }else{
        _heightUniversityView.constant=205;
        _unversityView.hidden=NO;
    }
    if(!_professionalSwitch.isOn){
        _professionalViewHeight.constant=0;
        _professionalView.hidden=YES;
    }else{
        _professionalViewHeight.constant=205;
        _professionalView.hidden=NO;
    }
    _qualificationLbl.text=Localized(@"Qualification");
    _educationLbl.text=Localized(@"Education");
    _elementrylbl.text=Localized(@"Elementry");
        _nameoftheSchoolLbl.text=Localized(@"Name of the school");
    _yearsAttendLbl.text=Localized(@"Years attended");
    _dateGraduatedLbl.text=Localized(@"Date graduated");
    _certificateLbl.text=Localized(@"Certificate");
    _secondaryLbl.text=Localized(@"Secondary");
    _nameoftheSchool2Lbl.text=Localized(@"Name of the school");
    _yearsAttend2Lbl.text=Localized(@"Years attended");
    _dateGraduated2Lbl.text=Localized(@"Date graduated");
    _certificate2Lbl.text=Localized(@"Certificate");
    _universityLbl.text=Localized(@"University");
    _nameoftheSchool3Lbl.text=Localized(@"Name of the school");
    _yearsAttend3Lbl.text=Localized(@"Years attended");
    _dateGraduated3Lbl.text=Localized(@"Date graduated");
    _certificate3Lbl.text=Localized(@"Certificate");
    _professionalLbl.text=Localized(@"Profissional Institutes");
    _nameoftheSchool4Lbl.text=Localized(@"Name of the school");
    _yearsAttend4Lbl.text=Localized(@"Years attended");
    _dateGraduated4Lbl.text=Localized(@"Date graduated");
    _certificate4Lbl.text=Localized(@"Certificate");
    
    self.nameoftheSchoolTxtField.text=@"";
    self.nameoftheSchoolTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"SchoolName")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    self.nameoftheSchool2TxtField.text=@"";
    self.nameoftheSchool2TxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"SchoolName")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];    self.nameoftheSchool3TxtField.text=@"";
    self.nameoftheSchool3TxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"SchoolName")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];    self.nameoftheSchool4TxtField.text=@"";
    self.nameoftheSchool4TxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"SchoolName")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];

    self.yearsAttendedTxtField.text=@"";
    self.yearsAttendedTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Years")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    self.yearsAttended2TxtField.text=@"";
    self.yearsAttended2TxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Years")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];    self.yearsAttended3TxtField.text=@"";
    self.yearsAttended3TxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Years")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];    self.yearsAttended4TxtField.text=@"";
    self.yearsAttended4TxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Years")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    self.dateGraduatedTxtField.text=@"";
    self.dateGraduatedTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Graduated Date")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    self.dateGraduated2TxtField.text=@"";
    self.dateGraduated2TxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Graduated Date")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    self.dateGraduated3TxtField.text=@"";
    self.dateGraduated3TxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Graduated Date")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    self.dateGraduated4TxtField.text=@"";
    self.dateGraduated4TxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Graduated Date")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    self.cartificateTxtField.text=@"";
    self.cartificateTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"CertificateNumber")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    self.cartificate2TxtField.text=@"";
    self.cartificate2TxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"CertificateNumber")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    self.cartificate3TxtField.text=@"";
    self.cartificate3TxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"CertificateNumber")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    self.cartificate4TxtField.text=@"";
    self.cartificate4TxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"CertificateNumber")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    _spokenLanguagesLbl.text=Localized(@"Spoken languages & Computer skills");
    _emailLbl.text=Localized(@"Email");
    self.emailTxtField.text=@"";
    self.emailTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Email")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    _englishLbl.text=Localized(@"Email");
    self.englishTxtfield.text=@"";
    self.englishTxtfield.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"English Level")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    _arabicLbl.text=Localized(@"Arabic");
    self.arabicTxtField.text=@"";
    self.arabicTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Arabic Level")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    _otherLbl.text=Localized(@"Other");
    self.otherTxtField.text=@"";
    self.otherTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Other Level")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    _msofficeLbl.text=Localized(@"MS Office");
    self.msofficeTxtFied.text=@"";
    self.msofficeTxtFied.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"MS Office Level")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    _typingLbl.text=Localized(@"Typing");
    self.typingTxtfield.text=@"";
    self.typingTxtfield.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Typing Level")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
}

-(void)fourthIntial{
    _employeeHistoryLbl.text=Localized(@"Employee History");
    _nameofemployerLbl.text=Localized(@"Name of the employer");
    self.nameofemployerTxtField.text=@"";
    self.nameofemployerTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Name of employer")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    _lastPositionLbl.text=Localized(@"Last position");
    self.lastPositionTxtField.text=@"";
    self.lastPositionTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Name of lastPostion")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    _employementDatesLbl.text=Localized(@"Employment Dates");

    _fromLbl.text=Localized(@"From");
    self.fromTxtField.text=@"";
    self.fromTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"FromDate")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    _toLbl.text=Localized(@"TO");
    self.totextField.text=@"";
    self.totextField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"ToDate")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    
    _totalSalaryLbl.text=Localized(@"Total Salary");
    
    _startLbl.text=Localized(@"Start");
    self.startTxtField.text=@"";
    self.startTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Start")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    _lastLbl.text=Localized(@"TO");
    self.lastTxtField.text=@"";
    self.lastTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Last")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    
    _nameofemployer2Lbl.text=Localized(@"Name of the employer");
    self.nameofemployer2TxtField.text=@"";
    self.nameofemployer2TxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Name of employer")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    _lastPosition2Lbl.text=Localized(@"Last position");
    self.lastPosition2TxtField.text=@"";
    self.lastPosition2TxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Name of lastPostion")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    _employementDates2Lbl.text=Localized(@"Employment Dates");
    
    _from2Lbl.text=Localized(@"From");
    self.from2TxtField.text=@"";
    self.from2TxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"FromDate")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    _to2Lbl.text=Localized(@"TO");
    self.to2textField.text=@"";
    self.to2textField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"ToDate")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    
    _totalSalary2Lbl.text=Localized(@"Total Salary");
    
    _start2Lbl.text=Localized(@"Start");
    self.start2TxtField.text=@"";
    self.start2TxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Start")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    _last2Lbl.text=Localized(@"TO");
    self.last2TxtField.text=@"";
    self.last2TxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Last")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    _nameofemployer3Lbl.text=Localized(@"Name of the employer");
    self.nameofemployer3TxtField.text=@"";
    self.nameofemployer3TxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Name of employer")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    _lastPosition3Lbl.text=Localized(@"Last position");
    self.lastPosition3TxtField.text=@"";
    self.lastPosition3TxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Name of lastPostion")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    _employementDates3Lbl.text=Localized(@"Employment Dates");
    
    _from3Lbl.text=Localized(@"From");
    self.from3TxtField.text=@"";
    self.from3TxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"FromDate")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    _to3Lbl.text=Localized(@"TO");
    self.to3textField.text=@"";
    self.to3textField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"ToDate")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    
    _total3SalaryLbl.text=Localized(@"Total Salary");
    
    _start3Lbl.text=Localized(@"Start");
    self.start3TxtField.text=@"";
    self.start3TxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Start")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    _last3Lbl.text=Localized(@"TO");
    self.last3TxtField.text=@"";
    self.last3TxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Last")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    self.reasonForLeavingTxtView.text = @"";
//    self.reasonForLeavingTxtView.placeholder = Localized(@"Reason For Leaving(be specific)");
    self.reasonForLeavingTxtView.placeholder = Localized(@"Details(Write your working history)");

    self.reasonForLeavingTxtView.placeholderTextColor = placeholderColor;
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//- (IBAction)segmentAction:(id)sender {
//    _personalView.hidden=YES;
//    _currentEmployeeView.hidden=YES;
//    _qualifocationView.hidden=YES;
//
//    if(_segment.selectedSegmentIndex==0){
//        _personalView.hidden=NO;
//        _viewHeight.constant=_personalView.frame.size.height;
//        _scrollview.contentSize= CGSizeMake(_scrollview.frame.size.width, _personalView.frame.size.height);
//
//    }else  if(_segment.selectedSegmentIndex==1){
//        _currentEmployeeView.hidden=NO;
//        _viewHeight.constant=_currentEmployeeView.frame.size.height;
//        _scrollview.contentSize= CGSizeMake(_scrollview.frame.size.width, _currentEmployeeView.frame.size.height);
//
//    }else  if(_segment.selectedSegmentIndex==2){
//        _qualifocationView.hidden=NO;
//        _viewHeight.constant=_qualifocationView.frame.size.height;
//        _scrollview.contentSize= CGSizeMake(_scrollview.frame.size.width, _qualifocationView.frame.size.height);
//
//    }
//}
- (IBAction)previousBtnAction:(id)sender {
    i = i-1;
    [self showView];
}

- (IBAction)nextBtnAction:(id)sender {
 
    
    if(i==4){
        if([self CheckValidation]){
            if([Utils loggedInUserId] != -1)
            {
                [self loadData];
            }else{
                //[self showErrorAlertWithMessage:Localized(@"Please Login To ")];
                LoginViewController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
                [self.navigationController pushViewController:obj animated:YES];
            }
//        [self loadData];
        }
       // [self.navigationController popViewControllerAnimated:YES];
    }else{
        
        i = i+1;
        [self showView];
//        if(i==1){
//            if([self CheckValidationForView1]){
//            i = i+1;
//            [self showView];
//            }
//        }else if(i==2){
//            if([self CheckValidationForView2]){
//                i = i+1;
//                [self showView];
//            }
//        }else if(i==3){
//            if([self CheckValidationForView3]){
//                i = i+1;
//                [self showView];
//            }
//        }
        
    }
  

}
-(void)loadData{
    
    if(!_universitySwitch.isOn){
  
        _nameoftheSchool3TxtField.text=@"";
        _yearsAttended3TxtField.text=@"";
        _dateGraduated3TxtField.text=@"";
        _cartificate3TxtField.text=@"";
    }
    if(!_professionalSwitch.isOn){
               _nameoftheSchool4TxtField.text=@"";
        _yearsAttended4TxtField.text=@"";
        _dateGraduated4TxtField.text=@"";
        _cartificate4TxtField.text=@"";
    }
    
    
    NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];

    [dict setValue:_firstNametxtField.text forKey:@"first_name"];
    [dict setValue:_middleNametxtField.text forKey:@"middle_name"];
    [dict setValue:_familytxtField.text forKey:@"family_name"];
    [dict setValue:_dateOfBirthTxtField.text forKey:@"date_of_birth"];
    [dict setValue:_placeOfBirthTxtField.text forKey:@"place_of_birth"];
    [dict setValue:_nationlaityTxtField.text forKey:@"nationality"];
    [dict setValue:_otherNationalityTxtField.text forKey:@"other_nationality"];

    [dict setValue:_residencyExpiryDateTxtfield.text forKey:@"residency_expiredate"];
    [dict setValue:_articalNumberTxtfield.text forKey:@"article_number"];
    [dict setValue:_addressTextField.text forKey:@"address"];
    [dict setValue:_telephoneTxtField.text forKey:@"telephone"];
    [dict setValue:_mobileTxtField.text forKey:@"mobile"];
    [dict setValue:_emailTxtField.text forKey:@"email"];
    [dict setValue:[SelectedPost valueForKey:@"id"] forKey:@"position_applied_for"];
    [dict setValue:[SelectedSubPost valueForKey:@"id"] forKey:@"subposition_applied_for"];
    [dict setValue:_otherSubCategoryTxtFiled.text forKey:@"other_subposition_applied_for"];

    [dict setValue: doYouWorkNow? @"YES": @"NO" forKey:@"do_you_work_now"];
    [dict setValue:_whenCanyouStartTxtField.text forKey:@"when_can_youstart"];
    [dict setValue:_expectedSalaryTxtField.text forKey:@"expected_salary"];
    [dict setValue:_maritalStatusTxtField.text forKey:@"marital_status"];
    
    [dict setValue:[gender  isEqual: @"male"]? @"0":@"1" forKey:@"gender"];
    

    [dict setValue:areyouEmployed? @"YES": @"NO" forKey:@"are_you_employed"];
    [dict setValue:_companyNameTxtField.text forKey:@"companyName"];
    [dict setValue:mayContactyourPrevious? @"YES": @"NO" forKey:@"maywe_contact_yourcurrent_employer"];
    
    [dict setValue:_fullname1Txtfield.text forKey:@"fullname_first"];
    [dict setValue:_occupation1txtfield.text forKey:@"occupation_first"];
    [dict setValue:_company1Txtfield.text forKey:@"company_first"];
    [dict setValue:_contactDetails1Txtfield.text forKey:@"contactdetails_first"];
    // for hide ref2 and ref3
//    [dict setValue:_fullname2Txtfield.text forKey:@"fullname_second"];
//    [dict setValue:_occupation2txtfield.text forKey:@"occupation_second"];
//    [dict setValue:_company2Txtfield.text forKey:@"company_second"];
//    [dict setValue:_contactDetails2Txtfield.text forKey:@"contactdetails_second"];
//
//    [dict setValue:_fullname3Txtfield.text forKey:@"fullname_third"];
//    [dict setValue:_occupation3txtfield.text forKey:@"occupation_third"];
//    [dict setValue:_company3Txtfield.text forKey:@"company_third"];
//    [dict setValue:_contactDetails3Txtfield.text forKey:@"contactdetails_third"];
    
    [dict setValue:areyouappliedBefore? @"YES": @"NO" forKey:@"applied_before"];
    [dict setValue:_whenTxtfiled.text forKey:@"when"];
    [dict setValue: haveRelatives? @"YES": @"NO" forKey:@"relatives_incompany"];
    [dict setValue:_nameandRelationshipTxtfield.text forKey:@"name_relationship"];
    
   
    
    
    [dict setValue:_nameoftheSchoolTxtField.text forKey:@"school_first"];
    [dict setValue:_yearsAttendedTxtField.text forKey:@"years_first"];
    [dict setValue:_dateGraduatedTxtField.text forKey:@"graduated_date_first"];
    [dict setValue:_cartificateTxtField.text forKey:@"certifate_first"];
    
    [dict setValue:_nameoftheSchool2TxtField.text forKey:@"school_second"];
    [dict setValue:_yearsAttended2TxtField.text forKey:@"years_second"];
    [dict setValue:_dateGraduated2TxtField.text forKey:@"graduated_date_second"];
    [dict setValue:_cartificate2TxtField.text forKey:@"certifate_second"];
    
    [dict setValue:_nameoftheSchool3TxtField.text forKey:@"school_third"];
    [dict setValue:_yearsAttended3TxtField.text forKey:@"years_third"];
    [dict setValue:_dateGraduated3TxtField.text forKey:@"graduated_date_third"];
    [dict setValue:_cartificate3TxtField.text forKey:@"certifate_third"];
    
    [dict setValue:_nameoftheSchool4TxtField.text forKey:@"school_fourth"];
    [dict setValue:_yearsAttended4TxtField.text forKey:@"years_fourth"];
    [dict setValue:_dateGraduated4TxtField.text forKey:@"graduated_date_fourth"];
    [dict  setValue:_cartificate4TxtField.text forKey:@"certifate_fourth"];
    
    [dict setValue:_englishTxtfield.text forKey:@"english"];
    [dict setValue:_arabicTxtField.text forKey:@"arabic"];
    [dict setValue:_otherTxtField.text forKey:@"other"];
    [dict setValue:_msofficeTxtFied.text forKey:@"msoffice"];
    [dict setValue:_typingTxtfield.text forKey:@"typing"];
    
    
    NSMutableArray *Employer=[[NSMutableArray alloc]init];

    NSMutableDictionary *empDict1=[[NSMutableDictionary alloc]init];
    
    
    [empDict1 setValue:_nameofemployerTxtField.text forKey:@"employer"];
    [empDict1 setValue:_lastPositionTxtField.text forKey:@"last_position"];
    [empDict1 setValue:_fromTxtField.text forKey:@"from"];
    [empDict1 setValue:_totextField.text forKey:@"to"];
    [empDict1 setValue:_startTxtField.text forKey:@"start_sal"];
    [empDict1 setValue:_lastTxtField.text forKey:@"last_sal"];
        [empDict1 setValue:_reasonForLeavingTxtView.text forKey:@"reason_for_leaving"];
    
    [Employer addObject:empDict1];
    
     NSMutableDictionary *empDict2=[[NSMutableDictionary alloc]init];
    
    [empDict2 setValue:_nameofemployer2TxtField.text forKey:@"employer"];
    [empDict2 setValue:_lastPosition2TxtField.text forKey:@"last_position"];
    [empDict2 setValue:_from2TxtField.text forKey:@"from"];
    [empDict2 setValue:_to2textField.text forKey:@"to"];
    [empDict2 setValue:_start2TxtField.text forKey:@"start_sal"];
    [empDict2 setValue:_last2TxtField.text forKey:@"last_sal"];
    [empDict2 setValue:@"" forKey:@"reason_for_leaving"];

    [Employer addObject:empDict2];
    
    NSMutableDictionary *empDict3=[[NSMutableDictionary alloc]init];
    
    [empDict3 setValue:_nameofemployer3TxtField.text forKey:@"employer"];
    [empDict3 setValue:_lastPosition3TxtField.text forKey:@"last_position"];
    [empDict3 setValue:_from3TxtField.text forKey:@"from"];
    [empDict3 setValue:_to3textField.text forKey:@"to"];
    [empDict3 setValue:_start3TxtField.text forKey:@"start_sal"];
    [empDict3 setValue:_last3TxtField.text forKey:@"last_sal"];
    [empDict3 setValue:@"" forKey:@"reason_for_leaving"];
     [Employer addObject:empDict3];
    
    [dict setValue:Employer forKey:@"employer"];
    
//    [dict setValue:_nameofemployer2TxtField.text forKey:@"employer_second"];
//    [dict setValue:_lastPosition2TxtField.text forKey:@"last_position_second"];
//    [dict setValue:_from2TxtField.text forKey:@"from_second"];
//    [dict setValue:_to2textField.text forKey:@"to_second"];
//    [dict setValue:_start2TxtField.text forKey:@"start_sal_second"];
//    [dict setValue:_last2TxtField.text forKey:@"last_sal_second"];
//
//    [dict setValue:_nameofemployer3TxtField.text forKey:@"employer_third"];
//    [dict setValue:_lastPosition3TxtField.text forKey:@"last_position_third"];
//    [dict setValue:_from3TxtField.text forKey:@"from_third"];
//    [dict setValue:_to3textField.text forKey:@"to_third"];
//    [dict setValue:_start3TxtField.text forKey:@"start_sal_third"];
//    [dict setValue:_last3TxtField.text forKey:@"last_sal_third"];
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
    NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"json: %@", json);
    
    if(SelectedPost.count==0){
        [self showErrorAlertWithMessage:Localized(@"Select The Post")];
    }
#pragma to hide question and answer part
    /*
    QuestionsViewController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"QuestionsViewController"];
    obj.formData = dict;
    obj.resumeImage = _resumeImage.image;
    obj.Qlist=[SelectedPost valueForKey:@"questions_list"];
    if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
        obj.title = [SelectedPost valueForKey:@"title_ar"];
    }else{
        obj.title = [SelectedPost valueForKey:@"title"];
        
    }

    [self.navigationController pushViewController:obj animated:YES];
     */
   // [self sendtoServer:json];
    [self uploadImagesWithProgressWithId:json];
}

-(BOOL)CheckValidationForView1{
//    if(![_resumeBtn isHidden]){
//        [self showErrorAlertWithMessage:Localized(@"Upload Your Resume")];
//        return NO;
//    }
    if(_firstNametxtField.text.length==0){
        [self showErrorAlertWithMessage:Localized(@"Enter FirstName")];
        return NO;
    }
//    else if(_middleNametxtField.text.length==0){
//        [self showErrorAlertWithMessage:Localized(@"Enter MiddleName")];
//        return NO;
//    }
    else if(_familytxtField.text.length==0){
        [self showErrorAlertWithMessage:Localized(@"Enter FamilyName")];
        return NO;
    }else if(_dateOfBirthTxtField.text.length==0){
        [self showErrorAlertWithMessage:Localized(@"Select Date Of Birth")];
        return NO;
    }
//    else if(_placeOfBirthTxtField.text.length==0){
//        [self showErrorAlertWithMessage:Localized(@"Enter Place Of Birth")];
//        return NO;
//    }
    else if(_nationlaityTxtField.text.length==0){
        [self showErrorAlertWithMessage:Localized(@"Select Nationality")];
        return NO;
    }else if(_residencyExpiryDateTxtfield.text.length==0){
        [self showErrorAlertWithMessage:Localized(@"Select Residency ExpireDate")];
        return NO;
    }else if(_articalNumberTxtfield.text.length==0){
        [self showErrorAlertWithMessage:Localized(@"Enter ArticleNumber")];
        return NO;
    }else if(_addressTextField.text.length==0){
        [self showErrorAlertWithMessage:Localized(@"Enter Addess")];
        return NO;
    }else if(_telephoneTxtField.text.length==0){
        [self showErrorAlertWithMessage:Localized(@"Enter TelePhone")];
        return NO;
    }else if(_mobileTxtField.text.length==0){
        [self showErrorAlertWithMessage:Localized(@"Enter Mobile")];
        return NO;
    }else if(_emailTxtField.text.length==0){
        [self showErrorAlertWithMessage:Localized(@"Enter EmailAddress")];
        return NO;
    }else if(_postAppliedForTxtField.text.length==0){
        [self showErrorAlertWithMessage:Localized(@"Select Post Applied For")];
        return NO;
    }else if(_selectSubcategoryTxtfiled.text.length==0){
        [self showErrorAlertWithMessage:Localized(@"Select SubPost Applied For")];
        return NO;
    }else if(_whenCanyouStartTxtField.text.length==0){
        [self showErrorAlertWithMessage:Localized(@"Select When can you start")];
        return NO;
    }else if(_telephoneTxtField.text.length==0){
        [self showErrorAlertWithMessage:Localized(@"Enter TelePhone")];
        return NO;
    }else if(_expectedSalaryTxtField.text.length==0){
        [self showErrorAlertWithMessage:Localized(@"Enter ExpectedSalary")];
        return NO;
    }else if(_maritalStatusTxtField.text.length==0){
        [self showErrorAlertWithMessage:Localized(@"Select MaritalStatus")];
        return NO;
    }
    else{
        return  [self CheckValidationForView2];;
    }
}

-(BOOL)CheckValidationForView2{
    if(_companyNameTxtField.text.length==0 && areyouEmployed){
        [self showErrorAlertWithMessage:Localized(@"Enter CompanyName")];
        return NO;
    } else if(_fullname1Txtfield.text.length==0 && mayContactyourPrevious){
        [self showErrorAlertWithMessage:Localized(@"Enter First Reference FullName")];
        return NO;
    } else if(_occupation1txtfield.text.length==0 && mayContactyourPrevious){
        [self showErrorAlertWithMessage:Localized(@"Enter First Reference Occupation")];
        return NO;
    } else if(_company1Txtfield.text.length==0 && mayContactyourPrevious){
        [self showErrorAlertWithMessage:Localized(@"Enter First Reference Company")];
        return NO;
    } else if(_contactDetails1Txtfield.text.length==0 && mayContactyourPrevious){
        [self showErrorAlertWithMessage:Localized(@"Enter First Reference ContactDetails")];
        return NO;
    }
    // for hide ref2 and ref3
//    else if(_fullname2Txtfield.text.length==0){
//        [self showErrorAlertWithMessage:Localized(@"Enter Second Reference FullName")];
//        return NO;
//    } else if(_occupation2txtfield.text.length==0){
//        [self showErrorAlertWithMessage:Localized(@"Enter Second Reference Occupation")];
//        return NO;
//    } else if(_company2Txtfield.text.length==0){
//        [self showErrorAlertWithMessage:Localized(@"Enter Second Reference Company")];
//        return NO;
//    } else if(_contactDetails2Txtfield.text.length==0){
//        [self showErrorAlertWithMessage:Localized(@"Enter Second Reference ContactDetails")];
//        return NO;
//    }
//    else if(_fullname3Txtfield.text.length==0){
//        [self showErrorAlertWithMessage:Localized(@"Enter Third Reference FullName")];
//        return NO;
//    } else if(_occupation3txtfield.text.length==0){
//        [self showErrorAlertWithMessage:Localized(@"Enter Third Reference Occupation")];
//        return NO;
//    } else if(_company3Txtfield.text.length==0){
//        [self showErrorAlertWithMessage:Localized(@"Enter Third Reference Company")];
//        return NO;
//    } else if(_contactDetails3Txtfield.text.length==0){
//        [self showErrorAlertWithMessage:Localized(@"Enter Third Reference ContactDetails")];
//        return NO;
//    }
//
//    else if(_whenTxtfiled.text.length==0 && areyouappliedBefore){
//        [self showErrorAlertWithMessage:Localized(@"Enter you applied before")];
//        return NO;
//    }
//    else if(_nameandRelationshipTxtfield.text.length==0 && haveRelatives){
//        [self showErrorAlertWithMessage:Localized(@"Enter Name&RelationShip")];
//        return NO;
//    }
    
    else{
        return [self CheckValidationForView3];
    }
    
}
-(BOOL)CheckValidationForView3{
//    if(_nameoftheSchoolTxtField.text.length==0){
//        [self showErrorAlertWithMessage:Localized(@"Enter Elementry SchoolName")];
//        return NO;
//    } else if(_yearsAttendedTxtField.text.length==0){
//        [self showErrorAlertWithMessage:Localized(@"Enter Elementry Years")];
//        return NO;
//    } else if(_dateGraduatedTxtField.text.length==0){
//        [self showErrorAlertWithMessage:Localized(@"Enter Elementry GraduatedDate")];
//        return NO;
//    } else if(_cartificateTxtField.text.length==0){
//        [self showErrorAlertWithMessage:Localized(@"Enter Elementry Certificate Number")];
//        return NO;
//    }
//    else
        
        if(_nameoftheSchool2TxtField.text.length==0){
        [self showErrorAlertWithMessage:Localized(@"Enter Secondary CollegeName")];
        return NO;
    } else if(_yearsAttended2TxtField.text.length==0){
        [self showErrorAlertWithMessage:Localized(@"Enter Secondary Years")];
        return NO;
    } else if(_dateGraduated2TxtField.text.length==0){
        [self showErrorAlertWithMessage:Localized(@"Enter Secondary GraduatedDate")];
        return NO;
    } else if(_cartificate2TxtField.text.length==0){
        [self showErrorAlertWithMessage:Localized(@"Enter Secondary Certificate Number")];
        return NO;
    }
    else  if(_nameoftheSchool3TxtField.text.length==0 && _universitySwitch.on){
        [self showErrorAlertWithMessage:Localized(@"Enter University Name")];
        return NO;
    } else if(_yearsAttended3TxtField.text.length==0 && _universitySwitch.on){
        [self showErrorAlertWithMessage:Localized(@"Enter University Years")];
        return NO;
    } else if(_dateGraduated3TxtField.text.length==0 && _universitySwitch.on){
        [self showErrorAlertWithMessage:Localized(@"Enter University GraduatedDate")];
        return NO;
    } else if(_cartificate3TxtField.text.length==0 && _universitySwitch.on){
        [self showErrorAlertWithMessage:Localized(@"Enter University Certificate Number")];
        return NO;
    }
    else if(_nameoftheSchool4TxtField.text.length==0 && _professionalSwitch.on){
        [self showErrorAlertWithMessage:Localized(@"Enter Profissional InstituteName")];
        return NO;
    } else if(_yearsAttended4TxtField.text.length==0 && _professionalSwitch.on){
        [self showErrorAlertWithMessage:Localized(@"Enter Profissional Years")];
        return NO;
    } else if(_dateGraduated4TxtField.text.length==0 && _professionalSwitch.on){
        [self showErrorAlertWithMessage:Localized(@"Enter Profissional GraduatedDate")];
        return NO;
    } else if(_cartificate4TxtField.text.length==0 && _professionalSwitch.on){
        [self showErrorAlertWithMessage:Localized(@"Enter Profissional Certificate Number")];
        return NO;
    }
    else if(_englishTxtfield.text.length==0){
        [self showErrorAlertWithMessage:Localized(@"Select Level in English")];
        return NO;
    }
    else if(_arabicTxtField.text.length==0){
        [self showErrorAlertWithMessage:Localized(@"Select Level in Arabic")];
        return NO;
    }
//    else if(_otherTxtField.text.length==0){
//        [self showErrorAlertWithMessage:Localized(@"Select Level in Other")];
//        return NO;
//    }
    else if(_msofficeTxtFied.text.length==0){
        [self showErrorAlertWithMessage:Localized(@"Select Level in MSOffice")];
        return NO;
    }
    else if(_typingTxtfield.text.length==0){
        [self showErrorAlertWithMessage:Localized(@"Select Level in Typing")];
        return NO;
    }
    else{
        return YES;
    }
}
-(BOOL)checkUniversity{
    if(_nameoftheSchool3TxtField.text.length==0){
        [self showErrorAlertWithMessage:Localized(@"Enter University Name")];
        return NO;
    } else if(_yearsAttended3TxtField.text.length==0){
        [self showErrorAlertWithMessage:Localized(@"Enter University Years")];
        return NO;
    } else if(_dateGraduated3TxtField.text.length==0){
        [self showErrorAlertWithMessage:Localized(@"Enter University GraduatedDate")];
        return NO;
    } else if(_cartificate3TxtField.text.length==0){
        [self showErrorAlertWithMessage:Localized(@"Enter University Certificate Number")];
        return NO;
    }else{
        return YES;
    }
}
-(BOOL)checkProfessional{
    if(_nameoftheSchool4TxtField.text.length==0){
        [self showErrorAlertWithMessage:Localized(@"Enter Profissional InstituteName")];
        return NO;
    } else if(_yearsAttended4TxtField.text.length==0){
        [self showErrorAlertWithMessage:Localized(@"Enter Profissional Years")];
        return NO;
    } else if(_dateGraduated4TxtField.text.length==0){
        [self showErrorAlertWithMessage:Localized(@"Enter Profissional GraduatedDate")];
        return NO;
    } else if(_cartificate4TxtField.text.length==0){
        [self showErrorAlertWithMessage:Localized(@"Enter Profissional Certificate Number")];
        return NO;
    }else{
        return YES;
    }
}
-(BOOL)CheckValidation{
    
 //   [self CheckValidationForView1];
//    [self CheckValidationForView2];
//    [self CheckValidationForView3];
    
    //second
    
    // third
    
    
    //forth
      if(_nameofemployerTxtField.text.length==0){
         [self showErrorAlertWithMessage:Localized(@"Enter PresentCompany Employer Name")];
         return NO;
     }else if(_lastPositionTxtField.text.length==0){
         [self showErrorAlertWithMessage:Localized(@"Enter PresentCompany LastPosition")];
         return NO;
     }else if(_fromTxtField.text.length==0){
         [self showErrorAlertWithMessage:Localized(@"Enter PresentCompany FromDate")];
         return NO;
     }else if(_totextField.text.length==0){
         [self showErrorAlertWithMessage:Localized(@"Enter PresentCompany LastDate")];
         return NO;
     }else if(_startTxtField.text.length==0){
         [self showErrorAlertWithMessage:Localized(@"Enter PresentCompany StartSalary")];
         return NO;
     }else if(_lastTxtField.text.length==0){
         [self showErrorAlertWithMessage:Localized(@"Enter PresentCompany LastSalary")];
         return NO;
     }else if(_reasonForLeavingTxtView.text.length==0){
         [self showErrorAlertWithMessage:Localized(@"Enter Reason for leaving")];
         return NO;
     }
     else if(_nameofemployer2TxtField.text.length==0){
         [self showErrorAlertWithMessage:Localized(@"Enter PreviousCompany Employer Name")];
         return NO;
     }else if(_lastPosition2TxtField.text.length==0){
         [self showErrorAlertWithMessage:Localized(@"Enter PreviousCompany LastPosition")];
         return NO;
     }else if(_from2TxtField.text.length==0){
         [self showErrorAlertWithMessage:Localized(@"Enter PreviousCompany FromDate")];
         return NO;
     }else if(_to2textField.text.length==0){
         [self showErrorAlertWithMessage:Localized(@"Enter PreviousCompany LastDate")];
         return NO;
     }else if(_start2TxtField.text.length==0){
         [self showErrorAlertWithMessage:Localized(@"Enter PreviousCompany StartSalary")];
         return NO;
     }else if(_last2TxtField.text.length==0){
         [self showErrorAlertWithMessage:Localized(@"Enter PreviousCompany LastSalary")];
         return NO;
     }
     else if(_nameofemployer3TxtField.text.length==0){
         [self showErrorAlertWithMessage:Localized(@"Enter BeforePreviousCompany Employer Name")];
         return NO;
     }else if(_lastPosition3TxtField.text.length==0){
         [self showErrorAlertWithMessage:Localized(@"Enter BeforePreviousCompany LastPosition")];
         return NO;
     }else if(_from3TxtField.text.length==0){
         [self showErrorAlertWithMessage:Localized(@"Enter BeforePreviousCompany FromDate")];
         return NO;
     }else if(_to3textField.text.length==0){
         [self showErrorAlertWithMessage:Localized(@"Enter BeforePreviousCompany LastDate")];
         return NO;
     }else if(_start3TxtField.text.length==0){
         [self showErrorAlertWithMessage:Localized(@"Enter BeforePreviousCompany StartSalary")];
         return NO;
     }else if(_last3TxtField.text.length==0){
         [self showErrorAlertWithMessage:Localized(@"Enter BeforePreviousCompany LastSalary")];
         return NO;
     }
    
    else{
        return [self CheckValidationForView1];
    }
}
- (void)cancelButtonClicked:(UIViewController *)secondDetailViewController {
    [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationSlideTopBottom];
}
- (IBAction)maleAction:(id)sender {
    gender = @"male";
    [_maleBtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
    [_femaleBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
    
}

- (IBAction)femaleAction:(id)sender {
    gender = @"female";
    [_femaleBtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
    [_maleBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
}
-(void)showView{
    
    _personalView.hidden=YES;
    _currentEmployeeView.hidden=YES;
    _qualifocationView.hidden=YES;
    _employementHistoryView.hidden=YES;
    
     _previousBtn.hidden=NO;
    
    [_nextBtn setTitle:Localized(@"Next") forState:UIControlStateNormal];
    [_previousBtn setTitle:Localized(@"Previous") forState:UIControlStateNormal];
    self.nextBtn.layer.cornerRadius = self.nextBtn.frame.size.height/2;
    self.nextBtn.clipsToBounds = YES;
    self.nextBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    self.nextBtn.layer.borderWidth = 2;
    
    self.previousBtn.layer.cornerRadius = self.previousBtn.frame.size.height/2;
    self.previousBtn.clipsToBounds = YES;
    self.previousBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    self.previousBtn.layer.borderWidth = 2;
    
    if(i==1){
        _previousBtn.hidden=YES;
        _personalView.hidden=NO;
        _scrollview.contentSize= CGSizeMake(_scrollview.frame.size.width, _personalView.frame.size.height);
        
    }else  if(i==2){
        _currentEmployeeView.hidden=NO;
        _scrollview.contentSize= CGSizeMake(_scrollview.frame.size.width, _currentEmployeeView.frame.size.height);
        
    }else  if(i==3){
        _qualifocationView.hidden=NO;
        _scrollview.contentSize= CGSizeMake(_scrollview.frame.size.width, _qualifocationView.frame.size.height);
        
    }else  if(i==4){
        [_nextBtn setTitle:Localized(@"Submit") forState:UIControlStateNormal];
        _employementHistoryView.hidden=NO;
        _scrollview.contentSize= CGSizeMake(_scrollview.frame.size.width, _employementHistoryView.frame.size.height);
        
    }
    [self.scrollview setContentOffset:CGPointZero animated:YES];

   [_scrollview setNeedsDisplay];
}
- (IBAction)dateofBirthAction:(id)sender {
    dateFrom = @"DOB";
    [self.dateOfBirthTxtField becomeFirstResponder];
}
- (IBAction)nationalityBtnAction:(id)sender {
    SelectAreaViewController *vc = [[SelectAreaViewController alloc] initWithNibName:@"SelectAreaViewController" bundle:nil];
    vc.delegate=self;
    //    [self.navigationController pushViewController:vc animated:YES];
    vc.completionBlock = ^(NSMutableDictionary *area) {
        NSLog(@"%@",area);
        _otherNationalityTxtField.text=@"";
        if([[area valueForKey:@"id"] isEqual:@"0"]){
            _otherNationalityTxtField.hidden=NO;
            _otherNationalityLbl.hidden=NO;
            _residancyTop.constant=61;
        }else{
            
            _otherNationalityTxtField.hidden=YES;
            _otherNationalityLbl.hidden=YES;
            _residancyTop.constant=13;
        }
        if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
            self.nationlaityTxtField.text = [area valueForKey:@"title_ar"];
        }else{
            self.nationlaityTxtField.text = [area valueForKey:@"title"];
        }
        
    };
    
    [self presentPopupViewController:vc animationType:MJPopupViewAnimationSlideBottomTop dismissed:nil];
}
- (IBAction)residencyExpiryAction:(id)sender {
    dateFrom = @"RED";
    [self.residencyExpiryDateTxtfield becomeFirstResponder];
}
- (IBAction)postappliedAction:(id)sender {
    AllPopViewController *vc = [[AllPopViewController alloc] initWithNibName:@"AllPopViewController" bundle:nil];
    vc.delegate=self;
    vc.From = @"POSTAPPLY";
    vc.areasList = @[Localized(@"Job1"),Localized(@"Job2"),Localized(@"Job3"),Localized(@"Job4"),Localized(@"Job5")];
    vc.completionBlock = ^(NSMutableDictionary *area) {
        SelectedPost = area;
        NSLog(@"%@",area);
           if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
        self.postAppliedForTxtField.text = [SelectedPost valueForKey:@"title_ar"];
           }else{
               self.postAppliedForTxtField.text = [SelectedPost valueForKey:@"title"];

           }
    };
    
    [self presentPopupViewController:vc animationType:MJPopupViewAnimationSlideBottomTop dismissed:nil];
}
- (IBAction)maritalStatusAction:(id)sender {
    AllPopViewController *vc = [[AllPopViewController alloc] initWithNibName:@"AllPopViewController" bundle:nil];
    vc.delegate=self;
    vc.From = @"MARITALSTATUS";
    vc.areasList = @[Localized(@"Married"),Localized(@"Single"),Localized(@"Seperated"),Localized(@"Divorced"),Localized(@"Dependents")];
    vc.completionBlockS = ^(NSString *area) {
        NSLog(@"%@",area);
        self.maritalStatusTxtField.text = area;
    };
    
    [self presentPopupViewController:vc animationType:MJPopupViewAnimationSlideBottomTop dismissed:nil];
}
- (IBAction)doyouworknowYesAction:(id)sender {
    doYouWorkNow = YES;
    [_doyouworknowYesBtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
    [_doyouworknowNoBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
}

- (IBAction)doyouworknowNoAction:(id)sender {
    doYouWorkNow = NO;
    [_doyouworknowYesBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
    [_doyouworknowNoBtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
}
- (IBAction)areyouEmployeedYesAction:(id)sender {
     areyouEmployed = YES;
    [self.areyouEmployeedYesView setHidden:NO];
    self.areyouemployeeedViewHeight.constant=60;
    [_areyouEmployeedYesBtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
    [_areyouEmployeedNoBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
    _scrollview.contentSize= CGSizeMake(_scrollview.frame.size.width, _currentEmployeeView.frame.size.height+60);
    [_scrollview setNeedsDisplay];
}

- (IBAction)areyouEmployeedNoAction:(id)sender {
    areyouEmployed = NO;
    [self.areyouEmployeedYesView setHidden:YES];
    self.areyouemployeeedViewHeight.constant=0;
    [_areyouEmployeedYesBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
    [_areyouEmployeedNoBtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
    _scrollview.contentSize= CGSizeMake(_scrollview.frame.size.width, _currentEmployeeView.frame.size.height-60);
    [_scrollview setNeedsDisplay];
}
- (IBAction)mayweContactyourCurrentEmployerYesBtnAction:(id)sender {
    mayContactyourPrevious = YES;
    [self.reference1View setHidden:NO];
    self.referenceView1Height.constant=273;
    [_mayweContactyourCurrentEmployerYesBtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
    [_mayweContactyourCurrentEmployerNoBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
    _scrollview.contentSize= CGSizeMake(_scrollview.frame.size.width, _currentEmployeeView.frame.size.height+273);
    [_scrollview setNeedsDisplay];
}

- (IBAction)mayweContactyourCurrentEmployerNoBtnAction:(id)sender {
    mayContactyourPrevious = NO;
    [self.reference1View setHidden:YES];
    self.referenceView1Height.constant=0;
    [_mayweContactyourCurrentEmployerYesBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
    [_mayweContactyourCurrentEmployerNoBtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
    _scrollview.contentSize= CGSizeMake(_scrollview.frame.size.width, _currentEmployeeView.frame.size.height-273);
    [_scrollview setNeedsDisplay];
}
- (IBAction)beforeappliedYesBtnAction:(id)sender {
    areyouappliedBefore = YES;
    [self.areYouAppliedYesView setHidden:NO];
    self.areyouAppliedYesViewHeight.constant=65;
    [_beforeappliedYesBtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
    [_beforeappliedNoBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
    _scrollview.contentSize= CGSizeMake(_scrollview.frame.size.width, _currentEmployeeView.frame.size.height+65);
    [_scrollview setNeedsDisplay];
}

- (IBAction)beforeappliedNoBtnAction:(id)sender {
    areyouappliedBefore = NO;
    [self.areYouAppliedYesView setHidden:YES];
    self.areyouAppliedYesViewHeight.constant=0;
    [_beforeappliedYesBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
    [_beforeappliedNoBtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
    _scrollview.contentSize= CGSizeMake(_scrollview.frame.size.width, _currentEmployeeView.frame.size.height-65);
    [_scrollview setNeedsDisplay];
}
- (IBAction)relitivesinCompanyYesBtnAction:(id)sender;{
    haveRelatives = YES;
    _relitivesYesView.hidden = NO;
    _relitivesViewHeight.constant = 65;
    [_relitivesinCompanyYesBtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
    [_relitivesinCompanyNoBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
    _scrollview.contentSize= CGSizeMake(_scrollview.frame.size.width, _currentEmployeeView.frame.size.height+65);
    [_scrollview setNeedsDisplay];
}
- (IBAction)relitivesinCompanyNoBtnAction:(id)sender;{
    haveRelatives = NO;
    _relitivesYesView.hidden = YES;
    _relitivesViewHeight.constant = 0;
    [_relitivesinCompanyYesBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
    [_relitivesinCompanyNoBtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
    _scrollview.contentSize= CGSizeMake(_scrollview.frame.size.width, _currentEmployeeView.frame.size.height-65);
    [_scrollview setNeedsDisplay];
}
- (IBAction)whenAction:(id)sender {
    dateFrom = @"WHEN";
    [self.whenTxtfiled becomeFirstResponder];
}
- (IBAction)englishAction:(id)sender {
    AllPopViewController *vc = [[AllPopViewController alloc] initWithNibName:@"AllPopViewController" bundle:nil];
    vc.delegate=self;
    vc.From = @"ENGLISH";
    vc.areasList = @[Localized(@"Excellent"),Localized(@"Good"),Localized(@"Fair")];
    vc.completionBlockS = ^(NSString *area) {
        NSLog(@"%@",area);
        self.englishTxtfield.text = area;
    };
    
    [self presentPopupViewController:vc animationType:MJPopupViewAnimationSlideBottomTop dismissed:nil];
}

- (IBAction)otherAction:(id)sender {
    AllPopViewController *vc = [[AllPopViewController alloc] initWithNibName:@"AllPopViewController" bundle:nil];
    vc.delegate=self;
    vc.From = @"OTHER";
    vc.areasList = @[Localized(@"Excellent"),Localized(@"Good"),Localized(@"Fair")];
    vc.completionBlockS = ^(NSString *area) {
        NSLog(@"%@",area);
        self.otherTxtField.text = area;
    };
    
    [self presentPopupViewController:vc animationType:MJPopupViewAnimationSlideBottomTop dismissed:nil];
}
- (IBAction)msofficeAction:(id)sender {
    AllPopViewController *vc = [[AllPopViewController alloc] initWithNibName:@"AllPopViewController" bundle:nil];
    vc.delegate=self;
    vc.From = @"MSOFFICE";
    vc.areasList = @[Localized(@"Excellent"),Localized(@"Good"),Localized(@"Fair")];
    vc.completionBlockS = ^(NSString *area) {
        NSLog(@"%@",area);
        self.msofficeTxtFied.text = area;
    };
    
    [self presentPopupViewController:vc animationType:MJPopupViewAnimationSlideBottomTop dismissed:nil];
}
- (IBAction)typingAction:(id)sender {
    AllPopViewController *vc = [[AllPopViewController alloc] initWithNibName:@"AllPopViewController" bundle:nil];
    vc.delegate=self;
    vc.From = @"TYPING";
    vc.areasList = @[Localized(@"Excellent"),Localized(@"Good"),Localized(@"Fair")];
    vc.completionBlockS = ^(NSString *area) {
        NSLog(@"%@",area);
        self.typingTxtfield.text = area;
    };
    
    [self presentPopupViewController:vc animationType:MJPopupViewAnimationSlideBottomTop dismissed:nil];
}

- (IBAction)graduatedDateAction:(id)sender {
    dateFrom = @"G1";
    [self.dateGraduatedTxtField becomeFirstResponder];
}

- (IBAction)graduatedDateAction2:(id)sender {
    dateFrom = @"G2";
    [self.dateGraduated2TxtField becomeFirstResponder];
}

- (IBAction)graduatedDateAction3:(id)sender {
    dateFrom = @"G3";
    [self.dateGraduated3TxtField becomeFirstResponder];
}

- (IBAction)graduatedDateAction4:(id)sender {
    dateFrom = @"G4";
    [self.dateGraduated4TxtField becomeFirstResponder];
}
- (IBAction)arabicAction:(id)sender;{
    AllPopViewController *vc = [[AllPopViewController alloc] initWithNibName:@"AllPopViewController" bundle:nil];
    vc.delegate=self;
    vc.From = @"ARABIC";
    vc.areasList = @[Localized(@"Excellent"),Localized(@"Good"),Localized(@"Fair")];
    vc.completionBlockS = ^(NSString *area) {
        NSLog(@"%@",area);
        self.arabicTxtField.text = area;
    };
    
    [self presentPopupViewController:vc animationType:MJPopupViewAnimationSlideBottomTop dismissed:nil];
}

- (IBAction)fromAction:(id)sender {
    dateFrom = @"FROM1";
    [self.fromTxtField becomeFirstResponder];
}
- (IBAction)from2Action:(id)sender {
    dateFrom = @"FROM2";
    [self.from2TxtField becomeFirstResponder];
}

- (IBAction)from3Action:(id)sender {
    dateFrom = @"FROM3";
    [self.from3TxtField becomeFirstResponder];
}

- (IBAction)toAction:(id)sender {
    dateFrom = @"TO1";
    [self.totextField becomeFirstResponder];
}
- (IBAction)to2Action:(id)sender {
    dateFrom = @"TO2";
    [self.to2textField becomeFirstResponder];
}
- (IBAction)to3Action:(id)sender {
    dateFrom = @"TO3";
    [self.to3textField becomeFirstResponder];
}
- (IBAction)startAction:(id)sender {
}
- (IBAction)lastBtnAction:(id)sender {
}

//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    if(textField==self.telephoneTxtField){
//        NSString *currentString = [textField.text stringByReplacingCharactersInRange:range withString:string];
//        int length = [currentString length];
//        if (length > 8) {
//            return NO;
//        }
//    }else  if(textField==self.mobileTxtField){
//        NSString *currentString = [textField.text stringByReplacingCharactersInRange:range withString:string];
//        int length = [currentString length];
//        if (length > 8) {
//            return NO;
//        }
//    }
//    return YES;
//    
//}


- (void)sendtoServer:(NSString *)json {
    if (![Utils isOnline]) {
        [Utils showErrorAlertWithMessage:[MCLocalization stringForKey:@"internet_error"]];
        return;
    }
    
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeGradient];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:[[Utils createURLForPage:EMPLOYEE_REQUEST withParameters:nil] absoluteString] parameters:@{@"member_id":[Utils loggedInUserIdStr],@"content":json} progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        [SVProgressHUD dismiss];
        NSLog(@"%@",responseObject);
        [self.navigationController popToRootViewControllerAnimated:YES];
        [Utils showAlertWithMessage:[MCLocalization stringForKey:@" Sent Sucessfully"]];

    } failure:^(NSURLSessionTask *operation, NSError *error) {
        [SVProgressHUD dismiss];
        NSLog(@"Error: %@", error);
        
        [self showErrorAlertWithMessage:[error localizedDescription]];
    }];
}
- (void)uploadImagesWithProgressWithId:(NSString *)json {
    
    //http://clients.yellowsoft.in/lawyers/api/add-member-image.php
    
    NSString *serverURL = [NSString stringWithFormat:@"%@/%@", SERVER_URL,EMPLOYEE_REQUEST];
    
    //    NSDictionary *parameters = @{@"inventory_id":_InvId};
    NSDictionary *parameters = @{@"member_id":[Utils loggedInUserIdStr],@"content":json};
    
    
    //    UIImage *image = Upload_Image1;
    UIImage *image = [UIImage imageWithCGImage:self.resumeImage.image.CGImage scale:0.25 orientation:_resumeImage.image.imageOrientation];
  
    
    
    
    if (image == nil) {
        [self hideHUD];
        // [Utils showAlertWithMessage:[MCLocalization stringForKey:@"Sent Sucessfully"]];
        // [self.navigationController popViewControllerAnimated:YES];
        [self sendtoServer:json];
        return;
    }
    
    
    // image = [image resizedImageToFitInSize:CGSizeMake(960, 640) scaleIfSmaller:NO];
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:serverURL parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        [formData appendPartWithFileData:UIImagePNGRepresentation(image)
                                    name:@"file1"
                                fileName:@"file.png"
                                mimeType:@"image/png"];
       
        
    } error:nil];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionUploadTask *uploadTask;
    
    uploadTask = [manager uploadTaskWithStreamedRequest:request
                                               progress:^(NSProgress * _Nonnull uploadProgress) {
                                                   dispatch_async(dispatch_get_main_queue(), ^{
                                                       [SVProgressHUD showProgress:uploadProgress.fractionCompleted];
                                                   });
                                               }
                                      completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                                          if (error) {
                                              NSLog(@"Failure %@", error.description);
                                              [self hideHUD];
                                              [Utils showErrorAlertWithMessage:[MCLocalization stringForKey:@"Error While Posting"]];
                                              
                                          } else {
                                              
                                              NSLog(@"Success %@", responseObject);
                                              
                                              [self hideHUD];
                                              //                                              [self.navigationController popViewControllerAnimated:YES];
                                              //                                              [Utils showAlertWithMessage:[MCLocalization stringForKey:@" Sent Sucessfully"]];
                                              [self.navigationController popToRootViewControllerAnimated:YES];

                                              [self showSuccessMessage:Localized(@"Sent Sucessfully")];

                                          }
                                      }];
    
    
    
    [uploadTask resume];
}


- (IBAction)unversitySwitchAction:(id)sender {
    if(!_universitySwitch.isOn){
        _heightUniversityView.constant=0;
        _unversityView.hidden=YES;
        
//        _nameoftheSchool3TxtField.text=@"";
//         _yearsAttended3TxtField.text=@"";
//        _dateGraduated3TxtField.text=@"";
//        _cartificate3TxtField.text=@"";

        _scrollview.contentSize= CGSizeMake(_scrollview.frame.size.width, _qualifocationView.frame.size.height-205);
        [_scrollview setNeedsDisplay];
        
    }else{
        _heightUniversityView.constant=205;
        _unversityView.hidden=NO;
        _scrollview.contentSize= CGSizeMake(_scrollview.frame.size.width, _qualifocationView.frame.size.height+205);
        [_scrollview setNeedsDisplay];
    }
   
}
- (IBAction)professionalSwitchAction:(id)sender {
    if(!_professionalSwitch.isOn){
        _professionalViewHeight.constant=0;
        _professionalView.hidden=YES;
//        _nameoftheSchool4TxtField.text=@"";
//        _yearsAttended4TxtField.text=@"";
//        _dateGraduated4TxtField.text=@"";
//        _cartificate4TxtField.text=@"";
        _scrollview.contentSize= CGSizeMake(_scrollview.frame.size.width, _qualifocationView.frame.size.height-205);
        [_scrollview setNeedsDisplay];
    }else{
        _professionalViewHeight.constant=205;
        _professionalView.hidden=NO;
        _scrollview.contentSize= CGSizeMake(_scrollview.frame.size.width, _qualifocationView.frame.size.height+205);
        [_scrollview setNeedsDisplay];
    }
 
}
- (IBAction)whencanyouStartBtnAction:(id)sender {
    dateFrom = @"WHENYOUSTART";
    [self.whenCanyouStartTxtField becomeFirstResponder];
}
- (IBAction)resumeBtnAction:(id)sender {
    selectedImage=@"0";
    [self imageSelection:sender];
}
-(void)imageSelection:(id)sender{
    
    // if (!_userPicker) {
    _userPicker = [[UIImagePickerController alloc] init];
    _userPicker.delegate = self;
    //}
    
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:Localized(@"Select Image") message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [controller addAction:[UIAlertAction actionWithTitle:Localized(@"Camera") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        _userPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:_userPicker animated:YES completion:nil];
    }]];
    [controller addAction:[UIAlertAction actionWithTitle:Localized(@"Gallery") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        _userPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:_userPicker animated:YES completion:nil];
    }]];
    [controller addAction:[UIAlertAction actionWithTitle:Localized(@"Cancel") style:UIAlertActionStyleCancel handler:nil]];
    
    [self presentViewController:controller animated:YES completion:nil];
    
}
- (void)imagePickerController:(UIImagePickerController *)picker2 didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    PECropViewController *controller = [[PECropViewController alloc] init];
    controller.image = image;
    controller.delegate = self;
    controller.keepingCropAspectRatio = YES;
    controller.toolbarHidden = YES;
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
    [self presentViewController:navigationController animated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)cropViewControllerDidCancel:(PECropViewController *)controller {
    [controller dismissViewControllerAnimated:YES completion:NULL];
}

- (void)cropViewController:(PECropViewController *)controller didFinishCroppingImage:(UIImage *)image {
    [controller dismissViewControllerAnimated:YES completion:NULL];
    
    if (image != nil) {
        if([selectedImage isEqualToString:@"0"]){
            [_resumeBtn setHidden:YES];
            self.resumeImage.image = image;
        }
        Upload_Image2 = image;
    }
}
UIImage *Upload_Image2;

- (IBAction)selectSubCategoryBtnAction:(id)sender {
    if([SelectedPost valueForKey:@"id"]){
    AllPopViewController *vc = [[AllPopViewController alloc] initWithNibName:@"AllPopViewController" bundle:nil];
    vc.delegate=self;
    vc.From = @"SUBPOSTAPPLY";
    vc.cat_id = [SelectedPost valueForKey:@"id"];

    vc.completionBlock = ^(NSMutableDictionary *area) {
        SelectedSubPost = area;
        NSLog(@"%@",area);
      
        
        _otherSubCategoryTxtFiled.text=@"";
        if([[area valueForKey:@"id"] isEqual:@"0"]){
            _whencanYouStartTop.constant=75;
            _otherSubCategoryLbl.hidden=NO;
            _otherSubCategoryTxtFiled.hidden=NO;
        }else{
            
            _whencanYouStartTop.constant=20;
            _otherSubCategoryLbl.hidden=YES;
            _otherSubCategoryTxtFiled.hidden=YES;
        }
        if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
            self.selectSubcategoryTxtfiled.text = [SelectedSubPost valueForKey:@"title_ar"];
        }else{
            self.selectSubcategoryTxtfiled.text = [SelectedSubPost valueForKey:@"title"];
            
        }
    };
    
    [self presentPopupViewController:vc animationType:MJPopupViewAnimationSlideBottomTop dismissed:nil];
    }else{
        [self showErrorAlertWithMessage:Localized(@"Please Select Post")];
    }
}
@end
