//
//  EmployeeRequestViewController.m
//  YEMNAK
//
//  Created by apple on 10/07/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import "EmployeeRequestViewController.h"
#import "AllPopViewController.h"
#import "UIViewController+MJPopupViewController.h"
#import "PECropViewController.h"
#import "AFNetworking.h"
#import "SVProgressHUD.h"
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"
#import "MembersViewController.h"
#import "SelectServiceViewController.h"
#import "PaymentViewController.h"
#import "LoginViewController.h"
@interface EmployeeRequestViewController ()<PopViewControllerDelegate>
{
     int i;
    UIButton *rightbutton;
    NSString *selectedImage;
    NSMutableDictionary *selectedPost;
    NSMutableDictionary *selectedSubPost;

    UIColor *placeholderColor;
    NSString *selectedage;
    NSMutableDictionary *age;
    NSString *gender;
     NSString *locality;
    
    NSMutableArray *selectedAges;
    NSString *ageIds;
}
@property (strong, nonatomic) IBOutlet UIImagePickerController *userPicker;

@end

@implementation EmployeeRequestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    gender = @"male";
    locality = @"local";
    placeholderColor = PLACEHOLDER_COLOR;
    [_view1 setHidden:NO];
    [_view2 setHidden:YES];
    [_view3 setHidden:YES];
    i =1;
    
    _view1.alpha=1.0;
    _view2.alpha=1.0;
    _view3.alpha=1.0;
    
    _entercomapanyDetails.text= Localized(@"Enter Company Details");
    _manpowerLbl.text = Localized(@"Enter Manpower Request");
    _reqiureDocumentsLbl.text = Localized(@"Require Documents");
    
    
    // Do any additional setup after loading the view.
    self.navigationItem.title=Localized(@"Corporate Form Request");
    _phoneNumberTxtField.delegate=self;
   // _contactNumberTxtField.delegate=self;
    self.companyNameTxtfield.text=@"";
    self.companyNameTxtfield.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Company Name")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    self.phoneNumberTxtField.text=@"";
    self.phoneNumberTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Phone Number")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    self.addressTxtField.text=@"";
    self.addressTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Address")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    self.contactPersonTxtField.text=@"";
    self.contactPersonTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Contact Person")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    [self.addyourRequirementBtn setTitle:Localized(@"Add your Requirement") forState:UIControlStateNormal];
    self.addyourRequirementBtn.layer.cornerRadius = self.addyourRequirementBtn.frame.size.height/2;
    self.addyourRequirementBtn.clipsToBounds = YES;
    self.addyourRequirementBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    self.addyourRequirementBtn.layer.borderWidth = 2;
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
    
//    _noteLbl.text=[NSString stringWithFormat:@"%@:%@",Localized(@"Note"),Localized(@"Working hours 8 hrs/ day") ];
    _noteLbl.text = Localized(@"Note:Working hours 8 hrs/day");
