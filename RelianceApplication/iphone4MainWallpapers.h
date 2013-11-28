//
//  iphone4MainWallpapers.h
//  RelianceApplication
//
//  Created by Ashwini Pawar on 16/08/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"
#import "GlobalClass.h"
#import "DatabaseClass.h"
#import "AsyncImageView.h"
#import <Twitter/Twitter.h>
#import <Socialize/Socialize.h>
#import "Social/Social.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import "JSON.h"
@interface iphone4MainWallpapers :DatabaseClass<iCarouselDelegate, iCarouselDataSource,UIWebViewDelegate,UIGestureRecognizerDelegate,UIScrollViewDelegate,MFMailComposeViewControllerDelegate,SocializeServiceDelegate>
{
    UIView          *vw_CollectionView;
    UITapGestureRecognizer *webViewTapped[1000];
    iCarousel       *ic_CoverFlow;
    UIWebView       *webwall;
    UIWebView       *bigWallImage;
    NSString        *strr;
    UIImageView  *view2[1000];
    NSString        *shareText;
	NSString        *shareTWEET[1000];
     int	sendtitle;
    UIButton *downloadButton[1000];
    UIButton *downloadHD[1000];
    CGFloat start;
    BOOL directionUp;
    UIImageView                 *ActIndImage1[1000];
	UIActivityIndicatorView     *activityIndicator1[1000];
    NSString    *fbsharetext;
    NSString    *twtsharetext;
    NSString    *mailsharesub;

    NSString    *mailsharetext;
    UIButton *shareButton[1000];
    UIView *shareView[1000];
    UIButton *fbButton[1000];
    
    UIButton *twtButton[1000];
    
    UIButton *mailButton[1000];

    NSArray *_products;
    NSNumberFormatter * _priceFormatter;
    
    UIImageView *lockImage;
   // UIImageView *premiumImage;
    UIView *premiumView;
    SZActionBar *actionBar[1000];
    NSString *FBID;
    NSString *ACCESSTOKEN;
    NSString *fbFeedId[1000];
    UIView *socializeBg[1000];
    UIButton *faceBookBtn;
    UIButton *twitterBtn;
    UIButton *emailBtn;
    
    
}
@property (nonatomic, retain) UIButton *faceBookBtn;
@property (nonatomic, retain) UIButton *twitterBtn;
@property (nonatomic, retain) UIButton *emailBtn;
@property (nonatomic, retain) UIView *wallpaperView;

@property (nonatomic, retain) ACAccountStore *accountStore;
@property (nonatomic, retain) ACAccount *facebookAccount;
//@property (nonatomic, retain) SZActionBar *actionBar;
@property (nonatomic, retain) id<SZEntity> entity;
@property (nonatomic, retain) SZLikeButton *likeButton;
@property (nonatomic, strong) Socialize *socialize;

@property (weak, nonatomic) IBOutlet UIView *IAPVIEW;
@property (weak, nonatomic) IBOutlet UILabel *pricelabel;
@property (strong, nonatomic) IBOutlet UIButton *cancelbutton;

-(IBAction)IAPCANCELED;
-(IBAction)IAPCALLED;
- (IBAction)RESTORE:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *okaybutton;
@property(nonatomic,strong) IBOutlet UIScrollView *IAPVIEWScroller;
@property(nonatomic,retain) NSTimer *logoTimer ;
@property (strong, nonatomic) IBOutlet UIProgressView *dwnloadProgress;
@property (nonatomic)int imgIndex;
@property (strong, nonatomic) IBOutlet UIView *footerMainView;
@property (strong, nonatomic) NSString *TAG;
@property (weak, nonatomic) IBOutlet UIButton *closebtn;
@property (weak, nonatomic) IBOutlet UIView *footerView;
@property(nonatomic,strong) UIScrollView *imageScroller;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activictyIndicator;
- (IBAction)openFooter:(id)sender;
- (IBAction)merchandise:(id)sender;
-(IBAction)toRelApp:(id)sender;
- (IBAction)myProfile:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *closeButtonView;
- (IBAction)closeButton:(id)sender;
-(IBAction)chat:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *headerImageView;
@property (strong, nonatomic) IBOutlet UILabel *headerLabel;
- (IBAction)fbShare:(id)sender;
- (IBAction)tweetShare:(id)sender;
-(IBAction)mailCompose:(id)sender;
- (IBAction)shareButton:(id)sender;
- (IBAction)downloadButton;
@end
