//
//  MembersViewController.h
//  Minwain
//
//  Created by Amit Kulkarni on 10/05/16.
//  Copyright © 2016 Amit Kulkarni. All rights reserved.
//

#import "BaseViewController.h"
#import "PopViewControllerDelegate.h"
#import "AppTableViewCell.h"
@interface MembersViewController : BaseViewController
@property (nonnull) id<PopViewControllerDelegate> delegate;
@property (nonatomic) NSString *restId;
@property (nonatomic, copy) void (^completionBlock)(NSString *area,NSString *price);

@property (nonatomic, copy) void (^completionBlock2)(NSDictionary *age);
@property (nonatomic, copy) void (^completionBlock3)(NSString *age);

@property(nonatomic,strong)NSMutableArray *areasList;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *closeBtn;
- (IBAction)close:(id)sender;
@property(nonatomic,strong)NSString *selectedDay;
@property(nonatomic,strong)NSString *Shift;
@property(nonatomic,strong)NSString *serviceId;
@property(nonatomic,strong)NSString *gender;
@property (weak, nonatomic) IBOutlet UILabel *emptyLbl;


@property(nonatomic,strong)NSString *from;

@end
