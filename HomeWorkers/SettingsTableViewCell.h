//
//  SettingsTableViewCell.h
//  HomeWorkers
//
//  Created by apple on 11/05/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *pName;
@property (weak, nonatomic) IBOutlet UIButton *pbutton;
- (IBAction)pBtnAction:(id)sender;
@property(nonatomic) void (^btnAction)();
@end
