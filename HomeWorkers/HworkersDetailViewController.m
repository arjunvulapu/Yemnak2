//
//  HworkersDetailViewController.m
//  HomeWorkers
//
//  Created by apple on 17/04/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import "HworkersDetailViewController.h"
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"
#import "HWCommnetsCollectionViewCell.h"
#import "RateOrderViewController.h"
#import "UIViewController+MJPopupViewController.h"
#import "PopViewControllerDelegate.h"
#import <MessageUI/MessageUI.h>
#import "PaymentViewController.h"
#import "MWPhotoBrowser.h"
#import "LoginViewController.h"
#import "BFRImageViewController.h"
@interface HworkersDetailViewController ()<MFMailComposeViewControllerDelegate,MWPhotoBrowserDelegate>
{
    UIButton *rightbutton;
    NSMutableArray *comments;
    
        NSMutableArray *propertices;
        NSMutableArray *photos ;
        NSMutableArray *thumbs ;
    
}
@end

@implementation HworkersDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    comments=[[NSMutableArray alloc]init];
    [self makePostCallForPage:WORKER_COMMENTS withParams:@{@"worker_id":[_workerDetails valueForKey:@"id"]} withRequestCode:101];
    // Do any additional setup after loading the view.
    
    
    _noCommentsLbl.text=Localized(@"No Comments");
    [_noCommentsLbl setHidden:YES];
    
    self.backView.layer.cornerRadius = 10;
    self.backView.clipsToBounds = YES;
    self.paymentbackgroundView.layer.cornerRadius = 20;
    self.paymentbackgroundView.clipsToBounds = YES;
    self.pImage.layer.cornerRadius = 10;
    self.pImage.clipsToBounds = YES;
    [self.pImage setImageWithURL:[self.workerDetails valueForKey:@"image2"]  usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.title =[NSString stringWithFormat:@"%@", [self.workerDetails valueForKey:@"applicant_id"]];
    self.applicationId.text = [NSString stringWithFormat:@"%@", [self.workerDetails valueForKey:@"applicant_id"]];
    self.age.text = [NSString stringWithFormat:@"%@", [self.workerDetails valueForKey:@"age"]];
//    self.nationality.text = [NSString stringWithFormat:@"%@", [[self.workerDetails valueForKey:@"nationality"] valueForKey:@"title"]];
//    self.religion.text = [NSString stringWithFormat:@"%@", [[self.workerDetails valueForKey:@"religion"] valueForKey:@"title"]];
//    self.callBtn.backgroundColor = BUTTON_BG_COLOR;
//    self.emailbtn.backgroundColor = BUTTON_BG_COLOR;
    //    self.requestpy.backgroundColor = BUTTON_BG_COLOR;
    self.detailsTxtview.text = @"";
    [self addtolayerTO:self.requestpy];
    if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
        self.nationality.text = [NSString stringWithFormat:@"%@", [[self.workerDetails valueForKey:@"nationality"] valueForKey:@"title_ar"]];
        self.religion.text = [NSString stringWithFormat:@"%@", [[self.workerDetails valueForKey:@"religion"] valueForKey:@"title_ar"]];
//        self.age.text = [NSString stringWithFormat:@"%@", [[self.workerDetails valueForKey:@"ages"] valueForKey:@"title_ar"]];
        self.aboutWorkTxtView.text = [NSString stringWithFormat:@"%@", [self.workerDetails valueForKey:@"about_ar"] ];
        self.exptextView.text = [NSString stringWithFormat:@"%@", [self.workerDetails valueForKey:@"experience_ar"] ];
        [self.religion setTextAlignment:NSTextAlignmentLeft];
        [self.age setTextAlignment:NSTextAlignmentLeft];
        [self.amount setTextAlignment:NSTextAlignmentLeft];
    }else{
        [self.religion setTextAlignment:NSTextAlignmentRight];
        [self.age setTextAlignment:NSTextAlignmentRight];
        [self.amount setTextAlignment:NSTextAlignmentRight];
        self.nationality.text = [NSString stringWithFormat:@"%@", [[self.workerDetails valueForKey:@"nationality"] valueForKey:@"title"]];
        self.religion.text = [NSString stringWithFormat:@"%@", [[self.workerDetails valueForKey:@"religion"] valueForKey:@"title"]];
//        self.age.text = [NSString stringWithFormat:@"%@", [[self.workerDetails valueForKey:@"ages"] valueForKey:@"title"]];
        self.aboutWorkTxtView.text = [NSString stringWithFormat:@"%@", [self.workerDetails valueForKey:@"about"] ];
        self.exptextView.text = [NSString stringWithFormat:@"%@", [self.workerDetails valueForKey:@"experience"] ];

    }
    self.salary.text = [NSString stringWithFormat:@"%@ %@", [self.workerDetails valueForKey:@"salary"],Localized(@"KD")];
    self.amount.text = [NSString stringWithFormat:@"%@ %@", [self.workerDetails valueForKey:@"amount"],Localized(@"KD")];
    [self addtolayerTO:_callBtn];
    [self addtolayerTO:_emailbtn];
