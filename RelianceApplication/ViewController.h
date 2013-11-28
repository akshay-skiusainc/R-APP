//
//  ViewController.h
//  RelianceApplication
//
//  Created by Akshay on 8/6/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"
#import "DatabaseClass.h"

@interface ViewController : DatabaseClass
{
    NSTimer *logoTimer;
}
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (strong, nonatomic) IBOutlet UIImageView *besharamLogin;
@property (strong, nonatomic) IBOutlet UIImageView *relLogo;
@property (strong, nonatomic) IBOutlet UIImageView *relScreen;
@property (strong, nonatomic) IBOutlet UIImageView *lowerBtnImage;
@property (strong, nonatomic) IBOutlet UIImageView *upperBtnImage;
@property (strong, nonatomic) IBOutlet UIButton *lowerBtn;
@property (strong, nonatomic) IBOutlet UIButton *upperBtn;

@end
