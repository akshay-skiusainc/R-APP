//
//  R_wallpapers_4.h
//  RelianceApplication
//
//  Created by Ashwini Pawar on 22/10/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import "GlobalClass.h"
#import "DatabaseClass.h"
#import "AsyncImageView.h"
#import "Social/Social.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import "JSON.h"
#import <Socialize/Socialize.h>

@interface R_wallpapers_4 : DatabaseClass<UIWebViewDelegate,UIScrollViewDelegate, UIGestureRecognizerDelegate,MFMailComposeViewControllerDelegate,SocializeServiceDelegate,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    UIImageView *imageCover[1000];
    UIWebView       *webwall;
    
    UIWebView       *bigWallImage;
    
    NSString        *strr;
    
    UIImageView  *view2[1000];
    UIImageView  *view3[1000];
    
    UIImageView *grayImage[1000];
    
    UIButton *downloadButton[1000];
    UIButton *downloadHD[1000];
    UIButton *shareButton[1000];
    UIView *bgViewStills[1000];
    UIView *shareView[1000];
    
    UIButton *fbButton[1000];
    
    UIButton *twtButton[1000];
    
    UIButton *mailButton[1000];
    
    // UIView *view3;
    
    NSString        *shareText;
    
    NSString        *shareTWEET[1000];
    
    int	sendtitle;
    
    
    
    
    CGFloat start;
    
    BOOL directionUp;
    
    UIImageView                 *ActIndImage1[1000];
    
    UIActivityIndicatorView     *activityIndicator1[1000];
    
    NSString    *fbsharetext;
    
    NSString    *twtsharetext;
    
    NSString    *mailsharesub;
    
    
    
    NSString    *mailsharetext;
    UIImageView *lockImage;
    NSArray *_products;
    NSNumberFormatter * _priceFormatter;
    UIView *premiumView;
    SZActionBar *actionBar[1000];
    NSString *FBID;
    NSString *ACCESSTOKEN;
    NSString *fbFeedId[1000];
    UIView *socializeBg[1000];
    UIButton *faceBookBtn;
    UIButton *twitterBtn;
    UIButton *emailBtn;
    UIImageView *grayImage1[1000];
    UILabel			*MovieLabelStills[1000];

    UIActivityIndicatorView *activityIndicator2;
}
@property (nonatomic, retain) UIButton *faceBookBtn;
@property (nonatomic, retain) UIButton *twitterBtn;
@property (nonatomic, retain) UIButton *emailBtn;

@property (nonatomic)int newTag;
@property (nonatomic)int nX;
@property (nonatomic)int nY;
@property (nonatomic)int b;
@property (nonatomic)int loaderCount;
@property (nonatomic)int currentScrollPosition;
@property (nonatomic)int finalCount;

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

@property(nonatomic,retain) NSTimer *logoTimer ;
@property (strong, nonatomic) IBOutlet UIImageView *textBackgrnd;

@property (nonatomic)int imgIndex;
@property (nonatomic)int openimgIndex;

@property (strong, nonatomic) NSString *TAG;

@property(nonatomic,strong) UIScrollView *mainScroller;

@property(nonatomic,strong) UIScrollView *imageScroller;

@property(nonatomic,strong) IBOutlet UIScrollView *IAPVIEWScroller;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activictyIndicator;

@property (strong, nonatomic) IBOutlet UIProgressView *dwnloadProgress;

@property (strong, nonatomic) IBOutlet UIButton *closeButtonView;
- (IBAction)closeButton:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *movieSearch;
@property (strong, nonatomic) IBOutlet UITableView *movieTable;
@property (retain, nonatomic)  NSMutableArray *movieNameArray;
@property (strong, nonatomic) IBOutlet UIImageView *shadowImage;
@property (strong, nonatomic) IBOutlet UIImageView *headerImage;
@property (strong, nonatomic) IBOutlet UILabel *headerLabel;
@end