//    _partialAmount.layer.cornerRadius = _partialAmount.frame.size.height/2;
//    _partialAmount.clipsToBounds = YES;
//    _partialAmount.layer.borderWidth = 2.0f;
//    _partialAmount.layer.borderColor = [UIColor blackColor].CGColor;
    self.aboutWorkLbl.text = Localized(@"About Worker");
 
    //    self.reasonForLeavingTxtView.placeholder = Localized(@"Reason For Leaving(be specific)");
    self.detailsTxtview.placeholder = Localized(@"Write Details");
    
    self.detailsTxtview.placeholderTextColor = PLACEHOLDER_COLOR;
    
    //self.exptextView.textAlignment = NSTextAlignmentJustified;
    //self.aboutWorkTxtView.textAlignment = NSTextAlignmentJustified;

    self.partialAmount.text = [NSString stringWithFormat:@"%@ %@", [self.workerDetails valueForKey:@"part_amount"],Localized(@"KD") ];
    self.fullamount.text =[NSString stringWithFormat:@"%@ %@", [self.workerDetails valueForKey:@"amount"] ,Localized(@"KD")];
    self.registerAmount.text =[NSString stringWithFormat:@"%d %@", [[self.workerDetails valueForKey:@"amount"] intValue]-[[self.workerDetails valueForKey:@"part_amount"] intValue],Localized(@"KD")];
    self.partialAmount.textAlignment = UITextAlignmentCenter;
    
    
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
    
    
    self.applicationIDL.text=Localized(@"Applicant ID");
    self.nationalityL.text=Localized(@"Nationality");
    self.salaryL.text=Localized(@"Salary");
    self.ageL.text=Localized(@"Age");
    self.religionL.text=Localized(@"Religion");
    self.amountL.text=Localized(@"Amount");
    
    [self.callBtn setTitle:Localized(@"Call") forState:UIControlStateNormal];
    [self.emailbtn setTitle:Localized(@"Email") forState:UIControlStateNormal];
    self.experienceL.text=Localized(@"Experience");
    self.partialAmountL.text=Localized(@"Partial amount to be paid");
    self.fullamountL.text=Localized(@"Full Amount");
    self.registerAmountL.text=Localized(@"Remaining Amount");
    self.comments.text=Localized(@"Comments");
    self.paymentDetailsL.text=Localized(@"Payment Details");
    [self.addcomments setTitle:Localized(@"Add Your Comments") forState:UIControlStateNormal];
   
    [self.requestpy setTitle:Localized(@"Request and Pay") forState:UIControlStateNormal];

    //self.aboutWorkTxtView.textAlignment = NSTextAlignmentJustified;

    

}
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)parseResult:(id)result withCode:(int)reqeustCode{
    NSLog(@"%@",result);
    if(reqeustCode == 101){
        
        comments = result;
        _commentsCollectionvie.reloadData;
        if(comments.count==0){
            _noCommentsLbl.hidden=false;
        }
    }else  if(reqeustCode == 2002)
    
    {
        self.completionBlock();
        [self.navigationController popViewControllerAnimated:YES];
        [self showSuccessMessage:Localized(@"Payment SucessFully")];
    } else if(reqeustCode==200){
        
        if ([[result valueForKey:@"status"] isEqualToString:@"Failed"]) {
            NSString *str=[result valueForKey:@"message"];
            [self showErrorAlertWithMessage:Localized(str)];
            
        } else {
            [self NeedToPay:[NSString stringWithFormat:@"%@", [result valueForKey:@"id"]]];
            // [Utils loginUserWithMemberId:[result valueForKey:@"member_id"] withType:@"User"];
            
            // [self.navigationController popViewControllerAnimated:YES];
            
        }
    }
    else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}