//    _otherTCLbl.text=[NSString stringWithFormat:@"%@:%@",Localized(@"Other terms & conditions"),Localized(@"As per Kuwait Labour Law") ];
    _otherTCLbl.text = Localized(@"Other terms and conditions:As per Kuwait Labour Law");
    [self viewSecond];
    [self viewThrid];
    
    // form list
    if([_from  isEqual: @"List"]){
        [self stopUserintereaction];
    }
    [self showFirstView];
    
}
-(void)showFirstView{
    _scrollView.contentSize= CGSizeMake(_scrollView.frame.size.width, _view1.frame.size.height);
    [self.scrollView setContentOffset:CGPointZero animated:YES];
    [self.scrollView setNeedsDisplay];
}
-(void)viewWillAppear:(BOOL)animated{
    
}
-(void)stopUserintereaction{
    NSLog(@"%@",_details);
    _companyNameTxtfield.userInteractionEnabled = NO;
    _phoneNumberTxtField.userInteractionEnabled = NO;
    _addressTxtField.userInteractionEnabled = NO;
    _contactPersonTxtField.userInteractionEnabled = NO;
    
    [_addyourRequirementBtn  setTitle:Localized(@"NEXT") forState:UIControlStateNormal];
    
    _selectCategoriesTxtfield.userInteractionEnabled = NO;
    _numberOfWorkersTxtfield.userInteractionEnabled = NO;
    _salaryTxtfield.userInteractionEnabled = NO;
    _otherBenfits.userInteractionEnabled = NO;
    
    _categoryBtn.userInteractionEnabled = NO;
    _numberOfWorkersBtn.userInteractionEnabled = NO;

    
    [_uploadDocBtn  setTitle:Localized(@"NEXT") forState:UIControlStateNormal];

    _emailAddresstxtFiedl.userInteractionEnabled = NO;
 //   _contactNumberTxtField.userInteractionEnabled = NO;
 //   _companyAddressTxtField.userInteractionEnabled = NO;
    _licenceBtn.userInteractionEnabled = NO;
    _civilBtn.userInteractionEnabled = NO;
    _authorisedBtn.userInteractionEnabled = NO;
    _licenseMainBtn.userInteractionEnabled = NO;
    _civilMainBtn.userInteractionEnabled = NO;
    _authorisedMainBtn.userInteractionEnabled = NO;
   _tradeLicensetxtField.userInteractionEnabled = NO;
       _authourizedSignatoryTxtField.userInteractionEnabled = NO;
       _civilIDCopyTxtField.userInteractionEnabled = NO;

    
    [_submitBtn setHidden:YES];
    
    
    //1
    _companyNameTxtfield.text=[_details valueForKey:@"company_name"];
    _phoneNumberTxtField.text=[_details valueForKey:@"phone_number"];
    _addressTxtField.text=[_details valueForKey:@"address"];
    _contactPersonTxtField.text=[_details valueForKey:@"contact_person"];
    
    _selectCategoriesTxtfield.text = [_details valueForKey:@"selected_categories"];

    _numberOfWorkersTxtfield.text = [_details valueForKey:@"number_of_workers"];
    _salaryTxtfield.text = [_details valueForKey:@"salary"];
    _otherBenfits.text = [_details valueForKey:@"other_benefits"];
    
    [_licenseImage setImageWithURL:[_details valueForKey:@"image1"] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [_authorisedImage setImageWithURL:[_details valueForKey:@"image2"] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [_civilImage setImageWithURL:[_details valueForKey:@"image3"] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    _emailAddresstxtFiedl.text=[_details valueForKey:@"email_address"];
//     _contactNumberTxtField.text=[_details valueForKey:@"contact_number"];
//     _companyAddressTxtField.text=[_details valueForKey:@"company_address"];

    
    
    
}
-(void)back{
    if(i == 1){
         if([_from  isEqual: @"List"]){
               [self.navigationController popViewControllerAnimated:YES];
         }else{
    //[self.navigationController popViewControllerAnimated:YES];
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:nil message:Localized(@"The Entire Data will be lossed ") preferredStyle:UIAlertControllerStyleAlert];
    [controller addAction:[UIAlertAction actionWithTitle:Localized(@"ok") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self.navigationController popViewControllerAnimated:YES];
        
    }]];
    [controller addAction:[UIAlertAction actionWithTitle:Localized(@"Cancel") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
    }]];
    [self presentViewController:controller animated:YES completion:nil];
         }
    }else if(i ==2){
        [_view1 setHidden:NO];
        [_view2 setHidden:YES];
        [_view3 setHidden:YES];
        i =1;
        _scrollView.contentSize= CGSizeMake(_scrollView.frame.size.width, _view1.frame.size.height);
        [self.scrollView setContentOffset:CGPointZero animated:YES];
        [self.scrollView setNeedsDisplay];
    }else if(i == 3){
        [self AddyourReqiurementAction:nil];
    }

}
-(void)viewThrid{
   // [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title=Localized(@"Corporate Request");
    self.tradeLicensetxtField.text=@"";
    self.tradeLicensetxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Trade License")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    self.authourizedSignatoryTxtField.text=@"";
    self.authourizedSignatoryTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Authorised Signatory")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    self.civilIDCopyTxtField.text=@"";
    self.civilIDCopyTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Civil ID Copy")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    self.visaQuota.text=@"";
    self.visaQuota.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Visa Quota")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    self.emailAddresstxtFiedl.text=@"";
    self.emailAddresstxtFiedl.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Email Address")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    
    self.addCommentTxtView.text = @"";
    self.addCommentTxtView.placeholder = Localized(@"Write comment here");
    self.addCommentTxtView.placeholderTextColor = placeholderColor;
    
    self.serviceChargeLbl.text = Localized(@"Service Charges");
    NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [currentDefaults objectForKey:@"SETTINGS"];
    NSDictionary *Settings = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    //NSDictionary *Settings=[[NSUserDefaults standardUserDefaults] valueForKey:@"SETTINGS"];
    self.servicePriceLbl.text = [NSString stringWithFormat:@"%@ %@",[Settings valueForKey:@"corporate_req_amount"],Localized(@"KD")];

//    self.contactNumberTxtField.text=@"";
//    self.contactNumberTxtField.attributedPlaceholder =
//    [[NSAttributedString alloc]
//     initWithString:Localized(@"Contact Number")
//     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
//    self.companyAddressTxtField.text=@"";
//    self.companyAddressTxtField.attributedPlaceholder =
//    [[NSAttributedString alloc]
//     initWithString:Localized(@"Company Address")
//     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    [self.submitBtn setTitle:Localized(@"Submit") forState:UIControlStateNormal];
    self.submitBtn.layer.cornerRadius = self.submitBtn.frame.size.height/2;
    self.submitBtn.clipsToBounds = YES;
    self.submitBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    self.submitBtn.layer.borderWidth = 2;

//    _disclaimarTxtView.text=[NSString stringWithFormat:@"%@:%@",Localized(@"Disclaimer"),Localized(@"Any candidates from International Group of Aamina that has been rejected for any reasons and found that is working under within six-month period of time,International group of Aamina has the right to collect the SERVICE FEE per the applicants as agreed to our local agreement.") ];
//
    _disclimarTxtView.text = Localized(@"Disclaimer:Any candidates from International Group of Aamina that has been rejected for any reasons and found that is working under within six month period of time,International group of Aamina has the right to collect the SERVICE FEE per the applicants a");
      _disclaimarTxtView.text = Localized(@"Disclaimer:Any candidates from International Group of Aamina that has been rejected for any reasons and found that is working under within six month period of time,International group of Aamina has the right to collect the SERVICE FEE per the applicants a");
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    if(textField==self.phoneNumberTxtField){
//        NSString *currentString = [textField.text stringByReplacingCharactersInRange:range withString:string];
//        int length = [currentString length];
//        if (length > 8) {
//            return NO;
//        }
//    }else if(textField==self.contactNumberTxtField){
//        NSString *currentString = [textField.text stringByReplacingCharactersInRange:range withString:string];
//        int length = [currentString length];
//        if (length > 8) {
//            return NO;
//        }
//    }
//    return YES;
//    
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)viewSecond{
    
    self.genderLbl.text=Localized(@"Gender");
    self.maleLbl.text =Localized(@"Male");
    self.femaleLbl.text=Localized(@"Female");
    self.bothGenderLbl.text=Localized(@"Both");

    self.localityLbl.text=Localized(@"Locality");
    self.localLbl.text =Localized(@"Local");
    self.overseasLbl.text=Localized(@"Overseas");
    self.agetxtfiled.text=@"";
    self.agetxtfiled.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Select Age")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    self.subCategoryTxtField.text=@"";
    self.subCategoryTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Select Subcategory")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    self.selectCategoriesTxtfield.text=@"";
    self.selectCategoriesTxtfield.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Select Categories")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    self.otherSubcategoryTxtField.text=@"";
    self.otherSubcategoryTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Enter Other Subcategory")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    self.numberOfWorkersTxtfield.text=@"";
    self.numberOfWorkersTxtfield.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"No.of Workers")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    self.salaryTxtfield.text=@"";
    self.salaryTxtfield.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Salary")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    self.otherBenfits.text=@"";
    self.otherBenfits.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Other Benefits")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    [self.uploadDocBtn setTitle:Localized(@"Upload your Company Papers") forState:UIControlStateNormal];
    self.uploadDocBtn.layer.cornerRadius = self.uploadDocBtn.frame.size.height/2;
    self.uploadDocBtn.clipsToBounds = YES;
    self.uploadDocBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    self.uploadDocBtn.layer.borderWidth = 2;
     _disclimarTxtView.text=[NSString stringWithFormat:@"%@:%@",Localized(@"Disclaimer"),Localized(@"Any candidates from International Group of Aamina that has been rejected for any reasons and found that is working under within six-month period of time,International group of Aamina has the right to collect the SERVICE FEE per the applicants as agreed to our local agreement.") ];
    _numberWorkersTop.constant=20;
    _otherSubcatLbl.hidden=YES;
    _otherSubcategoryTxtField.hidden=YES;
}
- (IBAction)AddyourReqiurementAction:(id)sender {
    [_view1 setHidden:YES];
    [_view2 setHidden:NO];
    [_view3 setHidden:YES];
      i=2;
    _scrollView.contentSize= CGSizeMake(_scrollView.frame.size.width, _view2.frame.size.height);
    [self.scrollView setContentOffset:CGPointZero animated:YES];
    [self.scrollView setNeedsDisplay];
}

