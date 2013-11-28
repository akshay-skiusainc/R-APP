//
//  iPhone5TheaterShowTimeViewController.m
//  RelianceApplication
//
//  Created by Ashwini Pawar on 08/08/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import "iPhone5TheaterShowTimeViewController.h"
#import "Merchandise.h"
#import "iphone5Settings.h"
#import "iphone5GroupViewController.h"

@interface iPhone5TheaterShowTimeViewController ()

@end

@implementation iPhone5TheaterShowTimeViewController

@synthesize str,showTimingsLable,showTimeTag,Bookmyshowbutton,theaterName,bmsurl,footerView,todaysShowLabel,tomorrowsShowLabel,showTimeScroller,tomorowtime;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithShowTiming:(NSString *)_str
{
    if(self)
    {
        self.str = _str;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	NSLog(@"bms=%@",bmsurl);
    
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(25,70,219,21)];
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:@"Helvetica Neue Bold" size: 20.0];
    [label setFont:[UIFont boldSystemFontOfSize:17]];
    label.text = theaterName;
    [label sizeToFit];
    [self.view addSubview:label];
    
    UIImage *buttonImage = [UIImage imageNamed:@"back-btn.png"];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:buttonImage forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, buttonImage.size.width, buttonImage.size.height);
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = customBarItem;
    
//    UIImage *relAppImage = [UIImage imageNamed:@"home_right_rel_icon.png"];
//    UIButton *buttonChat = [UIButton buttonWithType:UIButtonTypeCustom];
//    [buttonChat setImage:relAppImage forState:UIControlStateNormal];
//    buttonChat.frame = CGRectMake(0, 0, relAppImage.size.width, relAppImage.size.height);
//    [buttonChat addTarget:self action:@selector(toChat) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *customBarItem1 = [[UIBarButtonItem alloc] initWithCustomView:buttonChat];
//    self.navigationItem.RightBarButtonItem = customBarItem1;

    NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"app_bg_image"];
    UIImage* app_bg_image = [UIImage imageWithData:imageData];
    self.view.backgroundColor = [UIColor colorWithPatternImage:app_bg_image];
    
    footerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"footer_bg.png"]];
   
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"home_header_bg.jpg"] forBarMetrics:UIBarMetricsDefault];
    if (showTimeTag == 1 || showTimeTag == 0)
    {
	    self.showTimingsLable.text = self.str;
        todaysShowLabel.text = @"Today's Shows";
        tomorrowsShowLabel.text = @"Tomorrow's Shows";
	 
    }
    else if (showTimeTag == 2)
    {
        self.showTimingsLable.text = self.str;
        todaysShowLabel.text = @"Tomorrow's Shows";
        tomorrowsShowLabel.text = @"Today's Shows";
    }
    
       NSArray *listItems = [self.str componentsSeparatedByString:@" "];
    
    int nX=0;
    int nY=0;
    for (int a =0; a<[listItems count]; a++)
    {
        
        nX=106*(a%3);
        nY=26 * (a/3);
        
        showTimeLable[a] = [[UILabel alloc] initWithFrame:CGRectMake(nX+10, nY+12,106, 26)];
		showTimeLable[a].backgroundColor =[UIColor clearColor];
		showTimeLable[a].textColor= [UIColor blackColor];
        showTimeLable[a].numberOfLines = 1;
        showTimeLable[a].text=[listItems objectAtIndex:a];
		showTimeLable[a].font = [UIFont fontWithName:@"Helvetica Neue" size: 17.0];
		[showTimeScroller addSubview:showTimeLable[a]];

    }
    showTimeScroller.contentSize = CGSizeMake(320,(26*[listItems count]/3+30));
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
        [UIView animateWithDuration:.3 animations:^{_footerMainView.center = CGPointMake(320/2, 524);}];
    }
    else if(start>=0)
    {
        NSLog(@"touchesEnded    ----    start");
        //animate pulldownView with top to mainviews top
        [UIView animateWithDuration:.3 animations:^{_footerMainView.center = CGPointMake(320/2, 468);}];
    }
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:YES];
    // [self performSelector:@selector(openFooter1:) withObject:nil afterDelay:0.01 ];
    _footerMainView.frame = CGRectMake(0, 487, _footerMainView.frame.size.width, _footerMainView.frame.size.height);
    
}
- (IBAction)merchandise:(id)sender
{
      Merchandise *merchandise = [[Merchandise alloc]initWithNibName:@"Merchandise" bundle:nil];
      [self.navigationController pushViewController:merchandise animated:YES];
   
}
- (IBAction)chat:(id)sender
{
    iphone5GroupViewController *group = [[iphone5GroupViewController alloc]initWithNibName:@"iphone5GroupViewController" bundle:nil];
    [self.navigationController pushViewController:group animated:YES];
}
-(IBAction)toRelApp:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Under construction" message:@"Check Back Soon" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    
}

- (IBAction)myProfile:(id)sender
{
    iphone5Settings *setting = [[iphone5Settings alloc]initWithNibName:@"iphone5Settings" bundle:nil];
    [self.navigationController pushViewController:setting animated:YES];
    
}
-(void)back {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)BookMyShow:(id)sender
{
//	[[GAI sharedInstance].defaultTracker sendEventWithCategory:@"Book-My-Show-Button"
//                                                    withAction:@"Book-My-ShowTapped"
//                                                     withLabel:@"Book-Show"
//                                                     withValue:nil];
//	
//    
//	iphone5Bookmyshow *loginViewController = [[iphone5Bookmyshow alloc] initWithNibName:@"iphone5Bookmyshow" bundle:nil];
//	loginViewController.bmsurl=bmsurl;
//	[self.navigationController pushViewController:loginViewController animated:NO];
	
}

- (void)viewDidUnload {
    [self setShowTimingsLable:nil];
 
	[self setBookmyshowbutton:nil];
	    [super viewDidUnload];
}

- (IBAction)bookMyShowButton:(id)sender {
    NSLog(@"BMS");
    GlobalClass     *obj=[GlobalClass getInstance];
    NSString *url = [NSString stringWithFormat:@"%@",obj.bms_link];
    
    
    //NSLog(@"ss=%@",str);
    
    //NSString	*str = [NSString stringWithFormat:@"http://in.bookmyshow.com/movies/Life-Of-Pi-"];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    

}

- (IBAction)buttonTodaysShowTiming:(id)sender {
}

@end
