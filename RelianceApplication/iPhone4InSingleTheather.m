//
//  iPhone5InSingleTheather.m
//  RelianceApplication
//
//  Created by Ashwini Pawar on 08/08/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import "iPhone4InSingleTheather.h"
#import "iphone4Settings.h"
#import "iphone4Merchandise.h"
#import "GroupViewController.h"
@interface iPhone4InSingleTheather ()

@end

@implementation iPhone4InSingleTheather
@synthesize selectedTheater,Theater_Address, current_latitude,current_longitude,Phone_no,rate,bmsurl;
@synthesize Theater_latitude,Theater_longitude,time1,showTimeButtonOutlet,todayShowTimeButtonReference,tomorrowShowTimeButtonRefrence,Bookmyshowbutton,openFooerButton,footerView,tomorowtime;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      
        
        // Custom initialization
    }
    return self;
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

- (IBAction)merchandise:(id)sender
{
     iphone4Merchandise *merchandise = [[iphone4Merchandise alloc]initWithNibName:@"iphone4Merchandise" bundle:nil];
       [self.navigationController pushViewController:merchandise animated:YES];
  
}

- (IBAction)chat:(id)sender
{
       GroupViewController *group = [[GroupViewController alloc]initWithNibName:@"GroupViewController" bundle:nil];
      [self.navigationController pushViewController:group animated:YES];
    
       
}


- (IBAction)myProfile:(id)sender
{
    iphone4Settings *setting = [[iphone4Settings alloc]initWithNibName:@"iphone4Settings" bundle:nil];
    [self.navigationController pushViewController:setting animated:YES];
    
}



-(void)DesignHeader
{
//    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
//        
//        
//        
//	    if ([self.navigationController.navigationBar respondsToSelector:@selector( setBackgroundImage:forBarMetrics:)]){
//		    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bar_clean.png"] forBarMetrics:UIBarMetricsDefault];
//	    }

        
        
        UILabel * label = [[[UILabel alloc] initWithFrame:CGRectMake(0,0,45,45)] autorelease];
        label.textColor = [self colorWithHexString:@"2d0c02"];
        label.backgroundColor = [UIColor clearColor];
        label.font = [UIFont fontWithName:@"Helvetica Neue Bold" size: 20.0];
        [label setFont:[UIFont boldSystemFontOfSize:20]];
        
        label.text = self.navigationItem.title;
        self.navigationItem.titleView = label;
        [label sizeToFit];
        
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] init];
        backButton.title = self.navigationItem.title;
        backButton.tintColor = [self colorWithHexString:@"2d0c02"];
        self.navigationItem.backBarButtonItem = backButton;
        [backButton release];
    
}
- (void)viewDidLoad
{
    [self loadBackground];
    [super viewDidLoad];
	
	NSLog(@"bms=%@",bmsurl);
	
	NSString *countryCode = [[NSLocale currentLocale] objectForKey: NSLocaleCountryCode];
	NSLog(@"COUNTRY Detected=%@",countryCode);
	
	if ([countryCode isEqualToString:@"IN"]) {
		Bookmyshowbutton.alpha=1.0;
		Bookmyshowbutton.userInteractionEnabled=YES;
	}
	
	else{
		
		Bookmyshowbutton.alpha=0.0;
		Bookmyshowbutton.userInteractionEnabled=NO;
        
		
	}
    //    [self DesignHeader];
    
    
	
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
    
    [mainView addSubview:showTimeButtonOutlet];
    [mainView addSubview:todayShowTimeButtonReference];
    [mainView addSubview:tomorrowShowTimeButtonRefrence];
    
//    openFooerButton = [[UIButton alloc] initWithFrame:CGRectMake(143, 388, 35, 17)];
//  
//    UIImage *buttonImage1 = [[UIImage imageNamed:@"footer_down_btn.png"]  resizableImageWithCapInsets:UIEdgeInsetsMake(0, 16, 0, 16)];
//    [openFooerButton addTarget:self action:@selector(openFooter:) forControlEvents: UIControlEventTouchUpInside];
//    [openFooerButton setBackgroundImage:buttonImage1 forState:UIControlStateNormal];
//    
//    [self.view addSubview:openFooerButton];
    
    Bookmyshowbutton = [[UIButton alloc] initWithFrame:CGRectMake(62, 320, 197, 55)];
    
    UIImage *buttonImage2 = [[UIImage imageNamed:@"theater-bookmyshoe-icon.png"]  resizableImageWithCapInsets:UIEdgeInsetsMake(0, 16, 0, 16)];
    [Bookmyshowbutton addTarget:self action:@selector(bookMyShowButton:) forControlEvents: UIControlEventTouchUpInside];
    [Bookmyshowbutton setBackgroundImage:buttonImage2 forState:UIControlStateNormal];
    
    [self.view addSubview:Bookmyshowbutton];
    [self.view addSubview:_footerMainView];
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(8,235,236,47)];
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:@"Helvetica Neue Bold" size: 22.0];
    [label setFont:[UIFont boldSystemFontOfSize:22]];
    
    label.text = @"Today";
    [self.view addSubview:label];
    
    UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(8,273,236,47)];
    label1.textColor = [UIColor whiteColor];
    label1.backgroundColor = [UIColor clearColor];
    label1.font = [UIFont fontWithName:@"Helvetica Neue Bold" size: 22.0];
    [label1 setFont:[UIFont boldSystemFontOfSize:22]];
    
    label1.text = @"Tomorrow";
    [self.view addSubview:label1];
    
    UIImageView *image1 = [[UIImageView alloc]initWithFrame:CGRectMake(258, 247, 15, 20)];
    image1.image = [UIImage imageNamed:@"theater-arrow-yellow.png"];
     [self.view addSubview:image1];
    
    UIImageView *image2 = [[UIImageView alloc]initWithFrame:CGRectMake(258, 285, 15, 20)];
    image2.image = [UIImage imageNamed:@"theater-arrow-pink.png"];
    [self.view addSubview:image2];
}
-(IBAction)toRelApp:(UIButton *)sender
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Under construction" message:@"Check Back Soon" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    
}

