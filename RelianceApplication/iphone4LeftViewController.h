//
//  iphone4LeftViewController.h
//  RelianceApplication
//
//  Created by Ashwini Pawar on 13/08/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDMenuController.h"
#import "GroupViewController.h"
#import "R_MovieSeacrh_4.h"
#import "R_iPhone4Settings.h"
#import "R_iphone4ContestViewController.h"
#import "R_MovieCatalogue_4.h"

@interface iphone4LeftViewController : UIViewController<UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *Scroller;
@property (strong, nonatomic) IBOutlet UIView *VIEW1;
@property (strong, nonatomic) IBOutlet UIScrollView *Scroller2;
@property (strong, nonatomic) IBOutlet UIView *VIEW2;

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
@property (strong, nonatomic) IBOutlet UIView *movieView;
@property (strong, nonatomic) IBOutlet UIView *RelianceView;


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
