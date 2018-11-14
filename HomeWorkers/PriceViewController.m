//
//  PriceViewController.m
//  Minwain
//
//  Created by Amit Kulkarni on 10/05/16.
//  Copyright © 2016 Amit Kulkarni. All rights reserved.
//

#import "PriceViewController.h"

@interface PriceViewController () <UITableViewDelegate, UITableViewDataSource>
{
    NSString *price;
}
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UINavigationItem *navItem;
@property (nonatomic) NSMutableArray *areas;

@end

@implementation PriceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.areas = [[NSMutableArray alloc] init];
    
    [self.tableView registerClass:[AppTableViewCell class] forCellReuseIdentifier:@"cell"];
    
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
    
    self.navItem.title = Localized(self.title);
    [self.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    if ([self.restId length] > 0) {
        [dictionary setValue:self.restId forKey:@"rest_id"];
    }
   // self.areas=_areasList;
//    [self makePostCallForPage:PAGE_GET_Quantity
//                   withParams:@{@"day":_selectedDay,@"shift":_Shift}
//              withRequestCode:1];
    

    for (int i = 1; i <= ([self.minimum intValue] - [self.maximum intValue])/[self.devider intValue]; i++)
    {
        
        [self.areas addObject:[NSString stringWithFormat:@"%d",[self.maximum intValue]+i*[self.devider intValue]]];
    }
    //    NSMutableArray *results = [NSMutableArray arrayWithCapacity:64];
    //
    //    for (int i = 1; i <= 64; i++)
    //    {
    //
    //        [results addObject:[NSString stringWithFormat:@"%d",i]];
    //    }
    //
    
    [self.tableView reloadData];
    
}

- (void)viewWillAppear:(BOOL)animated {
    self.view.layer.cornerRadius = 10;
    self.view.clipsToBounds = YES;
}

- (void)parseResult:(id)result withCode:(int)reqeustCode {
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
    [self.tableView reloadData];
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
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[self.areas objectAtIndex:indexPath.row]];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    Country *country = [self.areas objectAtIndex:indexPath.section];
//    CountryArea *cat = [country.areas objectAtIndex:indexPath.row];
NSString *str=[self.areas objectAtIndex:indexPath.row];
    self.completionBlock(str);
    [self.delegate cancelButtonClicked:self];
}


- (IBAction)close:(id)sender {
    [self.delegate cancelButtonClicked:self];

}
@end
