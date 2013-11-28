//
//  Music.h
//  YJHD
//
//  Created by Akshay Band on 08/04/13.
//  Copyright (c) 2013 SKI USA 35. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalClass.h"
#import "Reachability.h"

@class AudioStreamer;

@interface Music : UIViewController

{
    
    NSString* data1[1000];
	NSString* data2[1000];
	NSString* data3[1000];
	
	NSString* data4[1000];
	
	NSString* data5[1000];
	int	TotalData;
    NSString    *song;
	IBOutlet UIButton *button;
    AudioStreamer *streamer;
	//NSTimer *progressUpdateTimer;
	NSString *currentImageName;

}

- (IBAction)buttonPressed:(id)sender;

@end
