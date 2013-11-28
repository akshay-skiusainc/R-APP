//
//  iPhone5ShortScenesVC.h
//  RelianceApplication
//
//  Created by Ashwini Pawar on 12/10/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalClass.h"
#import "DatabaseClass.h"
#import <Socialize/Socialize.h>
@interface iPhone5ShortScenesVC : DatabaseClass<UIWebViewDelegate,UIGestureRecognizerDelegate,SocializeServiceDelegate>
{
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
	UIView *backgroundView[1000];
	//LivedATA
    UIView *gapView[1000];
	UIImageView	*Mbackground;
    UIImageView *dividerImage[1000];

    UILabel *shareLabel;
    UILabel *timeLabel[1000];
    
	UIImageView		*webwall[1000];
    UITapGestureRecognizer *tapped123[100];

	UIImageView                 *ActIndImage1[1000];
	UIActivityIndicatorView     *activityIndicator1[1000];
	UIButton					*Video;
	UIButton					*Music;
	UIButton					*btn[100];
	UIImage	 *img[100];
	int k;
	
	UITextField *downloadSourceField;
	UIView *volumeSlider;
	UILabel *positionLabel[1000];
	UISlider *progressSlider;
	NSTimer *progressUpdateTimer;
	NSString *currentImageName;
	UILabel	*titleMusic;
	NSString *song;
	UIImageView		*star;
	UIButton			*hungamaBanner;
	
	UILabel			*MusicLabel[1000];
    
    CGFloat start;
    BOOL directionUp;
    
    
    NSString        *strr;
    NSString    *fbsharetext;
    
    NSString    *twtsharetext;
    
    NSString    *mailsharesub;
    
    
    
    NSString    *mailsharetext;

    UIImageView *lockImage;
    UIImageView *premiumImage;
    NSArray *_products;
    NSNumberFormatter * _priceFormatter;
    NSTimer *_timer;
    
    SZActionBar *actionBar[1000];
    NSString *FBID;
    NSString *ACCESSTOKEN;
    UIView *socializeBg[1000];
    
    UIButton *faceBookBtn;
    UIButton *twitterBtn;
    UIButton *emailBtn;
    NSString *fbFeedId[1000];
    
    
}

@property (retain, nonatomic)  NSMutableArray *movieNameArray;
@property(nonatomic)int imgIndex;

@property (nonatomic, retain) UIButton *faceBookBtn;
@property (nonatomic, retain) UIButton *twitterBtn;
@property (nonatomic, retain) UIButton *emailBtn;
@property (strong, nonatomic) IBOutlet UITextField *movieSearch;
@property (strong, nonatomic) IBOutlet UITableView *movieTable;

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

-(IBAction)IAPCANCELED;
-(IBAction)IAPCALLED;
- (IBAction)RESTORE:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *footerMainView;
@property (strong, nonatomic) NSString *TAG;
-(IBAction)info:(id)sender;
- (IBAction)openFooter:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *Scroller;
@property (strong, nonatomic) IBOutlet UIView *LOGINVIEW;
@property (strong, nonatomic) IBOutlet UIButton *sharebtn;
@property (strong, nonatomic) IBOutlet UIView *footerView;
- (id)initWithStr:(NSString *)_str;
@end
