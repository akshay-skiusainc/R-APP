//
//  R_OpenMovie_5.h
//  RelianceApplication
//
//  Created by Ashwini Pawar on 30/10/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatabaseClass.h"
#import "AsyncImageView.h"
#import "R_Trailers_5.h"
#import "iphone5PlayVideo.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import "JSON.h"
#import <Socialize/Socialize.h>

@interface R_OpenMovie_5 : DatabaseClass<UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate,UIScrollViewDelegate,SocializeActionBarDelegate>
{
    int m;

    NSString    *getiID;
    UIImageView *frame[10];
    UIImageView *_image2[100];
    int idis;
    int TotalShortScene;
    UIScrollView    *VideoScroller;
    UILabel *timeLabel[1000];
    UIImageView		*webwall[1000];
	UILabel	*MusicLabel[1000];
    UILabel	*viewsLabel[1000];
    UILabel	*views[1000];
    
    UIView *backgroundView[1000];
    UIImageView *lockImage;
    UIImageView *gapview[1000];
    
    NSString *data20[1000];
    NSString *data30[1000];
    NSString *data40[1000];
    
    NSString *data50[1000];
    
    NSString *data60[1000];
    NSString *data70[1000];
    NSString *data80[1000];
    NSString *data90[1000];
    NSString *data100[1000];
    NSString *data110[1000];
    
    SZActionBar *actionBar[1000];
    NSString *FBID;
    NSString *ACCESSTOKEN;
    NSString *fbFeedId[1000];
    // UIView *socializeBg[1000];
    UIButton *faceBookBtn;
    UIButton *twitterBtn;
    UIButton *emailBtn;
    NSString    *fbsharetext;
    NSString    *twtsharetext;
    NSString    *mailsharesub;
    
    NSString    *mailsharetext;
   
}
@property (weak, nonatomic) IBOutlet UIImageView *Play_video_nav;
@property (nonatomic, retain) UIButton *faceBookBtn;
@property (nonatomic, retain) UIButton *twitterBtn;
@property (nonatomic, retain) UIButton *emailBtn;


@property (nonatomic, retain) ACAccountStore *accountStore;
@property (nonatomic, retain) ACAccount *facebookAccount;
//@property (nonatomic, retain) SZActionBar *actionBar;
@property (nonatomic, retain) id<SZEntity> entity;
@property (nonatomic, retain) SZLikeButton *likeButton;
@property (nonatomic, strong) Socialize *socialize;
@property (weak, nonatomic) IBOutlet UITextView *movie_label;
@property (strong, nonatomic) NSMutableArray *movieNameArray;

@property (weak, nonatomic) IBOutlet UIButton *shortclipsbtn;
@property (weak, nonatomic) IBOutlet UIButton *castncrewbtn;
@property (strong,nonatomic) NSString    *getiID;
@property (weak, nonatomic) IBOutlet UILabel *Title;
@property (weak, nonatomic) IBOutlet UITextView *Description;
@property (weak, nonatomic) IBOutlet UITableView *castncrewtable;
@property (strong, nonatomic) IBOutlet UIView *socializeBgView;
- (IBAction)shareButton:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *image1;
@end
