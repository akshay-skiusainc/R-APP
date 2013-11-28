//
//  iphone4NewsViewController.h
//  RelianceApplication
//
//  Created by Ashwini Pawar on 13/08/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatabaseClass.h"
@interface iphone4NewsViewController : DatabaseClass<UIGestureRecognizerDelegate>
{
    UIView *backView[1000];
    UIImageView *newsImage[1000];
    UILabel *smallDesc[1000];
    UILabel *detailDesc[1000];
    UIImageView *detailButton[1000];
    UIActivityIndicatorView *activityIndicator[1000];
    NSString *data[1000];
//    NSString* data1[1000];
//    NSString* data2[1000];
//    int TotalData;
    
    UIScrollView	*descScroll;
    CGFloat start;
    BOOL directionUp;
    
}
@property (strong, nonatomic) IBOutlet UIView *footerMainView;

@property (strong, nonatomic)UIScrollView *Scroller;
@property (strong, nonatomic) NSString *TAG;


@property (nonatomic,retain) UIScrollView *newsScroll;
@property (nonatomic,retain) UIButton *shareButton;
@property (nonatomic,retain) UILabel *bigDetailDesc;
@property (nonatomic,retain) UILabel *bigSmallDesc;
@property (nonatomic,retain) UIActivityIndicatorView *bigActivityIndicator;
@property (nonatomic,retain) UIImageView *bigNewsImage;
@property (nonatomic,retain) UIButton *downButton;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *newsActivityIndicator;
@property (nonatomic,retain)UIView *bigBackView;
@property (strong, nonatomic) IBOutlet UIView *footerView;
- (IBAction)openFooter:(id)sender;
-(IBAction)chat:(id)sender;
- (IBAction)back:(id)sender;
- (IBAction)merchandise:(id)sender;
-(IBAction)toRelApp:(id)sender;
- (IBAction)myProfile:(id)sender;


@end
