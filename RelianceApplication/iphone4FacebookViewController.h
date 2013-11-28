//
//  iphone4FacebookViewController.h
//  RelianceApplication
//
//  Created by Ashwini Pawar on 13/08/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Twitter/Twitter.h>
#import <Socialize/Socialize.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import "JSON.h"
#import "GAITrackedViewController.h"

@interface iphone4FacebookViewController : GAITrackedViewController<MFMailComposeViewControllerDelegate,UIGestureRecognizerDelegate,UIWebViewDelegate,UITextFieldDelegate,SocializeServiceDelegate>
{
    UIScrollView    *VideoScroller;
    UIImageView     *ImagePatch[1000];
    UIImageView     *ImageBck;
    UIButton     *Sharer[1000];
    NSString    *FbFeeds[1000];
    NSString    *tweets[1000];
    NSString* data1[1000];
    NSString* data2[1000];
    NSString* data3[1000];
    NSString* data[1000];
    NSString* data6[1000];

    NSString* data5[1000];

    NSString* data4[1000];
    UITextField * commentTextField[1000];
    
    NSString    *TheaterAddress[1000];
    NSString    *Time[1000];
    UILabel     *Th_name_Lbl[1000];
    
    int         TotalNumOfRows;
    NSString     *jsonArray;
    UIImageView     *Publish[3];
    NSString        *shareText[1000];
    UIImageView     *ActIndImage;
    UIActivityIndicatorView  *activityIndicator;
    int  divider;
	
	UIImageView	*image1[1000];
	UIImageView	*fbLogo[1000];
    UILabel     *movieLabel[1000];
    UILabel     *dateLabel[1000];
    UILabel     *sharelabel[1000];
	UIImageView		*webwall[1000];
	
	NSString		*sharetweet[1000];
    
    UIButton        *infoButton;
    
    
    CGFloat start;
    BOOL directionUp;
    
    NSString    *fbsharetext;
    NSString    *twtsharetext;
    NSString    *mailsharesub;
    
    NSString    *mailsharetext;
    NSString *FBID;
    NSString *ACCESSTOKEN;
    NSString    *dataMvName;
    
    //Anish Socialize
    SZActionBar *actionBar[1000];
    NSString *fbFeedId[1000];
    UIView *socializeBg[1000];
//    UIButton *faceBookBtn;
//    UIButton *twitterBtn;
//    UIButton *emailBtn;
    SZActionBar *actionBarDetail;
    
}
//@property (nonatomic, retain) UIButton *faceBookBtn;
//@property (nonatomic, retain) UIButton *twitterBtn;
//@property (nonatomic, retain) UIButton *emailBtn;


@property (nonatomic, retain) ACAccountStore *accountStore;
@property (nonatomic, retain) ACAccount *facebookAccount;
//@property (nonatomic, retain) SZActionBar *actionBar;
@property (nonatomic, retain) id<SZEntity> entity;
@property (nonatomic, retain) SZLikeButton *likeButton;
@property (nonatomic, strong) Socialize *socialize;
@property (strong, nonatomic) NSString *TAG;

@property (strong, nonatomic) IBOutlet UIView *footerMainView;

@property (strong, nonatomic) IBOutlet UIView *footerView;
@property (nonatomic, assign) BOOL disableAlertViewResizing;

- (IBAction)openFooter:(id)sender;
-(IBAction)toRelApp:(UIButton *)sender;
- (IBAction)merchandise:(id)sender;
-(IBAction)chat:(id)sender;
- (IBAction)myProfile:(id)sender;


@property (weak, nonatomic) IBOutlet UIImageView *singleScrollImage;
@property (strong, nonatomic)  IBOutlet UIScrollView *singleFeedScroll;
@property (strong, nonatomic) IBOutlet UILabel *movieNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateBigLabel;
@property (strong, nonatomic) IBOutlet UIImageView *bigImageView;
@property (strong, nonatomic) IBOutlet UILabel *descLabel;
@property (strong, nonatomic) IBOutlet UIView *socialFeedsBgView;
@property (strong, nonatomic) IBOutlet UIButton *closeButton;
-(IBAction)fbshare1:(UIButton *)sender;
-(IBAction)twitter1:(UIButton *)sender;
-(IBAction)mailCompose1:(UIButton*)sender;
- (IBAction)close:(UIButton *)sender;


@end
