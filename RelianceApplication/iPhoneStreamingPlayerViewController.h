//
//  iPhoneStreamingPlayerViewController.h
//  iPhoneStreamingPlayer
//
//  Created by Matt Gallagher on 28/10/08.
//  Copyright Matt Gallagher 2008. All rights reserved.
//
//  This software is provided 'as-is', without any express or implied
//  warranty. In no event will the authors be held liable for any damages
//  arising from the use of this software. Permission is granted to anyone to
//  use this software for any purpose, including commercial applications, and to
//  alter it and redistribute it freely, subject to the following restrictions:
//
//  1. The origin of this software must not be misrepresented; you must not
//     claim that you wrote the original software. If you use this software
//     in a product, an acknowledgment in the product documentation would be
//     appreciated but is not required.
//  2. Altered source versions must be plainly marked as such, and must not be
//     misrepresented as being the original software.
//  3. This notice may not be removed or altered from any source
//     distribution.
//

#import <UIKit/UIKit.h>
#import "DatabaseClass.h"
#import "Reachability.h"
#import "iCarousel.h"
@class AudioStreamer;

@interface iPhoneStreamingPlayerViewController : DatabaseClass<UIScrollViewDelegate,iCarouselDelegate, iCarouselDataSource>
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


@property (strong, nonatomic) IBOutlet UILabel *titleMusic;
@property (nonatomic) int currentSong;
@property (nonatomic) int TotalData;
-(IBAction)chat:(id)sender;
- (IBAction)merchandise:(id)sender;
-(IBAction)toRelApp:(id)sender;
- (IBAction)myProfile:(id)sender;
@end

