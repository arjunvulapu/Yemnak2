//
//  HworkersDetailViewController.h
//  HomeWorkers
//
//  Created by apple on 17/04/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import <JVFloatLabeledTextField/JVFloatLabeledTextView.h>
@interface HworkersDetailViewController :BaseViewController
@property(strong,nonatomic) NSMutableDictionary *workerDetails;
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIImageView *pImage;
@property (weak, nonatomic) IBOutlet UILabel *applicationIDL;
@property (weak, nonatomic) IBOutlet UILabel *ageL;
@property (weak, nonatomic) IBOutlet UILabel *age;
@property (weak, nonatomic) IBOutlet UILabel *applicationId;
@property (weak, nonatomic) IBOutlet UILabel *nationalityL;
@property (weak, nonatomic) IBOutlet UILabel *religionL;
@property (weak, nonatomic) IBOutlet UILabel *nationality;
@property (weak, nonatomic) IBOutlet UILabel *religion;
@property (weak, nonatomic) IBOutlet UILabel *salaryL;
@property (weak, nonatomic) IBOutlet UILabel *amountL;
@property (weak, nonatomic) IBOutlet UILabel *salary;
@property (weak, nonatomic) IBOutlet UILabel *amount;
@property (weak, nonatomic) IBOutlet UIButton *callBtn;
@property (weak, nonatomic) IBOutlet UIButton *emailbtn;
- (IBAction)emailbtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *noCommentsLbl;

- (IBAction)calBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *experienceL;
@property (weak, nonatomic) IBOutlet UITextView *exptextView;
@property (weak, nonatomic) IBOutlet UILabel *paymentDetailsL;
@property (weak, nonatomic) IBOutlet UIView *paymentbackgroundView;
@property (weak, nonatomic) IBOutlet UILabel *fullamountL;
@property (weak, nonatomic) IBOutlet UILabel *registerAmountL;
@property (weak, nonatomic) IBOutlet UILabel *fullamount;
@property (weak, nonatomic) IBOutlet UILabel *registerAmount;
@property (weak, nonatomic) IBOutlet UILabel *partialAmountL;
@property (weak, nonatomic) IBOutlet UILabel *partialAmount;
@property (weak, nonatomic) IBOutlet UIButton *requestpy;
- (IBAction)requestPayBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *comments;
@property (weak, nonatomic) IBOutlet UIButton *addcomments;
- (IBAction)addcommnetsAction:(id)sender;
@property (weak, nonatomic) IBOutlet UICollectionView *commentsCollectionvie;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextView *detailsTxtview;
@property (weak, nonatomic) IBOutlet UILabel *aboutWorkLbl;
@property (weak, nonatomic) IBOutlet UITextView *aboutWorkTxtView;
@property (nonatomic, copy) void (^completionBlock)();
@property (weak, nonatomic) IBOutlet UIButton *imageViewer;
- (IBAction)imageViewerAction:(id)sender;

@end
