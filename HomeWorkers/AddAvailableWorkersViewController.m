//
//  AddAvailableWorkersViewController.m
//  HomeWorkers
//
//  Created by apple on 03/05/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import "AddAvailableWorkersViewController.h"
#import "Common.h"
#import "SelectAreaViewController.h"
#import "SelectReligionViewController.h"
#import "UIViewController+MJPopupViewController.h"
#import "MembersViewController.h"
#import "PECropViewController.h"
#import "AFNetworking.h"
#import "SVProgressHUD.h"
#import "PaymentViewController.h"
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"
@interface AddAvailableWorkersViewController ()<PopViewControllerDelegate>
{
    UIButton *buttonUser;
    UIColor *placeholderColor;
    
    NSDictionary *nationality;
    NSDictionary *religion;
    
    //NSDictionary *age;
    NSString *ages;

    NSString *gender;
}
@end

@implementation AddAvailableWorkersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    gender = @"male";
    placeholderColor=PLACEHOLDER_COLOR;
    // Do any additional setup after loading the view.
    _userImage.layer.cornerRadius=_userImage.frame.size.width/2;
    _userImage.clipsToBounds=YES;
    self.navigationItem.title=Localized(@"Add AvailableWorkers");
    self.nameTxtField.text=@"";
    self.ageNameTxtField.text=@"";
    self.nationalityTxtField.text=@"";
    self.religionTxtField.text=@"";
    self.salaryTxtField.text=@"";
    self.amountTxtField.text=@"";
    self.experienceTxtfied.text=@"";
    self.phoneNumberTxtField.text=@"";
    self.emailTxtField.text=@"";
   
    
    self.genderLbl.text=Localized(@"Gender");
    self.maleLbl.text =Localized(@"Male");
    self.femaleLbl.text=Localized(@"Female");
     self.serviceCharges.text = Localized(@"Service Charges");
    NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [currentDefaults objectForKey:@"SETTINGS"];
    NSDictionary *Settings = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    //NSDictionary *Settings=[[NSUserDefaults standardUserDefaults] valueForKey:@"SETTINGS"];
    self.AmountLbl.text = [NSString stringWithFormat:@"%@ %@",[Settings valueForKey:@"avail_amount"],Localized(@"KD")];

    
    self.phoneNumberTxtField.delegate=self;
    self.phoneNumberTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Phone Number")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    self.emailTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Email")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    self.nameTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Name")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    self.ageNameTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Age")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    self.nationalityTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Nationality")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    self.religionTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Religion")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    self.salaryTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Salary")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    self.amountTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Amount")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    self.experienceTxtfied.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Experience")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    self.SubmitBtn.layer.cornerRadius = self.SubmitBtn.frame.size.height/2;
    self.SubmitBtn.clipsToBounds = YES;
    self.SubmitBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    self.SubmitBtn.layer.borderWidth = 2;
    self.SubmitBtn.backgroundColor = BUTTON_BG_COLOR;
    [self.SubmitBtn setTitle:Localized(@"Submit") forState:UIControlStateNormal];

    self.nameL.text=Localized(@"Name");
     self.ageL.text=Localized(@"Age");
     self.nationalityL.text=Localized(@"Nationality");
     self.reigionL.text=Localized(@"Religion");
     self.salaryL.text=Localized(@"Salary");
     self.amountL.text=Localized(@"Amount");
     self.experienceL.text=Localized(@"Experience");
    
    
    
    
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
    
    
    // form list
    if([_from  isEqual: @"List"]){
        [self stopUserintereaction];
    }
    
    
}
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)stopUserintereaction{
    _maleBtn.userInteractionEnabled = NO;
    _femalebtn.userInteractionEnabled = NO;
    _religionBtn.userInteractionEnabled = NO;
    _religionTxtField.userInteractionEnabled = NO;
    _nationalityBtn.userInteractionEnabled = NO;
    _nationalityTxtField.userInteractionEnabled = NO;
    _ageNameTxtField.userInteractionEnabled = NO;
    _AgeBtn.userInteractionEnabled = NO;
       _salaryTxtField.userInteractionEnabled = NO;
    _amountTxtField.userInteractionEnabled = NO;
    _experienceTxtfied.userInteractionEnabled = NO;
    _emailTxtField.userInteractionEnabled = NO;
    _phoneNumberTxtField.userInteractionEnabled = NO;
    _userimageBtn.userInteractionEnabled = NO;
    [_SubmitBtn setHidden:YES];
    
    NSLog(@"%@",_details);
    
    if([[_details valueForKey:@"type"]  isEqual: @"male"]||[[_details valueForKey:@"type"]  isEqual: @"0"]){
        gender = @"male";
        [_maleBtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
        [_femalebtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
        
    }
    else {
        gender = @"female";
        [_femalebtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
        [_maleBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
    }
    

    
    
    // after api change
    
    religion =[_details valueForKey:@"religion"];
    _religionTxtField.text=[religion valueForKey:@"title"];

    nationality =[_details valueForKey:@"nationality"];
    _nationalityTxtField.text=[nationality valueForKey:@"title"];
        ages =[_details valueForKey:@"age"];
//    _ageNameTxtField.text=[age valueForKey:@"title"];
    _ageNameTxtField.text=ages;

    
  
    
    
    _phoneNumberTxtField.text=[NSString stringWithFormat:@"%@",[_details valueForKey:@"phone"]];
    _salaryTxtField.text=[NSString stringWithFormat:@"%@",[_details valueForKey:@"salary"]];
    _amountTxtField.text=[NSString stringWithFormat:@"%@",[_details valueForKey:@"amount"]];
    _experienceTxtfied.text=[NSString stringWithFormat:@"%@",[_details valueForKey:@"experience"]];
    _emailTxtField.text=[NSString stringWithFormat:@"%@",[_details valueForKey:@"email"]];

    _nameTxtField.text=[NSString stringWithFormat:@"%@",[_details valueForKey:@"name"]];
    [_userImage setImageWithURL:[_details valueForKey:@"image"] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)submitBtnAction:(id)sender {
  
    if(_nameTxtField.text.length == 0){
        [self showErrorAlertWithMessage:Localized(@"Please Enter Name")];
    }else if(_ageNameTxtField.text.length == 0){
        [self showErrorAlertWithMessage:Localized(@"Please Enter Age")];
    }
    else if(_nationalityTxtField.text.length == 0){
        [self showErrorAlertWithMessage:Localized(@"Please Enter Nationality")];
    }
    else if(_religionTxtField.text.length == 0){
        [self showErrorAlertWithMessage:Localized(@"Please Enter Religion")];
    }else if(_salaryTxtField.text.length == 0){
        [self showErrorAlertWithMessage:Localized(@"Please Enter Salary")];
    }else if(_amountTxtField.text.length == 0){
        [self showErrorAlertWithMessage:Localized(@"Please Enter Amount")];
    }else if(_experienceTxtfied.text.length == 0){
        [self showErrorAlertWithMessage:Localized(@"Please Enter Experience")];
    }else if(_emailTxtField.text.length == 0){
        [self showErrorAlertWithMessage:Localized(@"Please Enter Email")];
    }else if(_phoneNumberTxtField.text.length == 0){
        [self showErrorAlertWithMessage:Localized(@"Please Enter PhoneNumber")];
    }
        else{
            [self uploadImagesWithProgressWithId:@"1"];
    }
    
}
- (void)cancelButtonClicked:(UIViewController *)secondDetailViewController {
    [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationSlideTopBottom];
}

-(void)parseResult:(id)result withCode:(int)reqeustCode{
    NSLog(@"%@",result);
  
    if(reqeustCode==200){

        if ([[result valueForKey:@"status"] isEqualToString:@"Failed"]) {
            NSString *str=[result valueForKey:@"message"];
            [self showErrorAlertWithMessage:Localized(str)];
            
        } else {
            [self NeedToPay:[NSString stringWithFormat:@"%@", [result valueForKey:@"id"]]];
           // [Utils loginUserWithMemberId:[result valueForKey:@"member_id"] withType:@"User"];
            
           // [self.navigationController popViewControllerAnimated:YES];
            
        }
    }else if(requestCode == 2002){
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

- (IBAction)nationalityBtnAction:(id)sender {
    SelectAreaViewController *vc = [[SelectAreaViewController alloc] initWithNibName:@"SelectAreaViewController" bundle:nil];
    vc.delegate=self;
    //    [self.navigationController pushViewController:vc animated:YES];
     vc.from = @"filter";
    vc.completionBlock = ^(NSMutableDictionary *area) {
        NSLog(@"%@",area);
        if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
            self.nationalityTxtField.text = [area valueForKey:@"title_ar"];
        }else{
            self.nationalityTxtField.text = [area valueForKey:@"title"];
        }
        nationality =area;
    };
    
    [self presentPopupViewController:vc animationType:MJPopupViewAnimationSlideBottomTop dismissed:nil];
}

- (IBAction)religionBtnAction:(id)sender {
    SelectReligionViewController *vc = [[SelectReligionViewController alloc] initWithNibName:@"SelectReligionViewController" bundle:nil];
    vc.delegate=self;
    //    [self.navigationController pushViewController:vc animated:YES];
    vc.completionBlock = ^(NSMutableDictionary *area) {
        NSLog(@"%@",area);
        if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
            self.religionTxtField.text = [area valueForKey:@"title_ar"];
        }else{
            self.religionTxtField.text = [area valueForKey:@"title"];
        }
          religion=area;
    };
    
    [self presentPopupViewController:vc animationType:MJPopupViewAnimationSlideBottomTop dismissed:nil];
}

- (IBAction)ageBtnAction:(id)sender {
    MembersViewController *vc = [[MembersViewController alloc] initWithNibName:@"MembersViewController" bundle:nil];
    vc.delegate=self;
    //    [self.navigationController pushViewController:vc animated:YES];
    vc.from = @"ages";
    vc.completionBlock3 = ^(NSString *sage ) {
        ages=sage;
        if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
            self.ageNameTxtField.text = [NSString stringWithFormat:@"%@",ages];
        }else{
            self.ageNameTxtField.text = [NSString stringWithFormat:@"%@",ages];
        }
        self.ageNameTxtField.text = [NSString stringWithFormat:@"%@",ages ];

    };
    [self presentPopupViewController:vc animationType:MJPopupViewAnimationSlideBottomTop dismissed:nil];
}
- (IBAction)selectUserImage:(id)sender {
    [self imageSelection:sender];
}
-(void)imageSelection:(id)sender{
    
    // if (!_userPicker) {
    _userPicker = [[UIImagePickerController alloc] init];
    _userPicker.delegate = self;
    //}
    
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:Localized(@"select_image") message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [controller addAction:[UIAlertAction actionWithTitle:Localized(@"camera") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        _userPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:_userPicker animated:YES completion:nil];
    }]];
    [controller addAction:[UIAlertAction actionWithTitle:Localized(@"gallery") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        _userPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:_userPicker animated:YES completion:nil];
    }]];
    [controller addAction:[UIAlertAction actionWithTitle:Localized(@"cancel") style:UIAlertActionStyleCancel handler:nil]];
    
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
        self.userImage.image = image;
        user_uiimage = image;
        
        
    }
}
UIImage *user_uiimage;
- (void)uploadImagesWithProgressWithId:(NSString *)adId {
    
    //http://clients.yellowsoft.in/lawyers/api/add-member-image.php
    NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [currentDefaults objectForKey:@"SETTINGS"];
    NSDictionary *Settings = [NSKeyedUnarchiver unarchiveObjectWithData:data];

    NSString *serverURL = [NSString stringWithFormat:@"%@/%@", SERVER_URL,ADD_AVAILABLEWORKERS];
    
    NSDictionary *parameters = @{@"member_id":[Utils loggedInUserIdStr]
                                 ,@"name":_nameTxtField.text,
                                 @"age":ages,
                                 @"nationality":[nationality valueForKey:@"id"],
                                 @"religion":[religion valueForKey:@"id"],
                                 
                                 @"salary":_salaryTxtField.text,
                                 @"amount":_amountTxtField.text,
                                 @"experience":_experienceTxtfied.text,
                                 @"phone":_phoneNumberTxtField.text,
                                 @"email":_emailTxtField.text,
                                 @"gender":[gender  isEqual: @"male"]? @"0":@"1",
                                 @"service_amount":[NSString stringWithFormat:@"%@",[Settings valueForKey:@"avail_amount"]]
                                 };
    
    
    //    UIImage *image = user_uiimage;
    UIImage *image = [UIImage imageWithCGImage:user_uiimage.CGImage scale:0.25 orientation:user_uiimage.imageOrientation];
    
    
    if (image == nil) {
        [self makePostCallForPage:ADD_AVAILABLEWORKERS withParams:@{@"member_id":[Utils loggedInUserIdStr]
                                                                    ,@"name":_nameTxtField.text,
                                                                    @"age":ages,
                                                                    @"nationality":[nationality valueForKey:@"id"],
                                                                    @"religion":[religion valueForKey:@"id"],
                                                                    
                                                                    @"salary":_salaryTxtField.text,
                                                                    @"amount":_amountTxtField.text,
                                                                    @"experience":_experienceTxtfied.text,   @"phone":_phoneNumberTxtField.text,
                                                                    @"email":_emailTxtField.text,
                                                                     @"gender":[gender  isEqual: @"male"]? @"0":@"1",
                                                                    @"service_amount":[NSString stringWithFormat:@"%@",[Settings valueForKey:@"avail_amount"]]
                                                                    
                                                                    } withRequestCode:200];
        //[self hideHUD];
        //[Utils showAlertWithMessage:[MCLocalization stringForKey:@"SignUp_Sucessfully"]];
        //[self.navigationController popViewControllerAnimated:YES];
        return;
    }
    
    
    // image = [image resizedImageToFitInSize:CGSizeMake(960, 640) scaleIfSmaller:NO];
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:serverURL parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        [formData appendPartWithFileData:UIImagePNGRepresentation(image)
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
                                              [Utils showErrorAlertWithMessage:[MCLocalization stringForKey:@"error_while_posting_ad"]];
                                              
                                          } else {
                                              
                                              NSLog(@"Success %@", responseObject);
                                              
                                              [self hideHUD];
//                                              [Utils showAlertWithMessage:[MCLocalization stringForKey:@"SignUp_Sucessfully"]];
//                                              [self.navigationController popViewControllerAnimated:YES];
                                              [self NeedToPay:[NSString stringWithFormat:@"%@", [responseObject valueForKey:@"id"]]];

                                          }
                                      }];
    
    
    
    [uploadTask resume];
}
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    if(textField==self.phoneNumberTxtField){
//        NSString *currentString = [textField.text stringByReplacingCharactersInRange:range withString:string];
//        int length = [currentString length];
//        if (length > 8) {
//            return NO;
//        }
//    }
//    return YES;
//    
//}
-(void)NeedToPay:(NSString *)bookingId{

           // NSDictionary *Settings=[[NSUserDefaults standardUserDefaults] valueForKey:@"SETTINGS"];
    NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [currentDefaults objectForKey:@"SETTINGS"];
    NSDictionary *Settings = [NSKeyedUnarchiver unarchiveObjectWithData:data];
            
            PaymentViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"PaymentViewController"];
            vc.amount = [NSString stringWithFormat:@"%@",[Settings valueForKey:@"avail_amount"]];
            vc.invoice_id = [NSString stringWithFormat:@"%@", bookingId];
            vc.pageName = @"availworkers";
            vc.completionBlock = ^(NSString *status) {
                if ([status isEqualToString:@"success"]) {
                    
                    [self makePostCallForPage:AVAILABLEWORKERS_PAYMENT_SUCCESS withParams:@{@"member_id":[Utils loggedInUserIdStr],
                                                                                @"req_id":bookingId
                                                                                } withRequestCode:2002];
                    [self.navigationController popViewControllerAnimated:YES];
                    //[self showSuccessMessage:Localized(@"Payment SucessFully")];
                    [self showSuccessMessage:Localized(@"Yemnak team will get back to you within 12 hours")];
                } else {
                    [Utils showErrorAlertWithMessage:Localized(@"payment_failed")];
                }
            };
            
            [self.navigationController pushViewController:vc animated:YES];

        }



- (IBAction)maleBtnAction:(id)sender {
    gender=@"male";
    [_maleBtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
    [_femalebtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];

}

- (IBAction)femaleBtnAction:(id)sender {
    gender=@"female";
    [_femalebtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
    [_maleBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
}
@end
