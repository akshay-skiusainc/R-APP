//
//  R_iPhone5Settings.m
//  RelianceApplication
//
//  Created by Anish on 10/17/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import "R_iPhone5Settings.h"
#import "iphone5UserProfileViewController.h"
#import "R_AboutScreen_5.h"

@interface R_iPhone5Settings ()

@end

@implementation R_iPhone5Settings

@synthesize profileButtonView,profileLable,signoutButtonView,signoutLable,helpButtonView,helpLable,feedbackButtonView,feedbackLable,termsButtonView,termsLable,contactButtonView,contactLable,aboutButtonView,aboutLable,TAG;
@synthesize footerView;

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
    UIImage* app_bg_image = [UIImage imageNamed:@"rel_i4home_bg.jpg"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:app_bg_image];
    GlobalClass *obj1=[GlobalClass getInstance];
    //obj.coming = @"1";
    
    //   self.navigationItem.title=@"Settings";
    //          UIImage *buttonImage = [UIImage imageNamed:@"back-btn.png"];
    //        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    //        [button setImage:buttonImage forState:UIControlStateNormal];
    //        button.frame = CGRectMake(0, 0, buttonImage.size.width, buttonImage.size.height);
    //        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    //        UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    //        self.navigationItem.leftBarButtonItem = customBarItem;
    
    //    UIImage *relAppImage = [UIImage imageNamed:@"home_right_rel_icon.png"];
    //    UIButton *buttonChat = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [buttonChat setImage:relAppImage forState:UIControlStateNormal];
    //    buttonChat.frame = CGRectMake(0, 0, relAppImage.size.width, relAppImage.size.height);
    //    [buttonChat addTarget:self action:@selector(toRelApp:) forControlEvents:UIControlEventTouchUpInside];
    //    UIBarButtonItem *customBarItem1 = [[UIBarButtonItem alloc] initWithCustomView:buttonChat];
    //    self.navigationItem.RightBarButtonItem = customBarItem1;
    
    // Do any additional setup after loading the view from its nib.
    
