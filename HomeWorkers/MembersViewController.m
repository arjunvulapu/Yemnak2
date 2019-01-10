//
//  MembersViewController.m
//  Minwain
//
//  Created by Amit Kulkarni on 10/05/16.
//  Copyright © 2016 Amit Kulkarni. All rights reserved.
//

#import "MembersViewController.h"

@interface MembersViewController () <UITableViewDelegate, UITableViewDataSource>
{
    NSString *price;
}
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UINavigationItem *navItem;
@property (nonatomic) NSMutableArray *areas;

@end

@implementation MembersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _emptyLbl.hidden = YES;
    _tableView.hidden=NO;
    self.areas = [[NSMutableArray alloc] init];
    
    [self.tableView registerClass:[AppTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    _emptyLbl.text = Localized(@"LIST EMPTY");
    
//    UIBarButtonItem *closeButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"close.png"] style:UIBarButtonItemStyleDone target:self action:@selector(close)];
//    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
//        // Add a negative spacer on iOS >= 7.0
//        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
//                                           initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
//                                           target:nil action:nil];
//        negativeSpacer.width = 10;
//        self.navItem.rightBarButtonItems = @[negativeSpacer, closeButton];
//    } else {
//        self.navItem.leftBarButtonItem = closeButton;
//    }
    
    self.navItem.title = Localized(@"SELECT QUANTITY");
    [self.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    if ([self.restId length] > 0) {
        [dictionary setValue:self.restId forKey:@"rest_id"];
    }
    self.areas=_areasList;
    if([_from  isEqual: @"age"]){
        self.navItem.title = Localized(@"SELECT AGE");

//        NSMutableArray *results = [[NSMutableArray alloc]init];
//        [results addObject:[NSString stringWithFormat:@"18 - 25"]];
//        for (int i = 20; i <= 60;)
//        {
//
//            [results addObject:[NSString stringWithFormat:@"%d - %d",i,i+5]];
//            i= i+10;
//        }
//
//        NSLog(@"%@", results);
//        self.areas = results;
//        [self.tableView reloadData];
        [self makePostCallForPage:AGES
                       withParams:@{}
                  withRequestCode:3];
    }else  if([_from  isEqual: @"ages"]){
        self.navItem.title = Localized(@"SELECT AGE");
        
        NSMutableArray *results = [[NSMutableArray alloc]init];
        for (int i = 18; i <= 50;i++)
        {
            
            [results addObject:[NSString stringWithFormat:@"%d",i]];
            
        }
        
       // NSLog(@"%@", results);
        self.areas = results;
        [self.tableView reloadData];
        //        [self makePostCallForPage:AGES
        //                       withParams:@{}
        //                  withRequestCode:3];
    }else{
    [self makePostCallForPage:PAGE_GET_Quantity
                   withParams:@{@"day":_selectedDay,@"shift":_Shift,@"service_id":_serviceId,@"type":_gender}
              withRequestCode:1];
    }
 
    
}

- (void)viewWillAppear:(BOOL)animated {
    self.view.layer.cornerRadius = 10;
    self.view.clipsToBounds = YES;
}

- (void)parseResult:(id)result withCode:(int)reqeustCode {
    if(requestCode==1){
    NSDictionary *array = (NSDictionary *)result;
//    for (NSDictionary *dictionary in array) {
//        [self.areas addObject:[Country instanceFromDictionary:dictionary]];
//    }
    
    NSMutableArray *results = [NSMutableArray arrayWithCapacity:[[array valueForKey:@"available_workers"] intValue]];

    for (int i = 1; i <= [[array valueForKey:@"available_workers"] intValue]; i++)
    {

        [results addObject:[NSString stringWithFormat:@"%d",i]];
    }
//    NSMutableArray *results = [NSMutableArray arrayWithCapacity:64];
//
//    for (int i = 1; i <= 64; i++)
//    {
//
//        [results addObject:[NSString stringWithFormat:@"%d",i]];
//    }
//
    price = [array valueForKey:@"price"];
    NSLog(@"%@", results);
    self.areas = results;
        if(self.areas.count==0){
            _emptyLbl.hidden = NO;
            _tableView.hidden=YES;
        }else{
            _emptyLbl.hidden = YES;
            _tableView.hidden=NO;
        }
    [self.tableView reloadData];
    }else if(requestCode==3){
        NSLog(@"%@", result);
        self.areas = result;
        if(self.areas.count==0){
            _emptyLbl.hidden = NO;
            _tableView.hidden=YES;
        }else{
            _emptyLbl.hidden = YES;
            _tableView.hidden=NO;
        }
        [self.tableView reloadData];
    }
}

- (void)close {
    [self.delegate cancelButtonClicked:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - tableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    Country *country = [self.areas objectAtIndex:section];
//    return country.title;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    Country *country = [self.areas objectAtIndex:section];
//    return [country.areas count];
    return self.areas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
//    Country *country = [self.areas objectAtIndex:indexPath.section];
//    CountryArea *cat = [country.areas objectAtIndex:indexPath.row];
//    NSMutableDictionary *dic=[self.areas objectAtIndex:indexPath.row];
//    if([dic objectForKey:@"title"] != nil){
        if([_from  isEqual: @"age"]){
             NSMutableDictionary *dic=[self.areas objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[dic objectForKey:@"title"]];
        }else{
            cell.textLabel.text = [NSString stringWithFormat:@"%@",[self.areas objectAtIndex:indexPath.row]];

        }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    Country *country = [self.areas objectAtIndex:indexPath.section];
//    CountryArea *cat = [country.areas objectAtIndex:indexPath.row];
    if([_from  isEqual: @"age"]){
        NSString *str=[self.areas objectAtIndex:indexPath.row];
        self.completionBlock2(str);
        [self.delegate cancelButtonClicked:self];
    }else  if([_from  isEqual: @"ages"]){
        NSString *str=[self.areas objectAtIndex:indexPath.row];
        self.completionBlock3(str);
        [self.delegate cancelButtonClicked:self];
    }
    else{
        NSString *str=[self.areas objectAtIndex:indexPath.row];
    self.completionBlock(str,[NSString stringWithFormat:@"%d",price.intValue*str.intValue]);
    [self.delegate cancelButtonClicked:self];
}
}


- (IBAction)close:(id)sender {
    [self.delegate cancelButtonClicked:self];

}
@end
