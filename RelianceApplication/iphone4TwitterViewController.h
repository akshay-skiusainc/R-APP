//
//  iphone4TwitterViewController.h
//  RelianceApplication
//
//  Created by Ashwini Pawar on 13/08/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Twitter/Twitter.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import "JSON.h"
#import "GAITrackedViewController.h"
#import "GAI.h"
//#import "iRate.h"
//#import "iphone5OpenFeedsViewController.h"
#import <Socialize/Socialize.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>
@interface iphone4TwitterViewController : GAITrackedViewController<MFMailComposeViewControllerDelegate,UIGestureRecognizerDelegate,SocializeServiceDelegate,UIScrollViewDelegate>
{
	UIScrollView    *VideoScroller;
	UIImageView     *ImagePatch[1000];
	UIImageView     *ImageBck;
	UIButton     *Sharer[1000];
    UIImageView  *tweet[1000];
    UIImageView  *dividerImage[1000];
    UIButton     *reply[1000];
	NSString    *FbFeeds[1000];
	NSString    *tweets[1000];
	NSString    *TheaterAddress[1000];
	NSString    *Time[1000];
	UILabel     *Th_name_Lbl[1000];
	UILabel     *Th_add_Lbl[1000];
	int         TotalNumOfRows;
	NSString     *jsonArray;
	UIImageView     *Publish[3];
	NSString        *shareText[1000];
	UIImageView     *ActIndImage;
	UIActivityIndicatorView  *activityIndicator;
	int  divider;
    UIButton* infoButton;
    
    CGFloat start;
    BOOL directionUp;
    
    NSString    *fbsharetext;
    NSString    *twtsharetext;
    NSString    *mailsharesub;
    UIView *tweetView[1000];

    NSString    *mailsharetext;
    
    SZActionBar *actionBar[1000];
    NSString *FBID;
    NSString *ACCESSTOKEN;
    UIView *socializeBg[1000];
    
    UIButton *faceBookBtn;
    UIButton *twitterBtn;
    UIButton *emailBtn;
    
    
}
@property (nonatomic, retain) UIButton *faceBookBtn;
@property (nonatomic, retain) UIButton *twitterBtn;
@property (nonatomic, retain) UIButton *emailBtn;


@property (nonatomic, retain) ACAccountStore *accountStore;
@property (nonatomic, retain) ACAccount *facebookAccount;
//@property (nonatomic, retain) SZActionBar *actionBar;
@property (nonatomic, retain) id<SZEntity> entity;
@property (nonatomic, retain) SZLikeButton *likeButton;
@property (nonatomic, strong) Socialize *socialize;

@property (strong, nonatomic) IBOutlet UIView *footerMainView;
@property (strong, nonatomic) NSString *TAG;
@property (strong, nonatomic) IBOutlet UIView *footerView;
@property (nonatomic, assign) BOOL disableAlertViewResizing;
- (IBAction)openFooter:(id)sender;
-(IBAction)toRelApp:(UIButton *)sender;
- (IBAction)merchandise:(id)sender;
-(IBAction)chat:(id)sender;
- (IBAction)myProfile:(id)sender;


@end