-(void)addtolayerTO:(UIButton *)button{
    button.layer.cornerRadius = button.frame.size.height/2;
    button.clipsToBounds = YES;
    button.layer.borderWidth = 2.0f;
    button.layer.borderColor = [UIColor whiteColor].CGColor;
    
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
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return comments.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HWCommnetsCollectionViewCell *ccell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HWCommnetsCollectionViewCell" forIndexPath:indexPath];
   
    NSMutableDictionary *comment = [comments objectAtIndex:indexPath.row];
    ccell.comment.text = [NSString stringWithFormat:@"%@",[comment valueForKey:@"comments"]];
    ccell.memberName.text =[NSString stringWithFormat:@"%@ %@",[[comment valueForKey:@"member"] valueForKey:@"firstname"],[[comment valueForKey:@"member"] valueForKey:@"lastname"]];
    ccell.ratingView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%dstar",[[comment valueForKey:@"rating"] intValue]]];
    return ccell;
    
}
- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //        return CGSizeMake(CGRectGetWidth(collectionView.frame)/2.2, CGRectGetHeight(collectionView.frame));
    return CGSizeMake((CGRectGetWidth(collectionView.frame)/2.3)-8, (CGRectGetWidth(collectionView.frame)/4)+20);
    
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    
    return 2.0;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(2, 2, 2, 2);
}
- (IBAction)emailbtnAction:(id)sender {
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *composeViewController = [[MFMailComposeViewController alloc] initWithNibName:nil bundle:nil];
        [composeViewController setMailComposeDelegate:self];
        NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
        NSData *data = [currentDefaults objectForKey:@"SETTINGS"];
        NSMutableDictionary *Settings = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        NSString *email = [Settings  valueForKey:@"email"];

        [composeViewController setToRecipients:@[email]];
        [composeViewController setSubject:@"example subject"];
        [self presentViewController:composeViewController animated:YES completion:nil];
    }
}

