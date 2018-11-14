//
//  QuestionTableViewCell.m
//  YEMNAK
//
//  Created by apple on 14/07/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import "QuestionTableViewCell.h"
#import "Common.h"
#import "BaseViewController.h"
@implementation QuestionTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.answerTxtView.text=@"";
    self.answerTxtView.placeholder = Localized(@"Answer");
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
