//
//  PaymentViewController.m
//  Cavaratmall
//
//  Created by Amit Kulkarni on 30/09/15.
//  Copyright © 2015 iMagicsoftware. All rights reserved.
//

#import "PaymentViewController.h"

@interface PaymentViewController ()
{
    UIButton *rightbutton;
}
@end

@implementation PaymentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = Localized(@"Online Payment");
   
    //http://mamacgroup.com/gifts/Tap-app.php
    NSString *url = [NSString stringWithFormat:@"%@/%@",SERVER_URL, PAGE_PAYMENT];
    NSString *finalUrl = [NSString stringWithFormat:@"%@?member_id=%@&amount=%@&order_id=%@&device=%@&page=%@",
                          url, [Utils loggedInUserIdStr], self.amount,_invoice_id,@"1",self.pageName];
    NSLog(@"final url: %@", finalUrl);
    self.webView.delegate = self;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:finalUrl]]];
   
    rightbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [buttonUser setImage:[UIImage imageNamed:@"leftarrow-black90"] forState:UIControlStateNormal];
    if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
        [rightbutton setImage:[UIImage imageNamed:@"right-arrow"] forState:UIControlStateNormal];
        
    }else{
        [rightbutton setImage:[UIImage imageNamed:@"left-arrow"] forState:UIControlStateNormal];
    }
    rightbutton.frame = CGRectMake(0, 0, 30, 30);
    [rightbutton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *customBarRightBtn = [[UIBarButtonItem alloc] initWithCustomView:rightbutton];
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
    [backButtonView addSubview:rightbutton];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backButtonView];
    self.navigationItem.leftBarButtonItem = backButton;
  
}
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - webview delegate
- (void)webViewDidStartLoad:(UIWebView *)webView
{
     [self showHUD:@"Loading..."];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self hideHUD];
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    BOOL result = YES;
    
    NSURL *url = [request URL];
    NSLog(@"%@",url);
        if ([[url query] containsString:@"result=failed"]) {
            [self.navigationController popViewControllerAnimated:YES];
            if (self.completionBlock) {
                self.completionBlock(@"failed");
            }
            return YES;
        } else if ([[url query] containsString:@"result=SUCCESS"]) {
            [self.navigationController popViewControllerAnimated:YES];

            if (self.completionBlock) {
                self.completionBlock(@"success");

            }
            return YES;
        }
  
    
    return result;
}

@end
