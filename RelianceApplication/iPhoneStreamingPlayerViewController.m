//
//  iPhoneStreamingPlayerViewController.m
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

#import "iPhoneStreamingPlayerViewController.h"
#import "AudioStreamer.h"
#import <QuartzCore/CoreAnimation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <CFNetwork/CFNetwork.h>
#import "iphone5GroupViewController.h"
#import "Merchandise.h"
@implementation iPhoneStreamingPlayerViewController
@synthesize Scroller,titleMusic,LOGINVIEW,progressSlider;
@synthesize PlaylistView,downloadSourceField;
@synthesize currentSong;
//
// setButtonImageNamed:
//
// Used to change the image on the playbutton. This method exists for
// the purpose of inter-thread invocation because
// the observeValueForKeyPath:ofObject:change:context: method is invoked
// from secondary threads and UI updates are only permitted on the main thread.
//
// Parameters:
//    imageNamed - the name of the image to set on the play button.
//
- (void)setButtonImageNamed:(NSString *)imageName
{
	if (!imageName)
	{
		imageName = @"playButton.png";
	}
	[currentImageName autorelease];
	currentImageName = [imageName retain];
	
	UIImage *image = [UIImage imageNamed:imageName];
	
	[button.layer removeAllAnimations];
	[button setImage:image forState:0];
    
	if ([imageName isEqual:@"loadingbutton.png"])
	{
		[self spinButton];
	}
}

//
// destroyStreamer
//
// Removes the streamer, the UI update timer and the change notification
//
- (void)destroyStreamer
{
	if (streamer)
	{
		[[NSNotificationCenter defaultCenter]
         removeObserver:self
         name:ASStatusChangedNotification
         object:streamer];
		[progressUpdateTimer invalidate];
		progressUpdateTimer = nil;
		
		[streamer stop];
        
		streamer = nil;
	}
}

//
// createStreamer
//
// Creates or recreates the AudioStreamer object.
//
- (void)createStreamer
{
	if (streamer)
	{
		return;
	}
    
	[self destroyStreamer];
	
	NSString *escapedValue =
    [(NSString *)CFURLCreateStringByAddingPercentEscapes(
                                                         nil,
                                                         (CFStringRef)downloadSourceField.text,
                                                         NULL,
                                                         NULL,
                                                         kCFStringEncodingUTF8)
     autorelease];
    
	NSURL *url = [NSURL URLWithString:escapedValue];
	streamer = [[AudioStreamer alloc] initWithURL:url];
	
	progressUpdateTimer =
    [NSTimer
     scheduledTimerWithTimeInterval:0.1
     target:self
     selector:@selector(updateProgress:)
     userInfo:nil
     repeats:YES];
	[[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(playbackStateChanged:)
     name:ASStatusChangedNotification
     object:streamer];
}

//
// viewDidLoad
//
// Creates the volume slider, sets the default path for the local file and
// creates the streamer immediately if we already have a file at the local
// location.
//
- (void)viewDidLoad
{
	[super viewDidLoad];
    PlaylistView.alpha=0.0;
	
	[self setButtonImageNamed:@"playbutton.png"];
    GlobalClass *obj=[GlobalClass getInstance];
   
     _footerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"footer_bg.png"]];
   // self.navigationItem.title=@"Songs";
    NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"app_bg_image"];
    UIImage* app_bg_image = [UIImage imageWithData:imageData];
    self.view.backgroundColor = [UIColor colorWithPatternImage:app_bg_image];

	
	[self getdata];
    [self loadCollection];
    
    if (obj.music ==nil) {
        
        UIAlertView* logoutalertbox = [[ UIAlertView alloc]initWithTitle:@"Network Fail" message:@"Network Not Connected" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Retry", nil ];
        logoutalertbox.delegate=self;
        logoutalertbox.tag=1;
        [logoutalertbox show];
        
    }
    else
    {
        
        
//        [self performSelector:@selector(buttonPressed1:) withObject:nil afterDelay:0.0];
//      //
//    	[self performSelector:@selector(buttonPressed1:) withObject:nil afterDelay:1.0];
        
        titleMusic.text= data1[0];
        downloadSourceField.text=data2[0];
        currentSong=0;
    }
    
//    UIImage *relAppImage = [UIImage imageNamed:@"home_right_rel_icon.png"];
//    UIButton *buttonChat = [UIButton buttonWithType:UIButtonTypeCustom];
//    [buttonChat setImage:relAppImage forState:UIControlStateNormal];
//    buttonChat.frame = CGRectMake(0, 0, relAppImage.size.width, relAppImage.size.height);
//    [buttonChat addTarget:self action:@selector(toRelApp:) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *customBarItem1 = [[UIBarButtonItem alloc] initWithCustomView:buttonChat];
//    self.navigationItem.RightBarButtonItem = customBarItem1;
   
    if([_TAG isEqual: @"LEFT"])
    {
        
    }
    else
    {
        UIImage *buttonImage = [UIImage imageNamed:@"back-btn.png"];
        UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [button1 setImage:buttonImage forState:UIControlStateNormal];
        button1.frame = CGRectMake(0, 0, buttonImage.size.width, buttonImage.size.height);
        [button1 addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] initWithCustomView:button1];
        self.navigationItem.leftBarButtonItem = customBarItem;
        
    }

}

