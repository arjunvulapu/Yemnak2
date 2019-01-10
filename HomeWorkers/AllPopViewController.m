//
//  AllPopViewController.m
//  Minwain
//
//  Created by Amit Kulkarni on 10/05/16.
//  Copyright © 2016 Amit Kulkarni. All rights reserved.
//

#import "AllPopViewController.h"

@interface AllPopViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UINavigationItem *navItem;
@property (nonatomic) NSMutableArray *areas;

@end

@implementation AllPopViewController

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
    
    self.navItem.title = Localized(@"Nationality");
    [self.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    if ([self.restId length] > 0) {
        [dictionary setValue:self.restId forKey:@"rest_id"];
    }
    
    if([_From  isEqual: @"MARITALSTATUS"]){
        self.navItem.title = Localized(@"MaritalStatus");
    }else if([_From  isEqual: @"ENGLISH"]){
        self.navItem.title = Localized(@"English");
    }else if([_From  isEqual: @"ARABIC"]){
        self.navItem.title = Localized(@"Arabic");
    }else if([_From  isEqual: @"TYPING"]){
        self.navItem.title = Localized(@"Typing");
    }else if([_From  isEqual: @"OTHER"]){
        self.navItem.title = Localized(@"Other");
    }else if([_From  isEqual: @"MSOFFICE"]){
        self.navItem.title = Localized(@"MSOffice");
    }else if([_From  isEqual: @"POSTAPPLY"]){
        self.navItem.title = Localized(@"Selected Post");
    }else if([_From  isEqual: @"SUBPOSTAPPLY"]){
        self.navItem.title = Localized(@"Selected SubPost");
    }else if([_From  isEqual: @"CATEGORY"]){
        self.navItem.title = Localized(@"Select Category");
    }else if([_From  isEqual: @"NUMBEROFWORKERS"]){
        self.navItem.title = Localized(@"No.of Workers");
    }
    
    if([_From  isEqual: @"MARITALSTATUS"]||[_From  isEqual: @"ENGLISH"]||[_From  isEqual: @"ARABIC"]||[_From  isEqual: @"TYPING"]||[_From  isEqual: @"OTHER"]||[_From  isEqual: @"MSOFFICE"]||[_From  isEqual: @"CATEGORY"]||[_From  isEqual: @"NUMBEROFWORKERS"]){
    self.areas=_areasList;
    }if([_From  isEqual: @"POSTAPPLY"]){
    [self makePostCallForPage:JOBS_LIST
                   withParams:nil
              withRequestCode:1];
    }
    if([_From  isEqual: @"SUBPOSTAPPLY"]){
        [self makePostCallForPage:JOBS_LIST
                       withParams:@{@"type_id":_cat_id}
                  withRequestCode:1];
    }
    
}

- (void)viewWillAppear:(BOOL)animated {
    self.view.layer.cornerRadius = 10;
    self.view.clipsToBounds = YES;
}

- (void)parseResult:(id)result withCode:(int)reqeustCode {
    if(reqeustCode==1){
    NSArray *array = (NSArray *)result;
//    for (NSDictionary *dictionary in array) {
//        [self.areas addObject:[Country instanceFromDictionary:dictionary]];
//    }
       

        if([_From isEqualToString:@"SUBPOSTAPPLY"]){
            self.areas = array.mutableCopy;
            NSMutableDictionary *dic =[[NSMutableDictionary alloc] init];
            [dic setValue:@"0" forKey:@"id"];
            [dic setValue:Localized(@"Other") forKey:@"title"];
            [dic setValue:Localized(@"Other") forKey:@"title_ar"];
            [self.areas addObject:dic];
            [self.tableView reloadData];
        }else{
            self.areas = array.mutableCopy;
            [self.tableView reloadData];
        }
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
if([_From  isEqual: @"MARITALSTATUS"]||[_From  isEqual: @"ENGLISH"]||[_From  isEqual: @"ARABIC"]||[_From  isEqual: @"TYPING"]||[_From  isEqual: @"OTHER"]||[_From  isEqual: @"MSOFFICE"]||[_From  isEqual: @"CATEGORY"]||[_From  isEqual: @"NUMBEROFWORKERS"]){
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[self.areas objectAtIndex:indexPath.row]];
}
else if ([_From  isEqual: @"POSTAPPLY"]||[_From  isEqual: @"SUBPOSTAPPLY"]){
    NSMutableDictionary *dic=[self.areas objectAtIndex:indexPath.row];
    if([dic objectForKey:@"title"] != nil){
        if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[[self.areas objectAtIndex:indexPath.row] valueForKey:@"title_ar"]];
        }else{
            cell.textLabel.text = [NSString stringWithFormat:@"%@",[[self.areas objectAtIndex:indexPath.row] valueForKey:@"title"]];

        }
}
}

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
if([_From  isEqual: @"MARITALSTATUS"]||[_From  isEqual: @"ENGLISH"]||[_From  isEqual: @"ARABIC"]||[_From  isEqual: @"TYPING"]||[_From  isEqual: @"OTHER"]||[_From  isEqual: @"MSOFFICE"]||[_From  isEqual: @"CATEGORY"]||[_From  isEqual: @"NUMBEROFWORKERS"]){
    NSString *str=[self.areas objectAtIndex:indexPath.row];
    self.completionBlockS(str);
    [self.delegate cancelButtonClicked:self];
    }else if ([_From  isEqual: @"POSTAPPLY"]){
        NSMutableDictionary *str=[self.areas objectAtIndex:indexPath.row];
        self.completionBlock(str);
        [self.delegate cancelButtonClicked:self];
    } else if ([_From  isEqual: @"POSTAPPLY"]||[_From  isEqual: @"SUBPOSTAPPLY"]){
        NSMutableDictionary *str=[self.areas objectAtIndex:indexPath.row];
        self.completionBlock(str);
        [self.delegate cancelButtonClicked:self];
    }
}


- (IBAction)close:(id)sender {
    [self.delegate cancelButtonClicked:self];

}
@end