//    UIImage *image = [UIImage imageNamed:@"home_header_bg.jpg"];
//    //  [navController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
//    [[UINavigationBar appearance] setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    
    
    
    //    GlobalClass *obj=[GlobalClass getInstance];
    //    if ([obj.Leftcheck isEqualToString:@"1"])
    //    {
    //
    //    UIImage *buttonImage1 = [UIImage imageNamed:@"back-btn.png"];
    //    [profileButtonView setImage:buttonImage1 forState:UIControlStateNormal];
    //    [profileButtonView addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    //
    //    UIImage *buttonImage2 = [UIImage imageNamed:@"back-btn.png"];
    //    [signoutButtonView setImage:buttonImage2 forState:UIControlStateNormal];
    //    [signoutButtonView addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    //
    //    UIImage *buttonImage3 = [UIImage imageNamed:@"back-btn.png"];
    //    [feedbackButtonView setImage:buttonImage3 forState:UIControlStateNormal];
    //    [feedbackButtonView addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    //
    //    UIImage *buttonImage4 = [UIImage imageNamed:@"back-btn.png"];
    //    [helpButtonView setImage:buttonImage4 forState:UIControlStateNormal];
    //    [helpButtonView addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    //
    //    UIImage *buttonImage5 = [UIImage imageNamed:@"back-btn.png"];
    //    [termsButtonView setImage:buttonImage5 forState:UIControlStateNormal];
    //    [termsButtonView addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    //
    //    UIImage *buttonImage6 = [UIImage imageNamed:@"back-btn.png"];
    //    [contactButtonView setImage:buttonImage6 forState:UIControlStateNormal];
    //    [contactButtonView addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    //
    //    UIImage *buttonImage7 = [UIImage imageNamed:@"back-btn.png"];
    //    [aboutButtonView setImage:buttonImage7 forState:UIControlStateNormal];
    //    [aboutButtonView addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    //    }
}
-(void)back {
    
    [self.navigationController popViewControllerAnimated:YES];
}
-(IBAction)logout:(id)sender
{
	UIAlertView* logoutalertbox = [[ UIAlertView alloc]initWithTitle:@"Alert" message:@"Are you sure you want to Sign Out" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Yes",@"No", nil ];
	logoutalertbox.tag=5;
	logoutalertbox.delegate=self;
	[logoutalertbox show];
    
	
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	if (alertView.tag==5) {
		
		
		if(buttonIndex==0)
		{
			/*NSHTTPCookie *cookie;
             NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
             for (cookie in [storage cookies])
             {
             NSString* domainName = [cookie domain];
             NSRange domainRange = [domainName rangeOfString:@"facebook"];
             if(domainRange.length > 0)
             {
             [storage deleteCookie:cookie];
             }
             }
             
             NSString *q = [NSString stringWithFormat:@"Delete From USER where id=1"];
             [self saveData:q];
			 
			 */
			
			exit(0);
			
			
		}
		
		
	}
	
	
	else {
		
	}
}



- (void)viewDidUnload
{
    [self setContactButtonView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)helpviewcontroller:(id)sender {
    NSLog(@"dfsa");
    
    R_iphone5HelpViewController *policy = [[R_iphone5HelpViewController alloc]initWithNibName:@"R_iphone5HelpViewController" bundle:nil];
    [self.navigationController pushViewController:policy animated:YES];
    
    
}
- (IBAction)profileButton:(id)sender {
    
    GlobalClass *obj=[GlobalClass getInstance];
    obj.fetchall = @"0";
    if([obj.Leftcheck isEqualToString:@"1"])
    {
        
        iphone5UserProfileViewController *profile = [[iphone5UserProfileViewController alloc]initWithNibName:@"iphone5UserProfileViewController" bundle:nil];
        [self.navigationController pushViewController:profile animated:YES];
    }
    
    else{

    R_iphone5ProfileViewController *profile = [[R_iphone5ProfileViewController alloc]initWithNibName:@"R_iphone5ProfileViewController" bundle:nil];
    [self.navigationController pushViewController:profile animated:YES];
    }
    // [self presentViewController:profile animated:YES completion:nil];
}

- (IBAction)feedbackButton:(id)sender {
	
	
	NSString *str = [NSString stringWithFormat:@"http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=683133606&onlyLatestVersion=true&pageNumber=0&sortOrdering=1&type=Purple+Software"];
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
    
}



- (IBAction)termsButton:(id)sender {
    R_iphone5PolicyViewController *policy = [[R_iphone5PolicyViewController alloc]initWithNibName:@"R_iphone5PolicyViewController" bundle:nil];
    [self.navigationController pushViewController:policy animated:YES];
    // [self presentViewController:policy animated:YES completion:nil];
}

- (IBAction)contactButton:(id)sender {
    R_iphone5ContactUsViewController *contactUs = [[R_iphone5ContactUsViewController alloc]initWithNibName:@"R_iphone5ContactUsViewController" bundle:nil];
    [self.navigationController pushViewController:contactUs animated:YES];
    //  [self presentViewController:contactUs animated:YES completion:nil];
}
- (IBAction)aboutButton:(id)sender {
    
    R_AboutScreen_5 *aboutVC=[[R_AboutScreen_5 alloc]initWithNibName:@"R_AboutScreen_5" bundle:nil];
    
    aboutVC.modalTransitionStyle= UIModalTransitionStyleCrossDissolve;
    [self presentViewController:aboutVC animated:YES completion:nil];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
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

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:YES];
    // [self performSelector:@selector(openFooter1:) withObject:nil afterDelay:0.01 ];
    _footerMainView.frame = CGRectMake(0, 487, _footerMainView.frame.size.width, _footerMainView.frame.size.height);
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    if (directionUp)
    {
        NSLog(@"touchesEnded    ----    directionUp");//Ashwini
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
//- (IBAction)merchandise:(id)sender
//{
//    Merchandise *merchandise = [[Merchandise alloc]initWithNibName:@"Merchandise" bundle:nil];
//    [self.navigationController pushViewController:merchandise animated:YES];
//    
//}
//
//
//
//- (IBAction)chat:(id)sender
//{
//    iphone5GroupViewController *group = [[iphone5GroupViewController alloc]initWithNibName:@"iphone5GroupViewController" bundle:nil];
//    [self.navigationController pushViewController:group animated:YES];
//    
//    
//    
//}

- (IBAction)toRelApp:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Under construction" message:@"Check Back Soon" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    
}
//Ashwini
- (IBAction)myProfile:(id)sender {
    R_iPhone5Settings *setting = [[R_iPhone5Settings alloc]initWithNibName:@"R_iPhone5Settings" bundle:nil];
    [self.navigationController pushViewController:setting animated:YES];
    
}



@end