- (IBAction)merchandise:(id)sender
{
      Merchandise *merchandise = [[Merchandise alloc]initWithNibName:@"Merchandise" bundle:nil];
     [self.navigationController pushViewController:merchandise animated:YES];
   
}
- (IBAction)chat:(id)sender
{
      iphone5GroupViewController *group = [[iphone5GroupViewController alloc]initWithNibName:@"iphone5GroupViewController" bundle:nil];
      [self.navigationController pushViewController:group animated:YES];
       
}
-(IBAction)toRelApp:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Under construction" message:@"Check Back Soon" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    
}

- (IBAction)myProfile:(id)sender
{
    iphone5Settings *setting = [[iphone5Settings alloc]initWithNibName:@"iphone5Settings" bundle:nil];
    [self.navigationController pushViewController:setting animated:YES];
    
}

//Anish

- (void)loadCollection
{
    
	vw_CollectionView					= [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 280)];
	vw_CollectionView.alpha				= 1.0;
	[self.view addSubview:vw_CollectionView];
	
	ic_CoverFlow								= [[iCarousel alloc] initWithFrame:CGRectMake(0, 0, 320, 274)];
	ic_CoverFlow.delegate						= self;
	ic_CoverFlow.dataSource						= self;
	ic_CoverFlow.type							= iCarouselTypeCoverFlow;
	[vw_CollectionView addSubview:ic_CoverFlow];
     [self->ic_CoverFlow scrollToItemAtIndex:1 animated:YES];
}
#pragma mark Carousel Functions
- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return TotalData;
}

- (BOOL)carouselShouldWrap:(iCarousel *)carousel
{
    //wrap all carousels
    return YES;
}


- (CGFloat)carouselItemWidth:(iCarousel *)carousel
{
    //usually this should be slightly wider than the item views
    return 240;
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    if (view == nil)
    {
        view = [[AsyncImageView alloc] initWithFrame:CGRectMake(0, 0, 180.0f, 200.0f)];
        
        view.contentMode = UIViewContentModeScaleAspectFit;
    }
     view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];
    //cancel any previously loading images for this view
    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:view];
    
    //set image URL. AsyncImageView class will then dynamically load the image
    NSURL *url = [NSURL URLWithString:data4[index]];
    
    ((AsyncImageView *)view).imageURL =url;
    
    return view;
    
}



- (void)carousel:(iCarousel *)_carousel didSelectItemAtIndex:(NSInteger)index
{
    currentSong=index;
    NSString *songNum=[NSString stringWithFormat:@"%d",index];
    //    [self performSelector:@selector(changeSong1:) withObject:nil afterDelay:0.0];
    [self changeSong1:songNum];
    //	n_CollectionID = index;
    //	[self viewTransitions:7];
}

