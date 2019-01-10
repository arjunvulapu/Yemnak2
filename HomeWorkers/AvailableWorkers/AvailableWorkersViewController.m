//
//  AvailableWorkersViewController.m
//  HomeWorkers
//
//  Created by apple on 16/04/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import "AvailableWorkersViewController.h"
#import "AvailableWorkersTableViewCell.h"
#import "Common.h"
#import "Utils.h"
#import "AVworkersDetailViewController.h"
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"
#import "BaseViewController.h"
#import "UIViewController+MJPopupViewController.h"
#import "PopViewControllerDelegate.h"
#import "FilterViewController.h"
#import "AddAvailableWorkersViewController.h"
@interface AvailableWorkersViewController ()
{
    UIButton *rightbutton;
    UIButton *leftbutton;
     UIButton *leftbutton2;
    NSMutableArray *avWorkers;
    NSMutableArray *avWorkersCopy;
    NSMutableDictionary *filtDict;
    
    
    NSDictionary *areaF;
    NSDictionary *religionF;
    NSString *ageF;
    NSString *toageF;

    NSString *genderF;
}
@end

@implementation AvailableWorkersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _nolistLbl.text = Localized(@"List Empty");
    _nolistLbl.hidden = YES;
    avWorkers=[[NSMutableArray alloc]init];
     avWorkersCopy=[[NSMutableArray alloc]init];
    [self makePostCallForPage:AVAILABLEWORKERS withParams:@{} withRequestCode:100];
    self.navigationItem.title=Localized(@"AVAILABLE WORKERS");
    // Do any additional setup after loading the view.
    leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [leftbutton setBackgroundImage:[UIImage imageNamed:@"button_background_icon.png"] forState:UIControlStateNormal];
 
        [leftbutton setImage:[UIImage imageNamed:@"filter"] forState:UIControlStateNormal];
    
    
    
    leftbutton.frame = CGRectMake(0, 5, 20, 20);
    [leftbutton addTarget:self action:@selector(filterAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *customBarleftItem = [[UIBarButtonItem alloc] initWithCustomView:leftbutton];
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    [negativeSpacer setWidth:0];
    
    //    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer,customBarleftItem,nil];
    UIView *backButtonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    backButtonView.bounds = CGRectOffset(backButtonView.bounds, 0, 0);
    [backButtonView addSubview:leftbutton];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backButtonView];
    leftbutton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [leftbutton setBackgroundImage:[UIImage imageNamed:@"button_background_icon.png"] forState:UIControlStateNormal];
    [leftbutton2 setImage:[UIImage imageNamed:@"plus-white.png"] forState:UIControlStateNormal];
    
    
    leftbutton2.frame = CGRectMake(0, 5, 20, 20);
    [leftbutton2 addTarget:self action:@selector(AddAvailable) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *customBarRightItem3 = [[UIBarButtonItem alloc] initWithCustomView:leftbutton2];
    UIView *backButtonView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    backButtonView3.bounds = CGRectOffset(backButtonView.bounds, 0, 0);
    [backButtonView3 addSubview:leftbutton2];
    UIBarButtonItem *backButton3 = [[UIBarButtonItem alloc] initWithCustomView:backButtonView3];
    //self.navigationItem.rightBarButtonItems = @[backButton,backButton3];
    self.navigationItem.rightBarButtonItems = @[backButton];


    
    
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
    
    UIBarButtonItem *negativeSpacer1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    [negativeSpacer1 setWidth:0];
    
    //    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer,customBarRightBtn,nil];
    UIView *backButtonView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
        backButtonView1.bounds = CGRectOffset(backButtonView1.bounds, -10, 0);
    }else{
        backButtonView1.bounds = CGRectOffset(backButtonView1.bounds, 10, 0);
    }
    [backButtonView1 addSubview:rightbutton];
    UIBarButtonItem *backButton1 = [[UIBarButtonItem alloc] initWithCustomView:backButtonView1];
    self.navigationItem.leftBarButtonItem = backButton1;
}
-(void)AddAvailable{
    AddAvailableWorkersViewController *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"AddAvailableWorkersViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)parseResult:(id)result withCode:(int)reqeustCode{
    NSLog(@"%@",result);
    if(reqeustCode == 100){
        avWorkers = result;
         avWorkersCopy = result;
        _nolistLbl.hidden = YES;

        if(avWorkers.count==0){
            _nolistLbl.hidden = NO;

        }
        _homeWorkersTable.reloadData;
    }
}
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return avWorkers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AvailableWorkersTableViewCell *cell = [self.homeWorkersTable dequeueReusableCellWithIdentifier:@"AvailableWorkersTableViewCell"];
    NSMutableDictionary *hworker =[avWorkers objectAtIndex:indexPath.row];
    [cell.pImage setImageWithURL:[hworker valueForKey:@"image"]  usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    cell.applicationId.text = [NSString stringWithFormat:@"%@", [hworker valueForKey:@"applicant_id"]];
    cell.age.text = [NSString stringWithFormat:@"%@", [hworker valueForKey:@"age"]];
//    cell.nationality.text = [NSString stringWithFormat:@"%@", [[hworker valueForKey:@"nationality"] valueForKey:@"title"]];
//    cell.religion.text = [NSString stringWithFormat:@"%@", [[hworker valueForKey:@"religion"] valueForKey:@"title"]];
    if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
        cell.nationality.text = [NSString stringWithFormat:@"%@", [[hworker valueForKey:@"nationality"] valueForKey:@"title_ar"]];
        cell.religion.text = [NSString stringWithFormat:@"%@", [[hworker valueForKey:@"religion"] valueForKey:@"title_ar"]];
      //  cell.age.text = [NSString stringWithFormat:@"%@", [[hworker valueForKey:@"ages"] valueForKey:@"title_ar"]];
        [cell.religion setTextAlignment:NSTextAlignmentLeft];
        [cell.age setTextAlignment:NSTextAlignmentLeft];
        [cell.amount setTextAlignment:NSTextAlignmentLeft];
    }else{
        cell.nationality.text = [NSString stringWithFormat:@"%@", [[hworker valueForKey:@"nationality"] valueForKey:@"title"]];
        cell.religion.text = [NSString stringWithFormat:@"%@", [[hworker valueForKey:@"religion"] valueForKey:@"title"]];
      //  cell.age.text = [NSString stringWithFormat:@"%@", [[hworker valueForKey:@"ages"] valueForKey:@"title"]];
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
    return 182.5;
    ;
}
- (void)cancelButtonClicked:(UIViewController *)secondDetailViewController {
    [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationSlideTopBottom];
}

