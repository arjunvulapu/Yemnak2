//
//  SelectFormViewController.m
//  Minwain
//
//  Created by Amit Kulkarni on 10/05/16.
//  Copyright © 2016 Amit Kulkarni. All rights reserved.
//

#import "SelectFormViewController.h"

@interface SelectFormViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UINavigationItem *navItem;
@property (nonatomic) NSMutableArray *areas;

@end

@implementation SelectFormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.layer.borderColor = [UIColor colorWithRed:60/255.0f green:60/255.0f blue:60/255.0f alpha:1].CGColor;
    self.view.layer.borderWidth = 3;
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
    
    self.navItem.title = Localized(@"Select Type of Request");
    [self.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    if ([self.restId length] > 0) {
        [dictionary setValue:self.restId forKey:@"rest_id"];
    }
    [self.corporateRequestBtn setTitle:Localized(@"Corporate Request") forState:UIControlStateNormal];
    [self.employeeRequestBtn setTitle:Localized(@"Employee Request") forState:UIControlStateNormal];
//    self.areas=_areasList;
//    [self makePostCallForPage:NATIONALITY
//                   withParams:nil
//              withRequestCode:1];
    
    
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
    NSMutableDictionary *dic=[self.areas objectAtIndex:indexPath.row];
    if([dic objectForKey:@"title"] != nil){
        if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[[self.areas objectAtIndex:indexPath.row] valueForKey:@"title_ar"]];
        }else{
            cell.textLabel.text = [NSString stringWithFormat:@"%@",[[self.areas objectAtIndex:indexPath.row] valueForKey:@"title"]];

        }
}
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    Country *country = [self.areas objectAtIndex:indexPath.section];
//    CountryArea *cat = [country.areas objectAtIndex:indexPath.row];
NSMutableDictionary *str=[self.areas objectAtIndex:indexPath.row];
    self.completionBlock(str);
    [self.delegate cancelButtonClicked:self];
}


- (IBAction)close:(id)sender {
    [self.delegate cancelButtonClicked:self];

}
- (IBAction)corporateBtnAction:(id)sender {
    self.corporateRequestBtn.backgroundColor = THEME_COLOR;
    [self.corporateRequestBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.employeeRequestBtn.backgroundColor = [UIColor whiteColor];
    [self.employeeRequestBtn setTitleColor:[UIColor colorWithRed:60/255.0f green:60/255.0f blue:60/255.0f alpha:1] forState:UIControlStateNormal];
    self.completionBlock(@"1");
    [self.delegate cancelButtonClicked:self];
}

- (IBAction)employeebtnAction:(id)sender {
    self.employeeRequestBtn.backgroundColor = THEME_COLOR;
    [self.employeeRequestBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.corporateRequestBtn.backgroundColor = [UIColor whiteColor];
    [self.corporateRequestBtn setTitleColor:[UIColor colorWithRed:60/255.0f green:60/255.0f blue:60/255.0f alpha:1] forState:UIControlStateNormal];
    self.completionBlock(@"2");
    [self.delegate cancelButtonClicked:self];
}
@end