- (void)carouselDidEndScrollingAnimation:(iCarousel *)aCarousel
{
    [titleMusic setText:[NSString stringWithFormat:@"%@", data1[aCarousel.currentItemIndex]]];
}
//Anish*/

-(void)back {
	
	[self.navigationController popViewControllerAnimated:YES];
    
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    [button setBackgroundImage:[UIImage imageNamed:@"play-btn.png"] forState:UIControlStateNormal];
	[self destroyStreamer];
	if (progressUpdateTimer)
	{
		[progressUpdateTimer invalidate];
		progressUpdateTimer = nil;
	}
    
    
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    vw_CollectionView.alpha=1.0;
    PlaylistView.alpha=0.0;
    PlaylistView.userInteractionEnabled=NO;
    NSLog(@"touchesBegan");
    UITouch *touch = (UITouch *)[touches anyObject];
    start = [touch locationInView:self.view].y;
    
    NSLog(@"start = %f",start);
    if(start < 480 && _footerMainView.center.y > 480)//touch was not in upper area of view AND pulldownView not visible
    {
        start = -1; //start is a CGFloat member of this view
    }
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesMoved");
    if(start < 0)
    {
        return;
    }
    UITouch *touch = (UITouch *)[touches anyObject];
    CGFloat now = [touch locationInView:self.view].y;
    CGFloat diff = now - start;
    directionUp = diff > 0;//directionUp is a BOOL member of this view
    //    float nuCenterY = footerMainView.center.y + diff;
    //    footerMainView.center = CGPointMake(footerMainView.center.x, nuCenterY);
    start = now;
}


-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    if (directionUp)
    {
        NSLog(@"touchesEnded    ----    directionUp");
        //animate pulldownView out of visibel area
        [UIView animateWithDuration:.3 animations:^{_footerMainView.center = CGPointMake(320/2, 524);}];
    }
    else if(start>=0)
    {
        NSLog(@"touchesEnded    ----    start");
        //animate pulldownView with top to mainviews top
        [UIView animateWithDuration:.3 animations:^{_footerMainView.center = CGPointMake(320/2, 468);}];
    }
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:YES];
    
       // [self performSelector:@selector(openFooter1:) withObject:nil afterDelay:0.01 ];
    _footerMainView.frame = CGRectMake(0, 487, _footerMainView.frame.size.width, _footerMainView.frame.size.height);
}
-(void)getdata
{
	GlobalClass *obj=[GlobalClass getInstance];
	NSLog(@"ddata=%@",obj.music);
	
	int i=0;
	for (NSDictionary *actoAgent in obj.music)
	{
		data1[i]= [actoAgent objectForKey:@"title"];
		NSLog(@"title=%@",data1[i]);
		
		data2[i]= [actoAgent objectForKey:@"music_link"];
		NSLog(@"music_link=%@",data2[i]);
        
        data3[i]= [actoAgent objectForKey:@"music_id"];
		NSLog(@"music_id=%@",data3[i]);
        
        data4[i]= [actoAgent objectForKey:@"image"];
		NSLog(@"image=%@",data4[i]);
        
		sendsong =data3[i];
		downloadSourceField.text= data2[i];
        
        
		
        //		data3[i]= [actoAgent objectForKey:@"status"];
        //		NSLog(@"status=%@",data3[i]);
		
		
		//		data4[i]= [actoAgent objectForKey:@"image"];
		//		NSLog(@"str=%@",data4[i]);
		
		
		i++;
	}
	
	TotalData=i;
    
    [self Display];
}

