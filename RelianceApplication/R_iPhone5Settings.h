//
//  R_iPhone5Settings.h
//  RelianceApplication
//
//  Created by Anish on 10/17/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatabaseClass.h"
#import "R_iphone5ContactUsViewController.h"
#import "R_iphone5ProfileViewController.h"
#import "R_iphone5PolicyViewController.h"
#import "R_iphone5HelpViewController.h"
#import "AboutInfoViewController.h"
@interface R_iPhone5Settings :  DatabaseClass

{
    
    CGFloat start;
    BOOL directionUp;
    
}
@property (strong, nonatomic) IBOutlet UIView *footerView;
@property (strong, nonatomic) IBOutlet UIView *footerMainView;
@property (strong, nonatomic) IBOutlet UIButton *profileButtonView;
@property (strong, nonatomic) IBOutlet UIButton *signoutButtonView;
@property (strong, nonatomic) IBOutlet UIButton *feedbackButtonView;
@property (strong, nonatomic) IBOutlet UIButton *helpButtonView;
@property (strong, nonatomic) IBOutlet UIButton *termsButtonView;
@property (strong, nonatomic) IBOutlet UIButton *contactButtonView;
@property (strong, nonatomic) IBOutlet UIButton *aboutButtonView;

@property (strong, nonatomic) IBOutlet UILabel *profileLable;
@property (strong, nonatomic) IBOutlet UILabel *signoutLable;
@property (strong, nonatomic) IBOutlet UILabel *feedbackLable;
@property (strong, nonatomic) IBOutlet UILabel *helpLable;

@property (strong, nonatomic) IBOutlet UILabel *termsLable;
@property (strong, nonatomic) IBOutlet UILabel *contactLable;
@property (strong, nonatomic) IBOutlet UILabel *aboutLable;
@property (strong, nonatomic) NSString *TAG;

- (IBAction)profileButton:(id)sender;
- (IBAction)feedbackButton:(id)sender;
- (IBAction)helpButton:(id)sender;
- (IBAction)termsButton:(id)sender;
- (IBAction)contactButton:(id)sender;
- (IBAction)aboutButton:(id)sender;
-(IBAction)chat:(id)sender;


@end