-(void)back {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)openFooter:(id)sender {
    
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

    


-(void)loadBackground
{
    
    NSLog(@"ph=%@",Phone_no);
    mainView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 416)];
    mainView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"Theatre-bg.jpg"]];
    [self.view addSubview:mainView];
    [mainView release];
    
    theatre = [[[UILabel alloc] initWithFrame:CGRectMake(10,30,300,10)] autorelease];
    theatre.textColor = [UIColor blackColor];
    theatre.backgroundColor = [UIColor clearColor];
	theatre.adjustsFontSizeToFitWidth=YES;
    theatre.font = [UIFont fontWithName:@"Helvetica Neue, Bold" size: 20.8 ];
    [theatre setFont:[UIFont boldSystemFontOfSize:18]];
    [mainView addSubview:theatre];
    theatre.text = selectedTheater;
    [theatre sizeToFit];
    
    UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(150,50,70,20)];
    label1.textColor = [UIColor whiteColor];
    label1.backgroundColor = [UIColor clearColor];
    label1.font = [UIFont fontWithName:@"Helvetica Neue Bold" size: 30.0];
    [label1 setFont:[UIFont boldSystemFontOfSize:18]];
    label1.text = @"Address : ";
    [label1 sizeToFit];
    [mainView addSubview:label1];
    
    th_addres = [[[UILabel alloc] initWithFrame:CGRectMake(150,70,175,60)] autorelease];
    th_addres	.font = [UIFont fontWithName:@"Helvetica Neue, Regular" size: 17];
    [th_addres setFont:[UIFont boldSystemFontOfSize:12]];
    th_addres	.backgroundColor	=	[UIColor clearColor];
    th_addres	.textColor        = [UIColor whiteColor];
    th_addres.lineBreakMode = UILineBreakModeWordWrap;
    th_addres.numberOfLines = 3;
    [mainView addSubview:th_addres];
    
    th_addres.text = Theater_Address;
    
    
    rating = [[UIImageView  alloc]initWithFrame:CGRectMake(9, 130, 302, 25)];
    //rating.image= [UIImage imageNamed:@"rating-bar.png"];
    rating.userInteractionEnabled=YES;
    [mainView addSubview:rating];
    [rating release];
    
    int u=0;
    for (int j=0; j<5; j++) {
        
        STARIMAGE[j]  = [[UIImageView alloc] initWithFrame:CGRectMake(147,0, 20,22)];
        
        STARIMAGE[j].userInteractionEnabled=YES;
        STARIMAGE[j].image = [UIImage imageNamed:@"theater-yellow-star.png"];
        STARIMAGE[4].image = [UIImage imageNamed:@"theater-yellow-star.png"];
        
        [rating addSubview:STARIMAGE[j]];
        [STARIMAGE[j] release];
        
        if ([rate isEqualToString:@"4"]) {
            STARIMAGE[j].image = [UIImage imageNamed:@"theater-yellow-star.png"];
            STARIMAGE[4].image = [UIImage imageNamed:@"theater-yellow-star.png"];
            
            
        }
        if ([rate isEqualToString:@"3"]) {
            STARIMAGE[j].image = [UIImage imageNamed:@"theater-yellow-star.png"];
            STARIMAGE[4].image = [UIImage imageNamed:@"theater-yellow-star.png"];
            STARIMAGE[3].image = [UIImage imageNamed:@"theater-yellow-star.png"];
        }
        
        
        if ([rate isEqualToString:@"2"]) {
            STARIMAGE[j].image = [UIImage imageNamed:@"theater-yellow-star.png"];
            STARIMAGE[4].image = [UIImage imageNamed:@"theater-yellow-star.png"];
            STARIMAGE[3].image = [UIImage imageNamed:@"theater-yellow-star.png"];
            STARIMAGE[2].image = [UIImage imageNamed:@"theater-yellow-star.png"];
        }
        
        if ([rate isEqualToString:@""]) {
            STARIMAGE[j].image = [UIImage imageNamed:@"theater-yellow-star.png"];
            STARIMAGE[4].image = [UIImage imageNamed:@"theater-yellow-star.png"];
            STARIMAGE[3].image = [UIImage imageNamed:@"theater-yellow-star.png"];
            
            STARIMAGE[2].image = [UIImage imageNamed:@"theater-yellow-star.png"];
        }
        
        u+=22;
    }
	
    
	
    
    UIImage *SubmitImage=[UIImage imageNamed:@"map-thumb2.png"];
    
    loadmap				= [UIButton buttonWithType:UIButtonTypeCustom];
	loadmap.frame		= CGRectMake(5, 43, 109, 101);
	//loadmap.center		= CGPointMake(240+1, 250);
	[loadmap setBackgroundImage:SubmitImage forState:UIControlStateNormal];
	[loadmap addTarget:self action:@selector(navigateToMap) forControlEvents:UIControlEventTouchUpInside];
	[mainView  addSubview:loadmap];
    
    
    
    
    
    
    UIImageView* scheduleBackground					= [[UIImageView alloc] initWithFrame:CGRectMake(3, 180+25, 302, 157)];
    scheduleBackground.image = [UIImage imageNamed:@"show-timings2-2.png"];
    scheduleBackground.userInteractionEnabled=YES;
    [mainView addSubview:scheduleBackground];
    [scheduleBackground release];
    
    
	UIButton* Back_btntocancel					= [UIButton buttonWithType:UIButtonTypeCustom];
	Back_btntocancel.frame			= CGRectMake(302-115, 4, 102, 36);
	
	Back_btntocancel.userInteractionEnabled=YES;
	[Back_btntocancel setBackgroundImage:[UIImage imageNamed:@"bookmyshow-2-1.png"] forState:UIControlStateNormal];
	[Back_btntocancel setBackgroundImage:[UIImage imageNamed:@"bookmyshow-2-1.png"] forState:UIControlStateHighlighted];
    
	//Back_btntocancel.backgroundColor = [UIColor greenColor];
	[Back_btntocancel addTarget:self action:@selector(loadsafari) forControlEvents:UIControlEventTouchUpInside];
	//[tracker_ trackEventWithCategory:@"uiAction" withAction:@selector(loadsafari)  withLabel:Back_btntocancel  withValue:[NSNumber numberWithInt:100]];
	
	[scheduleBackground addSubview:Back_btntocancel];
    
    UILabel* Timing = [[[UILabel alloc] initWithFrame:CGRectMake(110,40,302-110,157-50)] autorelease];
    Timing	.font = [UIFont fontWithName:@"Helvetica Neue, Regular" size: 14.58];
    Timing	.backgroundColor	=	[UIColor clearColor];
    Timing	.textColor        = [self colorWithHexString:@"2b2828"];
    Timing.lineBreakMode = UILineBreakModeWordWrap;
    Timing.adjustsFontSizeToFitWidth=YES;
    Timing.numberOfLines = 5;
    // [scheduleBackground addSubview:Timing];
    
    Timing.text = [NSString stringWithFormat:@"Today:%@",time1];
    
    
	
	Bookmyshowbutton.frame = CGRectMake(57, 325, 206, 54);
	[self.view addSubview:Bookmyshowbutton];
	[self.view addSubview:_footerMainView];
    
    
}
-(IBAction)BookMyShow:(id)sender
{
	
    //	[[GAI sharedInstance].defaultTracker sendEventWithCategory:@"Book-My-Show-Button"
    //										   withAction:@"Book-My-ShowTapped"
    //										    withLabel:@"Book-Show"
    //										    withValue:nil];
    //
    //
    //
    //	iphone5Bookmyshow *loginViewController = [[iphone5Bookmyshow alloc] initWithNibName:@"iphone5Bookmyshow" bundle:nil];
    //	loginViewController.bmsurl=bmsurl;
    //	[self.navigationController pushViewController:loginViewController animated:NO];
	
}
-(void)loadsafari
{
	NSLog(@"touched");
	GlobalClass *obj=[GlobalClass getInstance];
    if (obj.Bookmyshow!=nil) {
        // Get the specific point that was touched
        //	CGPoint point = [sender locationInView:self.view];
		//NSString *str ;
		
		NSLog(@"str=%@",obj.Bookmyshow);
        NSLog(@"safari");
        for (NSDictionary *Feeds in obj.Bookmyshow){
            
			NSString *str = [Feeds objectForKey:@"bookmyshow_link"];
            NSString *url = [ NSString stringWithFormat:@"%@",str];
            
            
            //NSLog(@"ss=%@",str);
            
            //NSString	*str = [NSString stringWithFormat:@"http://in.bookmyshow.com/movies/Life-Of-Pi-"];
			[[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
            
            
            
        }
    }
    
    else
    {
        
    }
	
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

-(void)navigateToMap
{
    NSString* addr = [NSString stringWithFormat:@"http://maps.google.com/maps?saddr=%@,%@&daddr=%@,%@",current_latitude,current_longitude,Theater_latitude,Theater_longitude];
    NSURL* url = [[NSURL alloc] initWithString:[addr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [[UIApplication sharedApplication] openURL:url];
    [url release];
}

- (void)viewDidUnload
{
    [self setShowTimeButtonOutlet:nil];
    [self setTodayShowTimeButtonReference:nil];
    [self setTomorrowShowTimeButtonRefrence:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    [openFooerButton release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



- (IBAction)todayShowTimeButton:(UIButton *)sender {
    NSLog(@"HELLO BUTTON 1");
   // int a = [sender tag];
        iPhone4TheaterShowTimeViewController *showTimeVC = [[iPhone4TheaterShowTimeViewController alloc]initWithShowTiming:time1];
        showTimeVC.showTimeTag = [sender tag];
    NSLog(@"sender tag1 = %d",[sender tag]);
       showTimeVC.theaterName = selectedTheater;
   	showTimeVC.bmsurl=bmsurl;
  //  showTimeVC.tomorowtime = tomorowtime;
       [self.navigationController pushViewController:showTimeVC animated:YES];
    
}

- (IBAction)tomorrowShowTimeButton:(UIButton *)sender {
    NSLog(@"HELLO BUTTON 2");
        iPhone4TheaterShowTimeViewController *showTimeVC = [[iPhone4TheaterShowTimeViewController alloc]initWithShowTiming:tomorowtime];
        showTimeVC.showTimeTag = [sender tag];
      NSLog(@"sender tag2 = %d",[sender tag]);
         showTimeVC.theaterName = selectedTheater;
    	showTimeVC.bmsurl=bmsurl;
    //showTimeVC.tomorowtime = tomorowtime;
     [self.navigationController pushViewController:showTimeVC animated:YES];
    
}

- (IBAction)bookMyShowButton:(id)sender {
    NSLog(@"BMS");
    GlobalClass     *obj=[GlobalClass getInstance];
    NSString *url = [NSString stringWithFormat:@"%@",obj.bms_link];
    
    
    //NSLog(@"ss=%@",str);
    
    //NSString	*str = [NSString stringWithFormat:@"http://in.bookmyshow.com/movies/Life-Of-Pi-"];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    
    

}

@end
