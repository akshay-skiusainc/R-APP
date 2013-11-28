//
//  R_OpenStills_5.h
//  RelianceApplication
//
//  Created by Ashwini Pawar on 26/10/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatabaseClass.h"
#import "AsyncImageView.h"
#import "Social/Social.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import "JSON.h"
#import <Socialize/Socialize.h>

@interface R_OpenStills_5 : DatabaseClass<SocializeServiceDelegate>
{
    
    NSString        *strr;
    NSString        *shareText;
    UIImageView  *view2[1000];
    UIButton *downloadHD[1000];
    
    SZActionBar *actionBar[1000];
    NSString *FBID;
    NSString *ACCESSTOKEN;
    NSString *fbFeedId[1000];
    UIView *socializeBg[1000];
    UIButton *faceBookBtn;
    UIButton *twitterBtn;
    UIButton *emailBtn;
    NSString    *fbsharetext;
    
    NSString    *twtsharetext;
    
    NSString    *mailsharesub;
    
    
    
    NSString    *mailsharetext;
    NSString *entity_Key;
    NSString *entity_name;
    NSString *data18[1000];

    
}
@property (nonatomic, retain) NSString *entity_Key;
@property (nonatomic, retain) NSString *entity_name;
@property (nonatomic, retain) UIButton *faceBookBtn;
@property (nonatomic, retain) UIButton *twitterBtn;
@property (nonatomic, retain) UIButton *emailBtn;
@property (strong, nonatomic) IBOutlet UIButton *closeButtonView;

@property (nonatomic)int imgIndex;

//@property (nonatomic, retain) SZActionBar *actionBar;
@property (nonatomic, retain) id<SZEntity> entity;
@property (nonatomic, retain) SZLikeButton *likeButton;
@property (nonatomic, strong) Socialize *socialize;
@property (weak, nonatomic) IBOutlet UIView *IAPVIEW;
@property (weak, nonatomic) IBOutlet UILabel *pricelabel;
@property (strong, nonatomic) IBOutlet UIButton *cancelbutton;
@property(nonatomic)int stillIndex;
@property(nonatomic,strong) IBOutlet UIScrollView *imageScroller;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activictyIndicator;

@property(nonatomic,retain) NSTimer *logoTimer ;
@property (strong, nonatomic) IBOutlet UIProgressView *dwnloadProgress;

@property(strong,nonatomic)NSString *movieName;
-(IBAction)back;
@end
