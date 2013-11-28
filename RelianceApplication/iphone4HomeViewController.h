//
//  iphone4HomeViewController.h
//  RelianceApplication
//
//  Created by Ashwini Pawar on 13/08/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatabaseClass.h"
#import "iphone4ViewController.h"
#import "AsyncImageView.h"
#import "iPhone4StreamingPlayerViewController.h"
#import "iphone4FacebookViewController.h"
#import "iphone4NewsViewController.h"
#import "iphone4BehindtheScene.h"
#import "iPhone4Daabang2SecondViewController.h"
#import "iphone4TwitterViewController.h"
#import "iphone4FacebookViewController.h"
#import "SynopsisViewController.h"

@interface iphone4HomeViewController : DatabaseClass<UIGestureRecognizerDelegate,UIScrollViewDelegate>
{
    //    NSString* data1[1000];
    //	NSString* data2[1000];
    //	NSString* data3[1000];
    //
    //	NSString* data4[1000];
    //
    //	NSString* data5[1000];
    //	NSString* data6[1000];
    //	NSString* data7[1000];
    //	NSString* data8[1000];
    //    int TotalData;
    int n ;
    
    CGFloat newOffset;
    NSTimer *progressUpdateTimer;
    UIActivityIndicatorView     *activityIndicator[100];
    UIActivityIndicatorView     *bannerActivityIndicator[100];
    UIImageView *bannerImage[100];
    int totalBannerImage;
    UIImageView *PAGINGEFFECT[10];
    UIImageView *pagingbackground;
    CGFloat start;
    BOOL directionUp;
    //IBOutlet  UIImageView       *CatImage;
    
}
@property (weak, nonatomic) IBOutlet UIScrollView *banner_scroll;
@property (weak, nonatomic) IBOutlet UIImageView *image1;
@property (strong, nonatomic) IBOutlet UIView *cat1;
@property (strong, nonatomic) IBOutlet UIView *cat2;
@property (strong, nonatomic) IBOutlet UIView *cat3;
@property (strong, nonatomic) IBOutlet UIView *cat4;
@property (strong, nonatomic) IBOutlet UIView *cat5;
@property (strong, nonatomic) IBOutlet UIView *cat6;
@property(nonatomic) int totalBannerImage;;
@property (strong, nonatomic) IBOutlet UIView *bannerBgView;
@property (strong, nonatomic) IBOutlet UIView *footerView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *act1;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *act2;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *act3;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *act4;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *act5;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *act6;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *act7;
- (IBAction)openFooter;
@property (strong, nonatomic) IBOutlet UIView *footerMainView;
- (IBAction)myProfile:(id)sender;
-(IBAction)toRelApp:(UIButton *)sender;
- (IBAction)merchandise:(id)sender;
-(IBAction)chat:(id)sender;
@end
