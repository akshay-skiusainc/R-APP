//
//  iphone4RightViewController.m
//  RelianceApplication
//
//  Created by Akshay Jain on 9/20/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import "iphone4RightViewController.h"
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
#import "DDMenuController.h"


#import "R_Home.h"
#import "R_FeedsVC.h"

@interface iphone4RightViewController ()

@end

@implementation iphone4RightViewController

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
//    GlobalClass *obj=[GlobalClass getInstance];
//
//    if([obj.Leftcheck isEqualToString:@"1"])
//    {
//        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"home_bg.jpg"]];
//        
//    }
//    else
//    {
//
//    NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"app_bg_image"];
//    UIImage* app_bg_image = [UIImage imageWithData:imageData];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:app_bg_image];
//    }
    _VIEW1.backgroundColor=[UIColor clearColor];
    
    
    _Scroller.contentSize = CGSizeMake(215, 500);

    
    // Do any additional setup after loading the view from its nib.
}
- (UIColor *) colorWithHexString: (NSString *) hex
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
	
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
	
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
	
    if ([cString length] != 6) return  [UIColor grayColor];
	
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
	
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
	
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
	
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
	
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    GlobalClass *obj=[GlobalClass getInstance];
    NSLog(@"lal===1");

    
    if([obj.Leftcheck isEqualToString:@"1"])
    {
        NSLog(@"ll===1");
//        [self.view setBackgroundColor: [self colorWithHexString:@"0c4ca3"]];
//        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"right_nav_bg.jpg"]];
        _Scroller.contentSize = CGSizeMake(215, 400);
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"home_bg_548.jpg"]];

        _Scroller.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"right_nav_bg.jpg"]];
        _SONG_BTN.alpha=0.0;
        [_logo setImage:[UIImage imageNamed:@"right_nav-1.jpg"] forState:UIControlStateNormal];
        [_merchandise_btn setImage:[UIImage imageNamed:@"right_nav-2.jpg"] forState:UIControlStateNormal];
        [_chat_btn setImage:[UIImage imageNamed:@"right_nav-3.jpg"] forState:UIControlStateNormal];
        [_profile_btn setImage:[UIImage imageNamed:@"right_nav-4.jpg"] forState:UIControlStateNormal];

        
    }
    else
    {
        NSLog(@"ll===0");

        _Scroller.backgroundColor = [UIColor clearColor];

        _Scroller.contentSize = CGSizeMake(215, 500);

        NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"app_bg_image"];
        UIImage* app_bg_image = [UIImage imageWithData:imageData];
        self.view.backgroundColor = [UIColor colorWithPatternImage:app_bg_image];
        _SONG_BTN.alpha=1.0;
        
        [_logo setImage:[UIImage imageNamed:@"right_nav_reliance_btn.png"] forState:UIControlStateNormal];
        [_merchandise_btn setImage:[UIImage imageNamed:@"right_nav_merchandise_btn.png"] forState:UIControlStateNormal];
        [_chat_btn setImage:[UIImage imageNamed:@"right_nav_chat_btn.png"] forState:UIControlStateNormal];
        [_profile_btn setImage:[UIImage imageNamed:@"right_nav_myprofile_btn.png"] forState:UIControlStateNormal];
        
    }
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
    iphone4Merchandise *controller = [[iphone4Merchandise alloc] init];
    //controller.title = selectedCountry;
    controller.TAG = @"LEFT";
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [menuController setRootController:navController animated:YES];
    
    //
    //    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Under construction" message:@"Check Back Soon" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    //    [alert show];
    //
    
    
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
-(IBAction)settings:(id)sender
{
//    GlobalClass *obj=[GlobalClass getInstance];
//    
//    obj.coming = @"1";
//    
//    [obj.Mid_added removeAllObjects];
//    [obj.QtyOfProducts removeAllObjects];
//    obj.Mid_added =nil;
//    obj.QtyOfProducts =nil;
//    
//    
//    DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
//    iphone4Settings *controller = [[iphone4Settings alloc] init];
//    //controller.title = selectedCountry;
//    controller.TAG = @"LEFT";
//    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
//    
//    [menuController setRootController:navController animated:YES];
//    
    
    GlobalClass *obj=[GlobalClass getInstance];
    
    obj.coming = @"1";
    
    
    [obj.Mid_added removeAllObjects];
    [obj.QtyOfProducts removeAllObjects];
    obj.Mid_added =nil;
    obj.QtyOfProducts =nil;
    
    
    
    
    
    if([obj.Leftcheck isEqualToString:@"1"])
    {
        
        DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
        R_iPhone4Settings *controller = [[R_iPhone4Settings alloc] init];
        //controller.title = selectedCountry;
        controller.TAG = @"LEFT";
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
        
        [menuController setRootController:navController animated:YES];

              
        
    }
    else
    {
        
        DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
        iphone4Settings *controller = [[iphone4Settings alloc] init];
        //controller.title = selectedCountry;
        controller.TAG = @"LEFT";
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
        
        [menuController setRootController:navController animated:YES];

        
    }

    
}

-(IBAction)toRelApp:(UIButton *)sender
{
    GlobalClass *obj=[GlobalClass getInstance];
  obj.fetchall = @"0";
    if([obj.Leftcheck isEqualToString:@"1"])
    {
        obj.Leftcheck = @"0";
        UIImage *image = [UIImage imageNamed:@"home_header_bg.jpg"];
        [[UINavigationBar appearance] setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
        
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
    else
    {
        obj.Leftcheck=@"1";
        UIImage *image = [UIImage imageNamed:@"home_header_bg1.jpg"];
        [[UINavigationBar appearance] setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
        
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
//    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Under construction" message:@"Check Back Soon" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//    [alert show];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
