//
//  PartimeWorkersViewController.m
//  HomeWorkers
//
//  Created by apple on 16/04/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import "PartimeWorkersViewController.h"
#import "Utils.h"
#import "Common.h"
#import "ActionSheetStringPicker.h"
#import "UIViewController+MJPopupViewController.h"
#import "PopViewControllerDelegate.h"
#import "AreaViewController.h"
#import "DateViewController.h"
#import "MembersViewController.h"
#import "LoginViewController.h"
#import "PaymentViewController.h"
#import "AFNetworking.h"
#import "SVProgressHUD.h"
#import "SelectReligionViewController.h"
@interface PartimeWorkersViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
{
    UIButton *rightbutton;
    UIPickerView *areaPickerView;
    NSMutableArray *areas;
    NSMutableArray *areaNames;
    NSMutableDictionary *selectedArea;
    NSMutableDictionary *selectedService;
NSString *serviceId;
    NSString *areaId;
    NSString *selectedDate;
 NSString *numberOfMembers;
    NSString *selectedShift;
     NSString *selectedGender;
    NSString *price;
    NSString *bookingId;
}
@end

@implementation PartimeWorkersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    selectedShift= @"1";
    selectedGender = @"male";
    serviceId = @"";
    areaId = @"";
    price = @"";
      self.navigationItem.title=Localized(@"PART TIME WORKERS");
    
    self.areaL.text = Localized(@"Area");
    self.dayL.text = Localized(@"Day");
    self.chooseLbl.text = Localized(@"Choose Shift");
    self.qunatityLbl.text = Localized(@"Quantity");
    self.specialRequestL.text = Localized(@"Special Request");
    self.morningShiftL.text = Localized(@"Morning Shift");
    self.evenignShiftL.text = Localized(@"Evening Shift");

    self.morningShiftL.text = Localized(@"Morning Shift");
    self.evenignShiftL.text = Localized(@"Evening Shift");
    self.fullShiftLbl.text = Localized(@"Full Day Shift");
    self.blockL.text = Localized(@"Block");
    
    self.morningShiftTimeL.text = Localized(@"9:30 AM to 3:30 PM");
    self.eveningShiftTimeL.text = Localized(@"4:30 PM to 10:30 PM");
    self.fullShiftTimeLbl.text = Localized(@"10:30 AM to 11:00 PM");

    
    
    self.streetLbl.text = Localized(@"Street");
    self.juddaLbl.text = Localized(@"Judda");
    self.houseLbl.text = Localized(@"House");

    [self.bookandPayBtn setTitle:Localized(@"Book and Pay") forState:UIControlStateNormal];
    
    self.maleLbl.text = Localized(@"Male");
    self.femaleLbl.text = Localized(@"Female");
    self.serviceLbl.text = Localized(@"Service");
    self.genderLbl.text = Localized(@"Gender");
    self.serviceCharges.text = Localized(@"Service Charges");
    self.enterAddressTxtField.text=@"";
    self.selectDayTxtField.text=@"";
    self.serviceTxtField.text=@"";
    UIColor *placeholderColor = PLACEHOLDER_COLOR
self.selectQuantityOfmembers.text=@"";
    self.enterAddressTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Your address")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    self.selectAreaTxtField.text=@"";
    self.selectAreaTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Select Your Area")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    
    self.selectDayTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Day")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    self.serviceTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Services")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    self.selectQuantityOfmembers.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"No.of Workers")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    self.blockTxtField.text=@"";
    self.blockTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"--")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    self.streetTxtField.text=@"";
    self.streetTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"--")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    self.juddaTxtField.text=@"";
    self.juddaTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"--")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    self.houseTxtFiled.text=@"";
    self.houseTxtFiled.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"--")
     attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    self.AmountLbl.text = Localized(@"000 KD");
    self.specialReqTxtview.text=Localized(@"");
    self.specialReqTxtview.placeholder = Localized(@"Special Request");
    self.specialReqTxtview.placeholderTextColor =placeholderColor;
    self.specialReqTxtview.textColor = [UIColor whiteColor];
    self.specialReqTxtview.delegate=self;
    // Do any additional setup after loading the view.
