//
//  SelectFormViewController.h
//  Minwain
//
//  Created by Amit Kulkarni on 10/05/16.
//  Copyright © 2016 Amit Kulkarni. All rights reserved.
//

#import "BaseViewController.h"
#import "PopViewControllerDelegate.h"
#import "AppTableViewCell.h"
@interface SelectFormViewController : BaseViewController
@property (nonnull) id<PopViewControllerDelegate> delegate;
@property (nonatomic) NSString *restId;
@property (nonatomic, copy) void (^completionBlock)(NSString *area);
@property(nonatomic,strong)NSMutableArray *areasList;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *closeBtn;
- (IBAction)close:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *corporateRequestBtn;
@property (weak, nonatomic) IBOutlet UIButton *employeeRequestBtn;
- (IBAction)corporateBtnAction:(id)sender;
- (IBAction)employeebtnAction:(id)sender;
@end
