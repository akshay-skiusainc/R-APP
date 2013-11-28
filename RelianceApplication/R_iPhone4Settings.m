//
//  R_iPhone4Settings.m
//  RelianceApplication
//
//  Created by Anish on 10/17/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import "R_iPhone4Settings.h"
#import "iphone4AboutInfoViewController.h"
#import "iphone4UserProfileViewController.h"
#import "R_AboutScreen_4.h"

@interface R_iPhone4Settings ()

@end

@implementation R_iPhone4Settings

@synthesize profileButtonView,profileLable,signoutButtonView,signoutLable,helpButtonView,helpLable,feedbackButtonView,feedbackLable,termsButtonView,termsLable,contactButtonView,contactLable,aboutButtonView,aboutLable,footerView,TAG;

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
    footerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"footer_bg.png"]];
    // self.navigationItem.title=@"Settings";
    
  //  [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"home_header_bg.jpg"] forBarMetrics:UIBarMetricsDefault];
    
    //        UIImage *buttonImage = [UIImage imageNamed:@"back-btn.png"];
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
    
    
    [profileButtonView setBackgroundImage:[UIImage imageNamed:@"ma_profile_btn_red.png"] forState:UIControlStateHighlighted];
    [signoutButtonView setBackgroundImage:[UIImage imageNamed:@"ma_logout_btn_red.png"] forState:UIControlStateHighlighted];
    [feedbackButtonView setBackgroundImage:[UIImage imageNamed:@"ma_feedback_btn_red.png"] forState:UIControlStateHighlighted];
    [helpButtonView setBackgroundImage:[UIImage imageNamed:@"ma_help_btn_red.png"] forState:UIControlStateHighlighted];
    [termsButtonView setBackgroundImage:[UIImage imageNamed:@"ma_pas_btn_red.png"] forState:UIControlStateHighlighted];
    [contactButtonView setBackgroundImage:[UIImage imageNamed:@"ma_contact_btn_red.png"] forState:UIControlStateHighlighted];
    [aboutButtonView setBackgroundImage:[UIImage imageNamed:@"ma_about_btn_red.png"] forState:UIControlStateHighlighted];
    
    
   }

