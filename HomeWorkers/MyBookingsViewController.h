//
//  MyBookingsViewController.h
//  HomeWorkers
//
//  Created by apple on 04/05/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "Utils.h"
#import "Common.h"
@interface MyBookingsViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UIButton *AvailableWorkersBtn;
@property (weak, nonatomic) IBOutlet UIButton *homeWorkersBtn;
@property (weak, nonatomic) IBOutlet UIButton *PartimeWorkers;
@property (weak, nonatomic) IBOutlet UITableView *bookingTable;

@end
