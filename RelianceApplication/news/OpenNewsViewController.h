//
//  OpenNewsViewController.h
//  Relapp
//
//  Created by Ashwini Pawar on 06/08/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Twitter/Twitter.h>
#import "Social/Social.h"
#import "iphone5Settings.h"
#import <Socialize/Socialize.h>

@interface OpenNewsViewController : UIViewController<SocializeActionBarDelegate>
{
    UIView *bigBackView;
    UIButton *downButton;
    UIImageView *bigNewsImage;
    UIActivityIndicatorView *bigActivityIndicator;
    UITextView *bigSmallDesc;
    UILabel *bigDetailDesc;
    UIButton *shareButton;
    UIScrollView * newsScroll;
    NSString		*data1[1000];
	NSString		*data2[1000];
	NSString		*data3[1000];
    NSString        *shareText;
	NSString        *shareTWEET[1000];
    NSString    *fbsharetext;
    NSString    *twtsharetext;
    NSString    *mailsharesub;
    NSString    *mailsharetext;

    NSString   *strr;

    
    int	sendtitle;
    CGFloat start;
    BOOL directionUp;
    
    UIButton *faceBookBtn;
    UIButton *twitterBtn;
    UIButton *emailBtn;
    
    
}
@property (nonatomic, retain) UIButton *faceBookBtn;
@property (nonatomic, retain) UIButton *twitterBtn;
@property (nonatomic, retain) UIButton *emailBtn;
@property (nonatomic, retain) IBOutlet UIView *socializeBg;
@property (nonatomic, retain) SZActionBar *actionBar;

@property (nonatomic, retain) NSString *newsID;
@property (nonatomic, retain) ACAccountStore *accountStore;
@property (nonatomic, retain) ACAccount *facebookAccount;
//@property (nonatomic, retain) SZActionBar *actionBar;
@property (nonatomic, retain) id<SZEntity> entity;
@property (nonatomic, retain) SZLikeButton *likeButton;
@property (nonatomic, strong) Socialize *socialize;

@property (strong, nonatomic) IBOutlet UIView *footerMainView;

- (IBAction)shareButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *bigNewsImage;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *bigActivityIndicator;
@property (strong, nonatomic) IBOutlet UITextView *bigSmallDesc;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *newsActivityIndicator;
@property (strong, nonatomic) IBOutlet UILabel *bigDetailDesc;
@property (strong, nonatomic) IBOutlet UIView *fbTweetView;
@property (strong, nonatomic) IBOutlet UIView *middleView;
@property (strong, nonatomic) IBOutlet UIButton *closeButtonView;
@property (strong, nonatomic)IBOutlet UIScrollView *Scroller;
@property (nonatomic)NSInteger tagApply;
@property (nonatomic,retain)NSString* smallDescStr;
@property (nonatomic,retain)NSString* detailDescStr;
@property (nonatomic,retain)NSString* imageStr;
@property (strong, nonatomic) IBOutlet UIView *footerView;
- (IBAction)closeButton:(id)sender;
- (IBAction)backButton:(id)sender;
- (IBAction)toRelApp:(id)sender;
- (IBAction)fbShare:(id)sender;
- (IBAction)tweetShare:(id)sender;
- (IBAction)openFooter:(id)sender;
- (IBAction)closeFooter:(id)sender;
- (IBAction)merchandise:(id)sender;
- (IBAction)chat:(id)sender;
- (IBAction)myProfile:(id)sender;
@end
