//
//  iphone4Merchandise.h
//  RelianceApplication
//
//  Created by Ashwini Pawar on 19/08/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatabaseClass.h"
#import "AsyncImageView.h"
#import <Twitter/Twitter.h>
#import "Social/Social.h"
#import "AAViewController.h"
#import "AddToCart.h"

@interface iphone4Merchandise : DatabaseClass<UIGestureRecognizerDelegate,UIScrollViewDelegate,SocializeActionBarDelegate>
{
    UIActivityIndicatorView*	activityIndicator;
    UIScrollView            *VideoScroller;
    UIImageView             *ImagePatch[1000];
    UIImageView             *ImagePatch2[1000];
    UITextView              *Description[1000];
    UIImageView             *Imageview[1000];
    UILabel                 *Price[1000];
    UIButton                *pricebtn[1000];
    UIButton                *sharebtn[1000];
    UIButton                *leftbtn[1000];
    UIButton                *rightbtn[1000];
    UIImageView *upDownArrow;
    
    UIButton                *buybtn[1000];
    UILabel                 *title[1000];
    NSString        *shareTWEET[1000];    
    
    UIImageView *PAGINGEFFECT[10];
    UIImageView *pagingbackground;
    int m;
    CGFloat start;
    BOOL directionUp;
    NSString    *fbsharetext;
    NSString    *twtsharetext;
    NSString    *mailsharesub;
    UIImage *relAppImage1;
    NSString    *mailsharetext;
    int   sharetag;
    
    
    SZActionBar *actionBar[1000];
    UIView *socializeBg[1000];
    UIButton *faceBookBtn;
    UIButton *twitterBtn;
    UIButton *emailBtn;
    
    
}
@property (nonatomic, retain) UIButton *faceBookBtn;
@property (nonatomic, retain) UIButton *twitterBtn;
@property (nonatomic, retain) UIButton *emailBtn;
@property (nonatomic, retain) id<SZEntity> entity;
@property (nonatomic)int currentScrollPosition;
@property (strong, nonatomic) NSString *TAG;

@property (strong, nonatomic) IBOutlet UIView *fbTweetView;

@end
