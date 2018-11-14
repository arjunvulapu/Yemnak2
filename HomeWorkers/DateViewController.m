//
//  DateViewController.m
//  Minwain
//
//  Created by Amit Kulkarni on 10/05/16.
//  Copyright © 2016 Amit Kulkarni. All rights reserved.
//

#import "DateViewController.h"

@interface DateViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UINavigationItem *navItem;
@property (nonatomic) NSMutableArray *areas;
@property (nonatomic) NSMutableArray *areas2;

@end

@implementation DateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.areas = [[NSMutableArray alloc] init];
    self.areas2 = [[NSMutableArray alloc] init];

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
    
    self.navItem.title = Localized(@"SELECT DATE");
    [self.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    if ([self.restId length] > 0) {
        [dictionary setValue:self.restId forKey:@"rest_id"];
    }
    self.areas=_areasList;

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init] ;
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *now = [NSDate date];
    
    NSMutableArray *results = [NSMutableArray arrayWithCapacity:7];
    
    for (int i = 0; i < 7; i++)
    {
        NSDate *date = [NSDate dateWithTimeInterval:+(i * (60 * 60 * 24)) sinceDate:now];
        [results addObject:[dateFormatter stringFromDate:date]];
    }
    NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc] init] ;
    [dateFormatter2 setDateFormat:@"EEEE"];
    
    
    NSMutableArray *results2 = [NSMutableArray arrayWithCapacity:7];
    
    for (int i = 0; i < 7; i++)
    {
        NSDate *date = [NSDate dateWithTimeInterval:+(i * (60 * 60 * 24)) sinceDate:now];
        [results2 addObject:[dateFormatter2 stringFromDate:date]];
    }
    NSLog(@"%@", results2);
    self.areas = results;
    self.areas2 = results2;

  [self.tableView reloadData];
    
}

- (void)viewWillAppear:(BOOL)animated {
    self.view.layer.cornerRadius = 10;
    self.view.clipsToBounds = YES;
}

- (void)parseResult:(id)result withCode:(int)reqeustCode {
    NSArray *array = (NSArray *)result;
//    for (NSDictionary *dictionary in array) {
//        [self.areas addObject:[Country instanceFromDictionary:dictionary]];
//    }
    self.areas = array.mutableCopy;
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
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",[self.areas objectAtIndex:indexPath.row],[self.areas2 objectAtIndex:indexPath.row]];

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
