//
//  OptionsTableViewCell.h
//  YEMNAK
//
//  Created by apple on 14/07/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OptionsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet UILabel *optionTitle;
- (IBAction)optionSelected:(id)sender;
@property (nonatomic) void (^chooseOption)();
@end
