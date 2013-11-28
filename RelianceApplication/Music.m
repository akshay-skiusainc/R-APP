//
//  Music.m
//  YJHD
//
//  Created by Akshay Band on 08/04/13.
//  Copyright (c) 2013 SKI USA 35. All rights reserved.
//

#import "Music.h"
#import "AudioStreamer.h"
#import <QuartzCore/CoreAnimation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <CFNetwork/CFNetwork.h>

@interface Music ()

@end

@implementation Music
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setButtonImageNamed:@"playbutton.png"];
    
    song=  [NSString stringWithFormat:@"http://commondatastorage.googleapis.com/dabangg/Dabangg 2 = Saanson Ne (Male).mp3"];


   // self.trackedViewName=@"Songs Screen";
    
	
//	downloadSourceField= [NSString stringWithFormat:@"http://songs.mp3khan.com/music/indian_movies/Dabangg 2 (2012)/03 - Dabangg 2 - Fevicol Se [MP3Khan.Com].mp3"];
	[self setButtonImageNamed:@"playbutton.png"];
	
    GlobalClass *obj1=[GlobalClass getInstance];
    //obj.coming = @"1";
    
    self.navigationItem.title=@"Songs";
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"song_bg.png"]];
    
    if ([obj1.coming isEqualToString:@"1"])
    {
        
        if ([self.navigationController.navigationBar respondsToSelector:@selector( setBackgroundImage:forBarMetrics:)])
        {
			[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"header_bar.png"] forBarMetrics:UIBarMetricsDefault];
            
	    }
    }
	else {
        if ([self.navigationController.navigationBar respondsToSelector:@selector( setBackgroundImage:forBarMetrics:)]){
			[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bar_clean.png"] forBarMetrics:UIBarMetricsDefault];
        }
        
        UIImage *buttonImage = [UIImage imageNamed:@"c&c_top_back_btn.png"];
        UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [button1 setImage:buttonImage forState:UIControlStateNormal];
        button1.frame = CGRectMake(0, 0, buttonImage.size.width, buttonImage.size.height);
        [button1 addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] initWithCustomView:button1];
        self.navigationItem.leftBarButtonItem = customBarItem;
        
    }
	obj1.coming=@"2";

    // Do any additional setup after loading the view from its nib.
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
		
		
        //		data3[i]= [actoAgent objectForKey:@"status"];
        //		NSLog(@"status=%@",data3[i]);
		
		
		//		data4[i]= [actoAgent objectForKey:@"image"];
		//		NSLog(@"str=%@",data4[i]);
		
		
		i++;
	}
	TotalData=i;
	
}


- (void)setButtonImageNamed:(NSString *)imageName
{
	if (!imageName)
	{
		imageName = @"playButton";
	}
	[currentImageName autorelease];
	currentImageName = [imageName retain];
	
	UIImage *image = [UIImage imageNamed:imageName];
	
	[button.layer removeAllAnimations];
	[button setImage:image forState:0];
    
	if ([imageName isEqual:@"loadingbutton.png"])
	{
		//[self spinButton];
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
//		[progressUpdateTimer invalidate];
//		progressUpdateTimer = nil;
		
		[streamer stop];
		[streamer release];
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
                                                         (CFStringRef)song,
                                                         NULL,
                                                         NULL,
                                                         kCFStringEncodingUTF8)
     autorelease];
    
	NSURL *url = [NSURL URLWithString:escapedValue];
	streamer = [[AudioStreamer alloc] initWithURL:url];
	
//	progressUpdateTimer =
//    [NSTimer
//     scheduledTimerWithTimeInterval:0.1
//     target:self
//     selector:@selector(updateProgress:)
//     userInfo:nil
//     repeats:YES];
//	[[NSNotificationCenter defaultCenter]
//     addObserver:self
//     selector:@selector(playbackStateChanged:)
//     name:ASStatusChangedNotification
//     object:streamer];
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
	if ([currentImageName isEqual:@"playbutton.png"])
	{
		//[downloadSourceField resignFirstResponder];
		
		[self createStreamer];
		[self setButtonImageNamed:@"loadingbutton.png"];
		[streamer start];
	}
	else
	{
		[streamer stop];
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


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
