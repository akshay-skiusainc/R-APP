//
//  iphone4LeftViewController.m
//  RelianceApplication
//
//  Created by Ashwini Pawar on 13/08/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import "iphone4LeftViewController.h"
#import "iphone4HomeViewController.h"
#import "iphone4FacebookViewController.h"
#import "iphone4TwitterViewController.h"
#import "iphone4NewsViewController.h"
#import "SynopsisViewController.h"
#import "iphone4Video.h"
#import "iPhone4Daabang2SecondViewController.h"
#import "iphone4MainWallpapers.h"
#import "NotificationVC.h"
#import "iphone4ContestViewController.h"
#import "iphone4BehindtheScene.h"
#import "iPhone4StreamingPlayerViewController.h"
#import "iphone4Merchandise.h"


#import "R_Home.h"
#import "ShortScenesVC.h"
#import "R_FeedsVC.h"
#import "R_wallpapers_4.h"
#import "R_Trailers_4.h"

@interface iphone4LeftViewController ()

@end

@implementation iphone4LeftViewController
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
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"home_bg_460.jpg"]];

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
- (void)viewDidLoad
{
    [super viewDidLoad];
    GlobalClass *obj=[GlobalClass getInstance];

    if ([obj.Leftcheck isEqualToString:@"1"])
    {
        _Scroller2.alpha=1.0;
        Scroller.alpha=0.0;
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"home_bg_460.jpg"]];

    }
    
    else
    {
        _Scroller2.alpha=0.0;
        Scroller.alpha=1.0;
        NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"app_bg_image"];
        UIImage* app_bg_image = [UIImage imageWithData:imageData];
        self.view.backgroundColor = [UIColor colorWithPatternImage:app_bg_image];
    }

    
    
   
  //  _RelianceView.backgroundColor = [UIColor colorWithPatternImage:app_bg_image];

    _VIEW1.backgroundColor=[UIColor clearColor];
    
    _VIEW2.backgroundColor=[UIColor clearColor];

    Scroller.contentSize = CGSizeMake(215, 698);
    _Scroller2.contentSize = CGSizeMake(215, 590);

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
    iphone4HomeViewController *controller = [[iphone4HomeViewController alloc] init];
    //controller.title = selectedCountry;
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [menuController setRootController:navController animated:YES];
    
    
}

-(IBAction)Synopsis:(id)sender
{
    GlobalClass *obj=[GlobalClass getInstance];
    
    [obj.Mid_added removeAllObjects];
    [obj.QtyOfProducts removeAllObjects];
    obj.Mid_added =nil;
    obj.QtyOfProducts =nil;

       
    DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
    SynopsisViewController *controller = [[SynopsisViewController alloc] init];
    //controller.title = selectedCountry;
    obj.coming = @"1";
    controller.TAG = @"LEFT";
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [menuController setRootController:navController animated:YES];
    
    
}

