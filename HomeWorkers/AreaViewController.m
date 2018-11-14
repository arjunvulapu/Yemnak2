//
//  SelectAreaViewController.m
//  Minwain
//
//  Created by Amit Kulkarni on 10/05/16.
//  Copyright © 2016 Amit Kulkarni. All rights reserved.
//

#import "AreaViewController.h"

@interface AreaViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UINavigationItem *navItem;
@property (nonatomic) NSMutableArray *areas;

@end

@implementation AreaViewController

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

        self.navItem.title = Localized(@"Area");
        [self makePostCallForPage:PAGE_GET_AREA
                       withParams:nil
                  withRequestCode:1];
    
    [self.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    if ([self.restId length] > 0) {
        [dictionary setValue:self.restId forKey:@"rest_id"];
    }
    self.areas=_areasList;
 
    
    
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
    return self.areas.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSMutableDictionary *country = [self.areas objectAtIndex:section];
    if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
    return [country valueForKey:@"title_ar"];
    }else{
         return [country valueForKey:@"title"];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSMutableDictionary *country = [self.areas objectAtIndex:section];
    NSMutableArray *ares = [country valueForKey:@"areas"];
    
    return ares.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    NSMutableDictionary *country = [self.areas objectAtIndex:indexPath.section];
    NSMutableDictionary *cat = [[country valueForKey:@"areas"] objectAtIndex:indexPath.row];
    NSMutableDictionary *dic=cat;
    if([dic objectForKey:@"title"] != nil){
        if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){

    cell.textLabel.text = [NSString stringWithFormat:@"%@",[dic valueForKey:@"title_ar"]];
        }else{
            cell.textLabel.text = [NSString stringWithFormat:@"%@",[dic valueForKey:@"title"]];

        }
}
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    Country *country = [self.areas objectAtIndex:indexPath.section];
//    CountryArea *cat = [country.areas objectAtIndex:indexPath.row];
    NSMutableDictionary *country = [self.areas objectAtIndex:indexPath.section];
    NSMutableDictionary *cat = [[country valueForKey:@"areas"] objectAtIndex:indexPath.row];
NSMutableDictionary *str=cat;
    self.completionBlock(str);
    [self.delegate cancelButtonClicked:self];
}


- (IBAction)close:(id)sender {
    [self.delegate cancelButtonClicked:self];

}
@end
