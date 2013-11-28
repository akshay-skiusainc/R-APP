//
//  LeftViewController.h
//  Relapp
//
//  Created by Akshay on 8/2/13.
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

#import "R_Home_5.h"
#import "iPhone5ShortScenesVC.h"
#import "R_FeedsVC_5.h"

#import "R_iPhone5Settings.h"
#import "R_iphone5ContestViewController.h"

@interface LeftViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIScrollView *Scroller;
@property (weak, nonatomic) IBOutlet UIView *VIEW1;

-(IBAction)explore:(id)sender;
-(IBAction)Synopsis:(id)sender;
-(IBAction)news:(id)sender;
-(IBAction)Video:(id)sender;
-(IBAction)download:(id)sender;
-(IBAction)songs:(id)sender;
-(IBAction)behindScene:(id)sender;
-(IBAction)merchandise:(id)sender;
-(IBAction)theaters:(id)sender;
-(IBAction)chat:(id)sender;

-(IBAction)contest:(id)sender;
-(IBAction)settings:(id)sender;
-(IBAction)facebook:(id)sender;
-(IBAction)tweeter:(id)sender;

@property (strong, nonatomic) IBOutlet UIScrollView *Scroller2;
@property (strong, nonatomic) IBOutlet UIView *VIEW2;
-(IBAction)exploreRel:(id)sender;
-(IBAction)downloadRel:(id)sender;
-(IBAction)chatRel:(id)sender;
-(IBAction)filmCatalogue:(id)sender;
-(IBAction)memorableStore:(id)sender;
-(IBAction)tralilers:(id)sender;
-(IBAction)movieSearch:(id)sender;
-(IBAction)shortScenes:(id)sender;

-(IBAction)contestRel:(id)sender;
-(IBAction)settingsRel:(id)sender;
-(IBAction)facebookRel:(id)sender;
-(IBAction)tweeterRel:(id)sender;

@end