- (IBAction)categoriesAction:(id)sender {
    AllPopViewController *vc = [[AllPopViewController alloc] initWithNibName:@"AllPopViewController" bundle:nil];
    vc.delegate=self;
    vc.From = @"POSTAPPLY";
    vc.areasList = @[Localized(@"Job1"),Localized(@"Job2"),Localized(@"Job3"),Localized(@"Job4"),Localized(@"Job5")];
    vc.completionBlock = ^(NSMutableDictionary *area) {
        selectedPost = area;
        NSLog(@"%@",area);
        if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
            self.selectCategoriesTxtfield.text = [selectedPost valueForKey:@"title_ar"];
        }else{
            self.selectCategoriesTxtfield.text = [selectedPost valueForKey:@"title"];
            
        }
    };
    
    [self presentPopupViewController:vc animationType:MJPopupViewAnimationSlideBottomTop dismissed:nil];
}
- (IBAction)numberofWorkersAction:(id)sender {
    AllPopViewController *vc = [[AllPopViewController alloc] initWithNibName:@"AllPopViewController" bundle:nil];
    vc.delegate=self;
    vc.From = @"NUMBEROFWORKERS";
    vc.areasList = @[Localized(@"1"),Localized(@"2"),Localized(@"3"),Localized(@"4"),Localized(@"5"),Localized(@"6"),Localized(@"7"),Localized(@"8")];
    vc.completionBlockS = ^(NSString *area) {
        NSLog(@"%@",area);
        self.numberOfWorkersTxtfield.text = area;
    };
    
    [self presentPopupViewController:vc animationType:MJPopupViewAnimationSlideBottomTop dismissed:nil];
}
- (IBAction)uploadDocBtnAction:(id)sender {
    [_view1 setHidden:YES];
 [_view2 setHidden:YES];
    [_view3 setHidden:NO];
    i= 3;
    _scrollView.contentSize= CGSizeMake(_scrollView.frame.size.width, _view3.frame.size.height);
    [self.scrollView setContentOffset:CGPointZero animated:YES];
    [self.scrollView setNeedsDisplay];
}
- (void)cancelButtonClicked:(UIViewController *)secondDetailViewController {
    [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationSlideTopBottom];
}

