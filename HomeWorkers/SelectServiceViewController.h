//
//  SelectServiceViewController.h
//  Minwain
//
//  Created by Amit Kulkarni on 10/05/16.
//  Copyright © 2016 Amit Kulkarni. All rights reserved.
//

#import "BaseViewController.h"
#import "PopViewControllerDelegate.h"
#import "AppTableViewCell.h"
@interface SelectServiceViewController : BaseViewController
@property (nonnull) id<PopViewControllerDelegate> delegate;
@property (nonatomic) NSString *restId;
@property (nonatomic) NSString *from;

@property (nonatomic) NSMutableArray *arr;
@property (nonatomic, copy) void (^completionBlock)(NSMutableArray* dates);
@property(nonatomic,strong)NSMutableArray *areasList;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *closeBtn;
- (IBAction)close:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBtn;
@end
