//
//  MyBookingsViewController.m
//  HomeWorkers
//
//  Created by apple on 04/05/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import "MyBookingsViewController.h"

@interface MyBookingsViewController ()
{
    UIButton *buttonUser;
}
@end

@implementation MyBookingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addtolayerTO:self.AvailableWorkersBtn];
    [self addtolayerTO:self.homeWorkersBtn];
    [self addtolayerTO:self.PartimeWorkers];
    self.title = Localized(@"My Bookings");
    
    [self.AvailableWorkersBtn setTitle:Localized(@"Available Workers") forState:UIControlStateNormal];
    [self.homeWorkersBtn setTitle:Localized(@"Home Workers") forState:UIControlStateNormal];
    [self.PartimeWorkers setTitle:Localized(@"Parttime Workers") forState:UIControlStateNormal];
    // Do any additional setup after loading the view.
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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
