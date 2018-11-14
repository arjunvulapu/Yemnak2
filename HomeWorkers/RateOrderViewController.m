//
//  RateOrderViewController.m
//  Minwain
//
//  Created by Amit Kulkarni on 28/05/16.
//  Copyright © 2016 Amit Kulkarni. All rights reserved.
//

#import "RateOrderViewController.h"
#import "RatingBar.h"
#import "SZTextView.h"
#import "Common.h"
@interface RateOrderViewController ()
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property (nonatomic) RatingBar *bar;
@property (weak, nonatomic) IBOutlet SZTextView *textInfo;
@property (weak, nonatomic) IBOutlet UINavigationItem *navItem;
@property (weak, nonatomic) IBOutlet UIView *viewRating;
@property (weak, nonatomic) IBOutlet UIButton *buttonSubmit;

@end

@implementation RateOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.buttonSubmit.layer.cornerRadius = self.buttonSubmit.frame.size.height/2;
    self.buttonSubmit.clipsToBounds = YES;
    self.buttonSubmit.layer.borderWidth = 2.0f;
    self.buttonSubmit.layer.borderColor = [UIColor whiteColor].CGColor;
    self.buttonSubmit.backgroundColor=BUTTON_BG_COLOR;
    self.navItem.title = Localized(@"Rate Order");
    [self.buttonSubmit setTitle:Localized(@"Submit") forState:UIControlStateNormal];
    [self.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.textInfo.placeholder = Localized(@"Enter Review");
//    self.bar = [[RatingBar alloc] initWithFrame:CGRectMake(50, 50, 180, 30)];
//    self.bar.backgroundColor = [UIColor redColor];
//    self.bar.center = self.view.center;
//    self.bar.starNumber = 5;
//    [self.viewRating addSubview:self.bar];
    
    self.bar = [[RatingBar alloc] initWithFrame:CGRectMake(50, 50, 180, 30)];
    self.bar.backgroundColor= [UIColor blackColor];
    [self.view addSubview:self.bar];
}

- (void)viewWillAppear:(BOOL)animated {
    self.view.layer.cornerRadius = 10;
    self.view.clipsToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)submit:(id)sender {
    [self makePostCallForPage:PAGE_ADD_RATING withParams:@{@"worker_id":self.orderId,@"member_id":[Utils loggedInUserIdStr],@"rating":[NSString stringWithFormat:@"%ld", self.bar.starNumber], @"comments":self.textInfo.text} withRequestCode:1];
}
- (IBAction)close:(id)sender {
    [self.delegate cancelButtonClicked:self];
    
}
- (void)parseResult:(id)result withCode:(int)reqeustCode {
    self.completionBlock(@"str");
    [self.delegate cancelButtonClicked:self];
}

@end