- (IBAction)tradeLicenseAction:(id)sender {
    selectedImage=@"0";
    [self imageSelection:sender];
}
- (IBAction)authourizedSignatoryAction:(id)sender {
    selectedImage=@"1";
    [self imageSelection:sender];
}
- (IBAction)civilIDAction:(id)sender {
    selectedImage=@"2";
    [self imageSelection:sender];
}

- (IBAction)visaAction:(id)sender {
    selectedImage=@"3";
    [self imageSelection:sender];
}
- (IBAction)submitBtnAction:(id)sender {
    if([Utils loggedInUserId] != -1)
    {
    [self loadData];
        }else{
            //[self showErrorAlertWithMessage:Localized(@"Please Login To ")];
            LoginViewController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
            [self.navigationController pushViewController:obj animated:YES];
        }
}
-(void)loadData{
    if([self CheckValidation]){
    NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
        NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
        NSData *data2 = [currentDefaults objectForKey:@"SETTINGS"];
        NSDictionary *Settings = [NSKeyedUnarchiver unarchiveObjectWithData:data2];
    [dict setValue:[NSString stringWithFormat:@"%@",[Settings valueForKey:@"corporate_req_amount"]] forKey:@"service_amount"];

    [dict setValue:_companyNameTxtfield.text forKey:@"company_name"];
    [dict setValue:_phoneNumberTxtField.text forKey:@"phone_number"];
    [dict setValue:_addressTxtField.text forKey:@"address"];
    [dict setValue:_contactPersonTxtField.text forKey:@"contact_person"];
   
    
    [dict setValue:[selectedPost valueForKey:@"id"] forKey:@"selected_categories"];
        [dict setValue:[selectedSubPost valueForKey:@"id"] forKey:@"selected_subcategories"];
        [dict setValue:_otherSubcategoryTxtField.text forKey:@"other_selected_subcategories"];

    [dict setValue:_numberOfWorkersTxtfield.text forKey:@"number_of_workers"];
    [dict setValue:_salaryTxtfield.text forKey:@"salary"];
    [dict setValue:_otherBenfits.text forKey:@"other_benefits"];
    
    
    [dict setValue:_emailAddresstxtFiedl.text forKey:@"email_address"];
//    [dict setValue:_contactNumberTxtField.text forKey:@"contact_number"];
    [dict setValue:ageIds forKey:@"age"];
            [dict setValue:_addCommentTxtView.text forKey:@"comment"];

    [dict setValue: [gender  isEqual: @"male"]? @"0":[gender  isEqual: @"female"]? @"1":@"2" forKey:@"gender"];
        [dict setValue:locality forKey:@"locality"];
        [dict setValue:@"iPhone" forKey:@"device_type"];

    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
    NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"json: %@", json);
    //[self sendtoServer:json];
    [self uploadImagesWithProgressWithId:json];
    }
}
-(BOOL)CheckValidation{
    
    if(_companyNameTxtfield.text.length==0){
        [self showErrorAlertWithMessage:Localized(@"Enter CompanyName")];
        return NO;
    }else if(_phoneNumberTxtField.text.length==0){
        [self showErrorAlertWithMessage:Localized(@"Enter PhoneNumber")];
        return NO;
    }else if(_addressTxtField.text.length==0){
        [self showErrorAlertWithMessage:Localized(@"Enter Address")];
        return NO;
    }else if(_contactPersonTxtField.text.length==0){
        [self showErrorAlertWithMessage:Localized(@"Enter ContactPerson Details")];
        return NO;
    }else if(selectedPost.count==0){
        [self showErrorAlertWithMessage:Localized(@"Select Category")];
        return NO;
    }else if(selectedSubPost.count==0){
        [self showErrorAlertWithMessage:Localized(@"Select SubCategory")];
        return NO;
    }else if(_numberOfWorkersTxtfield.text.length==0){
        [self showErrorAlertWithMessage:Localized(@"Selelct Number Of Workers")];
        return NO;
    }else if(_salaryTxtfield.text.length==0){
        [self showErrorAlertWithMessage:Localized(@"Enter Salary")];
        return NO;
    }else if(_otherBenfits.text.length==0){
        [self showErrorAlertWithMessage:Localized(@"Enter Other Benifts")];
        return NO;
    }else if(_emailAddresstxtFiedl.text.length==0){
        [self showErrorAlertWithMessage:Localized(@"Enter EmailAddress")];
        return NO;
    }
//    else if(_contactNumberTxtField.text.length==0){
//        [self showErrorAlertWithMessage:Localized(@"Enter ContactNumber")];
//        return NO;
//    }else if(_companyAddressTxtField.text.length==0){
//        [self showErrorAlertWithMessage:Localized(@"Enter CompanyAddress")];
//        return NO;
//    }
    
    else{
        return YES;
    }
}
- (void)sendtoServer:(NSString *)json {
    if (![Utils isOnline]) {
        [Utils showErrorAlertWithMessage:[MCLocalization stringForKey:@"internet_error"]];
        return;
    }
    
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeGradient];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:[[Utils createURLForPage:CORPORATE_REQUEST withParameters:nil] absoluteString] parameters:@{@"member_id":[Utils loggedInUserIdStr],@"content":json} progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        [SVProgressHUD dismiss];
        NSLog(@"%@",responseObject);
       // [self uploadImagesWithProgressWithId:@"1"];
        //[self.navigationController popViewControllerAnimated:YES];
        
        [self NeedToPay:[responseObject valueForKey:@"corporate_id"]];
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        [SVProgressHUD dismiss];
        NSLog(@"Error: %@", error);
        
        [self showErrorAlertWithMessage:[error localizedDescription]];
    }];
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
            [_licenceBtn setHidden:YES];
            self.licenseImage.image = image;
        }else if([selectedImage isEqualToString:@"1"]){
            [_authorisedBtn setHidden:YES];
            self.authorisedImage.image = image;
        }else if([selectedImage isEqualToString:@"2"]){
            [_civilBtn setHidden:YES];
            self.civilImage.image = image;
        }
        else if([selectedImage isEqualToString:@"3"]){
            [_visaBtn setHidden:YES];
            self.visaImage.image = image;
        }
        Upload_Image1 = image;
        
        
    }
}
UIImage *Upload_Image1;
- (void)uploadImagesWithProgressWithId:(NSString *)json {
    
    //http://clients.yellowsoft.in/lawyers/api/add-member-image.php
    
    NSString *serverURL = [NSString stringWithFormat:@"%@/%@", SERVER_URL,CORPORATE_REQUEST];
    
    //    NSDictionary *parameters = @{@"inventory_id":_InvId};
    NSDictionary *parameters = @{@"member_id":[Utils loggedInUserIdStr],@"content":json};
    
    
    //    UIImage *image = Upload_Image1;
    UIImage *image = [UIImage imageWithCGImage:self.licenseImage.image.CGImage scale:0.25 orientation:_licenseImage.image.imageOrientation];
    UIImage *image1 = [UIImage imageWithCGImage:self.authorisedImage.image.CGImage scale:0.25 orientation:_authorisedImage.image.imageOrientation];
    UIImage *image2 = [UIImage imageWithCGImage:self.civilImage.image.CGImage scale:0.25 orientation:_civilImage.image.imageOrientation];
    UIImage *image3 = [UIImage imageWithCGImage:self.visaImage.image.CGImage scale:0.25 orientation:_civilImage.image.imageOrientation];
    if([locality isEqualToString:@"overseas"] ){
        if(image3 == nil){
            [self showErrorAlertWithMessage:Localized(@"Please Add Visa")];
        }
    }
    
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
        [formData appendPartWithFileData:UIImagePNGRepresentation(image1)
                                    name:@"file2"
                                fileName:@"file.png"
                                mimeType:@"image/png"];
        [formData appendPartWithFileData:UIImagePNGRepresentation(image2)
                                    name:@"file3"
                                fileName:@"file.png"
                                mimeType:@"image/png"];
        [formData appendPartWithFileData:UIImagePNGRepresentation(image3)
                                    name:@"file4"
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
                                              [self NeedToPay:[responseObject valueForKey:@"corporate_id"]];
                                          }
                                      }];
    
    
    
    [uploadTask resume];
}

