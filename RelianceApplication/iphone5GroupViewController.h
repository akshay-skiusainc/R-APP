//
//  iphone5GroupViewController.h
//  RelianceApplication
//
//  Created by Ashwini Pawar on 27/08/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatabaseClass.h"
#import "ChatViewController.h"
#import "SMChatDelegate.h"
#import "AppDelegate.h"
#import "XMPPFramework.h"
#import "XMPPRoster.h"
#import "XMPP.h"
#import "SMChatDelegate.h"
#import "SMMessageDelegate.h"
#import "XMPPRoomCoreDataStorage.h"
#import "XMPPReconnect.h"
#import "XMPPStream.h"

@interface iphone5GroupViewController :  DatabaseClass<UIWebViewDelegate,UIGestureRecognizerDelegate,SMChatDelegate>
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
	
	//LivedATA
    UIView *gapView[1000];
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
	UILabel	*titleMusic;
	NSString *song;
	UIImageView		*star;
	UIButton			*hungamaBanner;
	
	UILabel			*MusicLabel[1000];
    
    CGFloat start;
    BOOL directionUp;
    
    
    XMPPStream *xmppStream;
	XMPPRoster *xmppRoster;
    
    XMPPReconnect *xmppReconnect;
	XMPPRoomCoreDataStorage *xmppRosterStorage;
    
    int chatgroupid;

    NSTimer *_timer;
    NSArray *_products;
    NSNumberFormatter * _priceFormatter;
   UIView *premiumView[1000];
}
@property (nonatomic, readonly) XMPPStream *xmppStream;
@property (nonatomic, readonly) XMPPRoster *xmppRoster;
@property (nonatomic, strong, readonly) XMPPReconnect *xmppReconnect;
@property (nonatomic, strong, readonly) XMPPRoomCoreDataStorage *xmppRosterStorage;

@property (nonatomic, assign) id  _chatDelegate;
//@property (nonatomic, assign) id  _messageDelegate;
@property (nonatomic, assign) NSObject <SMMessageDelegate> *_messageDelegate;
@property (strong, nonatomic) IBOutlet UIView *footerMainView;
@property (strong, nonatomic) NSString *TAG;
-(IBAction)info:(id)sender;
- (IBAction)openFooter:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *Scroller;
@property (strong, nonatomic) IBOutlet UIView *LOGINVIEW;
@property (strong, nonatomic) IBOutlet UIButton *sharebtn;
@property (strong, nonatomic) IBOutlet UIView *footerView;

@property (strong, nonatomic) IBOutlet UIView *chatloginview;


@property (strong, nonatomic) IBOutlet UIButton *popupCloseButtonRef;
@property (strong, nonatomic) IBOutlet UITextField *popupTextField;
@property (strong, nonatomic) IBOutlet UIButton *loginButtonRef;


- (IBAction)popupCloseButton:(id)sender;
- (IBAction)popupLoginButton:(id)sender;




-(IBAction)toRelApp:(UIButton *)sender;
- (IBAction)merchandise:(id)sender;
-(IBAction)chat:(id)sender;
- (IBAction)myProfile:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *livechatgroup;

@property (strong, nonatomic) IBOutlet UIButton *cancelbutton;
@property (strong, nonatomic) IBOutlet UIButton *okaybutton;
@property (strong, nonatomic) IBOutlet UIView *IAPVIEW;
@property (strong, nonatomic) IBOutlet UILabel *pricelabel;
@property (strong, nonatomic) IBOutlet UIImageView *titleImageBackground;
@property (strong, nonatomic) IBOutlet UIImageView *dividerImage;

@property (strong, nonatomic) IBOutlet UILabel *titlelabel;
-(IBAction)IAPCANCELED;
-(IBAction)IAPCALLED;
- (IBAction)RESTORE:(id)sender;

@end
