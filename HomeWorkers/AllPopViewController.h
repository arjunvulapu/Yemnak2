//
//  AllPopViewController.h
//  Minwain
//
//  Created by Amit Kulkarni on 10/05/16.
//  Copyright © 2016 Amit Kulkarni. All rights reserved.
//

#import "BaseViewController.h"
#import "PopViewControllerDelegate.h"
#import "AppTableViewCell.h"
@interface AllPopViewController : BaseViewController
@property (nonnull) id<PopViewControllerDelegate> delegate;
@property (nonatomic) NSString *restId;
@property (nonatomic, copy) void (^completionBlock)(NSMutableDictionary *area);
@property (nonatomic, copy) void (^completionBlockS)(NSString *area);

@property(nonatomic,strong)NSMutableArray *areasList;
@property(nonatomic,strong)NSString *From;
@property(nonatomic,strong)NSString *cat_id;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *closeBtn;
- (IBAction)close:(id)sender;
@end
