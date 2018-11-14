//
//  PriceViewController.h
//  Minwain
//
//  Created by Amit Kulkarni on 10/05/16.
//  Copyright © 2016 Amit Kulkarni. All rights reserved.
//

#import "BaseViewController.h"
#import "PopViewControllerDelegate.h"
#import "AppTableViewCell.h"
@interface PriceViewController : BaseViewController
@property (nonnull) id<PopViewControllerDelegate> delegate;
@property (nonatomic) NSString *restId;
@property (nonatomic, copy) void (^completionBlock)(NSString *area);
@property(nonatomic,strong)NSMutableArray *areasList;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *closeBtn;
- (IBAction)close:(id)sender;
//@property(nonatomic,strong)NSString *selectedDay;
//@property(nonatomic,strong)NSString *Shift;
@property(nonatomic,strong)NSString *minimum;
@property(nonatomic,strong)NSString *maximum;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *devider;

@end
