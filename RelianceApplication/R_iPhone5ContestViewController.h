//
//  R_iPhone5ContestViewController.h
//  RelianceApplication
//
//  Created by Anish on 10/17/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>
@ class AppDelegate;
#import "GAITrackedViewController.h"

@interface R_iPhone5ContestViewController :  GAITrackedViewController<UIScrollViewDelegate,UIWebViewDelegate>
{
    IBOutlet UIImageView *poasterImage;
    IBOutlet UIScrollView *contestScroll;
    IBOutlet UIView *contestView;
    UIImageView *cellImage[1000];
    
    UIButton *cellBtn[1000];
    
    NSString* data1[1000];
	NSString* data2[1000];
	NSString* data3[1000];
	
	NSString* data4[1000];
	
	NSString* data5[1000];
	NSString* data6[1000];
	NSString* data7[1000];
	NSString* data8[1000];
    NSString* data9[1000];
    NSString* data10[1000];
	NSString* data11[1000];
    NSString* data14[1000];
    NSString* data15[1000];
    NSString* data18[1000];
    NSString    *str;
    int TotalData;
    
    //    UIImageView                 *ActIndImage1[1000];
    UIActivityIndicatorView     *activityIndicator;
    UIActivityIndicatorView     *activityIndicator1[1000];
    AppDelegate *appD;
    CGFloat start;
    BOOL directionUp;
    
}

@property(nonatomic,retain) IBOutlet UIActivityIndicatorView     *activityIndicator;
@property (strong, nonatomic) IBOutlet UIView *footerMainView;
@property (weak, nonatomic) IBOutlet UIView *footerView;
@property(nonatomic,retain) IBOutlet UIImageView *poasterImage;
@property(nonatomic,retain)  UIScrollView *contestScroll;
@property (strong, nonatomic) NSString *TAG;
@property(nonatomic,retain)  NSString* data12;
@property(nonatomic,retain)  NSString* data13;
@property(nonatomic,retain)  NSString* data16;
@property(nonatomic,retain)  NSString* data17;
- (IBAction)merchandise:(id)sender;
-(IBAction)toRelApp:(id)sender;
- (IBAction)myProfile:(id)sender;
-(IBAction)chat:(id)sender;

@end
