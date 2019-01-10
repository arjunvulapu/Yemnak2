//
//  HomeWorkersViewController.m
//  HomeWorkers
//
//  Created by apple on 16/04/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import "HomeWorkersViewController.h"
#import "HomeWorkersTableViewCell.h"
#import "Common.h"
#import "Utils.h"
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"
#import "FilterViewController.h"
#import "PopViewControllerDelegate.h"
#import "UIViewController+MJPopupViewController.h"
#import "HworkersDetailViewController.h"
@interface HomeWorkersViewController ()
{
    UIButton *rightbutton;
    UIButton *leftbutton;
    NSMutableArray * homeWorkers;
    NSMutableDictionary *filtDict;
    
    
    NSDictionary *areaF;
    NSDictionary *religionF;
    NSDictionary *ageF;
    NSDictionary *toageF;

    NSString *genderF;
    
}
@property (strong, nonatomic) IBOutlet UIView *filter_popup;
@property (weak, nonatomic) IBOutlet UILabel *noListLbl;
@end

@implementation HomeWorkersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _noListLbl.text=Localized(@"List Empty");
    _noListLbl.hidden=YES;
    homeWorkers=[[NSMutableArray alloc]init];
     [self makePostCallForPage:HOMEWORKERS withParams:@{} withRequestCode:1001];
    self.navigationItem.title=Localized(@"HOME WORKERS");
    // Do any additional setup after loading the view.
    leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [leftbutton setBackgroundImage:[UIImage imageNamed:@"button_background_icon.png"] forState:UIControlStateNormal];
 
        [leftbutton setImage:[UIImage imageNamed:@"filter"] forState:UIControlStateNormal];
    
    
    
    leftbutton.frame = CGRectMake(0, 5, 20, 20);
    [leftbutton addTarget:self action:@selector(filterAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *customBarleftItem = [[UIBarButtonItem alloc] initWithCustomView:leftbutton];
    
    UIBarButtonItem *negativeSpacer1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    [negativeSpacer1 setWidth:0];
    
    //    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer,customBarleftItem,nil];
    UIView *backButtonView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    backButtonView1.bounds = CGRectOffset(backButtonView1.bounds, 0, 0);
    [backButtonView1 addSubview:leftbutton];
    UIBarButtonItem *backButton1 = [[UIBarButtonItem alloc] initWithCustomView:backButtonView1];
    self.navigationItem.rightBarButtonItem = backButton1;
    
    
    
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
-(void)filterAction{
    FilterViewController *vc = [[FilterViewController alloc] initWithNibName:@"FilterViewController" bundle:nil];
    vc.nationality = areaF;
    vc.religion=religionF;
    vc.ages = ageF;
    vc.toAges = toageF;
    vc.gender = genderF;
    vc.delegate=self;
    vc.From = @"AW";
    //    [self.navigationController pushViewController:vc animated:YES];
    vc.completionBlock = ^(NSMutableDictionary *area,NSDictionary *nationality,NSDictionary *religion,NSDictionary *age) {
        filtDict = area;
        homeWorkers=[[NSMutableArray alloc]init];

//        [self makePostCallForPage:HOMEWORKERS withParams:@{@"nationality": [filtDict valueForKey:@"nationality"],
//                                                                @"religion":[filtDict valueForKey:@"religion"],                                                                    @"salary_from":[filtDict valueForKey:@"MinSal"],
//                                                                @"salary_to":[filtDict valueForKey:@"MaxSal"],
//                                                           @"age":[filtDict valueForKey:@"age"],
//                                                           @"amount":[filtDict valueForKey:@"amount"]
//                                                                } withRequestCode:1001];
        areaF = nationality;
        religionF = religion;
        ageF = age;
        toageF=[filtDict valueForKey:@"toage"];

        genderF = [filtDict valueForKey:@"gender"];
        
        [self makePostCallForPage:HOMEWORKERS withParams:@{@"nationality": [filtDict valueForKey:@"nationality"],
                                                           @"religion":[filtDict valueForKey:@"religion"],
                                                           @"fromage":[filtDict valueForKey:@"age"],
                                                           @"toage":[filtDict valueForKey:@"toage"],                                                           @"gender":[filtDict valueForKey:@"gender"]
                                                           } withRequestCode:1001];
    };
    vc.completionBlockAW = ^(NSMutableDictionary *area,NSDictionary *nationality,NSDictionary *religion,NSString *age) {
        NSLog(@"%@",area);
        filtDict = area;
        areaF = nationality;
        religionF = religion;
        ageF = [filtDict valueForKey:@"age"];
        genderF = [filtDict valueForKey:@"gender"];
        toageF=[filtDict valueForKey:@"toage"];

        [self makePostCallForPage:HOMEWORKERS withParams:@{@"nationality": [filtDict valueForKey:@"nationality"],
                                                           @"religion":[filtDict valueForKey:@"religion"],                                                                    @"fromage":[filtDict valueForKey:@"age"],
                                                           @"toage":[filtDict valueForKey:@"toage"], 
                                                                @"gender":[filtDict valueForKey:@"gender"]
                                                                } withRequestCode:1001];
        
     
    };
    [self presentPopupViewController:vc animationType:MJPopupViewAnimationSlideBottomTop dismissed:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)parseResult:(id)result withCode:(int)reqeustCode{
    NSLog(@"%@",result);
    if(reqeustCode == 1001){
         _noListLbl.hidden=YES;
        homeWorkers = result;
        if(homeWorkers.count==0){
             _noListLbl.hidden=NO;
        }
        _homeWorkersTable.reloadData;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (void)cancelButtonClicked:(UIViewController *)secondDetailViewController {
    [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationSlideTopBottom];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return homeWorkers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeWorkersTableViewCell *cell = [self.homeWorkersTable dequeueReusableCellWithIdentifier:@"HomeWorkersTableViewCell"];
    NSMutableDictionary *hworker =[homeWorkers objectAtIndex:indexPath.row];
    [cell.pImage setImageWithURL:[hworker valueForKey:@"image"]  usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    cell.applicationId.text = [NSString stringWithFormat:@"%@", [hworker valueForKey:@"applicant_id"]];
    cell.age.text = [NSString stringWithFormat:@"%@", [hworker valueForKey:@"age"]];
    if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
    cell.nationality.text = [NSString stringWithFormat:@"%@", [[hworker valueForKey:@"nationality"] valueForKey:@"title_ar"]];
    cell.religion.text = [NSString stringWithFormat:@"%@", [[hworker valueForKey:@"religion"] valueForKey:@"title_ar"]];
        //cell.age.text = [NSString stringWithFormat:@"%@", [[hworker valueForKey:@"ages"] valueForKey:@"title_ar"]];
        [cell.religion setTextAlignment:NSTextAlignmentLeft];
        [cell.age setTextAlignment:NSTextAlignmentLeft];
        [cell.amount setTextAlignment:NSTextAlignmentLeft];

    }else{
        cell.nationality.text = [NSString stringWithFormat:@"%@", [[hworker valueForKey:@"nationality"] valueForKey:@"title"]];
        cell.religion.text = [NSString stringWithFormat:@"%@", [[hworker valueForKey:@"religion"] valueForKey:@"title"]];
       // cell.age.text = [NSString stringWithFormat:@"%@", [[hworker valueForKey:@"ages"] valueForKey:@"title"]];
        [cell.religion setTextAlignment:NSTextAlignmentRight];
        [cell.age setTextAlignment:NSTextAlignmentRight];
        [cell.amount setTextAlignment:NSTextAlignmentRight];
    }
    cell.salary.text = [NSString stringWithFormat:@"%@ %@", [hworker valueForKey:@"salary"],Localized(@"KD")];
    cell.amount.text = [NSString stringWithFormat:@"%@ %@", [hworker valueForKey:@"amount"],Localized(@"KD")];
    
   

    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 190;
    ;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    HworkersDetailViewController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"HworkersDetailViewController"];
    obj.workerDetails = [homeWorkers objectAtIndex:indexPath.row];
    obj.completionBlock = ^{
        [self makePostCallForPage:HOMEWORKERS withParams:@{} withRequestCode:1001];

    };
    [self.navigationController pushViewController:obj animated:YES];
}

@end
