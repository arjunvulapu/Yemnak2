//
//  ContactUsTableViewCell.m
//  HomeWorkers
//
//  Created by apple on 11/05/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import "ContactUsTableViewCell.h"

@implementation ContactUsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)callBtnAction:(id)sender {
    if(self.calling){
        self.calling();
    }
}
- (IBAction)emailBtnAction:(id)sender {
    if(self.Email){
        self.Email();
    }
}
@end
