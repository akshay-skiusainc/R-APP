//
//  PlayVideo.h
//  YJHD
//
//  Created by SKI USA 35 on 3/21/13.
//  Copyright (c) 2013 SKI USA 35. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Twitter/Twitter.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import "JSON.h"
#import "DatabaseClass.h"
#import <Socialize/Socialize.h>
@interface iphone5PlayVideo : DatabaseClass<UIWebViewDelegate,MFMailComposeViewControllerDelegate,SocializeActionBarDelegate>
{
	NSString *idis;
	NSString	*link;
    NSString        *shareText;
    
    NSString *songTitle;
    NSString *lyrics;
    NSString *time;
    NSString *singer;
    
    NSString * VCTag;
	
	UIWebView*          fbview;
	UIImageView         *ActIndImage;
	UIActivityIndicatorView *activityIndicator;
    
    
    
    NSString    *fbsharetext;
    NSString    *twtsharetext;
    NSString    *mailsharesub;
    
    NSString    *mailsharetext;

    
    SZActionBar *actionBar;
    NSString *FBID;
    NSString *ACCESSTOKEN;
    NSString *fbFeedId[1000];
    // UIView *socializeBg[1000];
    UIButton *faceBookBtn;
    UIButton *twitterBtn;
    UIButton *emailBtn;
    
    NSString *entity_Key;
    NSString *entity_name;
    
}
@property (nonatomic, retain) NSString *entity_Key;
@property (nonatomic, retain) NSString *entity_name;
@property (weak, nonatomic) IBOutlet UIImageView *Play_video_nav;
@property (nonatomic, retain) UIButton *faceBookBtn;
@property (nonatomic, retain) UIButton *twitterBtn;
@property (nonatomic, retain) UIButton *emailBtn;


@property (nonatomic, retain) ACAccount *facebookAccount;
//@property (nonatomic, retain) SZActionBar *actionBar;
@property (nonatomic, retain) id<SZEntity> entity;
@property (nonatomic, retain) SZLikeButton *likeButton;
@property (nonatomic, strong) Socialize *socialize;
@property (strong, nonatomic) IBOutlet UIView *socializebg;


@property (nonatomic, retain) NSString *idis;
@property (nonatomic,retain)NSString * VCTag;
@property (nonatomic,retain)NSString * songTitle;
@property (nonatomic,retain)NSString * lyrics;
@property (nonatomic,retain)NSString * time;
@property (nonatomic,retain)NSString * premiumType;
@property (nonatomic,retain)NSString * singer;
@property (strong, nonatomic) IBOutlet UIImageView *infoImageView;
@property (strong, nonatomic) IBOutlet UIImageView *shareImageView;
@property (strong, nonatomic) IBOutlet UIWebView *VideoPlay;
@property (strong, nonatomic) IBOutlet UIButton *doneButton;
@property (strong, nonatomic) IBOutlet UIView *shareView;
@property (strong, nonatomic) IBOutlet UIButton *shareButtonView;
@property (strong, nonatomic) IBOutlet UIButton *finishButtonView;
@property (strong, nonatomic) IBOutlet UIButton *infoButtonView;


@property (nonatomic,retain)NSString * musicDirector;
@property (nonatomic,retain)NSString * musicLabel;
@property (nonatomic,retain) IBOutlet UILabel * songTitleLbl;
@property (nonatomic,retain) IBOutlet UILabel * lyricsLbl;
@property (nonatomic,retain) IBOutlet UILabel * timeLbl;
@property (nonatomic,retain) IBOutlet UILabel * singerLbl;
@property (nonatomic,retain) IBOutlet UILabel * musicDirectorLbl;
@property (nonatomic,retain) IBOutlet UILabel * musicLabelLbl;
@property (nonatomic,retain) IBOutlet UIView * alertView;
@property (nonatomic,retain) IBOutlet UIImageView * alertImgView;

- (IBAction)merchandise:(id)sender;
-(IBAction)toRelApp:(id)sender;
- (IBAction)myProfile:(id)sender;


- (IBAction)infoButton:(id)sender;
- (IBAction)shareButton:(id)sender;

-(IBAction)mailCompose:(id)sender;
- (IBAction)tweetShare:(id)sender;
- (IBAction)fbShare:(id)sender;

- (IBAction)downArrow:(id)sender;
-(id)initWithVCTag:(NSString *)_VCTag;
@end
