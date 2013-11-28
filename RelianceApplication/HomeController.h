//
//  HomeController.h
//  Relapp
//
//  Created by Akshay on 8/1/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalClass.h"
#import "ViewController.h"
#import "DatabaseClass.h"
#import "ContestViewController.h"
#import "iphone5CastNCrew.h"

#import "iphone5Settings.h"
#import "ContestViewController.h"
#import "AsyncImageView.h"
#import "NewsViewController.h"
#import "iphone5Video.h"
#import "MainWallpapers.h"
#import "iphone5Synopsis.h"
@interface HomeController : DatabaseClass<UIGestureRecognizerDelegate,UIScrollViewDelegate>
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


    //IBOutlet  UIImageView       *CatImage;
    UIActivityIndicatorView     *bannerActivityIndicator[100];
    UIImageView *bannerImage[100];

    CGFloat start;
    BOOL directionUp;
    UIImageView *PAGINGEFFECT[10];
    UIImageView *pagingbackground;
 int totalBannerImage;
    int check;

}
@property (strong, nonatomic) IBOutlet UIView *footerMainView;
@property (strong, nonatomic) IBOutlet UIView *footerView;
@property (weak, nonatomic) IBOutlet UIScrollView *banner_scroll;
@property (weak, nonatomic) IBOutlet UIImageView *image1;
@property (strong, nonatomic) IBOutlet UIView *cat1;
@property (strong, nonatomic) IBOutlet UIView *cat2;
@property (strong, nonatomic) IBOutlet UIView *cat3;
@property (strong, nonatomic) IBOutlet UIView *cat4;
@property (strong, nonatomic) IBOutlet UIView *cat5;
@property (strong, nonatomic) IBOutlet UIView *cat6;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *act1;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *act2;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *act3;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *act4;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *act5;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *act6;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *act7;

- (IBAction)myProfile:(id)sender;
-(IBAction)toRelApp:(UIButton *)sender;
- (IBAction)merchandise:(id)sender;
-(IBAction)chat:(id)sender;




@end
