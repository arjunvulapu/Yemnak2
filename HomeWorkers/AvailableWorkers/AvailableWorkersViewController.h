//
//  AvailableWorkersViewController.h
//  HomeWorkers
//
//  Created by apple on 16/04/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface AvailableWorkersViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UITableView *homeWorkersTable;
@property (weak, nonatomic) IBOutlet UILabel *nolistLbl;

@end
