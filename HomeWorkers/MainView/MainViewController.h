//
//  MainViewController.h
//  HomeWorkers
//
//  Created by apple on 16/04/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *contactUsBtn;
@property (weak, nonatomic) IBOutlet UIButton *aboutUsBtn;
@property (weak, nonatomic) IBOutlet UIButton *settingsBtn;
@property (weak, nonatomic) IBOutlet UITableView *mainTable;
- (IBAction)contactUsBtnAction:(id)sender;
- (IBAction)settingsBtnAction:(id)sender;

- (IBAction)aboutUsBtnAction:(id)sender;
@end
