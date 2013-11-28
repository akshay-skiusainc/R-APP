//
//  Video.h
//  YJHD
//
//  Created by Akshay Band on 19/03/13.
//  Copyright (c) 2013 SKI USA 35. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalClass.h"
#import "DatabaseClass.h"
#import "iphone5PlayVideo.h"
@interface iphone5Video : DatabaseClass<UIWebViewDelegate,UIGestureRecognizerDelegate>
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
	//UIImageView		*lockImage;
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
    UIImageView *lockImage;
     UIImageView *premiumImage;
    CGFloat start;
    BOOL directionUp;
    NSArray *_products;
    NSNumberFormatter * _priceFormatter;
    NSTimer *_timer;

    
}
@property (weak, nonatomic) IBOutlet UIView *IAPVIEW;
@property (weak, nonatomic) IBOutlet UILabel *pricelabel;
@property (strong, nonatomic) IBOutlet UIButton *cancelbutton;
@property (strong, nonatomic) IBOutlet UIButton *okaybutton;
@property(nonatomic,strong) IBOutlet UIScrollView *IAPVIEWScroller;
- (IBAction)RESTORE:(id)sender;
-(IBAction)IAPCANCELED;
-(IBAction)IAPCALLED;
@property (strong, nonatomic) IBOutlet UIView *footerMainView;
@property (strong, nonatomic) NSString *TAG;
-(IBAction)info:(id)sender;
- (IBAction)openFooter:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *footerView;
@property (weak, nonatomic) IBOutlet UIScrollView *Scroller;
@property (strong, nonatomic) IBOutlet UIView *LOGINVIEW;
@property (strong, nonatomic) IBOutlet UIButton *sharebtn;
- (IBAction)merchandise:(id)sender;
-(IBAction)toRelApp:(id)sender;
- (IBAction)myProfile:(id)sender;
- (IBAction)chat:(id)sender;
@end