-(void)Display
{
    int m=0;
	NSLog(@"hi");
	for (int i =0; i<TotalData; i++) {
		
		//		img[i] = [UIImage imageNamed:[NSString stringWithFormat:@"song-normal_%d.png",i+1]];
		//		img[i] = [UIImage imageNamed:[NSString stringWithFormat:@"song-normal_%d.png",i+1]];
		
		btn[i]					= [UIButton buttonWithType:UIButtonTypeCustom];
		btn[i].frame				= CGRectMake(0,m,235,38);
		btn[i].tag=i;
         [btn[i] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
		[btn[i] setTitle:data1[i] forState:UIControlStateNormal];
        btn[i].contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
		[btn[i] setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"song_title_bg.png"]] forState:UIControlStateNormal];
		[btn[i] setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"song_title_bg_yellow_mdl.png"]] forState:UIControlStateHighlighted];
		
		[btn[i] addTarget:self action:@selector(changeSong:) forControlEvents:UIControlEventTouchUpInside];
		[Scroller addSubview:btn[i]];
		
		
		
		m+=38;
	}
	Scroller.contentSize = CGSizeMake(237,38*TotalData);
	
	
	
	[progressSlider setMinimumTrackImage:[UIImage imageNamed:@"song_progress_bar_dark.png"] forState:UIControlStateNormal];
	[progressSlider setMaximumTrackImage:[UIImage imageNamed:@"song_progress_bar_white.png"] forState:UIControlStateNormal];
	[progressSlider setThumbImage:[UIImage imageNamed:@"songs-play-move-icon.png"] forState:UIControlStateNormal];
    
	
    
}

-(IBAction)PlayListTapped:(id)sender
{
	if (PlaylistView.alpha==0.0) {
       // vw_CollectionView.alpha=0.0;
		PlaylistView.alpha=1.0;
		//self.PlaylistView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"songs-plalist-streap.png"]];
        
		NSLog(@"play");
        PlaylistView.userInteractionEnabled=YES;
        //        [UIView beginAnimations:@"Animate Text Field Up" context:nil];
        //        [UIView setAnimationDuration:.3];
        //        [UIView setAnimationBeginsFromCurrentState:YES];
        //
        //        LOGINVIEW.frame = CGRectMake(LOGINVIEW.frame.origin.x,
        //                                     369,
        //                                     LOGINVIEW.frame.size.width,
        //                                     LOGINVIEW.frame.size.height);
        //
        //        [UIView commitAnimations];
        //
        //        [commenttext resignFirstResponder];
        
        
	}
	
	else
	{
      //  vw_CollectionView.alpha=1.0;
		PlaylistView.alpha=0.0;
		PlaylistView.userInteractionEnabled=NO;
        
	}
	
    
    
}

//
// spinButton
//
// Shows the spin button when the audio is loading. This is largely irrelevant
// now that the audio is loaded from a local file.
//
- (IBAction)NextBtnPressed:(id)sender

