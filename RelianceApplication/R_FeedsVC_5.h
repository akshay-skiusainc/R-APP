//
//  R_FeedsVC_5.h
//  RelianceApplication
//
//  Created by Ashwini Pawar on 15/10/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Twitter/Twitter.h>
#import <Socialize/Socialize.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import "JSON.h"
#import "GAITrackedViewController.h"

@interface R_FeedsVC_5 : GAITrackedViewController<MFMailComposeViewControllerDelegate,UIGestureRecognizerDelegate,UIWebViewDelegate,UITextFieldDelegate,SocializeServiceDelegate,UIScrollViewDelegate>
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
    NSString		*sharetweet1[1000];
    NSString        *shareText1[1000];
    NSString* data5[1000];
    int check_on;

    NSString* data4[1000];
    UITextField * commentTextField[1000];
    
    NSString    *TheaterAddress[1000];
    NSString    *Time[1000];
    UILabel     *Th_name_Lbl[1000];
    
    int         TotalNumOfRows;
    NSString     *jsonArray;
    UIButton *Publish[3];
    NSString        *shareText[1000];
    NSString        *shareFBText[1000];
    
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
    int  check;
    int  check1;
    
    CGFloat start;
    BOOL directionUp;
    
    NSString    *fbsharetext;
    NSString    *twtsharetext;
    NSString    *mailsharesub;
    
    NSString    *mailsharetext;
    NSString *FBID;
    NSString *ACCESSTOKEN;
    NSString    *dataMvName;
    
    
    int         TotalNumOfTweets;
    UIView *tweetView[1000];
    
    UIScrollView    *VideoScrollerTweet;
    UIImageView     *ImagePatchTweet[1000];
    
    
    //Anish Socialize
    SZActionBar *actionBar[1000];
    NSString *fbFeedId[1000];
    UIView *socializeBg[1000];
    UIView *socializeBgtweet[1000];
    
    SZActionBar *tweetActionBar[1000];
    SZActionBar *actionBarDetail;

}
@property (strong, nonatomic) IBOutlet UIButton *faceBookButton;
@property (strong, nonatomic) IBOutlet UIButton *twitterButton;

@property (nonatomic, retain) ACAccountStore *accountStore;
@property (nonatomic, retain) ACAccount *facebookAccount;
@property (nonatomic, retain) id<SZEntity> entity;
@property (nonatomic, retain) SZLikeButton *likeButton;
@property (nonatomic, strong) Socialize *socialize;
@property (strong, nonatomic) NSString *TAG;
@property (strong, nonatomic) NSString *FEEDTAG;

@property (nonatomic, assign) BOOL disableAlertViewResizing;

@property (strong, nonatomic) IBOutlet UIImageView *fbTweetBgImage;


@property (weak, nonatomic) IBOutlet UIImageView *singleScrollImage;
@property (strong, nonatomic)  IBOutlet UIScrollView *singleFeedScroll;
@property (strong, nonatomic) IBOutlet UILabel *movieNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateBigLabel;
@property (strong, nonatomic) IBOutlet UIImageView *bigImageView;
@property (strong, nonatomic) IBOutlet UILabel *descLabel;
@property (strong, nonatomic) IBOutlet UIView *socialFeedsBgView;
@property (strong, nonatomic) IBOutlet UIButton *closeButton;
- (IBAction)close:(UIButton *)sender;



- (IBAction)faceBookFeed:(id)sender;
- (IBAction)twitterFeed:(id)sender;

@end
