//
//  LeftViewController.m
//  Relapp
//
//  Created by Akshay on 8/2/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import "LeftViewController.h"u
#import "NewsViewController.h"
#import "iPhone5Daabang2SecondViewController.h"
#import "iphone5Settings.h"
#import "ContestViewController.h"
#import "Merchandise.h"
#import "iPhoneStreamingPlayerViewController.h"
#import "iphone5Synopsis.h"
#import "iphone5Notification.h"


#import "R_wallpapers_5.h"
#import "R_Trailers_5.h"
#import "R_MovieCatalogue_5.h"
#import "R_MovieSearch_5.h"

@interface LeftViewController ()


@end

@implementation LeftViewController
@synthesize Scroller;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    GlobalClass *obj=[GlobalClass getInstance];

    if ([obj.Leftcheck isEqualToString:@"1"])
    {
        _Scroller2.alpha=1.0;
        Scroller.alpha=0.0;
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"home_bg_548.jpg"]];

    }
    
    else
    {
        _Scroller2.alpha=0.0;
        Scroller.alpha=1.0;
        
        NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"app_bg_image"];
        UIImage* app_bg_image = [UIImage imageWithData:imageData];
        self.view.backgroundColor = [UIColor colorWithPatternImage:app_bg_image];
    }
    


}

-(void)viewWillDisappear:(BOOL)animated
{
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    GlobalClass *obj=[GlobalClass getInstance];   

    if ([obj.Leftcheck isEqualToString:@"1"])
    {
        _Scroller2.alpha=1.0;
        Scroller.alpha=0.0;
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"home_bg_548.jpg"]];

    }
    
    else
    {
        _Scroller2.alpha=0.0;
        Scroller.alpha=1.0;
        
        NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"app_bg_image"];
        UIImage* app_bg_image = [UIImage imageWithData:imageData];
        self.view.backgroundColor = [UIColor colorWithPatternImage:app_bg_image];
    }

    
   
    
  
    _VIEW1.backgroundColor=[UIColor clearColor];
    

    Scroller.contentSize = CGSizeMake(215, 698+10);
    
    _VIEW2.backgroundColor=[UIColor clearColor];
    _Scroller2.contentSize = CGSizeMake(215, 698-107);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)explore:(id)sender
{
    GlobalClass *obj=[GlobalClass getInstance];
    
    obj.coming = @"1";
    
    
    [obj.Mid_added removeAllObjects];
    [obj.QtyOfProducts removeAllObjects];
    obj.Mid_added =nil;
    obj.QtyOfProducts =nil;

    
    DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
    HomeController *controller = [[HomeController alloc] init];
    //controller.title = selectedCountry;
   
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [menuController setRootController:navController animated:YES];
    
    
}

-(IBAction)Synopsis:(id)sender
{
    GlobalClass *obj=[GlobalClass getInstance];
    
    obj.coming = @"1";
    
    
    [obj.Mid_added removeAllObjects];
    [obj.QtyOfProducts removeAllObjects];
    obj.Mid_added =nil;
    obj.QtyOfProducts =nil;

    
    DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
    iphone5Synopsis *controller = [[iphone5Synopsis alloc] init];
    //controller.title = selectedCountry;
    controller.TAG = @"LEFT";
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [menuController setRootController:navController animated:YES];
    
    
}

-(IBAction)news:(id)sender
{
    GlobalClass *obj=[GlobalClass getInstance];
    
    obj.coming = @"1";
    
    
    
    [obj.Mid_added removeAllObjects];
    [obj.QtyOfProducts removeAllObjects];
    obj.Mid_added =nil;
    obj.QtyOfProducts =nil;

    
    DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
    NewsViewController *controller = [[NewsViewController alloc] init];
    //controller.title = selectedCountry;
    controller.TAG = @"LEFT";
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [menuController setRootController:navController animated:YES];
    
    
}