{
    
    
    
    currentSong=currentSong+1;
    
    NSLog(@"NextBtnPressed Total Data %d",TotalData);
    
    NSLog(@"NextBtnPressed  **** currentSong **** Data %d",currentSong);
    
    
    
    if (currentSong<TotalData) {
        
        [ic_CoverFlow scrollToItemAtIndex:currentSong animated:YES];
        
        titleMusic.text=[NSString stringWithFormat:@"%@",data1[currentSong]];
        
        
        
        [self performSelector:@selector(buttonPressed:) withObject:nil afterDelay:0.0];
        
        [self destroyStreamer];
        
        
        
        NSLog(@"tag=%d",[sender tag]);
        
        
        
        
        
        
        
        
        
        
        
        [btn[currentSong] setBackgroundImage:[UIImage imageNamed:@"song_title_bg_yellow_mdl.png"] forState:UIControlStateHighlighted];
        
        for (int j=0; j<TotalData; j++) {
            
            
            
            if (j!=currentSong) {
                
                [btn[currentSong] setBackgroundImage:[UIImage imageNamed:@"song_title_bg.png"] forState:UIControlStateNormal];
                
                
                
            }
            
            
            
        }
        
        
        
        
        
        if (currentSong == 0) {
            
            titleMusic.text= data1[0];
            
            downloadSourceField.text=data2[0];
            
            sendsong=data3[0];
            
            NSLog(@"send song=%@",sendsong);
            
            
            
        }
        
        
        
        if (currentSong == 1) {
            
            titleMusic.text= data1[1];
            
            downloadSourceField.text=data2[1];
            
            sendsong=data3[1];
            
            
            
            
            
        }
        
        
        
        if (currentSong == 2) {
            
            titleMusic.text= data1[2];
            
            downloadSourceField.text=data2[2];
            
            sendsong=data3[2];
            
            
            
            
            
            
            
        }
        
        if (currentSong == 3) {
            
            titleMusic.text= data1[3];
            
            downloadSourceField.text=data2[3];
            
            sendsong=data3[3];
            
            
            
            
            
        }
        
        if (currentSong == 5) {
            
            titleMusic.text= data1[5];
            
            downloadSourceField.text=data2[5];
            
            sendsong=data3[5];
            
            
            
        }
        
        if (currentSong == 6) {
            
            titleMusic.text= data1[6];
            
            downloadSourceField.text=data2[6];
            
            sendsong=data3[6];
            
            
            
            
            
        }
        
        if (currentSong == 4) {
            
            titleMusic.text= data1[4];
            
            downloadSourceField.text=data2[4];
            
            sendsong=data3[4];
            
            
            
            
            
        }
        
        
        
        if (currentSong == 7) {
            
            titleMusic.text= data1[7];
            
            downloadSourceField.text=data2[7];
            
            sendsong=data3[7];
            
            
            
        }
        
        NSLog(@"SONGS=%@",downloadSourceField.text);
        
        [self performSelector:@selector(buttonPressed1:) withObject:nil afterDelay:0.0];
        
        //[self performSelector:@selector(buttonPressed:) withObject:nil afterDelay:0.0];
        
    }
    
    
    
    else
        
    {
        
        currentSong=currentSong-1;//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
        
        //        currentSong=0;
        
        //        titleMusic.text= data1[0];
        
        //        downloadSourceField.text=data2[0];
        
        //        sendsong=data3[0];
        
        //        NSLog(@"send song=%@",sendsong);
        
        
        
        [ic_CoverFlow scrollToItemAtIndex:currentSong animated:YES];
        
        titleMusic.text=[NSString stringWithFormat:@"%@",data1[currentSong]];
        
        
        
        
        
        UIAlertView* logoutalertbox = [[ UIAlertView alloc]initWithTitle:@"Alert" message:@"End of playlist" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil ];
        
        // logoutalertbox.tag=5;
        
        logoutalertbox.delegate=self;
        
        [logoutalertbox show];
        
    }
    
    
    
    
    
    
    
}

- (IBAction)PreviousBtnPressed:(id)sender

