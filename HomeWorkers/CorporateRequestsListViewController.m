//
//  CorporateRequestsListViewController.m
//  YEMNAK
//
//  Created by apple on 10/07/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import "CorporateRequestsListViewController.h"
#import "CorporateListTableViewCell.h"
#import "HomeWorkersRequestViewController.h"
#import "AddAvailableWorkersViewController.h"
#import "PartimeWorkersViewController.h"
#import "EmployeeRequestViewController.h"
#import "CorporateRequestViewController.h"
#import "AWListTableViewCell.h"
#import "EditAvailableWorkersViewController.h"
@interface CorporateRequestsListViewController ()
{
    UIButton *rightbutton;
    
    NSMutableArray *List;
    
}
@end

@implementation CorporateRequestsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _emptyLbl.hidden=YES;
    _emptyLbl.text= Localized(@"List Empty");
    List =[[NSMutableArray alloc]init];
    self.tableView.allowsSelection=YES;
    // Do any additional setup after loading the view.
    self.navigationItem.title=Localized(@"Corporate Request");
    if([_from isEqualToString:@"10"]){
        self.navigationItem.title=Localized(@"Home Workers Request");
        [self makePostCallForPage:HOMEWORKERS_LIST
                       withParams:@{@"member_id":[Utils loggedInUserIdStr]}
                  withRequestCode:54];
    }else  if([_from isEqualToString:@"11"]){
        self.navigationItem.title=Localized(@"Available Home Request");
        [self makePostCallForPage:AVAILABLEWORKES_LIST
                       withParams:@{@"member_id":[Utils loggedInUserIdStr]}
                  withRequestCode:55];
    }else  if([_from isEqualToString:@"12"]){
        self.navigationItem.title=Localized(@"Part Time Request");
        [self makePostCallForPage:PARTTIMEWORKERS_LIST
                       withParams:@{@"member_id":[Utils loggedInUserIdStr]}
                  withRequestCode:56];
    }else  if([_from isEqualToString:@"20"]){
        self.navigationItem.title=Localized(@"Corporate Request");
        [self makePostCallForPage:CORPORATE_LIST
                       withParams:@{@"member_id":[Utils loggedInUserIdStr]}
                  withRequestCode:57];
    }else  if([_from isEqualToString:@"21"]){
        self.navigationItem.title=Localized(@"Employee Request");
        [self makePostCallForPage:EMPLOYEE_LIST
                       withParams:@{@"member_id":[Utils loggedInUserIdStr]}
                  withRequestCode:58];
    }
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
- (void)parseResult:(id)result withCode:(int)reqeustCode {
    if(reqeustCode==60){
       
            NSLog(@"%@",result);
        
        [self makePostCallForPage:AVAILABLEWORKES_LIST
                       withParams:@{@"member_id":[Utils loggedInUserIdStr]}
                  withRequestCode:55];
    }else{
        List =[[NSMutableArray alloc]init];
    
        NSArray *array = (NSArray *)result;
        //    for (NSDictionary *dictionary in array) {
        //        [self.areas addObject:[Country instanceFromDictionary:dictionary]];
        //    }
        List = array.mutableCopy;
        
        _emptyLbl.hidden=YES;

        if(List.count == 0){
            _emptyLbl.hidden=NO;
        }
        [self.tableView reloadData];
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return List.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if([_from isEqualToString:@"11"]){
    static NSString *identifier = @"AWListTableViewCell";
    
    AWListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[AWListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
//    CorporateListTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"CorporateListTableViewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    NSDictionary *dic=[List objectAtIndex:indexPath.row];
    //cell.requestNoRLbl.text=[dic valueForKey:@"id"];
    cell.requestNoRLbl.text=[dic valueForKey:@"id_str"];
    cell.statusRLbl.text=[NSString stringWithFormat:@"%@",Localized([dic valueForKey:@"status"])];
    
    NSString *dateString = [dic valueForKey:@"date"];
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"dd-MM-yyyy"];
    NSDate *date = [format dateFromString:dateString];
    [format setDateFormat:@"dd MMM yyyy"];
    NSString* finalDateString = [format stringFromDate:date];
    cell.dateRLbl.text=finalDateString;
        cell.deleteCell = ^{
           
            [self makePostCallForPage:DELETE_AVAILABLEWORKERS
                           withParams:@{@"member_id":[Utils loggedInUserIdStr],
                                        @"worker_id":[NSString stringWithFormat:@"%@",[dic valueForKey:@"id"]]
                                        }
                      withRequestCode:60];
        };
        cell.editCell  = ^{
            EditAvailableWorkersViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"EditAvailableWorkersViewController"];
                    NSDictionary *dic=[List objectAtIndex:indexPath.row];
            
                    controller.from = @"List";
                    controller.details =[dic mutableCopy];;
                    [self.navigationController pushViewController:controller animated:YES];
        };
    return cell;
    }else{
        static NSString *identifier = @"CorporateListTableViewCell";
        
        CorporateListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil)
        {
            cell = [[CorporateListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        
        //    CorporateListTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"CorporateListTableViewCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        NSDictionary *dic=[List objectAtIndex:indexPath.row];
        //cell.requestNoRLbl.text=[dic valueForKey:@"id"];
        cell.requestNoRLbl.text=[dic valueForKey:@"id_str"];
        cell.statusRLbl.text=[NSString stringWithFormat:@"%@",Localized([dic valueForKey:@"status"])];
        
        NSString *dateString = [dic valueForKey:@"date"];
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"dd-MM-yyyy"];
        NSDate *date = [format dateFromString:dateString];
        [format setDateFormat:@"dd MMM yyyy"];
        NSString* finalDateString = [format stringFromDate:date];
        cell.dateRLbl.text=finalDateString;
        
        return cell;
    }
}
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
//    // Return YES if you want the specified item to be editable.
//    return YES;
//}
//
//// Override to support editing the table view.
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        //add code here for when you hit delete
//        NSDictionary *dic=[List objectAtIndex:indexPath.row];
//
//        [self makePostCallForPage:DELETE_AVAILABLEWORKERS
//                       withParams:@{@"member_id":[Utils loggedInUserIdStr],
//                                    @"worker_id":[NSString stringWithFormat:@"%@",[dic valueForKey:@"id"]]
//                                    }
//                  withRequestCode:56];
//
//    }
//}

- (void)refreshCart {
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    if([_from isEqual:@"10"]){
//    HomeWorkersRequestViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeWorkersRequestViewController"];
//        NSDictionary *dic=[List objectAtIndex:indexPath.row];
//
//        controller.from = @"List";
//        controller.details =[dic mutableCopy];;
//    [self.navigationController pushViewController:controller animated:YES];
//    }else if([_from isEqual:@"11"]){
//        AddAvailableWorkersViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"AddAvailableWorkersViewController"];
//        NSDictionary *dic=[List objectAtIndex:indexPath.row];
//        
//        controller.from = @"List";
//        controller.details =[dic mutableCopy];;
//        [self.navigationController pushViewController:controller animated:YES];
//    }else if([_from isEqual:@"12"]){
//        PartimeWorkersViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"PartimeWorkersViewController"];
//        NSDictionary *dic=[List objectAtIndex:indexPath.row];
//        
//        controller.from = @"List";
//        controller.details =[dic mutableCopy];;
//        [self.navigationController pushViewController:controller animated:YES];
//    }else if([_from isEqual:@"20"]){
//        EmployeeRequestViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"EmployeeRequestViewController"];
//        NSDictionary *dic=[List objectAtIndex:indexPath.row];
//        
//        controller.from = @"List";
//        controller.details =[dic mutableCopy];;
//        [self.navigationController pushViewController:controller animated:YES];
//    } else if([_from isEqual:@"20"]){
//    CorporateRequestViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"CorporateRequestViewController"];
//        NSDictionary *dic=[List objectAtIndex:indexPath.row];
//        
//        controller.from = @"List";
//        controller.details =[dic mutableCopy];;
//        [self.navigationController pushViewController:controller animated:YES];
//    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
