//
//  HomeWorkersTableViewCell.m
//  HomeWorkers
//
//  Created by apple on 16/04/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import "HomeWorkersTableViewCell.h"
#import "Common.h"
#import "MCLocalization.h"
@implementation HomeWorkersTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backView.layer.cornerRadius = 10;
    self.backView.clipsToBounds = YES;
    self.pImage.layer.cornerRadius = 10;
    self.pImage.clipsToBounds = YES;

    
    self.applicationIDL.text=Localized(@"Applicant ID");
    self.nationalityL.text=Localized(@"Nationality");
    self.salaryL.text=Localized(@"Salary");
    self.ageL.text=Localized(@"Age");
    self.religionL.text=Localized(@"Religion");
    self.amountL.text=Localized(@"Amount");
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