{
    
    currentSong=currentSong-1;
    
    NSLog(@"PreviousBtnPressed Total **** Data %d",TotalData);
    
    NSLog(@"PreviousBtnPressed currentSong **** Data %d",currentSong);
    
    if (currentSong>=0) {
        
        
        
        [ic_CoverFlow scrollToItemAtIndex:currentSong animated:YES];
        
        titleMusic.text=[NSString stringWithFormat:@"%@",data1[currentSong]];
        
        [self performSelector:@selector(buttonPressed:) withObject:nil afterDelay:0.0];
        
        [self destroyStreamer];
        
        
        
        NSLog(@"tag=%d",[sender tag]);
        
        
        
        [btn[currentSong] setBackgroundImage:[UIImage imageNamed:@"song_title_bg_yellow_mdl.png"] forState:UIControlStateHighlighted];
        
        for (int j=0; j<TotalData; j++) {
            
            
            
            if (j!=currentSong) {
                
                [btn[currentSong] setBackgroundImage:[UIImage imageNamed:@"song_title_bg.png"] forState:UIControlStateNormal];
                
                
                
            }
            
            
            
        }
        
        
        
        
        
        if (currentSong == 0) {
            
            titleMusic.text= data1[0];
            
            downloadSourceField.text=data2[0];
            
            sendsong=data3[0];
            
            NSLog(@"send song=%@",sendsong);
            
            
            
        }
        
        
        
        if (currentSong == 1) {
            
            titleMusic.text= data1[1];
            
            downloadSourceField.text=data2[1];
            
            sendsong=data3[1];
            
            
            
            
            
        }
        
        
        
        if (currentSong == 2) {
            
            titleMusic.text= data1[2];
            
            downloadSourceField.text=data2[2];
            
            sendsong=data3[2];
            
            
            
            
            
            
            
        }
        
        if (currentSong == 3) {
            
            titleMusic.text= data1[3];
            
            downloadSourceField.text=data2[3];
            
            sendsong=data3[3];
            
            
            
            
            
        }
        
        if (currentSong == 5) {
            
            titleMusic.text= data1[5];
            
            downloadSourceField.text=data2[5];
            
            sendsong=data3[5];
            
            
            
        }
        
        if (currentSong == 6) {
            
            titleMusic.text= data1[6];
            
            downloadSourceField.text=data2[6];
            
            sendsong=data3[6];
            
            
            
            
            
        }
        
        if (currentSong == 4) {
            
            titleMusic.text= data1[4];
            
            downloadSourceField.text=data2[4];
            
            sendsong=data3[4];
            
            
            
            
            
        }
        
        
        
        else if (currentSong == 7) {
            
            titleMusic.text= data1[7];
            
            downloadSourceField.text=data2[7];
            
            sendsong=data3[7];
            
            
            
        }
        
        NSLog(@"SONGS=%@",downloadSourceField.text);
        
        [self performSelector:@selector(buttonPressed1:) withObject:nil afterDelay:0.0];
        
        //[self performSelector:@selector(buttonPressed:) withObject:nil afterDelay:0.0];
        
    }
    
    
    
    else
        
    {
        
        currentSong=currentSong+1;
        
        
        
        [ic_CoverFlow scrollToItemAtIndex:currentSong animated:YES];
        
        titleMusic.text=[NSString stringWithFormat:@"%@",data1[currentSong]];
        
        titleMusic.text= data1[currentSong];
        
        downloadSourceField.text=data2[currentSong];
        
        sendsong=data3[currentSong];
        
        NSLog(@"send song=%@",sendsong);
        
        
        
        UIAlertView* logoutalertbox = [[ UIAlertView alloc]initWithTitle:@"Alert" message:@"Begining of playlist" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil ];
        
        // logoutalertbox.tag=5;
        
        logoutalertbox.delegate=self;
        
        [logoutalertbox show];
        
        
        
    }
    
}



- (void)dealloc

{
    
    [self destroyStreamer];
    
//    if (progressUpdateTimer)
//        
//    {
//        
//        [progressUpdateTimer invalidate];
//        
//        progressUpdateTimer = nil;
//        
//    }
    
//    [super dealloc];
    
}

-(void)changeSong:(UIButton *)sender
{
	[self performSelector:@selector(buttonPressed:) withObject:nil afterDelay:0.0];
	[self destroyStreamer];
	
	NSLog(@"tag=%d",[sender tag]);
	
	
	
	currentSong=[sender tag];
    
 	[btn[currentSong] setBackgroundImage:[UIImage imageNamed:@"song_title_bg_yellow_mdl.png"] forState:UIControlStateHighlighted];
	for (int j=0; j<TotalData; j++) {
		
		if (j!=currentSong) {
			[btn[currentSong] setBackgroundImage:[UIImage imageNamed:@"song_title_bg.png"] forState:UIControlStateNormal];
			
		}
		
	}
	
	
	if (currentSong == 0) {
		titleMusic.text= data1[0];
		downloadSourceField.text=data2[0];
		sendsong=data3[0];
		NSLog(@"send song=%@",sendsong);
		
	}
	
	 if (currentSong == 1) {
		titleMusic.text= data1[1];
		downloadSourceField.text=data2[1];
		sendsong=data3[1];
        
		
	}
	
	 if (currentSong == 2) {
		titleMusic.text= data1[2];
		downloadSourceField.text=data2[2];
		sendsong=data3[2];
        
		
		
	}
	 if (currentSong == 3) {
		titleMusic.text= data1[3];
		downloadSourceField.text=data2[3];
		sendsong=data3[3];
        
		
	}
	 if (currentSong == 5) {
		titleMusic.text= data1[5];
		downloadSourceField.text=data2[5];
		sendsong=data3[5];
        
	}
	 if (currentSong == 6) {
		titleMusic.text= data1[6];
		downloadSourceField.text=data2[6];
		sendsong=data3[6];
        
		
	}
	 if (currentSong == 4) {
		titleMusic.text= data1[4];
		downloadSourceField.text=data2[4];
		sendsong=data3[4];
        
		
	}
	
	 if (currentSong == 7) {
		titleMusic.text= data1[7];
		downloadSourceField.text=data2[7];
		sendsong=data3[7];
        
	}
	
	NSLog(@"SONGS=%@",downloadSourceField.text);
	[self performSelector:@selector(buttonPressed1:) withObject:nil afterDelay:0.0];
	//[self performSelector:@selector(buttonPressed:) withObject:nil afterDelay:0.0];
    
	[self performSelector:@selector(PlayListTapped:) withObject:nil afterDelay:0.0];
    
	[ic_CoverFlow scrollToItemAtIndex:currentSong animated:YES];
    titleMusic.text=[NSString stringWithFormat:@"%@",data1[currentSong]];
}


