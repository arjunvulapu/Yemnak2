//
//  Question2TableViewCell.h
//  YEMNAK
//
//  Created by apple on 14/07/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Question2TableViewCell : UITableViewCell<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *questionNUmber;
@property (weak, nonatomic) IBOutlet UITextView *questionTxtView;
@property (weak, nonatomic) IBOutlet UITableView *optionsTableView;
@property (strong, nonatomic) NSMutableArray *options;
@property (strong, nonatomic) NSString *selectedOption;

@property (nonatomic) void (^MoveProduct)();

@end
