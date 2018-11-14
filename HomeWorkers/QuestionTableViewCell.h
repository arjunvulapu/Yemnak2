//
//  QuestionTableViewCell.h
//  YEMNAK
//
//  Created by apple on 14/07/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JVFloatLabeledTextField/JVFloatLabeledTextView.h>
@interface QuestionTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *questionNumber;
@property (weak, nonatomic) IBOutlet UITextView *questionTxtView;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextView *answerTxtView;

@end
