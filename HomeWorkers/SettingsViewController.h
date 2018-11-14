//
//  SettingsViewController.h
//  HomeWorkers
//
//  Created by apple on 07/05/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface SettingsViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UIButton *editProfileBtn;
@property (weak, nonatomic) IBOutlet UIButton *myOrderBtn;
@property (weak, nonatomic) IBOutlet UIButton *logOutBtn;
@property (weak, nonatomic) IBOutlet UIButton *changeLanguageBtn;
- (IBAction)editProfileBtnAction:(id)sender;
- (IBAction)myorderBtnAction:(id)sender;
- (IBAction)logoutBtnAction:(id)sender;
- (IBAction)changeLanguageBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *settingsTableView;

@end
