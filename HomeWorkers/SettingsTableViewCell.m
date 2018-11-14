//
//  SettingsTableViewCell.m
//  HomeWorkers
//
//  Created by apple on 11/05/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import "SettingsTableViewCell.h"
#import "Utils.h"
#import "Common.h"
@implementation SettingsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)pBtnAction:(id)sender {
    if(self.btnAction){
        self.btnAction();
    }
}
@end