-(void)changeSong1:(NSString *)songNum
{
	[self performSelector:@selector(buttonPressed:) withObject:nil afterDelay:0.0];
	[self destroyStreamer];
	
	NSLog(@"tag=%@",songNum);
	
	
	
	currentSong=[[NSString stringWithFormat:@"%@",songNum]integerValue];
    
    
 	[btn[currentSong] setBackgroundImage:[UIImage imageNamed:@"song_title_bg_yellow_mdl.png"] forState:UIControlStateHighlighted];
	for (int j=0; j<TotalData; j++) {
		
		if (j!=currentSong) {
			[btn[currentSong] setBackgroundImage:[UIImage imageNamed:@"song_title_bg.png"] forState:UIControlStateNormal];
			
		}
		
	}
	
	
	if (currentSong == 0) {
		titleMusic.text= data1[0];
		downloadSourceField.text=data2[0];
		sendsong=data3[0];
		NSLog(@"send song=%@",sendsong);
		
	}
	
	 if (currentSong == 1) {
		titleMusic.text= data1[1];
		downloadSourceField.text=data2[1];
		sendsong=data3[1];
        
		
	}
	
	 if (currentSong == 2) {
		titleMusic.text= data1[2];
		downloadSourceField.text=data2[2];
		sendsong=data3[2];
        
		
		
	}
	 if (currentSong == 3) {
		titleMusic.text= data1[3];
		downloadSourceField.text=data2[3];
		sendsong=data3[3];
        
		
	}
	 if (currentSong == 5) {
		titleMusic.text= data1[5];
		downloadSourceField.text=data2[5];
		sendsong=data3[5];
        
	}
	 if (currentSong == 6) {
		titleMusic.text= data1[6];
		downloadSourceField.text=data2[6];
		sendsong=data3[6];
        
		
	}
	 if (currentSong == 4) {
		titleMusic.text= data1[4];
		downloadSourceField.text=data2[4];
		sendsong=data3[4];
        
		
	}
	
	 if (currentSong == 7) {
		titleMusic.text= data1[7];
		downloadSourceField.text=data2[7];
		sendsong=data3[7];
        
	}
	
	NSLog(@"SONGS=%@",downloadSourceField.text);
	[self performSelector:@selector(buttonPressed1:) withObject:nil afterDelay:0.0];
	[self performSelector:@selector(buttonPressed:) withObject:nil afterDelay:0.0];
    
	//[self performSelector:@selector(PlayListTapped:) withObject:nil afterDelay:0.0];
    
	[ic_CoverFlow scrollToItemAtIndex:currentSong animated:YES];
    titleMusic.text=[NSString stringWithFormat:@"%@",data1[currentSong]];
}




