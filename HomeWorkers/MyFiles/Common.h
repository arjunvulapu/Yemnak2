//
//  Common.h
//  Cavaratmall
//
//  Created by Amit Kulkarni on 12/07/15.
//  Copyright (c) 2015 iMagicsoftware. All rights reserved.
//

#ifndef Cavaratmall_Common_h
#define Cavaratmall_Common_h

#import "AppDelegate.h"

#define KEY_LANGUAGE_EN @"en"
#define KEY_LANGUAGE_AR @"ar"


#define LAST_CLOSED_TIME @"LAST_CLOSED_TIME"

#define THEME_COLOR [UIColor colorWithRed:60/255.0f green:60/255.0f blue:60/255.0f alpha:1];
#define BUTTON_BG_COLOR [UIColor whiteColor];
#define PROJECT_GRAY [UIColor colorWithRed:233.0f/255.0f green:236.0f/255.0f blue:239.0f/255.0f alpha:1];

#define PLACEHOLDER_COLOR [UIColor grayColor];

#define Localized(string) [MCLocalization stringForKey:string]

#define APP_DELEGATE (AppDelegate *) [[UIApplication sharedApplication] delegate]


//#define SERVER_URL @"http://products.yellowsoft.in/homeworkers/api/"
#define SERVER_URL @"http://yemnaak.com/api/"

#define HOMEWORKERS @"home_workers.php"
#define RELIGIONS @"religions.php"
#define NATIONALITY @"nationality.php"
#define ADDMEMBER @"add-member.php"
#define MEMBER_DETAILS @"members.php"
#define LOGIN @"login.php"
#define PAGE_FORGOT_PASSWORD @"forget-password.php"
#define EDITMEMBER @"edit-member.php"
#define AVAILABLEWORKERS @"avail_workers.php"
#define ADD_AVAILABLEWORKERS @"add-availworker.php"
#define EDIT_AVAILABLEWORKERS @"edit-availworkers.php"
#define DELETE_AVAILABLEWORKERS @"delete-availworkers.php"

#define SETTINGS @"settings.php"
#define WORDS @"words-json.php"
#define PAGE_ADD_RATING @"add-comments.php"
#define WORKER_COMMENTS @"worker_comments.php"
#define PAGE_GET_AREA @"areas.php"
#define PAGE_GET_Quantity @"part_qty.php"
#define BOOK_PART_TIMEWORKERS @"add-partworkers.php"
//#define PAGE_PAYMENT @"Tap.php"
#define PAGE_PAYMENT @"pay.php"

#define PAYMENT_SUCCESS @"update_part_payment.php"
#define HOME_PAYMENT_SUCCESS @"update_homereq_payment.php"
#define AVAILABLEWORKERS_PAYMENT_SUCCESS @"update_available_payment.php"
#define CORPORATEREQUEST_PAYMENT_SUCCESS @"update_corporate_payment.php"
#define HW_BOOKING_PAYMENT_SUCCESS @"update_homebooking_payment.php"

#define HW_BOOKING @"home_booking.php"
#define CONTACTUS @"contact-us.php"
#define SERVICES @"services.php"
#define HOMEWORKERS_REQUEST @"homew_reqs.php"

#define EMPLOYEE_REQUEST @"add-employee.php"
#define JOBS_LIST @"job_types.php"
#define CORPORATE_REQUEST @"add-corporate.php"
#define AGES @"age.php"

//list
#define CORPORATE_LIST @"corporates.php"
#define EMPLOYEE_LIST @"employee_reqs.php"
#define HOMEWORKERS_LIST @"home_workers_reqs.php"
#define AVAILABLEWORKES_LIST @"available_workers_reqs.php"
#define PARTTIMEWORKERS_LIST @"parttime_workers_reqs.php"

#define SYSTEM_VERSION_GREATER_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)

#endif