-(IBAction)news:(id)sender
{
    GlobalClass *obj=[GlobalClass getInstance];
    
    [obj.Mid_added removeAllObjects];
    [obj.QtyOfProducts removeAllObjects];
    obj.Mid_added =nil;
    obj.QtyOfProducts =nil;

    obj.coming = @"1";
    
    DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
    iphone4NewsViewController *controller = [[iphone4NewsViewController alloc] init];
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
    iphone4Video *controller = [[iphone4Video alloc] init];
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
    iphone4MainWallpapers *controller = [[iphone4MainWallpapers alloc] init];
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
    iPhone4StreamingPlayerViewController *controller = [[iPhone4StreamingPlayerViewController alloc] init];
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
    iphone4BehindtheScene *controller = [[iphone4BehindtheScene alloc] init];
    //controller.title = selectedCountry;
      controller.TAG = @"LEFT";
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [menuController setRootController:navController animated:YES];
    
}
-(IBAction)merchandise:(id)sender
{
    
    
    GlobalClass *obj=[GlobalClass getInstance];
    
    obj.coming = @"1";
    
    
      
    DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
    iphone4Merchandise *controller = [[iphone4Merchandise alloc] init];
    //controller.title = selectedCountry;
      controller.TAG = @"LEFT";
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [menuController setRootController:navController animated:YES];
    
//    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Under construction" message:@"Check Back Soon" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//    [alert show];
    
    
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
    iPhone4Daabang2SecondViewController     *controller = [[iPhone4Daabang2SecondViewController alloc] init];
    controller.TAG = @"LEFT";
    //controller.title = selectedCountry;
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [menuController setRootController:navController animated:YES];
//    UIAlertView *alret1 = [[UIAlertView alloc]initWithTitle:@"Please check back soon" message:nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//    [alret1 show];
    
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
    GroupViewController *controller = [[GroupViewController alloc] init];
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
    iphone4ContestViewController *controller = [[iphone4ContestViewController alloc] init];
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

    
      
    
//    
//    if([obj.Leftcheck isEqualToString:@"1"])
//    {
//        DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
//        NotificationVC *controller = [[NotificationVC alloc] init];
//        //controller.title = selectedCountry;
//        controller.TAG = @"LEFT";
//        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
//        
//        [menuController setRootController:navController animated:YES];
//
//        
//        }
//    else
//    {
    
        DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
        R_iPhone4Settings *controller = [[R_iPhone4Settings alloc] init];
        //controller.title = selectedCountry;
        controller.TAG = @"LEFT";
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
        
        [menuController setRootController:navController animated:YES];

    
//    }

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
    iphone4FacebookViewController *controller = [[iphone4FacebookViewController alloc] init];
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
    iphone4TwitterViewController *controller = [[iphone4TwitterViewController alloc] init];
    //controller.title = selectedCountry;
      controller.TAG = @"LEFT";
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [menuController setRootController:navController animated:YES];
    
    
}


//=================================Reliance============================================================

-(IBAction)exploreRel:(id)sender
{
    GlobalClass *obj=[GlobalClass getInstance];
    
    obj.coming = @"1";
    
    
    [obj.Mid_added removeAllObjects];
    [obj.QtyOfProducts removeAllObjects];
    obj.Mid_added =nil;
    obj.QtyOfProducts =nil;
    
    
    DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
    R_Home *controller = [[R_Home alloc] init];
    //controller.title = selectedCountry;
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    
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
    R_wallpapers_4 *controller = [[R_wallpapers_4 alloc] init];
    //controller.title = selectedCountry;
    controller.TAG = @"REL_LEFT";
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    
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
    GroupViewController *controller = [[GroupViewController alloc] init];
    //controller.title = selectedCountry;
    controller.TAG = @"REL_LEFT";
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    
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
    R_MovieCatalogue_4 *trailer = [[R_MovieCatalogue_4 alloc] init];
    trailer.TAG = @"REL_LEFT";
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:trailer];
    
    [menuController setRootController:navController animated:YES];

    

}
-(IBAction)memorableStore:(id)sender
{
    GlobalClass *obj=[GlobalClass getInstance];
    
    obj.coming = @"1";
    
    
    
    DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
    iphone4Merchandise *controller = [[iphone4Merchandise alloc] init];
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
    R_Trailers_4 *trailer = [[R_Trailers_4 alloc] init];
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
    R_MovieSeacrh_4 *controller = [[R_MovieSeacrh_4 alloc] init];
    controller.TAG = @"REL_LEFT";
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    
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
    ShortScenesVC *controller = [[ShortScenesVC alloc] init];
    //controller.title = selectedCountry;
    controller.TAG = @"REL_LEFT";
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    
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
        R_iphone4ContestViewController *controller = [[R_iphone4ContestViewController alloc] init];
        //controller.title = selectedCountry;
        controller.TAG = @"REL_LEFT";
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
        
        [menuController setRootController:navController animated:YES];
        


}
-(IBAction)settingsRel:(id)sender
{
    DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
    R_iPhone4Settings *controller = [[R_iPhone4Settings alloc] init];
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
    R_FeedsVC *controller = [[R_FeedsVC alloc] init];
    //controller.title = selectedCountry;
    controller.TAG = @"REL_LEFT";
    controller.FEEDTAG = @"FacebookTag";

    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    
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
    R_FeedsVC *controller = [[R_FeedsVC alloc] init];
    //controller.title = selectedCountry;
    controller.TAG = @"REL_LEFT";
    controller.FEEDTAG = @"TwitterTag";
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [menuController setRootController:navController animated:YES];

}

@end
