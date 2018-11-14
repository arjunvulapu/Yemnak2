//
//  CorporateRequestsListViewController.h
//  YEMNAK
//
//  Created by apple on 10/07/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "Common.h"
@interface CorporateRequestsListViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(weak,nonatomic) NSString *from;
@property (weak, nonatomic) IBOutlet UILabel *emptyLbl;
@end
