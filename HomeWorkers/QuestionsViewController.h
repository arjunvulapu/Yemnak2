//
//  QuestionsViewController.h
//  YEMNAK
//
//  Created by apple on 14/07/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface QuestionsViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UITableView *questionTableView;
@property(strong,nonatomic) NSString *entireData;
@property(strong,nonatomic) NSMutableDictionary *formData;
@property(strong,nonatomic) NSMutableArray *Qlist;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;
- (IBAction)submitAnswers:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *chefQuestionsLbl;
@property(strong,nonatomic)NSString *jobTitle;
@property(strong,nonatomic) UIImage *resumeImage;
@end