-(void)NeedToPay:(NSString *)bookingId{
    
    // NSDictionary *Settings=[[NSUserDefaults standardUserDefaults] valueForKey:@"SETTINGS"];
    NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [currentDefaults objectForKey:@"SETTINGS"];
    NSDictionary *Settings = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    PaymentViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"PaymentViewController"];
    vc.amount = [NSString stringWithFormat:@"%@",[Settings valueForKey:@"corporate_req_amount"]];
    vc.invoice_id = [NSString stringWithFormat:@"%@", bookingId];
    vc.pageName = @"corporates";
    vc.completionBlock = ^(NSString *status) {
        if ([status isEqualToString:@"success"]) {
            
            [self makePostCallForPage:CORPORATEREQUEST_PAYMENT_SUCCESS withParams:@{@"member_id":[Utils loggedInUserIdStr],
                                                                                    @"req_id":[NSString stringWithFormat:@"%@", bookingId]
                                                                                    } withRequestCode:2002];
            [self.navigationController popViewControllerAnimated:YES];
            //[self showSuccessMessage:Localized(@"Payment SucessFully")];
            [self showSuccessMessage:Localized(@"Sent Sucessfully")];
        } else {
            [Utils showErrorAlertWithMessage:Localized(@"payment_failed")];
        }
    };
    
    [self.navigationController pushViewController:vc animated:YES];
    
}



