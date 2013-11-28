//
//  iPhone4StreamingPlayerViewController.h
//  Relapp
//
//  Created by Anish on 8/16/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatabaseClass.h"
#import "Reachability.h"
#import "iCarousel.h"
@class AudioStreamer;

@interface iPhone4StreamingPlayerViewController : DatabaseClass<UIScrollViewDelegate,iCarouselDataSource,iCarouselDelegate>
{
	IBOutlet UITextField *downloadSourceField;
	IBOutlet UIButton *button;
	IBOutlet UIView *volumeSlider;
	IBOutlet UILabel *positionLabel;
	IBOutlet UISlider *progressSlider;
	AudioStreamer *streamer;
    
    NSString * wallpaperid;
	NSString		*comingfrom;
	NSTimer *progressUpdateTimer;
	NSString *currentImageName;
    
    UIButton *btn[100];
	NSString	*song;
	
	NSString* sendsong;
	
	int check;
    CGFloat start;
    BOOL directionUp;
    UIView          *vw_CollectionView;
    
    iCarousel       *ic_CoverFlow;
    
}
@property (strong, nonatomic) IBOutlet UIView *footerMainView;
@property (strong, nonatomic) IBOutlet UIView *footerView;
@property (retain, nonatomic) IBOutlet UIScrollView *Scroller;
@property (retain, nonatomic) IBOutlet UITextField *downloadSourceField;
@property (retain, nonatomic) IBOutlet  UISlider *progressSlider;
@property (strong, nonatomic) NSString *TAG;
- (IBAction)buttonPressed:(id)sender;
- (void)spinButton;
- (void)updateProgress:(NSTimer *)aNotification;
- (IBAction)sliderMoved:(UISlider *)aSlider;

- (IBAction)viewCommentsButton:(id)sender;

- (IBAction)NextBtnPressed:(id)sender;
- (IBAction)PreviousBtnPressed:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *LOGINVIEW;
@property (strong, nonatomic) IBOutlet UIView *PlaylistView;
-(IBAction)chat:(id)sender;
- (IBAction)merchandise:(id)sender;
-(IBAction)toRelApp:(id)sender;
- (IBAction)myProfile:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *titleMusic;
@property (nonatomic) int currentSong;
@property (nonatomic) int TotalData;

@end

