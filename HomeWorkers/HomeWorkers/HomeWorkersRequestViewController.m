//
//  HomeWorkersRequestViewController.m
//  YEMNAK
//
//  Created by apple on 04/07/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import "HomeWorkersRequestViewController.h"
#import "SelectReligionViewController.h"
#import "SelectAreaViewController.h"
#import "UIViewController+MJPopupViewController.h"
#import "PaymentViewController.h"
#import "SelectServiceViewController.h"
#import "MembersViewController.h"
#import "PECropViewController.h"
#import "AFNetworking.h"
#import "SVProgressHUD.h"
@interface HomeWorkersRequestViewController ()<PopViewControllerDelegate>
{
    UIButton *rightbutton;
    NSString *experiencedOrNot;
    NSMutableArray *selectedServices;
    NSString *serviceIds;
    
    NSMutableArray *selectedAges;
    NSString *ageIds;
    
//    NSDictionary *selectedService;
//    NSString *serviceId;
    
    NSString *serviceNames;
    NSString *gender;
    
    NSDictionary *nationality;
    NSDictionary *religion;
    
    NSString *bookingId;
    UIColor *placeholderColor;
    
    NSDictionary *age;
    NSString *selectedage;

}
@property (strong, nonatomic) IBOutlet UIImagePickerController *userPicker2;

@end

@implementation HomeWorkersRequestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
  
   
    
    placeholderColor = PLACEHOLDER_COLOR;
    self.navigationItem.title=Localized(@"Request Home Workers");

    experiencedOrNot = @"yes";
    gender = @"male";
    self.genderlbl.text=Localized(@"Gender");
    self.maleLbl.text =Localized(@"Male");
    self.femaleLbl.text=Localized(@"Female");
    self.yesLbl.text=Localized(@"Yes");
    self.noLbl.text=Localized(@"No");
    
    bookingId=@"";
    serviceNames=@"";
    serviceIds=@"";
    ageIds = @"";
    // serviceIds=@"";
    _phoneNumberTxtField.delegate=self;
    // Do any additional setup after loading the view.
    self.serviceTxtField.text=@"";
    self.serviceTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Service")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    self.visaQuota.text=@"";
    self.visaQuota.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Visa Quota")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    self.religionTxtfield.text=@"";
    self.religionTxtfield.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Religion")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    self.nationlaityTxtField.text=@"";
    self.nationlaityTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Nationality")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    self.ageTxtfiled.text=@"";
    self.ageTxtfiled.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Age")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    self.phoneNumberTxtField.text=@"";
    self.phoneNumberTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"PhoneNumber")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
  //labels
    _genderlbl.text=Localized(@"Gender");
    _religionLbl.text=Localized(@"Religion");
    _nationalitylbl.text=Localized(@"Nationality");
    _ageLbl.text=Localized(@"Age");
    _experiencelbl.text=Localized(@"Experience in Kuwait");
    _serviceLbl.text=Localized(@"Service");
    _phoneNumebrLbl.text=Localized(@"Phone Number");
    _serviceChargesLbl.text=Localized(@"Service Charges");
        NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [currentDefaults objectForKey:@"SETTINGS"];
    NSDictionary *Settings = [NSKeyedUnarchiver unarchiveObjectWithData:data];

     self.amountLbl.text = [NSString stringWithFormat:@"%@ %@",[Settings valueForKey:@"home_req_amount"],Localized(@"KD")];