//    self.AmountLbl.layer.cornerRadius = self.AmountLbl.frame.size.height/2;
//    self.AmountLbl.clipsToBounds = YES;
//    self.AmountLbl.layer.borderColor = [UIColor grayColor].CGColor;
//    self.AmountLbl.layer.borderWidth = 2;
//    self.AmountLbl.textAlignment = UITextAlignmentCenter;
    
    self.bookandPayBtn.layer.cornerRadius = self.bookandPayBtn.frame.size.height/2;
    self.bookandPayBtn.clipsToBounds = YES;
    self.bookandPayBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    self.bookandPayBtn.layer.borderWidth = 2;
    
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
       // NSLog(@"%@",_details);
    }
}
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)stopUserintereaction{
    _serviceBtn.userInteractionEnabled = NO;
    _serviceTxtField.userInteractionEnabled = NO;
    _mailBtn.userInteractionEnabled = NO;
    _femalebtn.userInteractionEnabled = NO;
    _selectAreaBtn.userInteractionEnabled = NO;
    self.selectDateBtn.userInteractionEnabled = NO;
    _morningShiftBtn.userInteractionEnabled = NO;
    _evngshiftBtn.userInteractionEnabled = NO;
    _selectQuantityBtn.userInteractionEnabled = NO;
    _selectQuantityOfmembers.userInteractionEnabled = NO;
    self.enterAddressTxtField.userInteractionEnabled = NO;
    self.blockTxtField.userInteractionEnabled = NO;
    self.streetTxtField.userInteractionEnabled = NO;
    self.juddaTxtField.userInteractionEnabled = NO;
    self.houseTxtFiled.userInteractionEnabled = NO;
    self.specialReqTxtview.userInteractionEnabled = NO;
    self.selectAreaTxtField.userInteractionEnabled = NO;
    self.selectDayTxtField.userInteractionEnabled = NO;

    
    [_bookandPayBtn setHidden:YES];
    
    NSLog(@"%@",_details);
    
    if([[_details valueForKey:@"type"]  isEqual: @"male"]||[[_details valueForKey:@"type"]  isEqual: @"0"]){
        selectedGender = @"male";
        [_mailBtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
        [_femalebtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
        
    }
    else {
        selectedGender = @"female";
        [_femalebtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
        [_mailBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
    }
    
    _selectDayTxtField.text=[_details valueForKey:@"day"];
    
    selectedService = [_details valueForKey:@"service"];
    self.serviceTxtField.text = [selectedService valueForKey:@"title"];
    
    selectedArea = [_details valueForKey:@"area"];
    self.selectAreaTxtField.text = [selectedArea valueForKey:@"title"];
    if([[_details valueForKey:@"shift"]  isEqual: @"1"]){
        selectedShift = @"1";
        
        [_morningShiftBtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
        [_evngshiftBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
    }
    else {
        [self reset];
        selectedShift = @"2";
        [_morningShiftBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
        [_evngshiftBtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
    }
     _specialReqTxtview.text=[_details valueForKey:@"request"];
    _selectQuantityOfmembers.text=[_details valueForKey:@"workers"];
    _enterAddressTxtField.text=[_details valueForKey:@"address"];
    
     _blockTxtField.text=[_details valueForKey:@"block"];
     _streetTxtField.text=[_details valueForKey:@"street"];
    _juddaTxtField.text=[_details valueForKey:@"judda"];
    _houseTxtFiled.text=[_details valueForKey:@"house"];
      self.AmountLbl.text = [NSString stringWithFormat:@"%@ %@",[_details valueForKey:@"price"],Localized(@"KD")];


    
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    return 1;  // Or return whatever as you intend
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView
numberOfRowsInComponent:(NSInteger)component {
    return 3;//Or, return as suitable for you...normally we use array for dynamic
}


- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *title = [NSString stringWithFormat:@"Choice-%ld",(long)row];
    NSAttributedString *attString =
    [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    return attString;
}
- (void)pickerView:(UIPickerView *)thePickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component {
    
    //Here, like the table view you can get the each section of each row if you've multiple sections
    NSLog(@"Selected Color: %@. Index of selected color: %li",
          @"arjun", (long)row);
    
    //Now, if you want to navigate then;
    // Say, OtherViewController is the controller, where you want to navigate:
   
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//- (void)textViewDidBeginEditing:(UITextView *)textView
//{
//    if ([textView.text isEqualToString:Localized(@"")])
//    {
//        textView.text = @"";
//        self.specialReqTxtview.textColor = [UIColor grayColor];
//    }
//    [textView becomeFirstResponder];
//}
//
//- (void)textViewDidEndEditing:(UITextView *)textView
//{
//    if ([textView.text isEqualToString:@""]) {
//        textView.text =Localized(@"");
//        self.specialReqTxtview.textColor = [UIColor grayColor];
//    }
//    [textView resignFirstResponder];
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)parseResult:(id)result withCode:(int)reqeustCode {
     if(reqeustCode==2){
        
        NSArray *array = (NSArray *)result;
        [areas removeAllObjects];
        [areaNames removeAllObjects];
        for (NSDictionary *dictionary in array) {
            
            [areas addObject:dictionary];
            [areaNames addObject:[dictionary valueForKey:@"title"]];
        }
        [ActionSheetStringPicker showPickerWithTitle:Localized(@"Select Area")
                                                rows:areaNames
                                    initialSelection:0
                                           doneBlock:^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue) {
                                               
                                               selectedArea = [areas objectAtIndex:selectedIndex];
                                                areaId =[selectedArea valueForKey:@"id"];
                                               self.selectAreaTxtField.text= [selectedArea valueForKey:@"title"];
                                           }
                                         cancelBlock:^(ActionSheetStringPicker *picker) {
                                             NSLog(@"Block Picker Canceled");
                                         }
                                              origin:self.view];
        
     }else if(reqeustCode==2000){
         {
             if ([[result valueForKey:@"status"] isEqualToString:@"Failed"]) {
                 [self showErrorAlertWithMessage:[result valueForKey:@"message"]];
             } else {
             [SVProgressHUD dismiss];
             
             bookingId = [NSString stringWithFormat:@"%@", [result valueForKey:@"bookin_id"]];
             //[self.navigationController popToRootViewControllerAnimated:YES];
             //        OrderSummaryViewController *vc = [Utils getViewControllerWithId:@"OrderSummaryViewController"];
             //        vc.order = [UserOrder instanceFromDictionary:responseObject];
             //        [self.navigationController pushViewController:vc animated:YES];
             
             
             PaymentViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"PaymentViewController"];
             vc.amount = [NSString stringWithFormat:@"%@", price ];
             vc.invoice_id = [NSString stringWithFormat:@"%@", [result valueForKey:@"bookin_id"]];
                 vc.pageName = @"partworkers";

             vc.completionBlock = ^(NSString *status) {
                 if ([status isEqualToString:@"success"]) {
                     //[self placeOrder:json];
                     
                     
                     // [_paymentScucessView setHidden:false];
                     // to move to home page
                     //                        self.tabBarController.selectedIndex=0;
                     
                     //                        HistoryOrderViewController *newView = [self.storyboard instantiateViewControllerWithIdentifier:@"HistoryOrderViewController"];
                     //                        newView.orderId =invoiceId;
                     //                        newView.from=@"cart";
                     //                        [self.navigationController pushViewController:newView animated:YES];
                     [self makePostCallForPage:PAYMENT_SUCCESS withParams:@{@"member_id":[Utils loggedInUserIdStr],
                                                                            @"booking_id":bookingId
                                                                            
                                                                            } withRequestCode:2002];
                     [self.navigationController popViewControllerAnimated:YES];
                     [self showSuccessMessage:Localized(@"Payment SucessFully")];

                 } else {
                     [Utils showErrorAlertWithMessage:Localized(@"payment_failed")];
                 }
             };
             
             [self.navigationController pushViewController:vc animated:YES];
             
             
             
         }
     }
     }else if(reqeustCode==2002){
         [self.navigationController popViewControllerAnimated:YES];
     }
}
- (void)cancelButtonClicked:(UIViewController *)secondDetailViewController {
    [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationSlideTopBottom];
}
- (IBAction)selectAreaBtnAction:(id)sender {
    AreaViewController *vc = [[AreaViewController alloc] initWithNibName:@"AreaViewController" bundle:nil];
    vc.delegate=self;
    //    [self.navigationController pushViewController:vc animated:YES];
    vc.completionBlock = ^(NSMutableDictionary *area) {
        NSLog(@"%@",area);
        
        if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
            self.selectAreaTxtField.text = [area valueForKey:@"title_ar"];
        }else{
            self.selectAreaTxtField.text = [area valueForKey:@"title"];
        }
        selectedArea = area;
        areaId =[selectedArea valueForKey:@"id"];
    };
    
    [self presentPopupViewController:vc animationType:MJPopupViewAnimationSlideBottomTop dismissed:nil];
}
- (IBAction)shownationality:(id)sender {
    
}

- (IBAction)selectDayBtnAction:(id)sender {
    DateViewController *vc = [[DateViewController alloc] initWithNibName:@"DateViewController" bundle:nil];
    vc.delegate=self;
    //    [self.navigationController pushViewController:vc animated:YES];
    vc.completionBlock = ^(NSString *area) {
        NSLog(@"%@",area);
        self.selectDayTxtField.text = area;
        selectedDate = area;
    };
    
    [self presentPopupViewController:vc animationType:MJPopupViewAnimationSlideBottomTop dismissed:nil];
}
- (IBAction)selectQuantityAction:(id)sender {
    if(self.selectDayTxtField.text.length==0){
        [self showErrorAlertWithMessage:Localized(@"please select date")];

    }
    else  if(self.serviceTxtField.text.length==0){
        [self showErrorAlertWithMessage:Localized(@"please select Service")];
        
    }
        else{
        MembersViewController *vc = [[MembersViewController alloc] initWithNibName:@"MembersViewController" bundle:nil];
        vc.delegate=self;
        //    [self.navigationController pushViewController:vc animated:YES];
        vc.selectedDay = selectedDate;
        vc.Shift  = selectedShift;
            vc.serviceId = serviceId;
             vc.gender = selectedGender;
        vc.completionBlock = ^(NSString *area ,NSString *Price) {
            NSLog(@"%@",area);
            self.selectQuantityOfmembers.text = area;
            numberOfMembers = area;
            price = Price;
            self.AmountLbl.text = [NSString stringWithFormat:@"%@ %@",Price,Localized(@"KD")];
        };
        
        [self presentPopupViewController:vc animationType:MJPopupViewAnimationSlideBottomTop dismissed:nil];
    }
}
-(void)reset{
    self.selectQuantityOfmembers.text = @"";
    numberOfMembers = @"";
    price = @"";
    self.AmountLbl.text = Localized(@"000 KD");
}
- (IBAction)morningShiftAction:(id)sender {
    [self reset];
    selectedShift = @"1";
    
    [_morningShiftBtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
     [_evngshiftBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
    [_fullShiftBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];

}

- (IBAction)eveningShiftAction:(id)sender {
     [self reset];
    selectedShift = @"2";
    [_morningShiftBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
    [_evngshiftBtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
    [_fullShiftBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];

}
- (IBAction)fullShiftBtnAction:(id)sender {
    [self reset];
    selectedShift = @"3";
    [_morningShiftBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
    [_evngshiftBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
    [_fullShiftBtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
   
}
- (IBAction)bookandPayBtnAction:(id)sender{
    if([Utils loggedInUserId] != -1)
    {
    
    //        if (![Utils isOnline]) {
    //            [Utils showErrorAlertWithMessage:[MCLocalization stringForKey:@"internet_error"]];
    //            return;
    //        }
    
    if(_serviceTxtField.text.length == 0){
        [self showErrorAlertWithMessage:Localized(@"Please Select Service")];
    }else if(_selectAreaTxtField.text.length == 0){
        [self showErrorAlertWithMessage:Localized(@"Please Select Area")];
    }else if(_selectDayTxtField.text.length == 0){
        [self showErrorAlertWithMessage:Localized(@"Please Select Date")];
    }else if(_selectQuantityOfmembers.text.length == 0){
        [self showErrorAlertWithMessage:Localized(@"Please Select Quantity")];
    }else if(_enterAddressTxtField.text.length == 0){
        [self showErrorAlertWithMessage:Localized(@"Please Enter Address")];
    }else if(_blockTxtField.text.length == 0){
        [self showErrorAlertWithMessage:Localized(@"Please Enter BlockNumber")];
    }else if(_streetTxtField.text.length == 0){
        [self showErrorAlertWithMessage:Localized(@"Please Enter StreetNumber")];
    }else if(_juddaTxtField.text.length == 0){
        [self showErrorAlertWithMessage:Localized(@"Please Enter Judda")];
    }else if(_houseTxtFiled.text.length == 0){
        [self showErrorAlertWithMessage:Localized(@"Please Enter HouseNumber")];
    }
    else{
        [self makePostCallForPage:BOOK_PART_TIMEWORKERS withParams:@{@"member_id":[Utils loggedInUserIdStr],@"service_id":serviceId,@"type":selectedGender,
                                                                     @"area":areaId, @"day":_selectDayTxtField.text,
                                                                     @"shift":selectedShift, @"workers":_selectQuantityOfmembers.text, @"price":price, @"address":_enterAddressTxtField.text, @"block":_blockTxtField.text, @"street":_streetTxtField.text, @"judda":_juddaTxtField.text,
                                                                     @"house":_houseTxtFiled.text,
                                                                     @"request":_specialReqTxtview.text
                                                                     } withRequestCode:2000];
    }
    
    
}else{
    //[self showErrorAlertWithMessage:Localized(@"Please Login To ")];
    LoginViewController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    [self.navigationController pushViewController:obj animated:YES];
}
}
- (IBAction)serviceBtnAction:(id)sender {
    SelectReligionViewController *vc = [[SelectReligionViewController alloc] initWithNibName:@"SelectReligionViewController" bundle:nil];
    vc.delegate=self;
    vc.from = @"Service";
    //    [self.navigationController pushViewController:vc animated:YES];
    vc.completionBlock = ^(NSMutableDictionary *area) {
        NSLog(@"%@",area);
        if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
            self.serviceTxtField.text = [area valueForKey:@"title_ar"];
        }else{
            self.serviceTxtField.text = [area valueForKey:@"title"];
        }
        selectedService = area;
        serviceId=[selectedService valueForKey:@"id"];
    };
    
    [self presentPopupViewController:vc animationType:MJPopupViewAnimationSlideBottomTop dismissed:nil];
}
- (IBAction)maleBtnAction:(id)sender {
     [self reset];
    selectedGender = @"male";
    [_mailBtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
    [_femalebtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
}

- (IBAction)femaleBtnAction:(id)sender {
     [self reset];
    selectedGender = @"female";
    [_femalebtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
    [_mailBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];

}

@end
