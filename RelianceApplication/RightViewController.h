//
//  RightViewController.h
//  RelianceApplication
//
//  Created by Akshay Jain on 9/19/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeController.h"
#import "DDMenuController.h"
#import "SynopsisViewController.h"
#import "iphone5Video.h"
#import "ContestViewController.h"
#import "MainWallpapers.h"
#import "BehindTheScene.h"
#import "iphone5CastNCrew.h"
#import "iPhone5Daabang2SecondViewController.h"
#import "iphone5TwitterfeedsViewController.h"
#import "iPhone5FacebookViewController.h"
#import "Merchandise.h"
#import "iphone5GroupViewController.h"
#import "NewsViewController.h"
#import "iPhone5Daabang2SecondViewController.h"
#import "iphone5Settings.h"
#import "ContestViewController.h"
#import "Merchandise.h"
#import "iPhoneStreamingPlayerViewController.h"
#import "iphone5Synopsis.h"
#import "iphone5Notification.h"
#import "iphone5Settings.h"
#import "R_iPhone5Settings.h"
@interface RightViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *SONG_BTN;

@property (strong, nonatomic) IBOutlet UIScrollView *Scroller;
@property (weak, nonatomic) IBOutlet UIView *VIEW1;
@property (weak, nonatomic) IBOutlet UIButton *logo;
@property (weak, nonatomic) IBOutlet UIButton *merchandise_btn;
@property (weak, nonatomic) IBOutlet UIButton *chat_btn;
@property (weak, nonatomic) IBOutlet UIButton *profile_btn;

-(IBAction)merchandise:(id)sender;
-(IBAction)chat:(id)sender;
-(IBAction)settings:(id)sender;
-(IBAction)toRelApp:(UIButton *)sender;
@end
