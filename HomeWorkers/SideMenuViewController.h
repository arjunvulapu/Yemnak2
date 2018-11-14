//
//  MenuViewController.h
//  RevealControllerStoryboardExample
//
//  Created by Nick Hodapp on 1/9/13.
//  Copyright (c) 2013 CoDeveloper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWUITableViewCell : UITableViewCell
@property (nonatomic) IBOutlet UILabel *label;
@end

@interface SideMenuViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *menuTable;
@property (weak, nonatomic) IBOutlet UIButton *topbutton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableviewLeading1;
@property (weak, nonatomic) IBOutlet UILabel *nameLbl;
@property (weak, nonatomic) IBOutlet UILabel *emailLbl;
@property (weak, nonatomic) IBOutlet UIView *LOGINVIEW;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *signUpBtn;
- (IBAction)signupBtnAction:(id)sender;
- (IBAction)loginBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btnTailing1;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leadingEdge1;
@property (weak, nonatomic) IBOutlet UIView *accountView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *signupTailing1;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageCenter;

@end