-(IBAction)Video:(id)sender
{
    GlobalClass *obj=[GlobalClass getInstance];
    
    obj.coming = @"1";
    
    
    [obj.Mid_added removeAllObjects];
    [obj.QtyOfProducts removeAllObjects];
    obj.Mid_added =nil;
    obj.QtyOfProducts =nil;

    
    DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
    iphone5Video *controller = [[iphone5Video alloc] init];
    //controller.title = selectedCountry;
    controller.TAG = @"LEFT";
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [menuController setRootController:navController animated:YES];
    
    
}
-(IBAction)download:(id)sender
{
    GlobalClass *obj=[GlobalClass getInstance];
    
    obj.coming = @"1";
    
    
    [obj.Mid_added removeAllObjects];
    [obj.QtyOfProducts removeAllObjects];
    obj.Mid_added =nil;
    obj.QtyOfProducts =nil;

    
    DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
    MainWallpapers *controller = [[MainWallpapers alloc] init];
    //controller.title = selectedCountry;
    controller.TAG = @"LEFT";
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [menuController setRootController:navController animated:YES];
    
    
}
-(IBAction)songs:(id)sender
{
   
    GlobalClass *obj=[GlobalClass getInstance];
    
    obj.coming = @"1";
    
    
    [obj.Mid_added removeAllObjects];
    [obj.QtyOfProducts removeAllObjects];
    obj.Mid_added =nil;
    obj.QtyOfProducts =nil;

    
    DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
   iPhoneStreamingPlayerViewController *controller = [[iPhoneStreamingPlayerViewController alloc] init];
    //controller.title = selectedCountry;
    controller.TAG = @"LEFT";
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [menuController setRootController:navController animated:YES];
}
-(IBAction)behindScene:(id)sender
{
    GlobalClass *obj=[GlobalClass getInstance];
    
    obj.coming = @"1";
    
    
    [obj.Mid_added removeAllObjects];
    [obj.QtyOfProducts removeAllObjects];
    obj.Mid_added =nil;
    obj.QtyOfProducts =nil;

    
    DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
    BehindTheScene *controller = [[BehindTheScene alloc] init];
    //controller.title = selectedCountry;
    controller.TAG = @"LEFT";
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [menuController setRootController:navController animated:YES];
    
}
-(IBAction)merchandise:(id)sender
{
    
    
    GlobalClass *obj=[GlobalClass getInstance];
    
    obj.coming = @"1";
    
    
//    [obj.Mid_added removeAllObjects];
//    [obj.QtyOfProducts removeAllObjects];
//    obj.Mid_added =nil;
//    obj.QtyOfProducts =nil;

    
    DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
    Merchandise *controller = [[Merchandise alloc] init];
    //controller.title = selectedCountry;
    controller.TAG = @"LEFT";
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [menuController setRootController:navController animated:YES];
 
//    
//    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Under construction" message:@"Check Back Soon" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//    [alert show];
//
    
    
}
-(IBAction)theaters:(id)sender
{
    GlobalClass *obj=[GlobalClass getInstance];
    
    obj.coming = @"1";
    
    [obj.Mid_added removeAllObjects];
    [obj.QtyOfProducts removeAllObjects];
    obj.Mid_added =nil;
    obj.QtyOfProducts =nil;

    
    DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
    iPhone5Daabang2SecondViewController     *controller = [[iPhone5Daabang2SecondViewController alloc] init];
    //controller.title = selectedCountry;
    controller.TAG = @"LEFT";
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [menuController setRootController:navController animated:YES];
//    UIAlertView *alert = [[UIAlertView alloc]
//                          initWithTitle: @"Status"
//                          message: @"Movie releasing October 2nd. Check back soon to book your tickets."\
//                          delegate: self
//                          cancelButtonTitle:@"OK"
//                          otherButtonTitles:nil];
//    [alert show];


    
    
}
-(IBAction)chat:(id)sender
{
    GlobalClass *obj=[GlobalClass getInstance];
    
    obj.coming = @"1";
    
    
    [obj.Mid_added removeAllObjects];
    [obj.QtyOfProducts removeAllObjects];
    obj.Mid_added =nil;
    obj.QtyOfProducts =nil;

    
    DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
    iphone5GroupViewController *controller = [[iphone5GroupViewController alloc] init];
    //controller.title = selectedCountry;
    controller.TAG = @"LEFT";
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [menuController setRootController:navController animated:YES];
    
}


