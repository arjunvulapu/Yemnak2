//
//  MainTableViewCell.h
//  HomeWorkers
//
//  Created by apple on 16/04/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *mainimage;
@property (weak, nonatomic) IBOutlet UIImageView *imageover;
@property (weak, nonatomic) IBOutlet UILabel *catName;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
- (IBAction)addBtnAction:(id)sender;
@property (nonatomic) void (^Add)();

@end