- (void)spinButton
{
	[CATransaction begin];
	[CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
	CGRect frame = [button frame];
	button.layer.anchorPoint = CGPointMake(0.5, 0.5);
	button.layer.position = CGPointMake(frame.origin.x + 0.5 * frame.size.width, frame.origin.y + 0.5 * frame.size.height);
	[CATransaction commit];
    
	[CATransaction begin];
	[CATransaction setValue:(id)kCFBooleanFalse forKey:kCATransactionDisableActions];
	[CATransaction setValue:[NSNumber numberWithFloat:2.0] forKey:kCATransactionAnimationDuration];
    
	CABasicAnimation *animation;
	animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
	animation.fromValue = [NSNumber numberWithFloat:0.0];
	animation.toValue = [NSNumber numberWithFloat:2 * M_PI];
	animation.timingFunction = [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionLinear];
	animation.delegate = self;
	[button.layer addAnimation:animation forKey:@"rotationAnimation"];
    
	[CATransaction commit];
}

//
// animationDidStop:finished:
//
// Restarts the spin animation on the button when it ends. Again, this is
// largely irrelevant now that the audio is loaded from a local file.
//
// Parameters:
//    theAnimation - the animation that rotated the button.
//    finished - is the animation finised?
//
- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)finished
{
	if (finished)
	{
		[self spinButton];
	}
}

//
// buttonPressed:
//
// Handles the play/stop button. Creates, observes and starts the
// audio streamer when it is a play button. Stops the audio streamer when
// it isn't.
//
// Parameters:
//    sender - normally, the play/stop button.
//
- (IBAction)buttonPressed:(id)sender
{
	
	NSLog(@"BUTTONDABBA2222");
	if ([currentImageName isEqual:@"playbutton.png"])
	{
		[downloadSourceField resignFirstResponder];
		
		[self createStreamer];
		[self setButtonImageNamed:@"loadingbutton.png"];
		[streamer start];
	}
	else
	{
		[streamer stop];
		[self setButtonImageNamed:@"playbutton.png"];
        
	}
}

- (void)buttonPressed1:(id)sender
{
	
	NSLog(@"BUTTONDABBA111111");
	if ([currentImageName isEqual:@"playbutton.png"])
	{
		[downloadSourceField resignFirstResponder];
		
		[self createStreamer];
		[self setButtonImageNamed:@"loadingbutton.png"];
		[streamer start];
	}
	else
	{
		[streamer stop];
		[self setButtonImageNamed:@"playbutton.png"];
		
	}
}


//
// sliderMoved:
//
// Invoked when the user moves the slider
//
// Parameters:
//    aSlider - the slider (assumed to be the progress slider)
//
- (IBAction)sliderMoved:(UISlider *)aSlider
{
	if (streamer.duration)
	{
		double newSeekTime = (aSlider.value / 100.0) * streamer.duration;
		[streamer seekToTime:newSeekTime];
	}
}

- (void)playbackStateChanged:(NSNotification *)aNotification
{
	if ([streamer isWaiting])
	{
		[self setButtonImageNamed:@"loadingbutton.png"];
	}
	else if ([streamer isPlaying])
	{
		[self setButtonImageNamed:@"stopbutton.png"];
	}
	else if ([streamer isIdle])
	{
		[self destroyStreamer];
		[self setButtonImageNamed:@"playbutton.png"];
	}
}

//
// updateProgress:
//
// Invoked when the AudioStreamer
// reports that its playback progress has changed.
//
- (void)updateProgress:(NSTimer *)updatedTimer
{
	if (streamer.bitRate != 0.0)
	{
		double progress = streamer.progress;
		double duration = streamer.duration;
		
		if (duration > 0)
		{
			[positionLabel setText:
             [NSString stringWithFormat:@"%.2f                                                          %.2f",
              progress/60,
              duration/60]];
			[progressSlider setEnabled:YES];
			[progressSlider setValue:100 * progress / duration];
            
//            [positionLabel setText:
//             [NSString stringWithFormat:@"%.1f                                                  %.1f seconds",
//              progress,
//              duration]];
//			[progressSlider setEnabled:YES];
//			[progressSlider setValue:100 * progress / duration];
            
		}
		else
		{
			[progressSlider setEnabled:NO];
		}
	}
	else
	{
		positionLabel.text = @"Time Played:";
	}
}



@end
