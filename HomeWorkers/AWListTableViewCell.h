//
//  AWListTableViewCell.h
//  YEMNAK
//
//  Created by apple on 10/07/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"
@interface AWListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *dateLbl;
@property (weak, nonatomic) IBOutlet UILabel *requestNoLbl;
@property (weak, nonatomic) IBOutlet UILabel *statusLbl;
@property (weak, nonatomic) IBOutlet UILabel *dateRLbl;
@property (weak, nonatomic) IBOutlet UILabel *requestNoRLbl;
@property (weak, nonatomic) IBOutlet UILabel *statusRLbl;
- (IBAction)edit:(id)sender;
@property (nonatomic) void (^deleteCell)();
@property (nonatomic) void (^editCell)();

@end
