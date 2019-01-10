//
//  FilterViewController.h
//  Minwain
//
//  Created by Amit Kulkarni on 10/05/16.
//  Copyright © 2016 Amit Kulkarni. All rights reserved.
//

#import "BaseViewController.h"
#import "PopViewControllerDelegate.h"
#import "AppTableViewCell.h"
@interface FilterViewController : BaseViewController
@property (nonnull) id<PopViewControllerDelegate> delegate;
@property (nonatomic) NSString *restId;
@property (nonatomic, copy) void (^completionBlock)(NSMutableDictionary *area,NSDictionary *nationality,NSDictionary *religion,NSDictionary *age);
@property (nonatomic, copy) void (^completionBlockAW)(NSMutableDictionary *area,NSDictionary *nationality,NSDictionary *religion,NSString *age);

@property(nonatomic,strong)NSMutableArray *areasList;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *closeBtn;
- (IBAction)close:(id)sender;
- (IBAction)shownationality:(id)sender;
- (IBAction)showReligion:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *fromSal;
@property (weak, nonatomic) IBOutlet UITextField *toSAl;
@property (weak, nonatomic) IBOutlet UITextField *nationalityTxtfiled;
@property (weak, nonatomic) IBOutlet UITextField *religionTxtFiled;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;
@property (weak, nonatomic) IBOutlet UILabel *minSalLbl;
@property (weak, nonatomic) IBOutlet UILabel *maximumSalLbl;
- (IBAction)submitBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *ageTxtField;
- (IBAction)selectAgeBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *AmountTxtField;
- (IBAction)amountBtnAction:(id)sender;
- (IBAction)fromsalBtnAction:(id)sender;
- (IBAction)toSalBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *maleBtn;
- (IBAction)maleBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *femaleBtn;
- (IBAction)femaleBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *maleLbl;
@property (weak, nonatomic) IBOutlet UILabel *femaleLbl;
@property (weak, nonatomic) IBOutlet UIButton *resetBtn;
- (IBAction)resetBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *toAgeTxtField;
- (IBAction)toAgeBtnAction:(id)sender;


@property (strong,nonatomic) NSString *From;

@property (assign,nonatomic) NSString *ages;
@property (assign,nonatomic) NSString *toAges;

@property (assign,nonatomic) NSDictionary *nationality;
@property (assign,nonatomic) NSDictionary *religion;
@property (assign,nonatomic) NSString *gender;
@property (assign,nonatomic) NSDictionary *age;














@end
