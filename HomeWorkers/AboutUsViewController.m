//
//  AboutUsViewController.m
//  Minwain
//
//  Created by Amit Kulkarni on 17/05/16.
//  Copyright © 2016 Amit Kulkarni. All rights reserved.
//

#import "AboutUsViewController.h"

@interface AboutUsViewController ()
{
    UIButton *buttonUser;
}
@property (nonatomic, weak) IBOutlet UITextView *txtView;
@end

@implementation AboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _txtView.text=@"";
    _txtView.editable = NO;
//    if ([[Utils getLanguage] isEqualToString:KEY_LANGUAGE_EN]) {
//        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"leftarrow-white90"] style:UIBarButtonItemStyleDone target:self action:@selector(back)];
//    } else {
//        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu.png"] style:UIBarButtonItemStyleDone target:self action:@selector(showSideMenu)];
//    }
    
    buttonUser = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [buttonUser setImage:[UIImage imageNamed:@"leftarrow-black90"] forState:UIControlStateNormal];
    if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
        [buttonUser setImage:[UIImage imageNamed:@"right-arrow"] forState:UIControlStateNormal];
        
    }else{
        [buttonUser setImage:[UIImage imageNamed:@"left-arrow"] forState:UIControlStateNormal];
    }
    buttonUser.frame = CGRectMake(0, 0, 30, 30);
    [buttonUser addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *customBarRightBtn = [[UIBarButtonItem alloc] initWithCustomView:buttonUser];
    customBarRightBtn.tintColor=[UIColor blueColor];
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    [negativeSpacer setWidth:0];
    
//    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer,customBarRightBtn,nil];
    UIView *backButtonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
   if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
    backButtonView.bounds = CGRectOffset(backButtonView.bounds, -10, 0);
     }else{
         backButtonView.bounds = CGRectOffset(backButtonView.bounds, 10, 0);
     }
    [backButtonView addSubview:buttonUser];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backButtonView];
    self.navigationItem.leftBarButtonItem = backButton;
    self.navigationItem.title = Localized(@"About Us");
    [self makePostCallForPage:SETTINGS withParams:@{} withRequestCode:1];
}
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)parseResult:(id)result withCode:(int)reqeustCode {
    NSDictionary *dictionary = (NSDictionary *)result;
    if ([[Utils getLanguage] isEqualToString:KEY_LANGUAGE_EN]) {
        NSString *htmlString = [dictionary valueForKey:@"about"];
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]
                                                initWithData: [htmlString dataUsingEncoding:NSUnicodeStringEncoding]
                                                options: @{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType }
                                                documentAttributes: nil
                                                error: nil
                                                ];
        _txtView.attributedText = attributedString;
        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0,[[_txtView text] length])];
        _txtView.attributedText = attributedString;
    } else {
        NSString *htmlString = [dictionary valueForKey:@"about_ar"];
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]
                                                initWithData: [htmlString dataUsingEncoding:NSUnicodeStringEncoding]
                                                options: @{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType }
                                                documentAttributes: nil
                                                error: nil
                                                ];
        _txtView.attributedText = attributedString;
        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0,[[_txtView text] length])];
        _txtView.attributedText = attributedString;
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
