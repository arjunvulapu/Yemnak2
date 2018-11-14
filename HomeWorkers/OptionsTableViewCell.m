//
//  OptionsTableViewCell.m
//  YEMNAK
//
//  Created by apple on 14/07/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import "OptionsTableViewCell.h"

@implementation OptionsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)optionSelected:(id)sender {
    if (self.chooseOption) {
        self.chooseOption();
    }
}
@end
