//
//  R_Trailers_5.h
//  RelianceApplication
//
//  Created by Ashwini Pawar on 23/10/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalClass.h"
#import "DatabaseClass.h"
#import "iphone5PlayVideo.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import "JSON.h"
#import <Socialize/Socialize.h>
#import "AppDelegate.h"
#import "RageIAPHelper.h"
#import <StoreKit/StoreKit.h>

@interface R_Trailers_5 : DatabaseClass<UIScrollViewDelegate,UIWebViewDelegate,UIGestureRecognizerDelegate,SocializeActionBarDelegate,UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>
{
    int check;

	UIImageView     *ImageBck;
	NSString    *VideoLinksfromServer[50];
	UIScrollView    *VideoScroller;
	UIImageView     *ImagePatch[50];
	UIButton        *infoVideo[50];
	UIButton        *ShareVideo[50];
	int             TotalNumOfRows;
	UIActionSheet   *actionSheet;
	NSString        *shareText;
	NSString        *AlbumImages[100];
	UISlider *volumeControl;
	UIActivityIndicatorView* activityIndicator;
	
	//LivedATA
	UIView *bgView[1000];
	UIImageView	*Mbackground;
	
	UIWebView		*webwall[1000];
	UIImageView                 *ActIndImage1[1000];
	UIActivityIndicatorView     *activityIndicator1[1000];
	UIButton					*Video;
	UIButton					*Music;
	UIButton					*btn[100];
	UIImage	 *img[100];
	int k;
	
	UITextField *downloadSourceField;
	UIView *volumeSlider;
	UILabel *positionLabel;
	UISlider *progressSlider;
	NSTimer *progressUpdateTimer;
	NSString *currentImageName;
	UILabel	*castLabel[1000];
	NSString *song;
	UIImageView		*star;
    
	UIButton			*hungamaBanner;
	
	UILabel			*MusicLabel[1000];
    UIImageView *lockImage;
    UIImageView *premiumImage;
    CGFloat start;
    BOOL directionUp;
    NSArray *_products;
    NSNumberFormatter * _priceFormatter;
    NSTimer *_timer;
    
    // int TotalData;
    SZActionBar *actionBar[1000];
    NSString *FBID;
    NSString *ACCESSTOKEN;
    UIView *socializeBg[1000];
    
    UIButton *faceBookBtn;
    UIButton *twitterBtn;
    UIButton *emailBtn;
    NSString *fbFeedId[1000];
    
    UIButton *faceBookBtnStills;
    UIButton *twitterBtnStills;
    UIButton *emailBtnStills;
    NSString *fbFeedIdStills[1000];
    UIImageView *grayImage[1000];
    UIView *bgViewStills[1000];
	UILabel			*MovieLabel[1000];
    
    NSString *data16[1000];
    NSString *data17[1000];
     NSString *data18[1000];
    
    UIImageView  *view3[1000];
    UIView *socializeBgStills[1000];
    SZActionBar *actionBarStills[1000];
    UIImageView *lockImageStills;
    UILabel			*MovieLabelStills[1000];
    int l;
    NSString        *strr;
    NSString    *fbsharetext;
    
    NSString    *twtsharetext;
    
    NSString    *mailsharesub;
    UITextView                        *MovieTextViewStills[1000];

    UITextView                        *MovieTextViewvideo[1000];
    UILabel			*MovieLabelVideo[1000];
    
    NSString    *mailsharetext;
    UIImageView *grayImage1[1000];
    
    UIActivityIndicatorView *activityIndicator2;

}
@property (nonatomic)int newTag;
@property (nonatomic)int nX;
@property (nonatomic)int nY;
@property (nonatomic)int b;
@property (nonatomic)int currentScrollPosition;
@property (nonatomic)int finalCount;
@property (nonatomic)int loaderCount;
@property (nonatomic)int m;


@property (retain, nonatomic)  NSMutableArray *movieNameArray;
@property (retain, nonatomic)  NSMutableArray *movieNameArrayForStills;
@property (strong,nonatomic) NSString    *tagg;

@property (strong,nonatomic) NSString    *moviename;


@property (nonatomic)int imgIndex;

@property (nonatomic, retain) UIButton *faceBookBtn;
@property (nonatomic, retain) UIButton *twitterBtn;
@property (nonatomic, retain) UIButton *emailBtn;
@property (nonatomic) int TotalData1;
@property (nonatomic,retain) IBOutlet UIButton *filmStillButton;

@property (strong, nonatomic) IBOutlet UIButton *trailersButton;
@property (nonatomic, retain) ACAccountStore *accountStore;
@property (nonatomic, retain) ACAccount *facebookAccount;
//@property (nonatomic, retain) SZActionBar *actionBar;
@property (nonatomic, retain) id<SZEntity> entity;
@property (nonatomic, retain) SZLikeButton *likeButton;
@property (nonatomic, strong) Socialize *socialize;

@property (weak, nonatomic) IBOutlet UIView *IAPVIEW;
@property (weak, nonatomic) IBOutlet UILabel *pricelabel;
@property (strong, nonatomic) IBOutlet UIButton *cancelbutton;
@property (strong, nonatomic) IBOutlet UIButton *okaybutton;
@property(nonatomic,strong) IBOutlet UIScrollView *IAPVIEWScroller;
- (IBAction)RESTORE:(id)sender;
-(IBAction)IAPCANCELED;
-(IBAction)IAPCALLED;
@property (strong, nonatomic) UIScrollView *Scroller;
@property (strong, nonatomic) IBOutlet UIView *LOGINVIEW;
@property (strong, nonatomic) IBOutlet UITextField *movieSearch;
@property (strong, nonatomic) IBOutlet UITableView *movieTable;
@property (strong, nonatomic) IBOutlet UITableView *stillTable;

@property (strong, nonatomic) NSString *TAG;
@property (strong, nonatomic) NSString *movieTagFromOpenMv;

- (id)initWithStr:(NSString *)_str;
- (IBAction)trailers:(id)sender;
- (IBAction)filmStills:(id)sender;

@end

