//
//  R_Home_5.h
//  RelianceApplication
//
//  Created by Ashwini Pawar on 15/10/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatabaseClass.h"
#import "iphone4ViewController.h"
#import "AsyncImageView.h"
#import "R_MovieSearch_5.h"
#import "R_wallpapers_5.h"
#import "R_MovieCatalogue_5.h"
#import "iPhone5ShortScenesVC.h"
#import "R_MovieCatalogue_5.h"
#import "R_Trailers_5.h"
#import "GroupViewController.h"
#import "R_FeedsVC_5.h"
#import "Merchandise.h"
#import "R_iPhone5ContestViewController.h"

@interface R_Home_5 : DatabaseClass<UIGestureRecognizerDelegate,UIScrollViewDelegate>
{
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
@property (weak, nonatomic) IBOutlet UIView *bottomview;
@property (weak, nonatomic) IBOutlet UIScrollView *bottom_scroll;
@property (weak, nonatomic) IBOutlet UIScrollView *mid_scroll;
@property (weak, nonatomic) IBOutlet UIScrollView *banner_scroll;
@property (weak, nonatomic) IBOutlet UIImageView *image1;
@property (strong, nonatomic) IBOutlet UIView *cat1;
@property (strong, nonatomic) IBOutlet UIView *cat2;
@property (strong, nonatomic) IBOutlet UIView *cat3;
@property (strong, nonatomic) IBOutlet UIView *cat4;
@property (strong, nonatomic) IBOutlet UIView *cat5;
@property (strong, nonatomic) IBOutlet UIView *cat6;
@property (strong, nonatomic) IBOutlet UIView *cat7;

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
@property (strong, nonatomic) IBOutlet UIView *footerMainView;
- (IBAction)traillers:(id)sender;
- (IBAction)nowPlaying:(id)sender;
- (IBAction)memorabillaStore:(id)sender;
- (IBAction)socialFeeds:(id)sender;
- (IBAction)chatRoom:(id)sender;

@end
