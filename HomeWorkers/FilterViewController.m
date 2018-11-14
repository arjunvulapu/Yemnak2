//
//  FilterViewController.m
//  Minwain
//
//  Created by Amit Kulkarni on 10/05/16.
//  Copyright © 2016 Amit Kulkarni. All rights reserved.
//

#import "FilterViewController.h"
#import "SelectAreaViewController.h"
#import "UIViewController+MJPopupViewController.h"
#import "PopViewControllerDelegate.h"
#import "SelectReligionViewController.h"
#import "PriceViewController.h"
#import "MembersViewController.h"
@interface FilterViewController () <UITableViewDelegate, UITableViewDataSource>
{
    NSDictionary *snationality;
    NSDictionary *sreligion;
    NSDictionary *sages;
    NSString *sgender;
     NSString *sage;
}
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UINavigationItem *navItem;
@property (nonatomic) NSMutableArray *areas;

@end

@implementation FilterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    _gender=@"";
//    _ages = @"";
    
    self.maleLbl.text =Localized(@"Male");
    self.femaleLbl.text=Localized(@"Female");
    [self.resetBtn setTitle:Localized(@"Reset")];
    self.nationalityTxtfiled.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Select Nationality")
     attributes:@{NSForegroundColorAttributeName:[UIColor grayColor]}];
    self.religionTxtFiled.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Select Religion")
     attributes:@{NSForegroundColorAttributeName:[UIColor grayColor]}];
    self.fromSal.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Min Sal")
     attributes:@{NSForegroundColorAttributeName:[UIColor grayColor]}];
    self.toSAl.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Max Sal")
     attributes:@{NSForegroundColorAttributeName:[UIColor grayColor]}];
    self.AmountTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Select Amount")
     attributes:@{NSForegroundColorAttributeName:[UIColor grayColor]}];
    self.ageTxtField.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:Localized(@"Select Age")
     attributes:@{NSForegroundColorAttributeName:[UIColor grayColor]}];
    self.submitBtn.layer.cornerRadius = self.submitBtn.frame.size.height/2;
    self.submitBtn.clipsToBounds = YES;
    self.submitBtn.layer.borderWidth = 2.0f;
    self.submitBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    //self.submitBtn.backgroundColor = BUTTON_BG_COLOR;

    self.areas = [[NSMutableArray alloc] init];
    [self.submitBtn setTitle:Localized(@"Submit") forState:UIControlStateNormal];
    self.minSalLbl.text=Localized(@"Minimum Sal");
    self.maximumSalLbl.text=Localized(@"Maximum Sal");

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
    
    self.navItem.title = Localized(@"Filter");
    [self.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    if ([self.restId length] > 0) {
        [dictionary setValue:self.restId forKey:@"rest_id"];
    }
    self.areas=_areasList;
//    [self makePostCallForPage:PAGE_GET_AREA
//                   withParams:dictionary
//              withRequestCode:1];
    
    
    
    
    if([_nationality valueForKey:@"title"]){
        snationality= _nationality;
    self.nationalityTxtfiled.text = [_nationality valueForKey:@"title"];
    }
    if([_religion valueForKey:@"title"]){
        sreligion = _religion;
        self.religionTxtFiled.text = [_religion valueForKey:@"title"];
    }
     if([_From isEqual:@"AW"]){
         sage = _ages;
         self.ageTxtField.text = sage;

     }
   else  if([_age valueForKey:@"title"]){
        sages = _age;
        self.ageTxtField.text = [sages valueForKey:@"title"];
    }
    if([_gender  isEqual: @"1"]){
        [self.maleBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
        [self.femaleBtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
        sgender = @"female";
    }else  if([_gender  isEqual: @"0"]){
        [self.maleBtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
        [self.femaleBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
        sgender = @"male";
    }else{
        [self.maleBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
        [self.femaleBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    self.view.layer.cornerRadius = 10;
    self.view.clipsToBounds = YES;
    

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
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[[self.areas objectAtIndex:indexPath.row] valueForKey:@"title"]];
}
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    Country *country = [self.areas objectAtIndex:indexPath.section];
//    CountryArea *cat = [country.areas objectAtIndex:indexPath.row];
NSMutableDictionary *str=[self.areas objectAtIndex:indexPath.row];
   // self.completionBlock(str);
    [self.delegate cancelButtonClicked:self];
}


- (IBAction)close:(id)sender {
    [self.delegate cancelButtonClicked:self];

}
- (void)cancelButtonClicked:(UIViewController *)secondDetailViewController {
    [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationSlideTopBottom];
}

- (IBAction)shownationality:(id)sender {
    SelectAreaViewController *vc = [[SelectAreaViewController alloc] initWithNibName:@"SelectAreaViewController" bundle:nil];
    vc.delegate=self;
    //    [self.navigationController pushViewController:vc animated:YES];
    vc.completionBlock = ^(NSMutableDictionary *area) {
        NSLog(@"%@",area);
        snationality= area;
        self.nationalityTxtfiled.text = [area valueForKey:@"title"];
    };
    
    [self presentPopupViewController:vc animationType:MJPopupViewAnimationSlideBottomTop dismissed:nil];
}

- (IBAction)showReligion:(id)sender {
    SelectReligionViewController *vc = [[SelectReligionViewController alloc] initWithNibName:@"SelectReligionViewController" bundle:nil];
    vc.delegate=self;
    //    [self.navigationController pushViewController:vc animated:YES];
    vc.completionBlock = ^(NSMutableDictionary *area) {
        NSLog(@"%@",area);
        sreligion = area;
        if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
           self.religionTxtFiled.text = [area valueForKey:@"title_ar"];
        }else{
             self.religionTxtFiled.text = [area valueForKey:@"title"];
            
        }
    };
    
    [self presentPopupViewController:vc animationType:MJPopupViewAnimationSlideBottomTop dismissed:nil];
}
- (IBAction)resetBtnAction:(id)sender {
    sgender = @"";
    [self.maleBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
    [self.femaleBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
    _nationalityTxtfiled.text=@"";
    snationality = [[NSDictionary alloc] init];
    _religionTxtFiled.text=@"";
    sreligion = [[NSDictionary alloc] init];
    _ageTxtField.text=@"";
    sages = [[NSDictionary alloc] init];
    
}
- (IBAction)submitBtnAction:(id)sender {
    NSLog(@"%@",self.nationalityTxtfiled.text);
    NSLog(@"%@",self.religionTxtFiled.text);NSLog(@"%@",self.fromSal.text);NSLog(@"%@",self.toSAl.text);
  
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    if(_nationalityTxtfiled.text.length>0){
    [dict setObject:[snationality valueForKey:@"id"] forKey:@"nationality"];
    }else{
        [dict setObject:@"" forKey:@"nationality"];

    }
     if(_religionTxtFiled.text.length>0){
    [dict setObject:[sreligion valueForKey:@"id"] forKey:@"religion"];
     }else{
         [dict setObject:@"" forKey:@"religion"];
     }
    if(_ageTxtField.text.length>0){
                if([_From  isEqual: @"AW"]){
                [dict setObject:_ages forKey:@"age"];
                }else{
                    [dict setObject:_ages forKey:@"age"];

                    //[dict setObject:[sages valueForKey:@"id"] forKey:@"age"];
                }
    }else{
        [dict setObject:@"" forKey:@"age"];
    }
   // [dict setObject:_fromSal.text forKey:@"MinSal"];
    // [dict setObject:_toSAl.text forKey:@"MaxSal"];
    //[dict setObject:_ageTxtField.text forKey:@"age"];
    //[dict setObject:_AmountTxtField.text forKey:@"amount"];
    if([sgender isEqual:@"male"]){
    [dict setObject:@"0" forKey:@"gender"];
    }else if([sgender isEqual:@"female"]){
        [dict setObject:@"1" forKey:@"gender"];
    }else{
       [dict setObject:@"" forKey:@"gender"];
    }
    if([_From isEqual:@"AW"]){
        self.completionBlockAW(dict,snationality,sreligion,sage);

    }else{
    self.completionBlock(dict,snationality,sreligion,sages);
    }
    
    [self.delegate cancelButtonClicked:self];
}
- (IBAction)selectAgeBtnAction:(id)sender {
    if([_From  isEqual: @"AW"]){
    PriceViewController *vc = [[PriceViewController alloc] initWithNibName:@"PriceViewController" bundle:nil];
    vc.delegate=self;
    //    [self.navigationController pushViewController:vc animated:YES];
    vc.title = @"SELECT AGE";
    vc.minimum=@"55";
    vc.maximum=@"0";
    vc.devider=@"1";
    vc.completionBlock = ^(NSString *area) {
        NSLog(@"%@",area);
        _ages = area;
        _ageTxtField.text=[NSString stringWithFormat:@"%@",area];
    };

    [self presentPopupViewController:vc animationType:MJPopupViewAnimationSlideBottomTop dismissed:nil];
    }else{
    MembersViewController *vc = [[MembersViewController alloc] initWithNibName:@"MembersViewController" bundle:nil];
    vc.delegate=self;
    //    [self.navigationController pushViewController:vc animated:YES];
    vc.from = @"ages";
    vc.completionBlock2 = ^(NSDictionary *sage ) {
        sages=sage;
        if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
            self.ageTxtField.text = [NSString stringWithFormat:@"%@",[sages valueForKey:@"title_ar"]];
        }else{
            self.ageTxtField.text = [NSString stringWithFormat:@"%@",[sages valueForKey:@"title"]];
        }
    };
        vc.completionBlock3 = ^(NSString *sage ) {
            sage=sage;
            if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
                self.ageTxtField.text = [NSString stringWithFormat:@"%@",sage];
            }else{
                self.ageTxtField.text = [NSString stringWithFormat:@"%@",sage];
            }
        };
    [self presentPopupViewController:vc animationType:MJPopupViewAnimationSlideBottomTop dismissed:nil];
    }
}
- (IBAction)amountBtnAction:(id)sender {
    PriceViewController *vc = [[PriceViewController alloc] initWithNibName:@"PriceViewController" bundle:nil];
    vc.delegate=self;
    //    [self.navigationController pushViewController:vc animated:YES];
    vc.title = @"SELECT AMOUNT";
    vc.minimum=@"10000";
    vc.maximum=@"0";
    vc.devider=@"100";
    vc.completionBlock = ^(NSString *area) {
        NSLog(@"%@",area);
        _AmountTxtField.text=[NSString stringWithFormat:@"%@",area];
    };
    
    [self presentPopupViewController:vc animationType:MJPopupViewAnimationSlideBottomTop dismissed:nil];
}

- (IBAction)fromsalBtnAction:(id)sender {
    PriceViewController *vc = [[PriceViewController alloc] initWithNibName:@"PriceViewController" bundle:nil];
    vc.delegate=self;
    //    [self.navigationController pushViewController:vc animated:YES];
    vc.title = @"SELECT MINIMUM SALARY";
    vc.minimum=@"10000";
    vc.maximum=@"0";
    vc.devider=@"100";
    vc.completionBlock = ^(NSString *area) {
        NSLog(@"%@",area);
        _fromSal.text=[NSString stringWithFormat:@"%@",area];
    };
    
    [self presentPopupViewController:vc animationType:MJPopupViewAnimationSlideBottomTop dismissed:nil];
}

- (IBAction)toSalBtnAction:(id)sender {
    PriceViewController *vc = [[PriceViewController alloc] initWithNibName:@"PriceViewController" bundle:nil];
    vc.delegate=self;
    //    [self.navigationController pushViewController:vc animated:YES];
    vc.title = @"SELECT MAXIMUM SALARY";
    vc.minimum=@"10000";
    vc.maximum=@"0";
    vc.devider=@"100";
    vc.completionBlock = ^(NSString *area) {
        NSLog(@"%@",area);
        _toSAl.text=[NSString stringWithFormat:@"%@",area];
    };
    
    [self presentPopupViewController:vc animationType:MJPopupViewAnimationSlideBottomTop dismissed:nil];
}
- (IBAction)maleBtnAction:(id)sender {
    if([sgender  isEqual: @"male"]){
    sgender= @"";
    [self.maleBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
    [self.femaleBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
    }else{
        sgender= @"male";
        [self.maleBtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
        [self.femaleBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
    }

}
- (IBAction)femaleBtnAction:(id)sender {
    if([sgender  isEqual: @"female"]){
        sgender= @"";
        [self.maleBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
        [self.femaleBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
    }else{
     sgender= @"female";
    [self.femaleBtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
    [self.maleBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
    }
}

@end
