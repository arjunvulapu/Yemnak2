//
//  ContactUsTableViewCell.h
//  HomeWorkers
//
//  Created by apple on 11/05/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactUsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *callBtn;
- (IBAction)callBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *emailBtn;
- (IBAction)emailBtnAction:(id)sender;
@property (nonatomic) void (^calling)();
@property (nonatomic) void (^Email)();
@end