-(IBAction)logout:(id)sender
{
	UIAlertView* logoutalertbox = [[ UIAlertView alloc]initWithTitle:@"Alert" message:@"Are you sure you want to Sign Out" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Yes",@"No", nil ];
	logoutalertbox.tag=5;
	logoutalertbox.delegate=self;
	[logoutalertbox show];
    
	
}
- (IBAction)openFooter:(id)sender
{
    if(self.view.frame.origin.y == 0)
    {
        [UIView beginAnimations:@"Animate Text Field Up" context:nil];
        [UIView setAnimationDuration:.3];
        [UIView setAnimationBeginsFromCurrentState:YES];
        self.view.frame = CGRectMake(self.view.frame.origin.x,
                                     -57,
                                     self.view.frame.size.width,
                                     self.view.frame.size.height);
        [UIView commitAnimations];
    }
    else if(self.view.frame.origin.y == -57)
    {
        [UIView beginAnimations:@"Animate Text Field Up" context:nil];
        [UIView setAnimationDuration:.3];
        [UIView setAnimationBeginsFromCurrentState:YES];
        self.view.frame = CGRectMake(self.view.frame.origin.x,
                                     0,
                                     self.view.frame.size.width,
                                     self.view.frame.size.height);
        [UIView commitAnimations];
    }
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    _footerMainView.frame = CGRectMake(0, 398, _footerMainView.frame.size.width, _footerMainView.frame.size.height);
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesBegan");
    UITouch *touch = (UITouch *)[touches anyObject];
    start = [touch locationInView:self.view].y;
    
    NSLog(@"start = %f",start);
    if(start < 400 && _footerMainView.center.y > 400)//touch was not in upper area of view AND pulldownView not visible
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


-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    if (directionUp)
    {
        NSLog(@"touchesEnded    ----    directionUp");
        //animate pulldownView out of visibel area
        [UIView animateWithDuration:.3 animations:^{_footerMainView.center = CGPointMake(320/2, 435);}];
    }
    else if(start>=0)
    {
        NSLog(@"touchesEnded    ----    start");
        //animate pulldownView with top to mainviews top
        [UIView animateWithDuration:.3 animations:^{_footerMainView.center = CGPointMake(320/2, 380);}];
    }
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:YES];
    // [self performSelector:@selector(openFooter1:) withObject:nil afterDelay:0.01 ];
    _footerMainView.frame = CGRectMake(0, 398, _footerMainView.frame.size.width, _footerMainView.frame.size.height);
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


-(void)back {
	
	[self.navigationController popViewControllerAnimated:YES];
    
    // Do any additional setup after loading the view from its nib.
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
	R_iphone4HelpViewController *profile = [[R_iphone4HelpViewController alloc]initWithNibName:@"R_iphone4HelpViewController" bundle:nil];
    [self.navigationController pushViewController:profile animated:YES];
    //[self presentViewController:profile animated:YES completion:nil];
}
- (IBAction)profileButton:(id)sender {
    
    GlobalClass *obj=[GlobalClass getInstance];
    obj.fetchall = @"0";
    if([obj.Leftcheck isEqualToString:@"1"])
    {

        iphone4UserProfileViewController *profile = [[iphone4UserProfileViewController alloc]initWithNibName:@"iphone4UserProfileViewController" bundle:nil];
        [self.navigationController pushViewController:profile animated:YES];
    }
    
    else{
    R_iphone4ProfileViewController *profile = [[R_iphone4ProfileViewController alloc]initWithNibName:@"R_iphone4ProfileViewController" bundle:nil];
    [self.navigationController pushViewController:profile animated:YES];
    }
    // [self presentViewController:profile animated:YES completion:nil];
}

- (IBAction)feedbackButton:(id)sender {
	
	
	NSString *str = [NSString stringWithFormat:@"http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=683133606&onlyLatestVersion=true&pageNumber=0&sortOrdering=1&type=Purple+Software"];
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
    
}
 


- (IBAction)termsButton:(id)sender {
    R_iphone4PolicyViewController *policy = [[R_iphone4PolicyViewController alloc]initWithNibName:@"R_iphone4PolicyViewController" bundle:nil];
    [self.navigationController pushViewController:policy animated:YES];
    // [self presentViewController:policy animated:YES completion:nil];
}

- (IBAction)contactButton:(id)sender {
    R_iphone4ContactUsViewController *contactUs = [[R_iphone4ContactUsViewController alloc]initWithNibName:@"R_iphone4ContactUsViewController" bundle:nil];
    [self.navigationController pushViewController:contactUs animated:YES];
    //[self presentViewController:contactUs animated:YES completion:nil];
}

- (IBAction)aboutButton:(id)sender {
    
    R_AboutScreen_4 *aboutVC=[[R_AboutScreen_4 alloc]initWithNibName:@"R_AboutScreen_4" bundle:nil];
    
    aboutVC.modalTransitionStyle= UIModalTransitionStyleCrossDissolve;
    [self presentViewController:aboutVC animated:YES completion:nil];
}
//- (IBAction)merchandise:(id)sender
//{
//    R_iphone4Merchandise *merchandise = [[R_iphone4Merchandise alloc]initWithNibName:@"R_iphone4Merchandise" bundle:nil];
//    [self.navigationController pushViewController:merchandise animated:YES];
//    
//    
//}
//
//- (IBAction)chat:(id)sender
//{
//    GroupViewController *group = [[GroupViewController alloc]initWithNibName:@"GroupViewController" bundle:nil];
//    [self.navigationController pushViewController:group animated:YES];
//}
- (IBAction)toRelApp:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Under construction" message:@"Check Back Soon" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    
}
//Ashwini
- (IBAction)myProfile:(id)sender {
    R_iPhone4Settings *setting = [[R_iPhone4Settings alloc]initWithNibName:@"R_iphone4Settings" bundle:nil];
    [self.navigationController pushViewController:setting animated:YES];
    
}


@end
