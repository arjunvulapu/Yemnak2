//
//  AVworkersDetailViewController.m
//  HomeWorkers
//
//  Created by apple on 17/04/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import "AVworkersDetailViewController.h"
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"
#import "HWCommnetsCollectionViewCell.h"
#import <MessageUI/MessageUI.h>

@interface AVworkersDetailViewController ()
{
    UIButton *rightbutton;
}
@end

@implementation AVworkersDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.backView.layer.cornerRadius = 10;
    self.backView.clipsToBounds = YES;
   
    self.pImage.layer.cornerRadius = 10;
    self.pImage.clipsToBounds = YES;
    [self.pImage setImageWithURL:[self.workerDetails valueForKey:@"image"]  usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.title =[NSString stringWithFormat:@"%@", [self.workerDetails valueForKey:@"applicant_id"]];

    self.applicationId.text = [NSString stringWithFormat:@"%@", [self.workerDetails valueForKey:@"applicant_id"]];
    self.age.text = [NSString stringWithFormat:@"%@", [self.workerDetails valueForKey:@"age"]];
//    self.nationality.text = [NSString stringWithFormat:@"%@", [[self.workerDetails valueForKey:@"nationality"] valueForKey:@"title"]];
//    self.religion.text = [NSString stringWithFormat:@"%@", [[self.workerDetails valueForKey:@"religion"] valueForKey:@"title"]];
    
    
    if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
        self.nationality.text = [NSString stringWithFormat:@"%@", [[self.workerDetails valueForKey:@"nationality"] valueForKey:@"title_ar"]];
        self.religion.text = [NSString stringWithFormat:@"%@", [[self.workerDetails valueForKey:@"religion"] valueForKey:@"title_ar"]];
//        self.age.text = [NSString stringWithFormat:@"%@", [[self.workerDetails valueForKey:@"ages"] valueForKey:@"title_ar"]];
        
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
        
    }
    self.salary.text = [NSString stringWithFormat:@"%@ %@", [self.workerDetails valueForKey:@"salary"],Localized(@"KD")];
    self.amount.text = [NSString stringWithFormat:@"%@ %@", [self.workerDetails valueForKey:@"amount"],Localized(@"KD")];
    [self addtolayerTO:_callBtn];
    [self addtolayerTO:_emailbtn];
    
   // self.exptextView.textAlignment = NSTextAlignmentJustified;

    rightbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [buttonUser setImage:[UIImage imageNamed:@"leftarrow-black90"] forState:UIControlStateNormal];
    if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
        [rightbutton setImage:[UIImage imageNamed:@"right-arrow"] forState:UIControlStateNormal];
        self.exptextView.text = [NSString stringWithFormat:@"%@", [self.workerDetails valueForKey:@"experience_ar"] ];

    }else{
        [rightbutton setImage:[UIImage imageNamed:@"left-arrow"] forState:UIControlStateNormal];
        self.exptextView.text = [NSString stringWithFormat:@"%@", [self.workerDetails valueForKey:@"experience"] ];

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
    //self.callBtn.backgroundColor = BUTTON_BG_COLOR;
    //self.emailbtn.backgroundColor = BUTTON_BG_COLOR;
}
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
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
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HWCommnetsCollectionViewCell *ccell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HWCommnetsCollectionViewCell" forIndexPath:indexPath];
   
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
        NSString *email =[[self.workerDetails valueForKey:@"member"] valueForKey:@"email"];

       // NSString *email = [Settings  valueForKey:@"email"];
        [composeViewController setToRecipients:@[email]];
        [composeViewController setSubject:@""];
        [self presentViewController:composeViewController animated:YES completion:nil];
    }
}

- (IBAction)calBtnAction:(id)sender {
//    NSString *phNo = [[_workerDetails valueForKey:@"member"] valueForKey:@"phone"];
    NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [currentDefaults objectForKey:@"SETTINGS"];
    NSMutableDictionary *Settings = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    //NSString *phNo = [Settings  valueForKey:@"phone"];
    NSString *phNo =[[self.workerDetails valueForKey:@"member"] valueForKey:@"phone"];
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
- (IBAction)requestPayBtnAction:(id)sender {
}
- (IBAction)addcommnetsAction:(id)sender {
}
@end
