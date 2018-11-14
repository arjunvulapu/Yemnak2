//
//  HomeWorkersTableViewCell.h
//  HomeWorkers
//
//  Created by apple on 16/04/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeWorkersTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIImageView *pImage;
@property (weak, nonatomic) IBOutlet UILabel *applicationIDL;
@property (weak, nonatomic) IBOutlet UILabel *ageL;
@property (weak, nonatomic) IBOutlet UILabel *age;
@property (weak, nonatomic) IBOutlet UILabel *applicationId;
@property (weak, nonatomic) IBOutlet UILabel *nationalityL;
@property (weak, nonatomic) IBOutlet UILabel *religionL;
@property (weak, nonatomic) IBOutlet UILabel *nationality;
@property (weak, nonatomic) IBOutlet UILabel *religion;
@property (weak, nonatomic) IBOutlet UILabel *salaryL;
@property (weak, nonatomic) IBOutlet UILabel *amountL;
@property (weak, nonatomic) IBOutlet UILabel *salary;
@property (weak, nonatomic) IBOutlet UILabel *amount;
@end
