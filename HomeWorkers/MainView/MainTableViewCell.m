//
//  MainTableViewCell.m
//  HomeWorkers
//
//  Created by apple on 16/04/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import "MainTableViewCell.h"

@implementation MainTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.mainimage.layer.cornerRadius = 10;
    self.mainimage.clipsToBounds = YES;
    self.imageover.layer.cornerRadius = 10;
    self.imageover.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)addBtnAction:(id)sender {
    if (self.Add) {
        self.Add();
    }
}
@end