- (IBAction)maleAction:(id)sender {
    gender = @"male";
    [_maleBtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
    [_femaleBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
    [_bothGenderBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];

}

- (IBAction)femaleAction:(id)sender {
    gender = @"female";
    [_femaleBtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
    [_maleBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
    [_bothGenderBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];

}
- (IBAction)locationBtnAction:(id)sender {
    locality = @"local";
    [_localBtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
    [_overseasBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
}
- (IBAction)overseasBtnAction:(id)sender {
    locality = @"overseas";
    [_overseasBtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
    [_localBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
}

- (IBAction)ageBtnAction:(id)sender {
//    MembersViewController *vc = [[MembersViewController alloc] initWithNibName:@"MembersViewController" bundle:nil];
//    vc.delegate=self;
//    //    [self.navigationController pushViewController:vc animated:YES];
//    vc.from = @"age";
//    vc.completionBlock2 = ^(NSDictionary *sage ) {
//        age=sage;
//        selectedage=[age valueForKey:@"id"];
//
//        if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
//            self.agetxtfiled.text = [NSString stringWithFormat:@"%@",[age valueForKey:@"title_ar"]];
//
//        }else{
//            self.agetxtfiled.text = [NSString stringWithFormat:@"%@",[age valueForKey:@"title"]];
//
//        }
//    };
//    vc.completionBlock3 = ^(NSString *sage ) {
//        selectedage=sage;
//        if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
//            self.agetxtfiled.text = [NSString stringWithFormat:@"%@",sage];
//        }else{
//            self.agetxtfiled.text = [NSString stringWithFormat:@"%@",sage];
//        }
//    };
//    [self presentPopupViewController:vc animationType:MJPopupViewAnimationSlideBottomTop dismissed:nil];
    SelectServiceViewController *vc = [[SelectServiceViewController alloc] initWithNibName:@"SelectServiceViewController" bundle:nil];
    vc.delegate=self;
    vc.from = @"age";
    //    [self.navigationController pushViewController:vc animated:YES];
    vc.completionBlock = ^(NSMutableArray* services) {
        NSLog(@"%@",services);
        selectedAges =[[NSMutableArray alloc]init];
        
        selectedAges = services;
        ageIds=@"";
        NSString *str=@"";
        for(NSDictionary *dict in services){
            if(ageIds.length==0){
                ageIds =[NSString stringWithFormat:@"%@",[dict valueForKey:@"id"]];
                str =[NSString stringWithFormat:@"%@",[dict valueForKey:@"title"]];
                
            }else{
                ageIds =[NSString stringWithFormat:@"%@,%@",ageIds,[dict valueForKey:@"id"]];
                str =[NSString stringWithFormat:@"%@,%@",str,[dict valueForKey:@"title"]];
                
            }
        }
        self.agetxtfiled.text = str;
        
    };
    
    [self presentPopupViewController:vc animationType:MJPopupViewAnimationSlideBottomTop dismissed:nil];
}
- (IBAction)selectSubcategoryAction:(id)sender {
    if(selectedPost.count>0){
    AllPopViewController *vc = [[AllPopViewController alloc] initWithNibName:@"AllPopViewController" bundle:nil];
    vc.delegate=self;
    vc.From = @"SUBPOSTAPPLY";
    vc.cat_id = [selectedPost valueForKey:@"id"];
    vc.completionBlock = ^(NSMutableDictionary *area) {
        selectedSubPost = area;
        NSLog(@"%@",area);
        _otherSubcategoryTxtField.text=@"";
        if([[area valueForKey:@"id"] isEqual:@"0"]){
            _numberWorkersTop.constant=75;
            _otherSubcatLbl.hidden=NO;
            _otherSubcategoryTxtField.hidden=NO;
        }else{
            
            _numberWorkersTop.constant=20;
            _otherSubcatLbl.hidden=YES;
            _otherSubcategoryTxtField.hidden=YES;
        }
        if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
            self.subCategoryTxtField.text = [selectedSubPost valueForKey:@"title_ar"];
        }else{
            self.subCategoryTxtField.text = [selectedSubPost valueForKey:@"title"];
            
        }
    };
    
    [self presentPopupViewController:vc animationType:MJPopupViewAnimationSlideBottomTop dismissed:nil];
    }else{
        [self showErrorAlertWithMessage:Localized(@"Select Category")];
    }

}
- (IBAction)bothGenderBtnAction:(id)sender {
    gender = @"both";
    [_maleBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
    [_femaleBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
    [_bothGenderBtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
}
@end
