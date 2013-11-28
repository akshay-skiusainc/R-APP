//
//  LeftViewController.m
//  Relapp
//
//  Created by Akshay on 8/2/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import "LeftViewController.h"
#import "NewsViewController.h"
@interface LeftViewController ()

@end

@implementation LeftViewController

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
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"home_main_bg.jpg"]];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)Video:(id)sender
{
    GlobalClass *obj=[GlobalClass getInstance];
    
    obj.coming = @"1";
    
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
    
    DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
    SynopsisViewController *controller = [[SynopsisViewController alloc] init];
    //controller.title = selectedCountry;
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [menuController setRootController:navController animated:YES];
    
    
}
-(IBAction)Videoscreen:(id)sender
{
    GlobalClass *obj=[GlobalClass getInstance];
    
    obj.coming = @"1";
    
    DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
    iphone5Video *controller = [[iphone5Video alloc] init];
    //controller.title = selectedCountry;
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [menuController setRootController:navController animated:YES];
    
    
}

-(IBAction)news:(id)sender
{
    GlobalClass *obj=[GlobalClass getInstance];
    
    obj.coming = @"1";
    
    DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
    NewsViewController *controller = [[NewsViewController alloc] init];
    //controller.title = selectedCountry;
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [menuController setRootController:navController animated:YES];
    
    
}

@end
