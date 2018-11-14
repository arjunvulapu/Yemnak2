//
//  ContactUsViewController.h
//  Minwain
//
//  Created by Amit Kulkarni on 17/05/16.
//  Copyright © 2016 Amit Kulkarni. All rights reserved.
//

#import "BaseViewController.h"

@interface ContactUsViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UIButton *calBtn;
@property (weak, nonatomic) IBOutlet UIButton *emailBtn;
@property (weak, nonatomic) IBOutlet UIButton *instagramBtn;
- (IBAction)calBtnAction:(id)sender;
- (IBAction)instagramBtnAction:(id)sender;
- (IBAction)emailBtnAction:(id)sender;

@end
