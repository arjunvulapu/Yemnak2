//
//  Question2TableViewCell.m
//  YEMNAK
//
//  Created by apple on 14/07/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import "Question2TableViewCell.h"
#import "Utils.h"
#import "Common.h"
#import "OptionsTableViewCell.h"
@implementation Question2TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.optionsTableView reloadData];
    self.optionsTableView.delegate = self;
    self.optionsTableView.dataSource = self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  
    return _options.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
       OptionsTableViewCell  *cell = [self.optionsTableView dequeueReusableCellWithIdentifier:@"OptionsTableViewCell"];
   
    cell.optionTitle.text=[_options objectAtIndex:indexPath.row];
    if([_options objectAtIndex:indexPath.row]==_selectedOption ){
        [cell.btn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];

    }else{
        [cell.btn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];

    }
    cell.chooseOption = ^(){
        [cell.btn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
        _selectedOption=[_options objectAtIndex:indexPath.row];
        [[NSUserDefaults standardUserDefaults] setValue:[_options objectAtIndex:indexPath.row] forKey:@"selected_option"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self pushProduct];
    };
       
        return cell;
    
   
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
 
        return 45;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
}
- (void)pushProduct {
    if (self.MoveProduct) {
        self.MoveProduct();
    }
}
@end