-(IBAction)contest:(id)sender
{
    GlobalClass *obj=[GlobalClass getInstance];
    
    obj.coming = @"1";
    
    
    [obj.Mid_added removeAllObjects];
    [obj.QtyOfProducts removeAllObjects];
    obj.Mid_added =nil;
    obj.QtyOfProducts =nil;

    
    DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
    ContestViewController *controller = [[ContestViewController alloc] init];
    //controller.title = selectedCountry;
    controller.TAG = @"LEFT";
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [menuController setRootController:navController animated:YES];
    
    
}
-(IBAction)settings:(id)sender
{
    GlobalClass *obj=[GlobalClass getInstance];
    
    obj.coming = @"1";
    
    [obj.Mid_added removeAllObjects];
    [obj.QtyOfProducts removeAllObjects];
    obj.Mid_added =nil;
    obj.QtyOfProducts =nil;

    
    DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
    iphone5Notification *controller = [[iphone5Notification alloc] init];
    //controller.title = selectedCountry;
    controller.TAG = @"LEFT";
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [menuController setRootController:navController animated:YES];
    
}

-(IBAction)facebook:(id)sender
{
    GlobalClass *obj=[GlobalClass getInstance];
    
    obj.coming = @"1";
    
    [obj.Mid_added removeAllObjects];
    [obj.QtyOfProducts removeAllObjects];
    obj.Mid_added =nil;
    obj.QtyOfProducts =nil;

    
    DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
    iPhone5FacebookViewController *controller = [[iPhone5FacebookViewController alloc] init];
    //controller.title = selectedCountry;
    controller.TAG = @"LEFT";
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [menuController setRootController:navController animated:YES];
}

-(IBAction)tweeter:(id)sender
{
    GlobalClass *obj=[GlobalClass getInstance];
    
    obj.coming = @"1";
    
    [obj.Mid_added removeAllObjects];
    [obj.QtyOfProducts removeAllObjects];
    obj.Mid_added =nil;
    obj.QtyOfProducts =nil;

    
    DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
    iphone5TwitterfeedsViewController *controller = [[iphone5TwitterfeedsViewController alloc] init];
    //controller.title = selectedCountry;
    controller.TAG = @"LEFT";
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [menuController setRootController:navController animated:YES];
    
    
}

-(IBAction)exploreRel:(id)sender
{
    GlobalClass *obj=[GlobalClass getInstance];
    
    obj.coming = @"1";
    
    
    [obj.Mid_added removeAllObjects];
    [obj.QtyOfProducts removeAllObjects];
    obj.Mid_added =nil;
    obj.QtyOfProducts =nil;
    
    
    DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
    
    R_Home_5 *   homeController = [[R_Home_5 alloc] init];
   
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:homeController];
    
    [menuController setRootController:navController animated:YES];
    
}
-(IBAction)downloadRel:(id)sender
{
    GlobalClass *obj=[GlobalClass getInstance];
    
    obj.coming = @"1";
    
    
    [obj.Mid_added removeAllObjects];
    [obj.QtyOfProducts removeAllObjects];
    obj.Mid_added =nil;
    obj.QtyOfProducts =nil;
    
    
    DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
   
        R_wallpapers_5 *wallController = [[R_wallpapers_5 alloc] init];
  
    wallController.TAG = @"REL_LEFT";
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:wallController];
    
    [menuController setRootController:navController animated:YES];
}
-(IBAction)chatRel:(id)sender
{
    GlobalClass *obj=[GlobalClass getInstance];
    
    obj.coming = @"1";
    
    
    [obj.Mid_added removeAllObjects];
    [obj.QtyOfProducts removeAllObjects];
    obj.Mid_added =nil;
    obj.QtyOfProducts =nil;
    
    
    DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
    iphone5GroupViewController*     chatController = [[iphone5GroupViewController alloc] init];
   
    //controller.title = selectedCountry;
    chatController.TAG = @"LEFT";
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:chatController];
    
    [menuController setRootController:navController animated:YES];
    
}
-(IBAction)filmCatalogue:(id)sender
{
    GlobalClass *obj=[GlobalClass getInstance];
    
    obj.coming = @"1";
    
    
    [obj.Mid_added removeAllObjects];
    [obj.QtyOfProducts removeAllObjects];
    obj.Mid_added =nil;
    obj.QtyOfProducts =nil;
    
    
    DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
    R_MovieCatalogue_5 *sceneController = [[R_MovieCatalogue_5 alloc] init];
    sceneController.TAG = @"REL_LEFT";
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:sceneController];
    
    [menuController setRootController:navController animated:YES];

}
-(IBAction)memorableStore:(id)sender
{
    
    GlobalClass *obj=[GlobalClass getInstance];
    
    obj.coming = @"1";
    
    
    //    [obj.Mid_added removeAllObjects];
    //    [obj.QtyOfProducts removeAllObjects];
    //    obj.Mid_added =nil;
    //    obj.QtyOfProducts =nil;
    
    
    DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
    Merchandise *controller = [[Merchandise alloc] init];
    //controller.title = selectedCountry;
    controller.TAG = @"LEFT";
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [menuController setRootController:navController animated:YES];
    

    
}
-(IBAction)tralilers:(id)sender
{
    GlobalClass *obj=[GlobalClass getInstance];
    
    obj.coming = @"1";
    
    
    [obj.Mid_added removeAllObjects];
    [obj.QtyOfProducts removeAllObjects];
    obj.Mid_added =nil;
    obj.QtyOfProducts =nil;
    
    
    DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
    R_Trailers_5 *trailer = [[R_Trailers_5 alloc] init];
    trailer.TAG = @"REL_LEFT";
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:trailer];
    
    [menuController setRootController:navController animated:YES];
}
-(IBAction)movieSearch:(id)sender
{
    GlobalClass *obj=[GlobalClass getInstance];
    
    obj.coming = @"1";
    
    
    [obj.Mid_added removeAllObjects];
    [obj.QtyOfProducts removeAllObjects];
    obj.Mid_added =nil;
    obj.QtyOfProducts =nil;
    
    
    DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
    R_MovieSearch_5 *sceneController = [[R_MovieSearch_5 alloc] init];
    sceneController.TAG = @"REL_LEFT";
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:sceneController];
    
    [menuController setRootController:navController animated:YES];
}
-(IBAction)shortScenes:(id)sender
{
    GlobalClass *obj=[GlobalClass getInstance];
    
    obj.coming = @"1";
    
    
    [obj.Mid_added removeAllObjects];
    [obj.QtyOfProducts removeAllObjects];
    obj.Mid_added =nil;
    obj.QtyOfProducts =nil;
    
    
    DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
        iPhone5ShortScenesVC *sceneController = [[iPhone5ShortScenesVC alloc] init];
    sceneController.TAG = @"REL_LEFT";
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:sceneController];
    
    [menuController setRootController:navController animated:YES];
    
}

