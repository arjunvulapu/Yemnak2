//
//  QuestionsViewController.m
//  YEMNAK
//
//  Created by apple on 14/07/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import "QuestionsViewController.h"
#import "QuestionTableViewCell.h"
#import "Common.h"
#import "AFNetworking.h"
#import "SVProgressHUD.h"
#import "Question2TableViewCell.h"
#import "OptionsTableViewCell.h"
@interface QuestionsViewController ()
{
    NSMutableArray *answers;
    NSMutableDictionary *selectedOpDict;
}
@end

@implementation QuestionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    selectedOpDict=[[NSMutableDictionary alloc] init];
    _chefQuestionsLbl.text=Localized(@"Chefs Questions");
    // Do any additional setup after loading the view.
    [self.submitBtn setTitle:Localized(@"Submit your Answers") forState:UIControlStateNormal];
    self.submitBtn.layer.cornerRadius = self.submitBtn.frame.size.height/2;
    self.submitBtn.clipsToBounds = YES;
    self.submitBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    self.submitBtn.layer.borderWidth = 2;
    
    _chefQuestionsLbl.text=self.title;
    self.navigationItem.title=Localized(@"Employee Request");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}
//
//
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//
//    return _Qlist.count;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    QuestionTableViewCell *cell = [self.questionTableView dequeueReusableCellWithIdentifier:@"QuestionTableViewCell"];
//    NSDictionary *que=[_Qlist objectAtIndex:indexPath.row+1];
//    cell.questionNumber.text = [NSString stringWithFormat:@"%.2ld",(long)indexPath.row];
//    if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
//        cell.questionTxtView.text = [NSString stringWithFormat:@"%@",[que valueForKey:@"title_ar"]];
//    }else{
//        cell.questionTxtView.text = [NSString stringWithFormat:@"%@",[que valueForKey:@"title"]];
//
//    }
//
//    return cell;
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == self.questionTableView) {
        return 1;
    } else {
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.questionTableView) {
        return _Qlist.count;
    } else {
        return 5;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.questionTableView) {
         NSDictionary *que=[_Qlist objectAtIndex:indexPath.row];
        if([[que valueForKey:@"type"] isEqual:@"Description"]){
        QuestionTableViewCell *cell = [self.questionTableView dequeueReusableCellWithIdentifier:@"QuestionTableViewCell"];
       
        cell.questionNumber.text = [NSString stringWithFormat:@"%.2ld",(long)indexPath.row+1];
        if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
            cell.questionTxtView.text = [NSString stringWithFormat:@"%@",[que valueForKey:@"title_ar"]];
        }else{
            cell.questionTxtView.text = [NSString stringWithFormat:@"%@",[que valueForKey:@"title"]];
            
        }
        
        return cell;
        }else{
            Question2TableViewCell *cell = [self.questionTableView dequeueReusableCellWithIdentifier:@"Question2TableViewCell"];
            NSMutableArray *opList=[[NSMutableArray alloc]init];
            opList = [que valueForKey:@"options"];
            cell.options = opList;
            cell.selectedOption = [selectedOpDict valueForKey:[que valueForKey:@"id"]];
            cell.questionNUmber.text = [NSString stringWithFormat:@"%.2ld",(long)indexPath.row+1];
            if([[Utils getLanguage] isEqual:KEY_LANGUAGE_AR]){
                cell.questionTxtView.text = [NSString stringWithFormat:@"%@",[que valueForKey:@"title_ar"]];
            }else{
                cell.questionTxtView.text = [NSString stringWithFormat:@"%@",[que valueForKey:@"title"]];
                
            }
            cell.MoveProduct = ^(){
                
                [selectedOpDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"selected_option"] forKey:[que valueForKey:@"id"]];
                NSIndexPath* rowToReload = [NSIndexPath indexPathForRow:indexPath.row inSection:0];
                NSArray* rowsToReload = [NSArray arrayWithObjects:rowToReload, nil];
                 cell.selectedOption = [selectedOpDict valueForKey:[que valueForKey:@"id"]];
                [cell.optionsTableView reloadData];
            };
            
            
            return cell;
        }
    }
    else {
        // Configure the cells of your self.toyTable;
        OptionsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OptionsTableViewCell"];
        cell.chooseOption = ^(){

        };
        cell.optionTitle=@"test";
        return cell;

    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
     NSDictionary *que=[_Qlist objectAtIndex:indexPath.row];
      if([[que valueForKey:@"type"] isEqual:@"Description"]){
    
   return UITableViewAutomaticDimension;
      }else{
          NSMutableArray *opList=[[NSMutableArray alloc]init];
          opList = [que valueForKey:@"options"];
          return 100+opList.count*45;
      }
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(Question2TableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(cell == [Question2TableViewCell class]){
    [cell.optionsTableView reloadData];
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.questionTableView) {
        // If this is the outer cell that contains self.toyTable
        // You should ignore the selection
        // Else handle it according to your needs
    } else {
        // Handle click on inner cell
    }
}
- (IBAction)submitAnswers:(id)sender {
    answers = [[NSMutableArray alloc] init];
    for(int i=0;i<_Qlist.count;i++){
        NSDictionary *que=[_Qlist objectAtIndex:i];
        if([[que valueForKey:@"type"] isEqual:@"Description"]){

        QuestionTableViewCell *cell = [self.questionTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        
            NSLog(@"%dcellanswer:%@",i,cell.answerTxtView.text);
      
        NSDictionary *userDictionary = [[NSDictionary alloc] initWithObjectsAndKeys: [que valueForKey:@"id"], @"question_id", cell.answerTxtView.text, @"answer", nil];
        [answers addObject:userDictionary];
        }else{
            if([selectedOpDict valueForKey:[que valueForKey:@"id"]]){
            NSDictionary *userDictionary = [[NSDictionary alloc] initWithObjectsAndKeys: [que valueForKey:@"id"], @"question_id", [selectedOpDict valueForKey:[que valueForKey:@"id"]], @"answer", nil];
            [answers addObject:userDictionary];
            }
//            else{
//                NSDictionary *userDictionary = [[NSDictionary alloc] initWithObjectsAndKeys: [que valueForKey:@"id"], @"question_id",@"" , @"answer", nil];
//                [answers addObject:userDictionary];
//            }
        }
    }
    
    NSLog(@"%@",answers);
    [self.formData setValue:@"iPhone" forKey:@"device_type"];
    [self.formData setValue:answers forKey:@"questions"];
    NSLog(@"%@",_formData);
    NSData *data = [NSJSONSerialization dataWithJSONObject:self.formData options:NSJSONWritingPrettyPrinted error:nil];
    NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"json: %@", json);
    //[self sendtoServer:json];
    [self uploadImagesWithProgressWithId:json];
}
- (void)uploadImagesWithProgressWithId:(NSString *)json {
    
    //http://clients.yellowsoft.in/lawyers/api/add-member-image.php
    
    NSString *serverURL = [NSString stringWithFormat:@"%@/%@", SERVER_URL,EMPLOYEE_REQUEST];
    
    //    NSDictionary *parameters = @{@"inventory_id":_InvId};
    NSDictionary *parameters = @{@"member_id":[Utils loggedInUserIdStr],@"content":json};
    
    
    //    UIImage *image = Upload_Image1;
    UIImage *image = [UIImage imageWithCGImage:self.resumeImage.CGImage scale:0.25 orientation:self.resumeImage.imageOrientation];
  
    
    
    if (image == nil) {
        [self hideHUD];
        // [Utils showAlertWithMessage:[MCLocalization stringForKey:@"Sent Sucessfully"]];
        // [self.navigationController popViewControllerAnimated:YES];
        [self sendtoServer:json];
        return;
    }
    
    
    // image = [image resizedImageToFitInSize:CGSizeMake(960, 640) scaleIfSmaller:NO];
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:serverURL parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        [formData appendPartWithFileData:UIImagePNGRepresentation(image)
                                    name:@"file1"
                                fileName:@"file.png"
                                mimeType:@"image/png"];
     
    } error:nil];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionUploadTask *uploadTask;
    
    uploadTask = [manager uploadTaskWithStreamedRequest:request
                                               progress:^(NSProgress * _Nonnull uploadProgress) {
                                                   dispatch_async(dispatch_get_main_queue(), ^{
                                                       [SVProgressHUD showProgress:uploadProgress.fractionCompleted];
                                                   });
                                               }
                                      completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                                          if (error) {
                                              NSLog(@"Failure %@", error.description);
                                              [self hideHUD];
                                              [Utils showErrorAlertWithMessage:[MCLocalization stringForKey:@"Error While Posting"]];
                                              
                                          } else {
                                              
                                              NSLog(@"Success %@", responseObject);
                                              
                                              [self hideHUD];
                                              [Utils showAlertWithMessage:[MCLocalization stringForKey:@" Sent Sucessfully"]];
                                              [self.navigationController popToRootViewControllerAnimated:YES];
                                          }
                                      }];
    
    
    
    [uploadTask resume];
}

- (void)sendtoServer:(NSString *)json {
    if (![Utils isOnline]) {
        [Utils showErrorAlertWithMessage:[MCLocalization stringForKey:@"internet_error"]];
        return;
    }
    
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeGradient];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:[[Utils createURLForPage:EMPLOYEE_REQUEST withParameters:nil] absoluteString] parameters:@{@"member_id":[Utils loggedInUserIdStr],@"content":json} progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        [SVProgressHUD dismiss];
        NSLog(@"%@",responseObject);
        [self.navigationController popToRootViewControllerAnimated:YES];
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        [SVProgressHUD dismiss];
        NSLog(@"Error: %@", error);
        
        [self showErrorAlertWithMessage:[error localizedDescription]];
    }];
}
@end