//    self.amountLbl.layer.cornerRadius = self.amountLbl.frame.size.height/2;
//    self.amountLbl.clipsToBounds = YES;
//    self.amountLbl.layer.borderColor = [UIColor whiteColor].CGColor;
//    self.amountLbl.layer.borderWidth = 2;
//    self.amountLbl.textAlignment = UITextAlignmentCenter;
    [self.bookandpayBtn setTitle:Localized(@"Submit Request") forState:UIControlStateNormal];
    self.bookandpayBtn.layer.cornerRadius = self.bookandpayBtn.frame.size.height/2;
    self.bookandpayBtn.clipsToBounds = YES;
    self.bookandpayBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    self.bookandpayBtn.layer.borderWidth = 2;
    
    
    
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
    
     // form list
    if([_from  isEqual: @"List"]){
        [self stopUserintereaction];
    }
}
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)stopUserintereaction{
    _malebtn.userInteractionEnabled = NO;
    _femaleBtn.userInteractionEnabled = NO;
    _religionBtn.userInteractionEnabled = NO;
    _religionTxtfield.userInteractionEnabled = NO;
    _nationalityBtn.userInteractionEnabled = NO;
    _nationlaityTxtField.userInteractionEnabled = NO;
    _ageTxtfiled.userInteractionEnabled = NO;
    _AgeBtn.userInteractionEnabled = NO;
    _yesBtn.userInteractionEnabled = NO;
    _nobtn.userInteractionEnabled = NO;
    _serviceTxtField.userInteractionEnabled = NO;
    _seriveBtn.userInteractionEnabled = NO;
    _phoneNumberTxtField.userInteractionEnabled = NO;
    
    [_bookandpayBtn setHidden:YES];
    
    NSLog(@"%@",_details);
    
    if([[_details valueForKey:@"type"]  isEqual: @"male"]||[[_details valueForKey:@"type"]  isEqual: @"0"]){
        gender = @"male";
        [_malebtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
        [_femaleBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
        
    }
    else {
        gender = @"female";
        [_femaleBtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
        [_malebtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
    }
    religion =[_details valueForKey:@"religion"];
    _religionTxtfield.text=[religion valueForKey:@"title"];
    
    nationality =[_details valueForKey:@"nationality"];
    _nationlaityTxtField.text=[nationality valueForKey:@"title"];
    
    age =[_details valueForKey:@"age"];
        _ageTxtfiled.text=[age valueForKey:@"title"];

////    if([age valueForKey:@"title"]){
////    _ageTxtfiled.text=[age valueForKey:@"title"];
////    }else{
//        _ageTxtfiled.text=[_details valueForKey:@"age"];
//
//  //  }
    
    selectedServices = [_details valueForKey:@"service"];
    self.serviceTxtField.text = [selectedServices valueForKey:@"title"];

    if([[_details valueForKey:@"exp_kuwait"]  isEqual: @"yes"]){
        experiencedOrNot = @"yes";
        [_yesBtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
        [_nobtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
    }
    
    else{
        experiencedOrNot = @"no";
        [_nobtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
        [_yesBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
    }
    
    _phoneNumberTxtField.text=[NSString stringWithFormat:@"%@",[_details valueForKey:@"phone"]];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)selectReligionAction:(id)sender {
    SelectReligionViewController *vc = [[SelectReligionViewController alloc] initWithNibName:@"SelectReligionViewController" bundle:nil];
    vc.delegate=self;
    //    [self.navigationController pushViewController:vc animated:YES];
    vc.completionBlock = ^(NSMutableDictionary *area) {
        NSLog(@"%@",area);
        self.religionTxtfield.text = [area valueForKey:@"title"];
        religion=area;
    };
    
    [self presentPopupViewController:vc animationType:MJPopupViewAnimationSlideBottomTop dismissed:nil];
}
- (IBAction)selectnationalityBtnAction:(id)sender {
    SelectAreaViewController *vc = [[SelectAreaViewController alloc] initWithNibName:@"SelectAreaViewController" bundle:nil];
    vc.delegate=self;
    //    [self.navigationController pushViewController:vc animated:YES];
     vc.from = @"filter";
    vc.completionBlock = ^(NSMutableDictionary *area) {
        NSLog(@"%@",area);
//        self.nationlaityTxtField.text = [area valueForKey:@"title"];
        if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
            self.nationlaityTxtField.text = [area valueForKey:@"title_ar"];
        }else{
            self.nationlaityTxtField.text = [area valueForKey:@"title"];
        }
        nationality=area;
    };
    
    [self presentPopupViewController:vc animationType:MJPopupViewAnimationSlideBottomTop dismissed:nil];
}
- (IBAction)yesBtnAction:(id)sender {
    experiencedOrNot = @"yes";
    [_yesBtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
    [_nobtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
}

- (IBAction)noBtnAction:(id)sender {
    experiencedOrNot = @"no";
    [_nobtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
    [_yesBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
}
- (IBAction)serviceAction:(id)sender {
//    SelectReligionViewController *vc = [[SelectReligionViewController alloc] initWithNibName:@"SelectReligionViewController" bundle:nil];
//    vc.delegate=self;
//    vc.from = @"Service";
//    //    [self.navigationController pushViewController:vc animated:YES];
//    vc.completionBlock = ^(NSMutableDictionary *area) {
//        NSLog(@"%@",area);
//        if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
//            self.serviceTxtField.text = [area valueForKey:@"title_ar"];
//        }else{
//            self.serviceTxtField.text = [area valueForKey:@"title"];
//        }
//        selectedService = area;
//        serviceId=[selectedService valueForKey:@"id"];
//    };
//
//    [self presentPopupViewController:vc animationType:MJPopupViewAnimationSlideBottomTop dismissed:nil];
    
    SelectServiceViewController *vc = [[SelectServiceViewController alloc] initWithNibName:@"SelectServiceViewController" bundle:nil];
    vc.delegate=self;
    //    [self.navigationController pushViewController:vc animated:YES];
    vc.completionBlock = ^(NSMutableArray* services) {
        NSLog(@"%@",services);
        selectedServices =[[NSMutableArray alloc]init];

        selectedServices = services;
        serviceIds=@"";
        NSString *str=@"";
        for(NSDictionary *dict in services){
            if(serviceIds.length==0){
                serviceIds =[NSString stringWithFormat:@"%@",[dict valueForKey:@"id"]];
                if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
                    str =[NSString stringWithFormat:@"%@",[dict valueForKey:@"title_ar"]];

                }else{
                    str =[NSString stringWithFormat:@"%@",[dict valueForKey:@"title"]];
                }
            }else{
            serviceIds =[NSString stringWithFormat:@"%@,%@",serviceIds,[dict valueForKey:@"id"]];
                if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
                    str =[NSString stringWithFormat:@"%@,%@",str,[dict valueForKey:@"title_ar"]];

                }else{
                    str =[NSString stringWithFormat:@"%@,%@",str,[dict valueForKey:@"title"]];
                }
            }
        }
        self.serviceTxtField.text = str;

    };

    [self presentPopupViewController:vc animationType:MJPopupViewAnimationSlideBottomTop dismissed:nil];
}
- (IBAction)bookandPayAction:(id)sender {
    
    if (![Utils isOnline]) {
        [Utils showErrorAlertWithMessage:[MCLocalization stringForKey:@"internet_error"]];
        return;
    }
//    if(_religionTxtfield.text.length == 0){
//        [self showErrorAlertWithMessage:Localized(@"Please Select Religion")];
//    }
//    else
        if(_nationlaityTxtField.text.length == 0){
        [self showErrorAlertWithMessage:Localized(@"Please Select Nationality")];
    }
//    else if(_ageTxtfiled.text.length == 0){
//        [self showErrorAlertWithMessage:Localized(@"Please Select Age")];
//    }else if(_serviceTxtField.text.length == 0){
//        [self showErrorAlertWithMessage:Localized(@"Please Select Service")];
//    }else if(_phoneNumberTxtField.text.length == 0){
//        [self showErrorAlertWithMessage:Localized(@"Please Select PhoneNumber")];
//    }
    
    else{
//    [self makePostCallForPage:HOMEWORKERS_REQUEST withParams:@{@"member_id":[Utils loggedInUserIdStr],
//                                                               @"services":serviceIds,
//                                                               @"exp_kuwait":experiencedOrNot,
//                                                               @"type":gender,
//                                                               @"age":ageIds, @"nationality":[nationality valueForKey:@"id"], @"religion":[religion valueForKey:@"id"], @"phone":_phoneNumberTxtField.text
//                                                                 } withRequestCode:20];
//
//        [self makePostCallForPage:HOMEWORKERS_REQUEST withParams:@{@"member_id":[Utils loggedInUserIdStr],
//                                                                   @"services":serviceIds,
//                                                                   @"exp_kuwait":experiencedOrNot,
//                                                                   @"type":gender,
//                                                                   @"age":ageIds, @"nationality":[nationality valueForKey:@"id"]?[nationality valueForKey:@"id"]:@"", @"religion":[religion valueForKey:@"id"]?[religion valueForKey:@"id"]:@"", @"phone":@""
//                                                                   } withRequestCode:20];
        
      

        [self uploadImagesWithProgressWithId:@"1"];
        
    }
    
    
}
- (void)uploadImagesWithProgressWithId:(NSString *)json {
    
    //http://clients.yellowsoft.in/lawyers/api/add-member-image.php
    NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [currentDefaults objectForKey:@"SETTINGS"];
    NSDictionary *Settings = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    NSString *serverURL = [NSString stringWithFormat:@"%@/%@", SERVER_URL,HOMEWORKERS_REQUEST];
    
    //    NSDictionary *parameters = @{@"inventory_id":_InvId};
    NSDictionary *parameters = @{@"member_id":[Utils loggedInUserIdStr],
                                 @"services":serviceIds,
                                 @"exp_kuwait":experiencedOrNot,
                                 @"type":gender,
                                 @"age":ageIds, @"nationality":[nationality valueForKey:@"id"]?[nationality valueForKey:@"id"]:@"", @"religion":[religion valueForKey:@"id"]?[religion valueForKey:@"id"]:@"", @"phone":@"",                                 @"service_amount":[NSString stringWithFormat:@"%@",[Settings valueForKey:@"home_req_amount"]]
};
    
    
    //    UIImage *image = Upload_Image1;

    UIImage *image3 = [UIImage imageWithCGImage:self.visaImage.image.CGImage scale:0.25 orientation:self.visaImage.image.imageOrientation];
        if(image3 == nil){
            [self showErrorAlertWithMessage:Localized(@"Please Add Visa")];
            return;
        }
    
    
  
    
    
    // image = [image resizedImageToFitInSize:CGSizeMake(960, 640) scaleIfSmaller:NO];
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:serverURL parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
    
        [formData appendPartWithFileData:UIImagePNGRepresentation(image3)
                                    name:@"file"
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
                                              [self processPayment:responseObject];
                                          }
                                      }];
    
    
    
    [uploadTask resume];
}
- (IBAction)visaAction:(id)sender {
    [self imageSelection:sender];
}
-(void)imageSelection:(id)sender{
    
    // if (!_userPicker) {
    _userPicker2 = [[UIImagePickerController alloc] init];
    _userPicker2.delegate = self;
    //}
    
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:Localized(@"Select Image") message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [controller addAction:[UIAlertAction actionWithTitle:Localized(@"Camera") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        _userPicker2.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:_userPicker2 animated:YES completion:nil];
    }]];
    [controller addAction:[UIAlertAction actionWithTitle:Localized(@"Gallery") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        _userPicker2.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:_userPicker2 animated:YES completion:nil];
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
    
   
            [_visaBtn setHidden:YES];
            self.visaImage.image = image;
    
        Upload_Image3 = image;
        
        
    
}
UIImage *Upload_Image3;
-(void)processPayment:(id)result{
   
        NSLog(@"%@",result);
        bookingId = [NSString stringWithFormat:@"%@", [result valueForKey:@"id"]];
        //[self.navigationController popToRootViewControllerAnimated:YES];
        //        OrderSummaryViewController *vc = [Utils getViewControllerWithId:@"OrderSummaryViewController"];
        //        vc.order = [UserOrder instanceFromDictionary:responseObject];
        //        [self.navigationController pushViewController:vc animated:YES];
        NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
        NSData *data = [currentDefaults objectForKey:@"SETTINGS"];
        NSDictionary *Settings = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        
        
        PaymentViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"PaymentViewController"];
        vc.amount = [NSString stringWithFormat:@"%@",[Settings valueForKey:@"home_req_amount"]];
        vc.invoice_id = [NSString stringWithFormat:@"%@", [result valueForKey:@"id"]];
        vc.pageName = @"homew_reqs";
        
        vc.completionBlock = ^(NSString *status) {
            if ([status isEqualToString:@"success"]) {
                
                [self makePostCallForPage:HOME_PAYMENT_SUCCESS withParams:@{@"member_id":[Utils loggedInUserIdStr],
                                                                            @"req_id":bookingId
                                                                            
                                                                            } withRequestCode:2002];
                [self.navigationController popViewControllerAnimated:YES];
                //[self showSuccessMessage:Localized(@"Payment SucessFully")];
                [self showSuccessMessage:Localized(@"Yemnak team will get back to you within 2-3 working days")];
            } else {
                [Utils showErrorAlertWithMessage:Localized(@"payment_failed")];
            }
        };
        
        [self.navigationController pushViewController:vc animated:YES];
        
        
        
    
}
-(void)parseResult:(id)result withCode:(int)reqeustCode{
    if(reqeustCode==20){
        if ([[result valueForKey:@"status"] isEqualToString:@"Failed"]) {
            [self showErrorAlertWithMessage:[result valueForKey:@"message"]];
        } else {
            NSLog(@"%@",result);
            bookingId = [NSString stringWithFormat:@"%@", [result valueForKey:@"id"]];
            //[self.navigationController popToRootViewControllerAnimated:YES];
            //        OrderSummaryViewController *vc = [Utils getViewControllerWithId:@"OrderSummaryViewController"];
            //        vc.order = [UserOrder instanceFromDictionary:responseObject];
            //        [self.navigationController pushViewController:vc animated:YES];
                NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [currentDefaults objectForKey:@"SETTINGS"];
    NSDictionary *Settings = [NSKeyedUnarchiver unarchiveObjectWithData:data];
            
            
            PaymentViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"PaymentViewController"];
            vc.amount = [NSString stringWithFormat:@"%@",[Settings valueForKey:@"home_req_amount"]];
            vc.invoice_id = [NSString stringWithFormat:@"%@", [result valueForKey:@"id"]];
            vc.pageName = @"homew_reqs";

            vc.completionBlock = ^(NSString *status) {
                if ([status isEqualToString:@"success"]) {
                   
                    [self makePostCallForPage:HOME_PAYMENT_SUCCESS withParams:@{@"member_id":[Utils loggedInUserIdStr],
                                                                           @"req_id":bookingId
                                                                           
                                                                           } withRequestCode:2002];
                    [self.navigationController popViewControllerAnimated:YES];
                    //[self showSuccessMessage:Localized(@"Payment SucessFully")];
                    [self showSuccessMessage:Localized(@"Yemnak team will get back to you within 2-3 working days")];
                } else {
                    [Utils showErrorAlertWithMessage:Localized(@"payment_failed")];
                }
            };
            
            [self.navigationController pushViewController:vc animated:YES];
            
            
            
        }
    }else if(requestCode == 2002){
        [self.navigationController popViewControllerAnimated:YES];
    }
}
- (void)cancelButtonClicked:(UIViewController *)secondDetailViewController {
    [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationSlideTopBottom];
}
- (IBAction)mailBtnAction:(id)sender {
    gender = @"male";
    [_malebtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
    [_femaleBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];

}

- (IBAction)femalebtnAction:(id)sender {
    gender = @"female";
    [_femaleBtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
    [_malebtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
}

//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    if(textField==_phoneNumberTxtField){
//        NSString *currentString = [textField.text stringByReplacingCharactersInRange:range withString:string];
//        int length = [currentString length];
//        if (length > 8) {
//            return NO;
//        }
//    }
//    return YES;
//    
//}
- (IBAction)ageAction:(id)sender {
//    MembersViewController *vc = [[MembersViewController alloc] initWithNibName:@"MembersViewController" bundle:nil];
//    vc.delegate=self;
//    //    [self.navigationController pushViewController:vc animated:YES];
//    vc.from = @"age";
//    vc.completionBlock2 = ^(NSDictionary *sage ) {
//        age=sage;
//        selectedage=[age valueForKey:@"id"];
//
//        if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
//   self.ageTxtfiled.text = [NSString stringWithFormat:@"%@",[age valueForKey:@"title_ar"]];
//
//        }else{
//   self.ageTxtfiled.text = [NSString stringWithFormat:@"%@",[age valueForKey:@"title"]];
//
//        }
//    };
//    vc.completionBlock3 = ^(NSString *sage ) {
//        selectedage=sage;
//        if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
//            self.ageTxtfiled.text = [NSString stringWithFormat:@"%@",sage];
//        }else{
//            self.ageTxtfiled.text = [NSString stringWithFormat:@"%@",sage];
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
        self.ageTxtfiled.text = str;
        
    };
    
    [self presentPopupViewController:vc animationType:MJPopupViewAnimationSlideBottomTop dismissed:nil];
}
@end