-(IBAction)contestRel:(id)sender
{
    GlobalClass *obj=[GlobalClass getInstance];
    
    obj.coming = @"1";
    
    
    [obj.Mid_added removeAllObjects];
    [obj.QtyOfProducts removeAllObjects];
    obj.Mid_added =nil;
    obj.QtyOfProducts =nil;
    
    
    DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
    R_iPhone5ContestViewController *controller = [[R_iPhone5ContestViewController alloc] init];
    //controller.title = selectedCountry;
    controller.TAG = @"REL_LEFT";
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [menuController setRootController:navController animated:YES];
}
-(IBAction)settingsRel:(id)sender
{
    DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
    R_iPhone5Settings *controller = [[R_iPhone5Settings alloc] init];
    //controller.title = selectedCountry;
    controller.TAG = @"REL_LEFT";
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [menuController setRootController:navController animated:YES];
 
}
-(IBAction)facebookRel:(id)sender
{
    
    GlobalClass *obj=[GlobalClass getInstance];
    
    obj.coming = @"1";
    
    
    [obj.Mid_added removeAllObjects];
    [obj.QtyOfProducts removeAllObjects];
    obj.Mid_added =nil;
    obj.QtyOfProducts =nil;
    
    
    DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
   
     R_FeedsVC_5*   feedController = [[R_FeedsVC_5 alloc] init];
  
    feedController.TAG = @"REL_LEFT";
    feedController.FEEDTAG = @"FacebookTag";
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:feedController];
    
    [menuController setRootController:navController animated:YES];
    
}
-(IBAction)tweeterRel:(id)sender
{
    GlobalClass *obj=[GlobalClass getInstance];
    
    obj.coming = @"1";
    
    
    [obj.Mid_added removeAllObjects];
    [obj.QtyOfProducts removeAllObjects];
    obj.Mid_added =nil;
    obj.QtyOfProducts =nil;
    
    
    DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
   R_FeedsVC_5* feedController = [[R_FeedsVC_5 alloc] init];

    //controller.title = selectedCountry;
    feedController.TAG = @"REL_LEFT";
    feedController.FEEDTAG = @"TwitterTag";
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:feedController];
    
    [menuController setRootController:navController animated:YES];
    
}


@end