-(void)filterAction{
    FilterViewController *vc = [[FilterViewController alloc] initWithNibName:@"FilterViewController" bundle:nil];
    vc.From = @"AW";
    vc.nationality = areaF;
    vc.religion=religionF;
    vc.ages = ageF;
    vc.toAges = toageF;

    vc.gender = genderF;
    vc.delegate=self;
    //    [self.navigationController pushViewController:vc animated:YES];
    vc.completionBlockAW = ^(NSMutableDictionary *area,NSDictionary *nationality,NSDictionary *religion,NSString *age) {
        NSLog(@"%@",area);
        filtDict = area;
        areaF = nationality;
        religionF = religion;
        ageF = [filtDict valueForKey:@"age"];
        toageF=[filtDict valueForKey:@"toage"];
        genderF = [filtDict valueForKey:@"gender"];
//        [self makePostCallForPage:AVAILABLEWORKERS withParams:@{@"nationality": [filtDict valueForKey:@"nationality"],
//                                                                    @"religion":[filtDict valueForKey:@"religion"],                                                                    @"salary_from":[filtDict valueForKey:@"MinSal"],
//                                                                @"salary_to":[filtDict valueForKey:@"MaxSal"],@"age":[filtDict valueForKey:@"age"],
//                                                                @"amount":[filtDict valueForKey:@"amount"]
//                                                                    } withRequestCode:100];
        [self makePostCallForPage:AVAILABLEWORKERS withParams:@{@"nationality": [filtDict valueForKey:@"nationality"],
                                                                @"religion":[filtDict valueForKey:@"religion"],                                                                   @"fromage":[filtDict valueForKey:@"age"],
                                                                @"toage":[filtDict valueForKey:@"toage"],
                                                                @"gender":[filtDict valueForKey:@"gender"]
                                                                } withRequestCode:100];

       //Filter opertion
        /*
//
//        [dict setObject:_nationalityTxtfiled.text forKey:@"nationality"];
//        [dict setObject:_religionTxtFiled.text forKey:@"religion"];
//
//        [dict setObject:_fromSal.text forKey:@"MinSal"];
//        [dict setObject:_toSAl.text forKey:@"MaxSal"];
        avWorkers =[[NSMutableArray alloc] init];
        for (NSDictionary* currentAw in avWorkersCopy)
        {
            NSString *str =[filtDict valueForKey:@"nationality"];
            if(str.length>0){
            if([[currentAw valueForKey:@"nationality"] valueForKey:@"title"] == [filtDict valueForKey:@"nationality"]){
                NSString *str =[filtDict valueForKey:@"religion"];
                if(str.length>0){
                    if([[currentAw valueForKey:@"religion"] valueForKey:@"title"] == [filtDict valueForKey:@"religion"]){
                        NSString *str =[filtDict valueForKey:@"MinSal"];
                        NSString *str2 =[filtDict valueForKey:@"MaxSal"];
                        if(str.length>0 && str2.length>0){
                            if([filtDict valueForKey:@"MinSal"] <[currentAw valueForKey:@"salary"]  <[filtDict valueForKey:@"MaxSal"]  ){
                                [avWorkers addObject:currentAw];
                            }
                        }else if(str.length>0 ){
                            if([filtDict valueForKey:@"MinSal"] <[currentAw valueForKey:@"salary"] ){
                                [avWorkers addObject:currentAw];
                            }
                            }else if( str2.length>0){
                                    if([currentAw valueForKey:@"salary"]  <[filtDict valueForKey:@"MaxSal"]  ){
                                            [avWorkers addObject:currentAw];
                                            }
                                }
                        }
                }else{
                    NSString *str =[filtDict valueForKey:@"MinSal"];
                    NSString *str2 =[filtDict valueForKey:@"MaxSal"];
                    if(str.length>0 && str2.length>0){
                        if([filtDict valueForKey:@"MinSal"] <[currentAw valueForKey:@"salary"]  <[[filtDict valueForKey:@"MaxSal"] intValue] ){
                            [avWorkers addObject:currentAw];
                        }
                    }else if(str.length>0 ){
                        if([filtDict valueForKey:@"MinSal"] <[currentAw valueForKey:@"salary"] ){
                            [avWorkers addObject:currentAw];
                        }
                    }else if( str2.length>0){
                        if([currentAw valueForKey:@"salary"]  <[filtDict valueForKey:@"MaxSal"]  ){
                            [avWorkers addObject:currentAw];
                        }
                    }else{
                        [avWorkers addObject:currentAw];
                    }
                }
            }
            }else{
                NSString *str =[filtDict valueForKey:@"religion"];
                if(str.length>0){
                    if([[currentAw valueForKey:@"religion"] valueForKey:@"title"] == [filtDict valueForKey:@"religion"]){
                        NSString *str =[filtDict valueForKey:@"MinSal"];
                        NSString *str2 =[filtDict valueForKey:@"MaxSal"];
                        if(str.length>0 && str2.length>0){
                            if([filtDict valueForKey:@"MinSal"] <[currentAw valueForKey:@"salary"]  <[filtDict valueForKey:@"MaxSal"] ){
                                [avWorkers addObject:currentAw];
                            }
                        }else if(str.length>0 ){
                            if([filtDict valueForKey:@"MinSal"] <[currentAw valueForKey:@"salary"] ){
                                [avWorkers addObject:currentAw];
                            }
                        }else if( str2.length>0){
                            if([currentAw valueForKey:@"salary"]  <[filtDict valueForKey:@"MaxSal"]  ){
                                [avWorkers addObject:currentAw];
                            }
                        }
                    }
                }else{
                    NSString *str =[filtDict valueForKey:@"MinSal"];
                    NSString *str2 =[filtDict valueForKey:@"MaxSal"];
                    if(str.length>0 && str2.length>0){
                        if([filtDict valueForKey:@"MinSal"] <[currentAw valueForKey:@"salary"] &&[currentAw valueForKey:@"salary"] <[filtDict valueForKey:@"MaxSal"]  ){
                            [avWorkers addObject:currentAw];
                        }
                    }else if(str.length>0 ){
                        if([filtDict valueForKey:@"MinSal"] <[currentAw valueForKey:@"salary"]){
                            [avWorkers addObject:currentAw];
                        }
                    }else if( str2.length>0){
                        if([currentAw valueForKey:@"salary"]  < [filtDict valueForKey:@"MaxSal"]  ){
                            [avWorkers addObject:currentAw];
                        }
                    }else{
                        [avWorkers addObject:currentAw];
                    }
                }
            }
        }
        _homeWorkersTable.reloadData;
         */
    };
    
    [self presentPopupViewController:vc animationType:MJPopupViewAnimationSlideBottomTop dismissed:nil];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AVworkersDetailViewController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"AVworkersDetailViewController"];
    obj.workerDetails = [avWorkers objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:obj animated:YES];
}

@end
