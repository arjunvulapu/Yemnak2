//
//  CorporateListTableViewCell.m
//  YEMNAK
//
//  Created by apple on 10/07/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import "CorporateListTableViewCell.h"
#import "MCLocalization.h"
@implementation CorporateListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _dateLbl.text=Localized(@"Date");
    _requestNoLbl.text=Localized(@"Request No.");
    _statusLbl.text=Localized(@"Status");

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