- (IBAction)calBtnAction:(id)sender {
    NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [currentDefaults objectForKey:@"SETTINGS"];
    NSMutableDictionary *Settings = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    NSString *phNo = [Settings  valueForKey:@"phone"];
    NSURL *phoneUrl = [NSURL URLWithString:[NSString  stringWithFormat:@"telprompt:%@",phNo]];
    
    if ([[UIApplication sharedApplication] canOpenURL:phoneUrl]) {
        [[UIApplication sharedApplication] openURL:phoneUrl];
    } else
    {
        UIAlertView *calert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Call facility is not available!!!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [calert show];
    }
}
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    //Add an alert in case of failure
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)NeedToPay:(NSString *)bookingId{
    
    
    
    PaymentViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"PaymentViewController"];
    vc.amount = [self.workerDetails valueForKey:@"part_amount"];
    vc.pageName = @"home_work_bookings";
    vc.invoice_id = [NSString stringWithFormat:@"%@", bookingId];
    
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
            [self makePostCallForPage:HW_BOOKING_PAYMENT_SUCCESS withParams:@{@"member_id":[Utils loggedInUserIdStr],
                                                              @"req_id":bookingId
                                                              
                                                              } withRequestCode:2002];
            
            
            
        } else {
            [Utils showErrorAlertWithMessage:Localized(@"payment_failed")];
        }
    };
    
    [self.navigationController pushViewController:vc animated:YES];
    
    
    
}
- (IBAction)requestPayBtnAction:(id)sender {
     if([Utils loggedInUserId] != -1)
    {
        
        [self makePostCallForPage:HW_BOOKING withParams:@{@"member_id":[Utils loggedInUserIdStr],
                                                          @"worker_id":[self.workerDetails valueForKey:@"id"]
                                                          
                                                          } withRequestCode:200];
        
    }else{
        //[self showErrorAlertWithMessage:Localized(@"Please Login To ")];
        LoginViewController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        [self.navigationController pushViewController:obj animated:YES];
    }
}
- (IBAction)addcommnetsAction:(id)sender {
    if([Utils loggedInUserId] != -1)
    {
    RateOrderViewController *vc = [[RateOrderViewController alloc] initWithNibName:@"RateOrderViewController" bundle:nil];
    vc.delegate = self;
    vc.orderId = [self.workerDetails valueForKey:@"id"];
    vc.completionBlock = ^(NSString *area){
        comments=[[NSMutableArray alloc]init];
        [self makePostCallForPage:WORKER_COMMENTS withParams:@{@"worker_id":[_workerDetails valueForKey:@"id"]} withRequestCode:101];
    };
    [self presentPopupViewController:vc animationType:MJPopupViewAnimationSlideBottomTop dismissed:nil];
    }else{
        //[self showErrorAlertWithMessage:Localized(@"Please Login To ")];
        LoginViewController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        [self.navigationController pushViewController:obj animated:YES];
    }
        
}
- (void)cancelButtonClicked:(UIViewController *)secondDetailViewController {
    [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationSlideTopBottom];
}
- (IBAction)imageViewerAction:(id)sender {
    //[self showImage:[_workerDetails valueForKey:@"image2"]];
    BFRImageViewController *imageVC = [[BFRImageViewController alloc] initWithImageSource:@[[_workerDetails valueForKey:@"image2"]]];
    [imageVC setModalPresentationStyle:UIModalPresentationCustom];
    [imageVC setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentViewController:imageVC animated:YES completion:nil];

}
#pragma mark - MWPhotoBrowserDelegate
-(void)showImage:(NSString *)imageurl{
    // Browser
    photos = [[NSMutableArray alloc] init];
    thumbs = [[NSMutableArray alloc] init];
    MWPhoto *photo;
    //    MWPhoto *thumb;
    BOOL displayActionButton = YES;
    BOOL displaySelectionButtons = NO;
    BOOL displayNavArrows = NO;
    BOOL enableGrid = NO;
    BOOL startOnGrid = NO;
    BOOL autoPlayOnAppear = NO;
    
    
    
    NSString *url_Img = imageurl;
    
    photo = [MWPhoto photoWithURL:[NSURL URLWithString:url_Img]];
    [photos addObject:photo];
    
    // Create browser
    MWPhotoBrowser *browser = [[MWPhotoBrowser alloc] initWithDelegate:self];
//    browser.displayActionButton = displayActionButton;
//    browser.displayNavArrows = displayNavArrows;
//    browser.displaySelectionButtons = displaySelectionButtons;
//    browser.alwaysShowControls = displaySelectionButtons;
//    browser.zoomPhotosToFill = NO;
//    browser.enableGrid = enableGrid;
//    browser.startOnGrid = startOnGrid;
//    browser.enableSwipeToDismiss = NO;
//    browser.autoPlayOnAppear = autoPlayOnAppear;
    //    browser.title = @"my";
    browser.displayActionButton = YES;
    browser.zoomPhotosToFill = NO;
    browser.alwaysShowControls = YES;
    [browser setCurrentPhotoIndex:0];
    
    // Show
    // Push
    [self.navigationController pushViewController:browser animated:YES];
    
    //    [self presentViewController:browser animated:YES completion:nil];
    
}
- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser {
    return photos.count;
}

- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index {
    if (index < photos.count)
    return [photos objectAtIndex:index];
    return nil;
}

- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser thumbPhotoAtIndex:(NSUInteger)index {
    if (index < thumbs.count)
    return [thumbs objectAtIndex:index];
    return nil;
}
- (void)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index selectedChanged:(BOOL)selected {
    //    [_selections replaceObjectAtIndex:index withObject:[NSNumber numberWithBool:selected]];
    NSLog(@"Photo at index %lu selected %@", (unsigned long)index, selected ? @"YES" : @"NO");
}
- (void)photoBrowser:(MWPhotoBrowser *)photoBrowser didDisplayPhotoAtIndex:(NSUInteger)index{
    
}

- (void)photoBrowserDidFinishModalPresentation:(MWPhotoBrowser *)photoBrowser {
    // If we subscribe to this method we must dismiss the view controller ourselves
    NSLog(@"Did finish modal presentation");
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
