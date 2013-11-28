//
//  BVideos.h
//  RelianceApplication
//
//  Created by Akshay on 8/12/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatabaseClass.h"
#import "iphone5PlayVideo.h"

@interface BVideos : DatabaseClass<UIWebViewDelegate,UIGestureRecognizerDelegate>
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
    UIImageView *premiumImage;
    NSArray *_products;
    NSNumberFormatter * _priceFormatter;
    NSTimer *_timer;
    UIImageView *lockImage;
    
}
@property (weak, nonatomic) IBOutlet UIView *IAPVIEW;
@property (weak, nonatomic) IBOutlet UILabel *pricelabel;
@property (strong, nonatomic) IBOutlet UIButton *cancelbutton;
@property (strong, nonatomic) IBOutlet UIButton *okaybutton;
@property(nonatomic,strong) IBOutlet UIScrollView *IAPVIEWScroller;

-(IBAction)IAPCANCELED;
-(IBAction)IAPCALLED;
- (IBAction)RESTORE:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *footerView;
@property (strong, nonatomic) IBOutlet UIView *footerMainView;
-(IBAction)info:(id)sender;
-(IBAction)chat:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *Scroller;
@property (strong, nonatomic) IBOutlet UIView *LOGINVIEW;
@property (strong, nonatomic) IBOutlet UIButton *sharebtn;
- (IBAction)merchandise:(id)sender;
-(IBAction)toRelApp:(id)sender;
- (IBAction)myProfile:(id)sender;

@end
