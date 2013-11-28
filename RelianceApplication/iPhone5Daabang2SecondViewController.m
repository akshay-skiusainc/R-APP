//
//  Daabang2SecondViewController.m
//  Dabaang2
//
//  Created by Javed Sunesra on 7/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "iPhone5Daabang2SecondViewController.h"
#import "iPhone5InSingleTheather.h"
#import "Merchandise.h"
#import "iphone5Settings.h"
#import "iphone5GroupViewController.h"

#define kGeoCodingString @"http://maps.google.com/maps/geo?q=%f,%f&output=csv"
@interface iPhone5Daabang2SecondViewController ()

@end

@implementation iPhone5Daabang2SecondViewController
@synthesize mapView,backGroundView,flipButton,doneButton,tableview,menuTableView,Theater_array,Theater_Add_array,Theater_latitude,Theater_Longitude,footerView,merchandiseButton,chatButton,myProfileButton,relianceButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
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
- (void) viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
}

-(void)DesignHeader
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
        
        
//        if ([self.navigationController.navigationBar respondsToSelector:@selector( setBackgroundImage:forBarMetrics:)])
//        {
            [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"home_header_bg.jpg"] forBarMetrics:UIBarMetricsDefault];
            
//        }
        
        
//        UILabel * label = [[[UILabel alloc] initWithFrame:CGRectMake(0,0,45,45)] autorelease];
//        label.textColor = [UIColor whiteColor];
//        label.backgroundColor = [UIColor clearColor]; 
//        label.font = [UIFont fontWithName:@"Helvetica Neue Bold" size: 20.0];
//        [label setFont:[UIFont boldSystemFontOfSize:20]];
//        
//        label.text = self.navigationItem.title;
//        self.navigationItem.titleView = label;
//        [label sizeToFit];
//      	    
//	    self.navigationItem.title=@"Theater List";
    }
    
    
    
}


- (void)viewDidLoad
{
    
    [super viewDidLoad];
    NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"app_bg_image"];
    UIImage* app_bg_image = [UIImage imageWithData:imageData];
    self.view.backgroundColor = [UIColor colorWithPatternImage:app_bg_image];
    
    footerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"footer_bg.png"]];
	//self.trackedViewName=@"Theaters Screen";

    //[self DesignHeader];
    
//    ads *loginViewController = [[ads alloc] initWithNibName:@"ads" bundle:nil];
//    [self presentModalViewController:loginViewController animated:YES]; 
//   // [loginViewController loadSkip];
//    [loginViewController release];
    
    
	//GlobalClass *obj1=[GlobalClass getInstance];
	
			
    if([_TAG isEqual: @"LEFT"])
    {
        
    }
    else
    {
        UIImage *buttonImage = [UIImage imageNamed:@"back-btn.png"];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:buttonImage forState:UIControlStateNormal];
        button.frame = CGRectMake(0, 0, buttonImage.size.width, buttonImage.size.height);
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        self.navigationItem.leftBarButtonItem = customBarItem;
        
    }

//    UIImage *relAppImage = [UIImage imageNamed:@"home_right_rel_icon.png"];
//    UIButton *buttonChat = [UIButton buttonWithType:UIButtonTypeCustom];
//    [buttonChat setImage:relAppImage forState:UIControlStateNormal];
//    buttonChat.frame = CGRectMake(0, 0, relAppImage.size.width, relAppImage.size.height);
//    [buttonChat addTarget:self action:@selector(toRelApp:) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *customBarItem1 = [[UIBarButtonItem alloc] initWithCustomView:buttonChat];
//    self.navigationItem.RightBarButtonItem = customBarItem1;

    
    u=0;
    BOOL result = [CLLocationManager locationServicesEnabled];
    
    if (result) {
        NSLog(@"enable");
    } else  {
        NSLog(@"Location services disabled");
    }
    
    [self performSelector:@selector(flipAction:) withObject:nil	afterDelay:0.0];
    
    Theater_array = [[NSMutableArray alloc] initWithCapacity:100];
    Theater_Add_array = [[NSMutableArray alloc] initWithCapacity:100];
    Theater_latitude = [[NSMutableArray alloc] initWithCapacity:100];
    Theater_Longitude = [[NSMutableArray alloc] initWithCapacity:100];
    
    
    //[[self navigationController] setNavigationBarHidden:NO animated:YES];
    
    currentLocation = [[CLLocationManager alloc]init];
	currentLocation.desiredAccuracy = kCLLocationAccuracyBest;
	currentLocation.delegate = self;
	[currentLocation startUpdatingLocation];
    
    
    backGroundView = [[UIView alloc] initWithFrame:self.view.bounds];
	[self.view addSubview:backGroundView];
    
    [backGroundView addSubview:mapView];
    
    backGroundView.alpha=0.0;
    
    
    
    UIButton* infoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    infoButton.frame= CGRectMake(0,0,40,40);
    
    [infoButton setBackgroundImage:[UIImage imageNamed:@"list_icon.png"] forState:UIControlStateNormal];
	[infoButton addTarget:self action:@selector(flipAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:infoButton];
	flipButton = [[UIBarButtonItem alloc] initWithCustomView:infoButton];
	self.navigationItem.rightBarButtonItem = flipButton;
    
//     UIButton* openFooerButton = [[UIButton alloc] initWithFrame:CGRectMake(143, 497, 35, 17)];
//    
//    UIImage *buttonImage1 = [[UIImage imageNamed:@"footer_down_btn.png"]  resizableImageWithCapInsets:UIEdgeInsetsMake(0, 16, 0, 16)];
//    [openFooerButton addTarget:self action:@selector(openFooter:) forControlEvents: UIControlEventTouchUpInside];
//    [openFooerButton setBackgroundImage:buttonImage1 forState:UIControlStateNormal];
//    
//    [self.view addSubview:openFooerButton];

    
//    ImageBck = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320,548)];
//    ImageBck.image  = [UIImage imageNamed:@"home_main_bg.jpg"];
//    ImageBck.userInteractionEnabled=YES;
//    //  ImageBck.backgroundColor= [UIColor blueColor];
//    [tableview addSubview:ImageBck];
//    [ImageBck release];
		

    
    ActIndImage = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,320,548)];
  //  ActIndImage.center = CGPointMake(320/2, 460/2);
	ActIndImage.image = [UIImage imageNamed:@"home_main_bg.jpg"];
    ActIndImage.opaque=0.5;
	[self.view addSubview:ActIndImage];
	[ActIndImage release];
    
    activityIndicator = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 70, 70)];
	activityIndicator.center=CGPointMake(320/2, 548/2);
    activityIndicator.transform = CGAffineTransformMakeScale(2.0, 2.0);
	[activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
	[ActIndImage addSubview:activityIndicator];
    
    Map_Annotaions = [[NSMutableArray alloc]initWithCapacity:10];
    
    
    ActIndImage.alpha=1.0;
    [activityIndicator startAnimating];
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(100,0,236,47)];
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:@"Helvetica Neue Bold" size: 22.0];
    [label setFont:[UIFont boldSystemFontOfSize:22]];
    
    label.text = @"Theater List";
    [self.view addSubview:label];
    
    
//    footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 524, 320, 57)];
//    footerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"footer_bg.png"]];
//    
//    relianceButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 6, 105, 44)];
//    [relianceButton addTarget:self action:@selector(toRelApp:) forControlEvents: UIControlEventTouchUpInside];
//    [relianceButton setBackgroundImage:[UIImage imageNamed:@"home_right_rel_icon.png"] forState:UIControlStateNormal];
//    
//    [footerView addSubview:relianceButton];
//    
//    
//    merchandiseButton = [[UIButton alloc] initWithFrame:CGRectMake(116, 7, 76, 42)];
//    [merchandiseButton addTarget:self action:@selector(merchandise:) forControlEvents: UIControlEventTouchUpInside];
//    [merchandiseButton setBackgroundImage:[UIImage imageNamed:@"merchandise.png"] forState:UIControlStateNormal];
//    
//    [footerView addSubview:merchandiseButton];
//    
//    chatButton = [[UIButton alloc] initWithFrame:CGRectMake(194, 7, 41, 42)];
//    [chatButton addTarget:self action:@selector(chat:) forControlEvents: UIControlEventTouchUpInside];
//    [chatButton setBackgroundImage:[UIImage imageNamed:@"chat.png"] forState:UIControlStateNormal];
//    
//    [footerView addSubview:chatButton];
//    
//    myProfileButton = [[UIButton alloc] initWithFrame:CGRectMake(250, 7, 62, 42)];
//    [myProfileButton addTarget:self action:@selector(myProfile:) forControlEvents: UIControlEventTouchUpInside];
//    [myProfileButton setBackgroundImage:[UIImage imageNamed:@"myprofile.png"] forState:UIControlStateNormal];
//    
//    [footerView addSubview:myProfileButton];
//    
//    
//    UIImageView *devideimage = [[UIImageView alloc]initWithFrame:CGRectMake(186, 5, 6, 45)];
//    devideimage.image = [UIImage imageNamed:@"divder.png"];
//    [footerView addSubview:devideimage];
//    
//    UIImageView *devideimage1 = [[UIImageView alloc]initWithFrame:CGRectMake(243, 5, 6, 45)];
//    devideimage1.image = [UIImage imageNamed:@"divder.png"];
//    [footerView addSubview:devideimage1];
//    
//    [self.view addSubview:footerView];
    
	// create our done button as the nav bar's custom right view for the flipped view (used later)
	//doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction
    //                                             target:self action:@selector(flipAction:)];
    //  [doneButton setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    
//    UIImage *buttonImage = [UIImage imageNamed:@"map_icon.png"];
//    UIButton *aButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [aButton setImage:buttonImage forState:UIControlStateNormal];
//    
//    aButton.frame = CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height);
//    doneButton = [[UIBarButtonItem alloc] initWithCustomView:aButton];
//     [aButton addTarget:self action:@selector(flipAction:) forControlEvents:UIControlEventTouchUpInside];
//	UIButton* infoButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
//	infoButton1.frame= CGRectMake(0,0,42,35);
	
//	[infoButton1 setBackgroundImage:[UIImage imageNamed:@"refresh_icon.png"] forState:UIControlStateNormal];
//	[infoButton1 addTarget:self action:@selector(refreshTheaters) forControlEvents:UIControlEventTouchUpInside];
//	[self.view addSubview:infoButton1];
//	UIBarButtonItem* RefreshButton = [[UIBarButtonItem alloc] initWithCustomView:infoButton1];
	//self.navigationItem.leftBarButtonItem = RefreshButton;

	
	

	
	// Do any additional setup after loading the view, typically from a nib.
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
-(void)back {
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)refreshTheaters
{
	for (int i=0; i<TotalNumOfRows; i++) {
		
		
		TA[i]=nil;
		rating[i]=nil;
		rating[i]=nil;

		th_name[i]=nil;
		TN[i]=nil;
		NearbyTheatersList[i]=nil;
		Time[i]=nil;

		rating[i]=nil;

		
		 for (int j=0; j<5; j++) {
		
		if (STARIMAGE[j]!=nil) {
			[STARIMAGE[j] removeFromSuperview];
			STARIMAGE[j]=nil;
		}
			 
		 }
		if (ImagePatch[i]!=nil) {
			[ImagePatch[i] removeFromSuperview];
			ImagePatch[i]=nil;
		}

	}
//	if (VideoScroller!=nil) {
//		[VideoScroller removeFromSuperview];
//		VideoScroller=nil;
	//}
	u=0;
	currentLocation = [[CLLocationManager alloc]init];
	currentLocation.desiredAccuracy = kCLLocationAccuracyBest;
	currentLocation.delegate = self;
	[currentLocation startUpdatingLocation];
	
	
	ActIndImage.alpha=1.0;
	[activityIndicator startAnimating];


}
-(void)loaddata
{
   
    //    NSString *urltosearch= [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/textsearch/json?query=movie_theater+in+Sydney Point, Wai-Panchgani Road,, Panchgani 412 805, MH, India&sensor=true&key=AIzaSyD7kd_RqqDlWMDip1aG8QZ-WRfyonwgirY"];
    //    
    //   // [self showCurrentLoc];
    //    //  NSString *urltosearch= [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/textsearch/json?query=movie_theater+in+%@&sensor=true&key=  AIzaSyDh_8wBel6x8vT4KPh629ZZFHLCD93K3hI",locationString];
    //    
    //    
    //    
    //    NSLog(@"post=%@",urltosearch);
    //    
    //    NSString *strURL = [urltosearch stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //    
    //    [self FetchTheater:strURL];
    
}


-(void)loadAllAnnotations
{
    for (int T=0; T<=7; T++) {
        countra[T]=T;
        NSLog(@"LT-Anno %f",TLat[T]);
    }
    
    {
        
		CLLocationCoordinate2D coordinate;
		coordinate.latitude = TLat[0];
		coordinate.longitude = TLon[0];
		Annotation2* annotation = [[Annotation2 alloc]initWithCoordinate:coordinate andID:countra[1]];
		annotation.title = TN[0];
		annotation.subtitle =TA[0];
		
		[Map_Annotaions insertObject:annotation atIndex:countra[1]];
        [mapView addAnnotation:annotation];
        
		[annotation release];
	}
    
    {
		CLLocationCoordinate2D coordinate;
		coordinate.latitude = TLat[1];
		coordinate.longitude = TLon[1];
		Annotation3* annotation = [[Annotation3 alloc]initWithCoordinate:coordinate andID:countra[2]];
		annotation.title = TN[1];
		annotation.subtitle =TA[1];
		
		[Map_Annotaions insertObject:annotation atIndex:countra[2]];
        [mapView addAnnotation:[Map_Annotaions objectAtIndex:countra[2]]];
        
		[annotation release];
	}
    {
		CLLocationCoordinate2D coordinate;
		coordinate.latitude = TLat[2];
		coordinate.longitude = TLon[2];
		Annotation4* annotation = [[Annotation4 alloc]initWithCoordinate:coordinate andID:countra[3]];
		annotation.title = TN[2];
		annotation.subtitle =TA[2];
		
		[Map_Annotaions insertObject:annotation atIndex:countra[3]];
        [mapView addAnnotation:[Map_Annotaions objectAtIndex:countra[3]]];
        
		[annotation release];
	}
    {
		CLLocationCoordinate2D coordinate;
		coordinate.latitude = TLat[3];
		coordinate.longitude = TLon[3];
		Annotation5* annotation = [[Annotation5 alloc]initWithCoordinate:coordinate andID:countra[4]];
		annotation.title = TN[3];
		annotation.subtitle =TA[3];
		
		[Map_Annotaions insertObject:annotation atIndex:countra[4]];
        [mapView addAnnotation:[Map_Annotaions objectAtIndex:countra[4]]];
        
		[annotation release];
	}
    {
		CLLocationCoordinate2D coordinate;
		coordinate.latitude = TLat[4];
		coordinate.longitude = TLon[4];
		Annotation6* annotation = [[Annotation6 alloc]initWithCoordinate:coordinate andID:countra[5]];
		annotation.title = TN[4];
		annotation.subtitle =TA[4];
		
		[Map_Annotaions insertObject:annotation atIndex:countra[5]];
        [mapView addAnnotation:[Map_Annotaions objectAtIndex:countra[5]]];
        
		[annotation release];
	}
    {
		CLLocationCoordinate2D coordinate;
		coordinate.latitude = TLat[5];
		coordinate.longitude = TLon [5];
		Annotation7* annotation = [[Annotation7 alloc]initWithCoordinate:coordinate andID:countra[6]];
		annotation.title = TN[5];
		annotation.subtitle =TA[5];
		
		[Map_Annotaions insertObject:annotation atIndex:countra[6]];
        [mapView addAnnotation:[Map_Annotaions objectAtIndex:countra[6]]];
        
		[annotation release];
	}
    
    {
		CLLocationCoordinate2D coordinate;
		coordinate.latitude = TLat[6];
		coordinate.longitude = TLon [6];
		Annotation8* annotation = [[Annotation8 alloc]initWithCoordinate:coordinate andID:countra[7]];
		annotation.title = TN[6];
		annotation.subtitle =TA[6];
		
		[Map_Annotaions insertObject:annotation atIndex:countra[7]];
        [mapView addAnnotation:[Map_Annotaions objectAtIndex:countra[7]]];
        
		[annotation release];
	}
    
    
    
    
    
    {
		CLLocationCoordinate2D coordinate;
		coordinate.latitude = TLat[7];
		coordinate.longitude = TLon [7];
		Annotation9* annotation = [[Annotation9 alloc]initWithCoordinate:coordinate andID:countra[8]];
		annotation.title = TN[7];
		annotation.subtitle =TA[7];
		
		[Map_Annotaions insertObject:annotation atIndex:countra[8]];
        [mapView addAnnotation:[Map_Annotaions objectAtIndex:countra[8]]];
        
		[annotation release];
	}
    
    {
		CLLocationCoordinate2D coordinate;
		coordinate.latitude = TLat[8];
		coordinate.longitude = TLon [8];
		Annotation10* annotation = [[Annotation10 alloc]initWithCoordinate:coordinate andID:countra[9]];
		annotation.title = TN[8];
		annotation.subtitle =TA[8];
		
		[Map_Annotaions insertObject:annotation atIndex:countra[9]];
        [mapView addAnnotation:[Map_Annotaions objectAtIndex:countra[9]]];
        
		[annotation release];
	}
    
    
    {
		CLLocationCoordinate2D coordinate;
		coordinate.latitude = TLat[9];
		coordinate.longitude = TLon [9];
		Annotation11* annotation = [[Annotation11 alloc]initWithCoordinate:coordinate andID:countra[10]];
		annotation.title = TN[9];
		annotation.subtitle =TA[9];
		
		[Map_Annotaions insertObject:annotation atIndex:countra[10]];
        [mapView addAnnotation:[Map_Annotaions objectAtIndex:countra[10]]];
        
		[annotation release];
	}
    
    
    {
		CLLocationCoordinate2D coordinate;
		coordinate.latitude = TLat[10];
		coordinate.longitude = TLon [10];
		Annotation12* annotation = [[Annotation12 alloc]initWithCoordinate:coordinate andID:countra[11]];
		annotation.title = TN[10];
		annotation.subtitle =TA[10];
		
		[Map_Annotaions insertObject:annotation atIndex:countra[11]];
        [mapView addAnnotation:[Map_Annotaions objectAtIndex:countra[11]]];
        
		[annotation release];
	}
    
    
    
    {
		CLLocationCoordinate2D coordinate;
		coordinate.latitude = TLat[11];
		coordinate.longitude = TLon [11];
		Annotation13* annotation = [[Annotation13 alloc]initWithCoordinate:coordinate andID:countra[12]];
		annotation.title = TN[11];
		annotation.subtitle =TA[11];
		
		[Map_Annotaions insertObject:annotation atIndex:countra[12]];
        [mapView addAnnotation:[Map_Annotaions objectAtIndex:countra[12]]];
        
		[annotation release];
	}
    
    
    
    {
		CLLocationCoordinate2D coordinate;
		coordinate.latitude = TLat[12];
		coordinate.longitude = TLon [12];
		Annotation14* annotation = [[Annotation14 alloc]initWithCoordinate:coordinate andID:countra[13]];
		annotation.title = TN[12];
		annotation.subtitle =TA[12];
		
		[Map_Annotaions insertObject:annotation atIndex:countra[13]];
        [mapView addAnnotation:[Map_Annotaions objectAtIndex:countra[13]]];
        
		[annotation release];
	}
    
    
    
    {
		CLLocationCoordinate2D coordinate;
		coordinate.latitude = TLat[13];
		coordinate.longitude = TLon [13];
		Annotation15* annotation = [[Annotation15 alloc]initWithCoordinate:coordinate andID:countra[14]];
		annotation.title = TN[13];
		annotation.subtitle =TA[13];
		
		[Map_Annotaions insertObject:annotation atIndex:countra[14]];
        [mapView addAnnotation:[Map_Annotaions objectAtIndex:countra[14]]];
        
		[annotation release];
	}
    
    
    
    {
		CLLocationCoordinate2D coordinate;
		coordinate.latitude = TLat[14];
		coordinate.longitude = TLon [14];
		Annotation16* annotation = [[Annotation16 alloc]initWithCoordinate:coordinate andID:countra[15]];
		annotation.title = TN[14];
		annotation.subtitle =TA[14];
		
		[Map_Annotaions insertObject:annotation atIndex:countra[15]];
        [mapView addAnnotation:[Map_Annotaions objectAtIndex:countra[15]]];
        
		[annotation release];
	}
    
    
    
    {
		CLLocationCoordinate2D coordinate;
		coordinate.latitude = TLat[15];
		coordinate.longitude = TLon [15];
		Annotation17* annotation = [[Annotation17 alloc]initWithCoordinate:coordinate andID:countra[16]];
		annotation.title = TN[15];
		annotation.subtitle =TA[15];
		
		[Map_Annotaions insertObject:annotation atIndex:countra[16]];
        [mapView addAnnotation:[Map_Annotaions objectAtIndex:countra[16]]];
        
		[annotation release];
	}
    
    
    
    
    {
		CLLocationCoordinate2D coordinate;
		coordinate.latitude = TLat[16];
		coordinate.longitude = TLon [16];
		Annotation18* annotation = [[Annotation18 alloc]initWithCoordinate:coordinate andID:countra[17]];
		annotation.title = TN[16];
		annotation.subtitle =TA[16];
		
		[Map_Annotaions insertObject:annotation atIndex:countra[17]];
        [mapView addAnnotation:[Map_Annotaions objectAtIndex:countra[17]]];
        
		[annotation release];
	}
    
    
    
    
    {
		CLLocationCoordinate2D coordinate;
		coordinate.latitude = TLat[17];
		coordinate.longitude = TLon[17];
		Annotation19* annotation = [[Annotation19 alloc]initWithCoordinate:coordinate andID:countra[17]];
		annotation.title = TN[17];
		annotation.subtitle =TA[17];
		
		[Map_Annotaions insertObject:annotation atIndex:countra[17]];
        [mapView addAnnotation:[Map_Annotaions objectAtIndex:countra[17]]];
        
		[annotation release];
	}
    
    
    {
		CLLocationCoordinate2D coordinate;
		coordinate.latitude = TLat[18];
		coordinate.longitude = TLon [18];
		Annotation20* annotation = [[Annotation20 alloc]initWithCoordinate:coordinate andID:countra[18]];
		annotation.title = TN[18];
		annotation.subtitle =TA[18];
		
		[Map_Annotaions insertObject:annotation atIndex:countra[18]];
        [mapView addAnnotation:[Map_Annotaions objectAtIndex:countra[18]]];
        
		[annotation release];
	}
    
    
    NSLog(@"Mapan-=%@",Map_Annotaions);
    
}


-(void)displayallannotations
{
    for (int i = 1; i<9; i++) {
        
        
        [mapView addAnnotation:[Map_Annotaions objectAtIndex:i]];
    }
    
    
}

#pragma mark - UITableViewDatasource and UITableViewDelegate Methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 99.0;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


//RootViewController.m
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [Theater_array count];
}
//RootViewController.m
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    
    
    // NSString *cellValue = [Theater_array objectAtIndex:indexPath.row];
    cell.textLabel.text = [Theater_array objectAtIndex:indexPath.row];
    
    return cell;
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    NSString *selectedTheater= [Theater_array objectAtIndex:indexPath.row];
//    NSString *Theater_Address= [Theater_Add_array objectAtIndex:indexPath.row];
//    NSString* Theater_latitude1= [Theater_latitude objectAtIndex:indexPath.row];
//    NSString* Theater_Longitude1= [Theater_Longitude objectAtIndex:indexPath.row];
    
    
//    TheaterDetails *dvController = [[TheaterDetails alloc] initWithNibName:@"TheaterDetails" bundle:[NSBundle mainBundle]];
//	dvController.selectedTheater = selectedTheater;
//    dvController.Theater_Address = Theater_Address;
//    dvController.Theater_latitude = Theater_latitude1;
//    dvController.Theater_longitude = Theater_Longitude1;
//    dvController.current_latitude = CurrentLatitude;
//    dvController.current_longitude = CurrentLongitude;
//    
//	[self.navigationController pushViewController:dvController animated:YES];
//	[dvController release];
//	dvController = nil;
}

//- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath {
//    
//    return UITableViewCellAccessoryDisclosureIndicator;
//}

//- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
//    
//    [self tableView:tableView didSelectRowAtIndexPath:indexPath];
//}

-(void)DisplayTheater
{
    
    
    
    
}


- (void)flipAction:(id)sender
{
    
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(animationDidStop:animationIDfinished:finished:context:)];
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.5];
	
    
	[UIView setAnimationTransition:([self.mapView superview] ?
									UIViewAnimationTransitionFlipFromLeft : UIViewAnimationTransitionFlipFromRight)
                           forView:backGroundView cache:YES];
                        if ([tableview superview])
                           {
                               [tableview removeFromSuperview];
                               [backGroundView addSubview:self.mapView];
                           }
                           else
                           {
                               [self.mapView removeFromSuperview];
                               [backGroundView addSubview:tableview];
                           }
	
	[UIView commitAnimations];
	
	// adjust our done/info buttons accordingly
	if ([tableview superview])
		self.navigationItem.rightBarButtonItem = doneButton;
	else
		self.navigationItem.rightBarButtonItem = flipButton;
    
    backGroundView.alpha=1.0;
}



- (void)showAnnotation
{
    //  Map_Annotaions = [[NSMutableArray alloc]initWithCapacity:4];
   	{
        
        MKCoordinateRegion region;
        region.center = theCoordinate;
        //        MKCoordinateSpan span;
        //        span.latitudeDelta = 0.10;
        //        span.longitudeDelta = 0.10;
        //        region.span=span;
        
        theCoordinate.latitude = theater_lat;
        theCoordinate.longitude = theater_lng;
        mapView.delegate=self;
        
        
		annotation1 *annotation = [[annotation1 alloc] initWithCoordinate:theCoordinate andID:0];
        
        
		annotation.title = THEATER_Name;
		annotation.subtitle =Theater_address;
        
		
		[Map_Annotaions insertObject:annotation atIndex:0];
        [mapView addAnnotation:[Map_Annotaions objectAtIndex:0]];
        
        
	}	
}


- (void)showCurrentLoc
{
   	{
        
        MKCoordinateRegion region;
        region.center = theCoordinate;
        MKCoordinateSpan span;
        mapView.delegate=self;
        span.latitudeDelta = 0.10;
        span.longitudeDelta = 0.10;
        region.span=span;
        [mapView setRegion:region animated:TRUE];
        //        theCoordinate.latitude = theater_lat;
        //        theCoordinate.longitude = theater_lng;
        
		
		annotation1 *annotation = [[annotation1 alloc] initWithCoordinate:theCoordinate andID:0];
        
        
		annotation.title = @"Your Location";
		annotation.subtitle =locationString;
        
		
		[Map_Annotaions insertObject:annotation atIndex:0];
        //  [mapView addAnnotation:[Map_Annotaions objectAtIndex:0]];
        
        
	}	
}

-(void)FetchTheater:(NSString *)urlString
{
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:urlString] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:5.0];
    
    //    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    //    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:urlString]]];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Current-Type"];
    NSError *errorReturned = nil;
    NSURLResponse *theResponse =[[NSURLResponse alloc]init];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&theResponse error:&errorReturned];
    
    if (errorReturned) {
        NSLog(@"errorReturned=%@",errorReturned);
        
        //        UIAlertView *alert = [[UIAlertView alloc]
        //                              initWithTitle: @"OOps"
        //                              message: @"Something went wrong"\
        //                              delegate: nil
        //                              cancelButtonTitle:@"OK"
        //                              otherButtonTitles:nil];
        //        [alert show];
        //        [alert release];
        
        // Handle error.
    }
    else
    {
        //  NSError *jsonParsingError = nil;
        //     jsonArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers|NSJSONReadingAllowFragments error:&jsonParsingError];
        
        
        
        
        
        jsonArray = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding]; 
        
        NSLog(@"response==%@",jsonArray);
        
    }
    NSArray* responseDict = [(NSDictionary*)[jsonArray JSONValue] objectForKey:@"results"];
    
    //  NSArray* responseDict = [jsonArray objectForKey:@"results"];
    NSLog(@"DATA=%@",responseDict);
    int i=0;
    // int m=0;
	for (NSDictionary *map in responseDict){
       	//choose a random loan
        //  NSDictionary* map = [responseDict objectAtIndex:0];
        
        //fetch the data
        THEATER_Name = [map objectForKey:@"name"];
        NSLog(@"NAME=%@",THEATER_Name);
        Theater_address = [map objectForKey:@"formatted_address"]; 
        NSLog(@"address=%@",Theater_address);
        
        NSString* a1 = [(NSDictionary*)[map objectForKey:@"geometry"] objectForKey:@"location"]; 
        NSString *th_lat = [a1 objectForKey:@"lat"];
        NSString *th_lng = [a1 objectForKey:@"lng"];
        NSLog(@"th_lng=%@",th_lng);
        
        theater_lat = [th_lat floatValue];
        theater_lng = [th_lng floatValue];
        [Theater_array addObject: THEATER_Name];
        [Theater_Add_array addObject: Theater_address];
        [Theater_latitude addObject: th_lat];
        [Theater_Longitude addObject: th_lng];
        // [self showAnnotation];
        
        
        
        TLat[i] = [th_lat floatValue];
        TLon[i] = [th_lng floatValue];
        NSLog(@"LT=%f",TLat[i]);
        TN[i] = [map objectForKey:@"name"];
        TA[i]=[map objectForKey:@"formatted_address"]; 
        
        
        i++;
        
        
    }
    
    
    
    
    NumOfRows=i;
    NSLog(@"array=%@",Theater_array);
    
    
    
    if (NumOfRows<1) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Result"
                              message: @"There are No theaters in your Region"\
                              delegate: nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
        [alert release];
        
        
        //        [activityIndicator stopAnimating];
        //        ActIndImage.alpha=0.0;
        
        
    }
    [activityIndicator stopAnimating];
    ActIndImage.alpha=0.0;
    
 
    
    
    menuTableView = [[UITableView alloc] initWithFrame:self.view.bounds
                                                 style:UITableViewStyleGrouped];
    [menuTableView setBackgroundColor:[UIColor clearColor]] ;
    menuTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    menuTableView.autoresizingMask =  UIViewAutoresizingFlexibleWidth;
    menuTableView.dataSource = self;
    menuTableView.delegate = self;
    // menuTableView.hidden = YES;
    [tableview addSubview:menuTableView];
    
}


#pragma mark Location Manager Event

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{	
    NSLog(@"GGG");
    
	[currentLocation stopUpdatingLocation];	
    
    
	theCoordinate.latitude = newLocation.coordinate.latitude;
	theCoordinate.longitude = newLocation.coordinate.longitude;
    CurrentLatitude = [[NSString stringWithFormat:@"%f",newLocation.coordinate.latitude] retain];
    CurrentLongitude = [[NSString stringWithFormat:@"%f",newLocation.coordinate.longitude] retain];
    
    NSLog(@"currloc= %f",theCoordinate.longitude);
	
    [self getAddressFromLatLon:theCoordinate.latitude withLongitude:theCoordinate.longitude];
    
    NSString* post = [NSString stringWithFormat:@"http://maps.googleapis.com/maps/api/geocode/json?latlng=%f,%f&sensor=true",theCoordinate.latitude,theCoordinate.longitude];


  //  [self FetchCity:post];
    
    //  NSString *urltosearch= [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/textsearch/json?query=movie_theater+in+%@&sensor=true&key=  AIzaSyD7kd_RqqDlWMDip1aG8QZ-WRfyonwgirY",locationString];
    
    //  NSString *urltosearch= [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/textsearch/json?query=movie_theater+in+%@&sensor=true&key= AIzaSyCcGNzyanmtAAyNKQExGiP8tri8TDsqDv8",locationString];
    
    
    [self showCurrentLoc];
    NSString *urltosearch= [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/textsearch/json?query=movie_theater+in+%@&sensor=true&key=  AIzaSyDh_8wBel6x8vT4KPh629ZZFHLCD93K3hI",locationString];
    
    
    NSLog(@"urrl=%@",urltosearch);
    
    //  NSString *urltosearch= [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/textsearch/json?query=movie_theater+in+%@&sensor=true&key=AIzaSyA1JWMTvO9olvS1NzanU72Zqhr1AJUlAdU",locationString];
    
    
    NSLog(@"post=%@",urltosearch);
    
    NSString *strURL = [urltosearch stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    if (u==0) {
       // [self FetchTheater:strURL];
        
        [self GetLiveTheaters];
        //[self GetTheaterLinks];
        [self loadAllAnnotations];
         [self displayallannotations];
        
    }
    else {
        
    }
    
    u++;
    
}





- (MKAnnotationView *)mapView:(MKMapView *)sender viewForAnnotation:(id <MKAnnotation>)annotation
{
    
    NSLog(@"OKOKOKOKOKOK");
    // if it's the user location, just return nil.
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    // handle our two custom annotations
    //
    if ([annotation isKindOfClass:[annotation1 class]]) // for Golden Gate Bridge
    {
        // try to dequeue an existing pin view first
        static NSString* BridgeAnnotationIdentifier = @"annotation1Identifier";
        MKPinAnnotationView* pinView = (MKPinAnnotationView *)
        [mapView dequeueReusableAnnotationViewWithIdentifier:BridgeAnnotationIdentifier];
        if (!pinView)
        {
            // if an existing pin view was not available, create one
            MKPinAnnotationView* customPinView = [[[MKPinAnnotationView alloc]
                                                   initWithAnnotation:annotation reuseIdentifier:BridgeAnnotationIdentifier] autorelease];
            customPinView.pinColor = MKPinAnnotationColorGreen;
            customPinView.animatesDrop = YES;
            customPinView.canShowCallout = YES;
            
            
            
            
            
            // add a detail disclosure button to the callout which will open a new view controller page
            //
            // note: you can assign a specific call out accessory view, or as MKMapViewDelegate you can implement:
            //  - (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control;
            //
            return customPinView;
        }
        else
        {
            pinView.annotation = annotation;
        }
        return pinView;
    }
    else if ([annotation isKindOfClass:[Annotation2 class]])
    {
        static NSString* Annotation2Identifier = @"Annotation2Identifier";
        MKPinAnnotationView* pinView = (MKPinAnnotationView *)
		[mapView dequeueReusableAnnotationViewWithIdentifier:Annotation2Identifier];
        if (!pinView)
        {
            MKPinAnnotationView* customPinView = [[[MKPinAnnotationView alloc]
												   initWithAnnotation:annotation reuseIdentifier:Annotation2Identifier] autorelease];
            customPinView.pinColor = MKPinAnnotationColorRed;
            customPinView.animatesDrop = YES;
            customPinView.canShowCallout = YES;
            
            
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [rightButton addTarget:self
                            action:@selector(A1)
                  forControlEvents:UIControlEventTouchUpInside];
            customPinView.rightCalloutAccessoryView = rightButton;
            
            
            return customPinView;
        }
        else
        {
            pinView.annotation = annotation;
        }
        return pinView;
    }	
	
	
	else if ([annotation isKindOfClass:[Annotation3 class]])
    {
        static NSString* Annotation3Identifier = @"Annotation3Identifier";
        MKPinAnnotationView* pinView = (MKPinAnnotationView *)
		[mapView dequeueReusableAnnotationViewWithIdentifier:Annotation3Identifier];
        if (!pinView)
        {
            MKPinAnnotationView* customPinView = [[[MKPinAnnotationView alloc]
												   initWithAnnotation:annotation reuseIdentifier:Annotation3Identifier] autorelease];
            customPinView.pinColor = MKPinAnnotationColorRed;
            customPinView.animatesDrop = YES;
            customPinView.canShowCallout = YES;
            
            counter= 1;
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [rightButton addTarget:self
                            action:@selector(A2)
                  forControlEvents:UIControlEventTouchUpInside];
            customPinView.rightCalloutAccessoryView = rightButton;
            
            
			
            return customPinView;
        }
        else
        {
            pinView.annotation = annotation;
        }
        return pinView;
    }
	
    
    //hospitals
    
    
    
    else if ([annotation isKindOfClass:[Annotation4 class]])
    {
        static NSString* Annotation4Identifier = @"Annotation4Identifier";
        MKPinAnnotationView* pinView = (MKPinAnnotationView *)
		[mapView dequeueReusableAnnotationViewWithIdentifier:Annotation4Identifier];
        if (!pinView)
        {
            MKPinAnnotationView* customPinView = [[[MKPinAnnotationView alloc]
												   initWithAnnotation:annotation reuseIdentifier:Annotation4Identifier] autorelease];
            customPinView.pinColor = MKPinAnnotationColorRed;
            customPinView.animatesDrop = YES;
            customPinView.canShowCallout = YES;
			
            
            counter= 2;
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [rightButton addTarget:self
                            action:@selector(A3)
                  forControlEvents:UIControlEventTouchUpInside];
            customPinView.rightCalloutAccessoryView = rightButton;
            
            
            return customPinView;
        }
        else
        {
            pinView.annotation = annotation;
        }
        return pinView;
    }	
    
	else if ([annotation isKindOfClass:[Annotation5 class]])
    {
        static NSString* Annotation5Identifier = @"Annotation5Identifier";
        MKPinAnnotationView* pinView = (MKPinAnnotationView *)
		[mapView dequeueReusableAnnotationViewWithIdentifier:Annotation5Identifier];
        if (!pinView)
        {
            MKPinAnnotationView* customPinView = [[[MKPinAnnotationView alloc]
												   initWithAnnotation:annotation reuseIdentifier:Annotation5Identifier] autorelease];
            customPinView.pinColor = MKPinAnnotationColorRed;
            customPinView.animatesDrop = YES;
            customPinView.canShowCallout = YES;
			
            
            counter= 3;
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [rightButton addTarget:self
                            action:@selector(A4)
                  forControlEvents:UIControlEventTouchUpInside];
            customPinView.rightCalloutAccessoryView = rightButton;
            
            
            return customPinView;
        }
        else
        {
            pinView.annotation = annotation;
        }
        return pinView;
    }	
    else if ([annotation isKindOfClass:[Annotation6 class]])
    {
        static NSString* Annotation6Identifier = @"Annotation6Identifier";
        MKPinAnnotationView* pinView = (MKPinAnnotationView *)
		[mapView dequeueReusableAnnotationViewWithIdentifier:Annotation6Identifier];
        if (!pinView)
        {
            MKPinAnnotationView* customPinView = [[[MKPinAnnotationView alloc]
												   initWithAnnotation:annotation reuseIdentifier:Annotation6Identifier] autorelease];
            customPinView.pinColor = MKPinAnnotationColorRed;
            customPinView.animatesDrop = YES;
            customPinView.canShowCallout = YES;
            
            counter= 4;
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [rightButton addTarget:self
                            action:@selector(A5)
                  forControlEvents:UIControlEventTouchUpInside];
            customPinView.rightCalloutAccessoryView = rightButton;
            
			
            return customPinView;
        }
        else
        {
            pinView.annotation = annotation;
        }
        return pinView;
    }	
    
    else if ([annotation isKindOfClass:[Annotation7 class]])
    {
        static NSString* Annotation6Identifier = @"Annotation7Identifier";
        MKPinAnnotationView* pinView = (MKPinAnnotationView *)
		[mapView dequeueReusableAnnotationViewWithIdentifier:Annotation6Identifier];
        if (!pinView)
        {
            MKPinAnnotationView* customPinView = [[[MKPinAnnotationView alloc]
												   initWithAnnotation:annotation reuseIdentifier:Annotation6Identifier] autorelease];
            customPinView.pinColor = MKPinAnnotationColorRed;
            customPinView.animatesDrop = YES;
            customPinView.canShowCallout = YES;
            
            counter= 5;
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [rightButton addTarget:self
                            action:@selector(A6)
                  forControlEvents:UIControlEventTouchUpInside];
            customPinView.rightCalloutAccessoryView = rightButton;
            
			
            return customPinView;
        }
        else
        {
            pinView.annotation = annotation;
        }
        return pinView;
    }	
    
    
    
    
    else if ([annotation isKindOfClass:[Annotation8 class]])
    {
        static NSString* Annotation6Identifier = @"Annotation8Identifier";
        MKPinAnnotationView* pinView = (MKPinAnnotationView *)
		[mapView dequeueReusableAnnotationViewWithIdentifier:Annotation6Identifier];
        if (!pinView)
        {
            MKPinAnnotationView* customPinView = [[[MKPinAnnotationView alloc]
												   initWithAnnotation:annotation reuseIdentifier:Annotation6Identifier] autorelease];
            customPinView.pinColor = MKPinAnnotationColorRed;
            customPinView.animatesDrop = YES;
            customPinView.canShowCallout = YES;
            
            counter= 6;
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [rightButton addTarget:self
                            action:@selector(A7)
                  forControlEvents:UIControlEventTouchUpInside];
            customPinView.rightCalloutAccessoryView = rightButton;
            
			
            return customPinView;
        }
        else
        {
            pinView.annotation = annotation;
        }
        return pinView;
    }	
    else if ([annotation isKindOfClass:[Annotation9 class]])
    {
        static NSString* Annotation9Identifier = @"Annotation9Identifier";
        MKPinAnnotationView* pinView = (MKPinAnnotationView *)
		[mapView dequeueReusableAnnotationViewWithIdentifier:Annotation9Identifier];
        if (!pinView)
        {
            MKPinAnnotationView* customPinView = [[[MKPinAnnotationView alloc]
												   initWithAnnotation:annotation reuseIdentifier:Annotation9Identifier] autorelease];
            customPinView.pinColor = MKPinAnnotationColorRed;
            customPinView.animatesDrop = YES;
            customPinView.canShowCallout = YES;
			
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [rightButton addTarget:self
                            action:@selector(A8)
                  forControlEvents:UIControlEventTouchUpInside];
            customPinView.rightCalloutAccessoryView = rightButton;
            
            
            
            return customPinView;
        }
        else
        {
            pinView.annotation = annotation;
        }
        return pinView;
    }	
    
    //restaturant 
    
    else if ([annotation isKindOfClass:[Annotation10 class]])
    {
        static NSString* Annotation10Identifier = @"Annotation10Identifier";
        MKPinAnnotationView* pinView = (MKPinAnnotationView *)
		[mapView dequeueReusableAnnotationViewWithIdentifier:Annotation10Identifier];
        if (!pinView)
        {
            MKPinAnnotationView* customPinView = [[[MKPinAnnotationView alloc]
												   initWithAnnotation:annotation reuseIdentifier:Annotation10Identifier] autorelease];
            customPinView.pinColor = MKPinAnnotationColorRed;
            customPinView.animatesDrop = YES;
            customPinView.canShowCallout = YES;
			
            
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [rightButton addTarget:self
                            action:@selector(A9)
                  forControlEvents:UIControlEventTouchUpInside];
            customPinView.rightCalloutAccessoryView = rightButton;
            
            
            return customPinView;
        }
        else
        {
            pinView.annotation = annotation;
        }
        return pinView;
    }	
    else if ([annotation isKindOfClass:[Annotation11 class]])
    {
        static NSString* Annotation11Identifier = @"Annotation11Identifier";
        MKPinAnnotationView* pinView = (MKPinAnnotationView *)
		[mapView dequeueReusableAnnotationViewWithIdentifier:Annotation11Identifier];
        if (!pinView)
        {
            MKPinAnnotationView* customPinView = [[[MKPinAnnotationView alloc]
												   initWithAnnotation:annotation reuseIdentifier:Annotation11Identifier] autorelease];
            customPinView.pinColor = MKPinAnnotationColorRed;
            customPinView.animatesDrop = YES;
            customPinView.canShowCallout = YES;
			
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [rightButton addTarget:self
                            action:@selector(A10)
                  forControlEvents:UIControlEventTouchUpInside];
            customPinView.rightCalloutAccessoryView = rightButton;
            
            
            
            return customPinView;
        }
        else
        {
            pinView.annotation = annotation;
        }
        return pinView;
    }	
    else if ([annotation isKindOfClass:[Annotation12 class]])
    {
        static NSString* Annotation12Identifier = @"Annotation12Identifier";
        MKPinAnnotationView* pinView = (MKPinAnnotationView *)
		[mapView dequeueReusableAnnotationViewWithIdentifier:Annotation12Identifier];
        if (!pinView)
        {
            MKPinAnnotationView* customPinView = [[[MKPinAnnotationView alloc]
												   initWithAnnotation:annotation reuseIdentifier:Annotation12Identifier] autorelease];
            customPinView.pinColor = MKPinAnnotationColorRed;
            customPinView.animatesDrop = YES;
            customPinView.canShowCallout = YES;
			
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [rightButton addTarget:self
                            action:@selector(A11)
                  forControlEvents:UIControlEventTouchUpInside];
            customPinView.rightCalloutAccessoryView = rightButton;
            
            
            return customPinView;
        }
        else
        {
            pinView.annotation = annotation;
        }
        return pinView;
    }	
    else if ([annotation isKindOfClass:[Annotation13 class]])
    {
        static NSString* Annotation13Identifier = @"Annotation13Identifier";
        MKPinAnnotationView* pinView = (MKPinAnnotationView *)
		[mapView dequeueReusableAnnotationViewWithIdentifier:Annotation13Identifier];
        if (!pinView)
        {
            MKPinAnnotationView* customPinView = [[[MKPinAnnotationView alloc]
												   initWithAnnotation:annotation reuseIdentifier:Annotation13Identifier] autorelease];
            customPinView.pinColor = MKPinAnnotationColorRed;
            customPinView.animatesDrop = YES;
            customPinView.canShowCallout = YES;
			
            
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [rightButton addTarget:self
                            action:@selector(A12)
                  forControlEvents:UIControlEventTouchUpInside];
            customPinView.rightCalloutAccessoryView = rightButton;
            
            
            return customPinView;
        }
        else
        {
            pinView.annotation = annotation;
        }
        return pinView;
    }	
    else if ([annotation isKindOfClass:[Annotation14 class]])
    {
        static NSString* Annotation14Identifier = @"Annotation14Identifier";
        MKPinAnnotationView* pinView = (MKPinAnnotationView *)
		[mapView dequeueReusableAnnotationViewWithIdentifier:Annotation14Identifier];
        if (!pinView)
        {
            MKPinAnnotationView* customPinView = [[[MKPinAnnotationView alloc]
												   initWithAnnotation:annotation reuseIdentifier:Annotation14Identifier] autorelease];
            customPinView.pinColor = MKPinAnnotationColorRed;
            customPinView.animatesDrop = YES;
            customPinView.canShowCallout = YES;
			
            
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [rightButton addTarget:self
                            action:@selector(A13)
                  forControlEvents:UIControlEventTouchUpInside];
            customPinView.rightCalloutAccessoryView = rightButton;
            
            
            
            return customPinView;
        }
        else
        {
            pinView.annotation = annotation;
        }
        return pinView;
    }	
    else if ([annotation isKindOfClass:[Annotation15 class]])
    {
        static NSString* Annotation15Identifier = @"Annotation15Identifier";
        MKPinAnnotationView* pinView = (MKPinAnnotationView *)
		[mapView dequeueReusableAnnotationViewWithIdentifier:Annotation15Identifier];
        if (!pinView)
        {
            MKPinAnnotationView* customPinView = [[[MKPinAnnotationView alloc]
												   initWithAnnotation:annotation reuseIdentifier:Annotation15Identifier] autorelease];
            customPinView.pinColor = MKPinAnnotationColorRed;
            customPinView.animatesDrop = YES;
            customPinView.canShowCallout = YES;
			
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [rightButton addTarget:self
                            action:@selector(A14)
                  forControlEvents:UIControlEventTouchUpInside];
            customPinView.rightCalloutAccessoryView = rightButton;
            
            
            
            return customPinView;
        }
        else
        {
            pinView.annotation = annotation;
        }
        return pinView;
    }	
    else if ([annotation isKindOfClass:[Annotation16 class]])
    {
        static NSString* Annotation16Identifier = @"Annotation16Identifier";
        MKPinAnnotationView* pinView = (MKPinAnnotationView *)
		[mapView dequeueReusableAnnotationViewWithIdentifier:Annotation16Identifier];
        if (!pinView)
        {
            MKPinAnnotationView* customPinView = [[[MKPinAnnotationView alloc]
												   initWithAnnotation:annotation reuseIdentifier:Annotation16Identifier] autorelease];
            customPinView.pinColor = MKPinAnnotationColorRed;
            customPinView.animatesDrop = YES;
            customPinView.canShowCallout = YES;
			
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [rightButton addTarget:self
                            action:@selector(A15)
                  forControlEvents:UIControlEventTouchUpInside];
            customPinView.rightCalloutAccessoryView = rightButton;
            
            
            
            return customPinView;
        }
        else
        {
            pinView.annotation = annotation;
        }
        return pinView;
    }	
    else if ([annotation isKindOfClass:[Annotation17 class]])
    {
        static NSString* Annotation17Identifier = @"Annotation17Identifier";
        MKPinAnnotationView* pinView = (MKPinAnnotationView *)
		[mapView dequeueReusableAnnotationViewWithIdentifier:Annotation17Identifier];
        if (!pinView)
        {
            MKPinAnnotationView* customPinView = [[[MKPinAnnotationView alloc]
												   initWithAnnotation:annotation reuseIdentifier:Annotation17Identifier] autorelease];
            customPinView.pinColor = MKPinAnnotationColorRed;
            customPinView.animatesDrop = YES;
            customPinView.canShowCallout = YES;
			
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [rightButton addTarget:self
                            action:@selector(A16)
                  forControlEvents:UIControlEventTouchUpInside];
            customPinView.rightCalloutAccessoryView = rightButton;
            
            
            
            return customPinView;
        }
        else
        {
            pinView.annotation = annotation;
        }
        return pinView;
    }	
    else if ([annotation isKindOfClass:[Annotation18 class]])
    {
        static NSString* Annotation18Identifier = @"Annotation18Identifier";
        MKPinAnnotationView* pinView = (MKPinAnnotationView *)
		[mapView dequeueReusableAnnotationViewWithIdentifier:Annotation18Identifier];
        if (!pinView)
        {
            MKPinAnnotationView* customPinView = [[[MKPinAnnotationView alloc]
												   initWithAnnotation:annotation reuseIdentifier:Annotation18Identifier] autorelease];
            customPinView.pinColor = MKPinAnnotationColorRed;
            customPinView.animatesDrop = YES;
            customPinView.canShowCallout = YES;
			
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [rightButton addTarget:self
                            action:@selector(A17)
                  forControlEvents:UIControlEventTouchUpInside];
            customPinView.rightCalloutAccessoryView = rightButton;
            
            
            
            return customPinView;
        }
        else
        {
            pinView.annotation = annotation;
        }
        return pinView;
    }	
    else if ([annotation isKindOfClass:[Annotation19 class]])
    {
        static NSString* Annotation19Identifier = @"Annotation19Identifier";
        MKPinAnnotationView* pinView = (MKPinAnnotationView *)
		[mapView dequeueReusableAnnotationViewWithIdentifier:Annotation19Identifier];
        if (!pinView)
        {
            MKPinAnnotationView* customPinView = [[[MKPinAnnotationView alloc]
												   initWithAnnotation:annotation reuseIdentifier:Annotation19Identifier] autorelease];
            customPinView.pinColor = MKPinAnnotationColorRed;
            customPinView.animatesDrop = YES;
            customPinView.canShowCallout = YES;
			
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [rightButton addTarget:self
                            action:@selector(A18)
                  forControlEvents:UIControlEventTouchUpInside];
            customPinView.rightCalloutAccessoryView = rightButton;
            
            
            return customPinView;
        }
        else
        {
            pinView.annotation = annotation;
        }
        return pinView;
    }	
    
    else if ([annotation isKindOfClass:[Annotation20 class]])
    {
        static NSString* Annotation20Identifier = @"Annotation20Identifier";
        MKPinAnnotationView* pinView = (MKPinAnnotationView *)
		[mapView dequeueReusableAnnotationViewWithIdentifier:Annotation20Identifier];
        if (!pinView)
        {
            MKPinAnnotationView* customPinView = [[[MKPinAnnotationView alloc]
												   initWithAnnotation:annotation reuseIdentifier:Annotation20Identifier] autorelease];
            customPinView.pinColor = MKPinAnnotationColorRed;
            customPinView.animatesDrop = YES;
            customPinView.canShowCallout = YES;
			
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [rightButton addTarget:self
                            action:@selector(A19)
                  forControlEvents:UIControlEventTouchUpInside];
            customPinView.rightCalloutAccessoryView = rightButton;
            
            
            return customPinView;
        }
        else
        {
            pinView.annotation = annotation;
        }
        return pinView;
    }	
    
    
    
    return nil;
}







-(NSString *)getAddressFromLatLon:(double)pdblLatitude withLongitude:(double)pdblLongitude
{
    NSString *urlString = [NSString stringWithFormat:kGeoCodingString,pdblLatitude, pdblLongitude];
    NSLog(@"str=%@",urlString);
    NSError* error;
    locationString = [NSString stringWithContentsOfURL:[NSURL URLWithString:urlString] encoding:NSASCIIStringEncoding error:&error];
    
 //   ArrayForLocation= [NSMutableArray initWithCapacity:20];
    

    locationString = [locationString stringByReplacingOccurrencesOfString:@"\"" withString:@""];
    
   // locationString = [locationString stringByReplacingOccurrencesOfString:@" " withString:@"+"];

    NSLog(@"loc=%@",locationString);
    return [locationString substringFromIndex:6];
    
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error 
{	
	[currentLocation stopUpdatingLocation];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}


-(void)A1
{
    NSString *LT= [NSString stringWithFormat:@"%f",TLat[0]];
    NSString *LN= [NSString stringWithFormat:@"%f",TLon[0]];
    NSString *Timing= [NSString stringWithFormat:@"%@",Time[0]];

    
    iPhone5InSingleTheather *dvController = [[iPhone5InSingleTheather alloc] initWithNibName:@"iPhone5InSingleTheather" bundle:[NSBundle mainBundle]];
	dvController.selectedTheater = TN[0];
    dvController.Theater_Address = TA[0];
    dvController.Theater_latitude = LT;
    dvController.Theater_longitude = LN;
    dvController.current_latitude = CurrentLatitude;
    dvController.current_longitude = CurrentLongitude;
    dvController.time1 = Timing;

	[self.navigationController pushViewController:dvController animated:YES];
	[dvController release];
	dvController = nil;
    
}


-(void)A2
{
    NSString *LT= [NSString stringWithFormat:@"%f",TLat[1]];
    NSString *LN= [NSString stringWithFormat:@"%f",TLon[1]];
    NSString *Timing= [NSString stringWithFormat:@"%@",Time[1]];

    
    iPhone5InSingleTheather *dvController = [[iPhone5InSingleTheather alloc] initWithNibName:@"iPhone5InSingleTheather" bundle:[NSBundle mainBundle]];
	dvController.selectedTheater = TN[1];
    dvController.Theater_Address = TA[1];
    dvController.Theater_latitude = LT;
    dvController.Theater_longitude = LN;
    dvController.current_latitude = CurrentLatitude;
    dvController.current_longitude = CurrentLongitude;
    dvController.time1 = Timing;

	[self.navigationController pushViewController:dvController animated:YES];
	[dvController release];
	dvController = nil;
    
}
-(void)A3
{
    NSString *LT= [NSString stringWithFormat:@"%f",TLat[2]];
    NSString *LN= [NSString stringWithFormat:@"%f",TLon[2]];
    NSString *Timing= [NSString stringWithFormat:@"%@",Time[2]];

    
    iPhone5InSingleTheather *dvController = [[iPhone5InSingleTheather alloc] initWithNibName:@"iPhone5InSingleTheather" bundle:[NSBundle mainBundle]];
	dvController.selectedTheater = TN[2];
    dvController.Theater_Address = TA[2];
    dvController.Theater_latitude = LT;
    dvController.Theater_longitude = LN;
    dvController.current_latitude = CurrentLatitude;
    dvController.current_longitude = CurrentLongitude;
    dvController.time1 = Timing;

	[self.navigationController pushViewController:dvController animated:YES];
	[dvController release];
	dvController = nil;
    
}
-(void)A4
{
    NSString *LT= [NSString stringWithFormat:@"%f",TLat[3]];
    NSString *LN= [NSString stringWithFormat:@"%f",TLon[3]];
    NSString *Timing= [NSString stringWithFormat:@"%@",Time[3]];

    
    iPhone5InSingleTheather *dvController = [[iPhone5InSingleTheather alloc] initWithNibName:@"iPhone5InSingleTheather" bundle:[NSBundle mainBundle]];
	dvController.selectedTheater = TN[3];
    dvController.Theater_Address = TA[3];
    dvController.Theater_latitude = LT;
    dvController.Theater_longitude = LN;
    dvController.current_latitude = CurrentLatitude;
    dvController.current_longitude = CurrentLongitude;
    dvController.time1 = Timing;

	[self.navigationController pushViewController:dvController animated:YES];
	[dvController release];
	dvController = nil;
    
}
-(void)A5
{
    NSString *LT= [NSString stringWithFormat:@"%f",TLat[4]];
    NSString *LN= [NSString stringWithFormat:@"%f",TLon[4]];
    NSString *Timing= [NSString stringWithFormat:@"%@",Time[4]];

    
    iPhone5InSingleTheather *dvController = [[iPhone5InSingleTheather alloc] initWithNibName:@"iPhone5InSingleTheather" bundle:[NSBundle mainBundle]];
	dvController.selectedTheater = TN[4];
    dvController.Theater_Address = TA[4];
    dvController.Theater_latitude = LT;
    dvController.Theater_longitude = LN;
    dvController.current_latitude = CurrentLatitude;
    dvController.current_longitude = CurrentLongitude;
    dvController.time1 = Timing;

	[self.navigationController pushViewController:dvController animated:YES];
	[dvController release];
	dvController = nil;
    
}
-(void)A6
{
    NSString *LT= [NSString stringWithFormat:@"%f",TLat[5]];
    NSString *LN= [NSString stringWithFormat:@"%f",TLon[5]];
    NSString *Timing= [NSString stringWithFormat:@"%@",Time[5]];

    
    iPhone5InSingleTheather *dvController = [[iPhone5InSingleTheather alloc] initWithNibName:@"iPhone5InSingleTheather" bundle:[NSBundle mainBundle]];
	dvController.selectedTheater = TN[5];
    dvController.Theater_Address = TA[5];
    dvController.Theater_latitude = LT;
    dvController.Theater_longitude = LN;
    dvController.current_latitude = CurrentLatitude;
    dvController.current_longitude = CurrentLongitude;
    dvController.time1 = Timing;

	[self.navigationController pushViewController:dvController animated:YES];
	[dvController release];
	dvController = nil;
    
}
-(void)A7
{
    NSString *LT= [NSString stringWithFormat:@"%f",TLat[6]];
    NSString *LN= [NSString stringWithFormat:@"%f",TLon[6]];
    NSString *Timing= [NSString stringWithFormat:@"%@",Time[6]];

    
    iPhone5InSingleTheather *dvController = [[iPhone5InSingleTheather alloc] initWithNibName:@"iPhone5InSingleTheather" bundle:[NSBundle mainBundle]];
	dvController.selectedTheater = TN[6];
    dvController.Theater_Address = TA[6];
    dvController.Theater_latitude = LT;
    dvController.Theater_longitude = LN;
    dvController.current_latitude = CurrentLatitude;
    dvController.current_longitude = CurrentLongitude;
    dvController.time1 = Timing;

	[self.navigationController pushViewController:dvController animated:YES];
	[dvController release];
	dvController = nil;
    
}
-(void)A8
{
    NSString *LT= [NSString stringWithFormat:@"%f",TLat[7]];
    NSString *LN= [NSString stringWithFormat:@"%f",TLon[7]];
    NSString *Timing= [NSString stringWithFormat:@"%@",Time[7]];

    
    iPhone5InSingleTheather *dvController = [[iPhone5InSingleTheather alloc] initWithNibName:@"iPhone5InSingleTheather" bundle:[NSBundle mainBundle]];
	dvController.selectedTheater = TN[7];
    dvController.Theater_Address = TA[7];
    dvController.Theater_latitude = LT;
    dvController.Theater_longitude = LN;
    dvController.current_latitude = CurrentLatitude;
    dvController.current_longitude = CurrentLongitude;
    dvController.time1 = Timing;

	[self.navigationController pushViewController:dvController animated:YES];
	[dvController release];
	dvController = nil;
    
}
-(void)A9
{
    NSString *LT= [NSString stringWithFormat:@"%f",TLat[8]];
    NSString *LN= [NSString stringWithFormat:@"%f",TLon[8]];
    NSString *Timing= [NSString stringWithFormat:@"%@",Time[8]];

    
    iPhone5InSingleTheather *dvController = [[iPhone5InSingleTheather alloc] initWithNibName:@"iPhone5InSingleTheather" bundle:[NSBundle mainBundle]];
	dvController.selectedTheater = TN[8];
    dvController.Theater_Address = TA[8];
    dvController.Theater_latitude = LT;
    dvController.Theater_longitude = LN;
    dvController.current_latitude = CurrentLatitude;
    dvController.current_longitude = CurrentLongitude;
    dvController.time1 = Timing;

	[self.navigationController pushViewController:dvController animated:YES];
	[dvController release];
	dvController = nil;
    
}
-(void)A10
{
    NSString *LT= [NSString stringWithFormat:@"%f",TLat[9]];
    NSString *LN= [NSString stringWithFormat:@"%f",TLon[9]];
    NSString *Timing= [NSString stringWithFormat:@"%@",Time[9]];

    
    iPhone5InSingleTheather *dvController = [[iPhone5InSingleTheather alloc] initWithNibName:@"iPhone5InSingleTheather" bundle:[NSBundle mainBundle]];
	dvController.selectedTheater = TN[9];
    dvController.Theater_Address = TA[9];
    dvController.Theater_latitude = LT;
    dvController.Theater_longitude = LN;
    dvController.current_latitude = CurrentLatitude;
    dvController.current_longitude = CurrentLongitude;
    dvController.time1 = Timing;

	[self.navigationController pushViewController:dvController animated:YES];
	[dvController release];
	dvController = nil;
    
}
-(void)A11
{
    NSString *LT= [NSString stringWithFormat:@"%f",TLat[10]];
    NSString *LN= [NSString stringWithFormat:@"%f",TLon[10]];
    NSString *Timing= [NSString stringWithFormat:@"%@",Time[10]];

    
    iPhone5InSingleTheather *dvController = [[iPhone5InSingleTheather alloc] initWithNibName:@"iPhone5InSingleTheather" bundle:[NSBundle mainBundle]];
	dvController.selectedTheater = TN[10];
    dvController.Theater_Address = TA[10];
    dvController.Theater_latitude = LT;
    dvController.Theater_longitude = LN;
    dvController.current_latitude = CurrentLatitude;
    dvController.current_longitude = CurrentLongitude;
    dvController.time1 = Timing;

	[self.navigationController pushViewController:dvController animated:YES];
	[dvController release];
	dvController = nil;
    
}
-(void)A12
{
    NSString *LT= [NSString stringWithFormat:@"%f",TLat[11]];
    NSString *LN= [NSString stringWithFormat:@"%f",TLon[11]];
    NSString *Timing= [NSString stringWithFormat:@"%@",Time[11]];

    
    iPhone5InSingleTheather *dvController = [[iPhone5InSingleTheather alloc] initWithNibName:@"iPhone5InSingleTheather" bundle:[NSBundle mainBundle]];
	dvController.selectedTheater = TN[11];
    dvController.Theater_Address = TA[11];
    dvController.Theater_latitude = LT;
    dvController.Theater_longitude = LN;
    dvController.current_latitude = CurrentLatitude;
    dvController.current_longitude = CurrentLongitude;
    dvController.time1 = Timing;
 
	[self.navigationController pushViewController:dvController animated:YES];
	[dvController release];
	dvController = nil;
    
}
-(void)A13
{
    NSString *LT= [NSString stringWithFormat:@"%f",TLat[12]];
    NSString *LN= [NSString stringWithFormat:@"%f",TLon[12]];
    NSString *Timing= [NSString stringWithFormat:@"%@",Time[12]];

    
    iPhone5InSingleTheather *dvController = [[iPhone5InSingleTheather alloc] initWithNibName:@"iPhone5InSingleTheather" bundle:[NSBundle mainBundle]];
	dvController.selectedTheater = TN[12];
    dvController.Theater_Address = TA[12];
    dvController.Theater_latitude = LT;
    dvController.Theater_longitude = LN;
    dvController.current_latitude = CurrentLatitude;
    dvController.current_longitude = CurrentLongitude;
    dvController.time1 = Timing;

	[self.navigationController pushViewController:dvController animated:YES];
	[dvController release];
	dvController = nil;
    
}
-(void)A14
{
    NSString *LT= [NSString stringWithFormat:@"%f",TLat[13]];
    NSString *LN= [NSString stringWithFormat:@"%f",TLon[13]];
    NSString *Timing= [NSString stringWithFormat:@"%@",Time[13]];

    
    iPhone5InSingleTheather *dvController = [[iPhone5InSingleTheather alloc] initWithNibName:@"iPhone5InSingleTheather" bundle:[NSBundle mainBundle]];
	dvController.selectedTheater = TN[13];
    dvController.Theater_Address = TA[13];
    dvController.Theater_latitude = LT;
    dvController.Theater_longitude = LN;
    dvController.current_latitude = CurrentLatitude;
    dvController.current_longitude = CurrentLongitude;
    dvController.time1 = Timing;

	[self.navigationController pushViewController:dvController animated:YES];
	[dvController release];
	dvController = nil;
    
}
-(void)A15
{
    NSString *LT= [NSString stringWithFormat:@"%f",TLat[14]];
    NSString *LN= [NSString stringWithFormat:@"%f",TLon[14]];
    NSString *Timing= [NSString stringWithFormat:@"%@",Time[14]];

    
    iPhone5InSingleTheather *dvController = [[iPhone5InSingleTheather alloc] initWithNibName:@"iPhone5InSingleTheather" bundle:[NSBundle mainBundle]];
	dvController.selectedTheater = TN[14];
    dvController.Theater_Address = TA[14];
    dvController.Theater_latitude = LT;
    dvController.Theater_longitude = LN;
    dvController.current_latitude = CurrentLatitude;
    dvController.current_longitude = CurrentLongitude;
    dvController.time1 = Timing;

	[self.navigationController pushViewController:dvController animated:YES];
	[dvController release];
	dvController = nil;
    
}
-(void)A16
{
    NSString *LT= [NSString stringWithFormat:@"%f",TLat[15]];
    NSString *LN= [NSString stringWithFormat:@"%f",TLon[15]];
    NSString *Timing= [NSString stringWithFormat:@"%@",Time[15]];

    
    iPhone5InSingleTheather *dvController = [[iPhone5InSingleTheather alloc] initWithNibName:@"iPhone5InSingleTheather" bundle:[NSBundle mainBundle]];
	dvController.selectedTheater = TN[15];
    dvController.Theater_Address = TA[15];
    dvController.Theater_latitude = LT;
    dvController.Theater_longitude = LN;
    dvController.current_latitude = CurrentLatitude;
    dvController.current_longitude = CurrentLongitude;
    dvController.time1 = Timing;

	[self.navigationController pushViewController:dvController animated:YES];
	[dvController release];
	dvController = nil;
    
}
-(void)A17
{
    NSString *LT= [NSString stringWithFormat:@"%f",TLat[16]];
    NSString *LN= [NSString stringWithFormat:@"%f",TLon[16]];
    NSString *Timing= [NSString stringWithFormat:@"%@",Time[16]];

    
    iPhone5InSingleTheather *dvController = [[iPhone5InSingleTheather alloc] initWithNibName:@"iPhone5InSingleTheather" bundle:[NSBundle mainBundle]];
	dvController.selectedTheater = TN[16];
    dvController.Theater_Address = TA[16];
    dvController.Theater_latitude = LT;
    dvController.Theater_longitude = LN;
    dvController.current_latitude = CurrentLatitude;
    dvController.current_longitude = CurrentLongitude;
    dvController.time1 = Timing;

	[self.navigationController pushViewController:dvController animated:YES];
	[dvController release];
	dvController = nil;
    
}
-(void)A18
{
    NSString *LT= [NSString stringWithFormat:@"%f",TLat[17]];
    NSString *LN= [NSString stringWithFormat:@"%f",TLon[17]];
    NSString *Timing= [NSString stringWithFormat:@"%@",Time[17]];

    
    iPhone5InSingleTheather *dvController = [[iPhone5InSingleTheather alloc] initWithNibName:@"iPhone5InSingleTheather" bundle:[NSBundle mainBundle]];
	dvController.selectedTheater = TN[17];
    dvController.Theater_Address = TA[17];
    dvController.Theater_latitude = LT;
    dvController.Theater_longitude = LN;
    dvController.current_latitude = CurrentLatitude;
    dvController.current_longitude = CurrentLongitude;
    dvController.time1 = Timing;

	[self.navigationController pushViewController:dvController animated:YES];
	[dvController release];
	dvController = nil;
    
}
-(void)A19
{
    NSString *LT= [NSString stringWithFormat:@"%f",TLat[18]];
    NSString *LN= [NSString stringWithFormat:@"%f",TLon[18]];
    NSString *Timing= [NSString stringWithFormat:@"%@",Time[18]];

    
    
    iPhone5InSingleTheather *dvController = [[iPhone5InSingleTheather alloc] initWithNibName:@"iPhone5InSingleTheather" bundle:[NSBundle mainBundle]];
	dvController.selectedTheater = TN[18];
    dvController.Theater_Address = TA[18];
    dvController.Theater_latitude = LT;
    dvController.Theater_longitude = LN;
    dvController.current_latitude = CurrentLatitude;
    dvController.current_longitude = CurrentLongitude;
    dvController.time1 = Timing;
    
	[self.navigationController pushViewController:dvController animated:YES];
	[dvController release];
	dvController = nil;
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    
//    
//    if ([self.navigationController.navigationBar respondsToSelector:@selector( setBackgroundImage:forBarMetrics:)]){
//        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"header_bar.png"] forBarMetrics:UIBarMetricsDefault];
//        
//    }
//    
}

-(void)GetLiveTheaters
{
    
    NSString* post = [NSString
                      stringWithFormat:@"http://apps.medialabs24x7.com/besharam/get_loc.php?lat=%@&lng=%@",CurrentLatitude,CurrentLongitude];

    
//    NSString* post = [NSString
//                      stringWithFormat:@"http://apps.medialabs24x7.com/besharam/get_loc.php?lat=19.1738634&lng=72.8440463"];
//    NSString* post = [NSString
//                      stringWithFormat:@"http://apps.micrositeads.com/yjhd/get_loc.php?lat=%@&lng=%@",CurrentLatitude,CurrentLongitude];
    
//    NSString* post = [NSString
//                      stringWithFormat:@"http://apps.micrositeads.com/yjhd/get_loc_ipad_test_29042013.php?lat=%@&lng=%@",CurrentLatitude,CurrentLongitude];
    NSLog(@"POST=%@",post);
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]
                                    initWithURL:[NSURL URLWithString:post]
                                    cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:100.0];
    
    
    //  NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:[NSURLURLWithString:@"http://110.175.19.95/SCMIpadDemoWebApp/CustomerList.aspx?username=02&BeginRowNo=0&LastRowNo=10"]cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:5.0];
    
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/x-www-form-urlencoded"
     
   forHTTPHeaderField:@"Current-Type"];
    NSError *errorReturned = nil;
    NSURLResponse *theResponse =[[NSURLResponse alloc]init];
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:&theResponse error:&errorReturned];
    
    
    
    
    NSLog(@"POSTING=%@",post);
    
//    //    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding
//allowLossyConversion:YES];
//    //    NSString *postLength = [NSString
//stringWithFormat:@"%d",[postData length]];
//    //
//    //    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
//    //
//    //    [request setURL:[NSURL URLWithString:[NSString
//stringWithFormat:@"http://apps.micrositeads.com/dabang2/get_loc.php"]]];
//    //    [request setHTTPMethod:@"POST"];
//    //    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
//    //    [request setValue:@"application/x-www-form-urlencoded"
//forHTTPHeaderField:@"Current-Type"];
//    //    [request setHTTPBody:postData];
//    //
//    //
//    //
//    //    NSError *errorReturned = nil;
//    //    NSURLResponse *theResponse =[[NSURLResponse alloc]init];
//    //    NSData *data = [NSURLConnection sendSynchronousRequest:request
//returningResponse:&theResponse error:&errorReturned];
//    //
    if (errorReturned) {
        NSLog(@"errorReturned=%@",errorReturned);
        
        //        UIAlertView *alert = [[UIAlertView alloc]
        //                              initWithTitle: @"OOps"
        //                              message: @"Something went wrong"\
        //                              delegate: nil
        //                              cancelButtonTitle:@"OK"
        //                              otherButtonTitles:nil];
        //        [alert show];
        //        [alert release];
        
        // Handle error.
    }
    else
    {
        
        NSString *stringResponse = [[NSString alloc] initWithData:data
                                                         encoding:NSASCIIStringEncoding];
        NSLog(@"response1=%@",stringResponse);
        
        
        
        NSError *jsonParsingError = nil;
        NSString    *status= [[NSJSONSerialization JSONObjectWithData:data
                                                              options:NSJSONReadingMutableContainers|NSJSONReadingAllowFragments
                                                                error:&jsonParsingError] objectForKey:@"status"];
        
        NSLog(@"status==%@",status);
        
        if ([status isEqualToString:@"INVALID"]) {
            
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle: @"Status"
                                  message: @"Oops! Something went wrong! Please try again."\
                                  delegate: self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
            alert.tag=3;
            [alert show];
            [alert release];
            
            
            
        }
        
        else   if ([status isEqualToString:@"FAIL"]) {
		    
		    UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle: @"Status"
                                  message: @"Movie releasing October 2nd. Check back soon to book your tickets."\
                                  delegate: self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
		    alert.tag=3;
            
		    
		    [alert show];
		    [alert release];
		    
		    
		    
	    }
	    
	    else  if ([status isEqualToString:@"OK"]) {
            
            
            
            
            NSArray *responseDict = [[NSJSONSerialization
                                      JSONObjectWithData:data
                                      options:NSJSONReadingMutableContainers|NSJSONReadingAllowFragments
                                      error:&jsonParsingError] objectForKey:@"theater"];
            
            NSLog(@"responseDict=%@",responseDict);
            //      NSArray *responseDict = [stringResponse JSONValue];
            
            
            int i=0;
            for (NSDictionary *actoAgent in responseDict){
                
                NearbyTheatersList[i] =[[actoAgent objectForKey:@"name"] retain];
                NSLog(@"theatre=%@", NearbyTheatersList[i]);
                TN[i] = NearbyTheatersList[i];
                TheaterAddress[i] =[[actoAgent objectForKey:@"address"] retain];
                rating[i] =[[actoAgent objectForKey:@"rating"] retain];
                Time[i]=[[actoAgent objectForKey:@"show_time"] retain];
                TomorowTime[i]= [[actoAgent objectForKey:@"show_time_tmr"] retain];
                TA[i] =   TheaterAddress[i];
                
                bmsurl[i] =[[actoAgent objectForKey:@"bms_url_ios"] retain];
                
                NSLog(@"bmsurl===%@",  bmsurl[i]);
                
                
                NSString* a1 = [(NSDictionary*)[actoAgent
                                                objectForKey:@"geometry"] objectForKey:@"location"];
                tlati[i]= [[a1 objectForKey:@"lat"] retain];
                tlngi[i]= [[a1 objectForKey:@"lng"] retain];
                // NSLog(@"lattt=%@",tlati[i]);
                
                //            ratingForThr[i] = [rating[i] intValue];
                //            NSLog(@"ratingg=%d",ratingForThr[i]);
                //
                TLat[i] = [tlati[i] doubleValue];
                
                TLon[i] = [tlngi[i] doubleValue];
                
                
                //    Time[i] = [[NSString stringWithFormat:@"9:30 1:00 4:00
             //   8:00 12:45"] retain];
                
                NSLog(@"TIMING=%@",Time[i]);
                
                
                
                i++;
                
            }
            TotalNumOfRows=i;
        }
        [activityIndicator stopAnimating];
        ActIndImage.alpha=0.0;
        [self DisplayTheaterList];
    }
    
}

-(void)GetTheaterLinks
{
	
    NSString* post = [NSString stringWithFormat:@"location=%@&date=%@",@"mumbai",@"0"];
    NSLog(@"POST=%@",post);
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    
    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@" http://apps.micrositeads.com/yjhd/get_bkms_theaters.php"]]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Current-Type"];
    [request setHTTPBody:postData];
    
	
    
    NSError *errorReturned = nil;
    NSURLResponse *theResponse =[[NSURLResponse alloc]init];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&theResponse error:&errorReturned];
    
    if (errorReturned) {
        NSLog(@"errorReturned=%@",errorReturned);
        
        //        UIAlertView *alert = [[UIAlertView alloc]
        //                              initWithTitle: @"OOps"
        //                              message: @"Something went wrong"\
        //                              delegate: nil
        //                              cancelButtonTitle:@"OK"
        //                              otherButtonTitles:nil];
        //        [alert show];
        //        [alert release];
        
        // Handle error.
    }
    else
    {
        NSError *jsonParsingError = nil;
        NSArray *responseDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers|NSJSONReadingAllowFragments error:&jsonParsingError];
        
        NSLog(@"responseDict=%@",responseDict);
        //      NSArray *responseDict = [stringResponse JSONValue];
        int i=0;
        for (NSDictionary *actoAgent in responseDict){
            
            NearbyTheatersList[i] =[[actoAgent objectForKey:@"theatre"] retain];
            NSLog(@"theatre=%@", NearbyTheatersList[i]);
            TN[i] = NearbyTheatersList[i];
            TheaterAddress[i] =[[actoAgent objectForKey:@"address"] retain];
		   
		   bmsurl[i] =[[actoAgent objectForKey:@"bms_url_ios"] retain];

		   NSLog(@"bmsurl===%@",  bmsurl[i]);
            str =[[actoAgent objectForKey:@"time"] retain];
            
            
            
            
            NSString *str1 ;
            
            str1 = [str stringByReplacingOccurrencesOfString:@"&#8206;"
                                                  withString:@""];
            
            Time[i] = [[str1 stringByReplacingOccurrencesOfString:@"&nbsp"
                                                      withString:@" "] retain];
            
            NSLog(@"str1111111=%@",Time[i]);
            
            //split it
            
            NSString *name =TheaterAddress[i];
            
            // scan for "1ZA"
            NSString *separatorString = @"- 0";
            
            NSArray *split = [name componentsSeparatedByString:separatorString];
            
            for (NSString *element in split) {
                phoneno[i] = element;
                NSLog(@"element: %@", phoneno[i]);
                
            }
            NSLog(@"phoneno=%@", phoneno[i]);
            
            
            if ([TheaterAddress[i] rangeOfString:@"- 0"].location != NSNotFound)
            {
                NSString *str2 = TheaterAddress[i];
                NSRange range = [str2 rangeOfString:@"- 0"];
                
                TheaterAddress[i] = [str2 substringToIndex:range.location];
                NSLog(@"TheaterAddress[i]=%@",TheaterAddress[i]);
                TA[i] =   TheaterAddress[i];
            }
            else {
                
                
                
                
            }
            
            [self geoCodeUsingAddress: TheaterAddress[i] and:i];
            
            
            
            i++;
            
        }
        TotalNumOfRows=i;
    }
    [activityIndicator stopAnimating];
    ActIndImage.alpha=0.0;
    [self DisplayTheaterList];
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

//- (IBAction)closeFooter:(id)sender {
//    
//    
//}

-(void)DisplayTheaterList
{
    
    NSLog(@"Ashwini");
    if (TotalNumOfRows<0) {
        UIAlertView *alert = [[ UIAlertView alloc]initWithTitle:@"Theaters Not Found" message:@"There are No Theaters in your Area" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil ];
        [alert show];
        [alert   release];
        
    }
    else {
        
    
    VideoScroller = [[UIScrollView alloc] initWithFrame:CGRectMake(0,40,320,460)];
    VideoScroller.userInteractionEnabled	=YES;
    VideoScroller.showsVerticalScrollIndicator = YES;
    VideoScroller.pagingEnabled = NO;
    [self.view addSubview:VideoScroller];
    [VideoScroller release];
    
    int m=0;
    NSLog(@"hi");
   
    for (int i =0; i<TotalNumOfRows; i++) {
        
        ImagePatch1[i]  = [[UIImageView alloc] initWithFrame:CGRectMake(0, m, 320,99)];
        ImagePatch1[i].userInteractionEnabled=NO;
        ImagePatch1[i].backgroundColor = [self colorWithHexString:@"004aad"];
        ImagePatch1[i].alpha = 0.5;
        
        
        
        [VideoScroller addSubview:ImagePatch1[i]];
        [ImagePatch1[i] release];
      //  ImagePatch1[i].tag= i;

        
        ImagePatch[i]  = [[UIImageView alloc] initWithFrame:CGRectMake(0, m, 320,99)];
        ImagePatch[i].userInteractionEnabled=YES;
        ImagePatch[i].backgroundColor = [UIColor clearColor];
       
     

  
        [VideoScroller addSubview:ImagePatch[i]];
        [ImagePatch[i] release];
        ImagePatch[i].tag= i;
        
        
        UITapGestureRecognizer *tapped123 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(towardsDetails:)];
        tapped123.numberOfTapsRequired = 1;
        [ImagePatch[i] addGestureRecognizer:tapped123];   
        [tapped123 release];
        
 	    geometry = [[UIImageView alloc] initWithFrame:CGRectMake(260,20, 47 , 47)];
	    geometry.userInteractionEnabled=YES;
	    geometry.image = [UIImage imageNamed:@"theater-icon.png"];
	    [ImagePatch[i] addSubview:geometry];
	    


        [ImagePatch[i] addSubview:geometry];
	    [geometry release];
        Th_name_Lbl[i]	=	[[UILabel alloc] initWithFrame:CGRectMake(5, 5,250,30)];
        Th_name_Lbl[i]	.text  =  NearbyTheatersList[i];
        Th_name_Lbl[i]	.font = [UIFont fontWithName:@"Helvetica Neue, Regular" size: 30.0 ];
	    
	    Th_name_Lbl[i]	.backgroundColor	=	[UIColor clearColor];

        [Th_name_Lbl[i] setFont:[UIFont boldSystemFontOfSize:16]];
        Th_name_Lbl[i]	.textColor = [self colorWithHexString:@"a2d9fb"];
        [ImagePatch[i] addSubview: Th_name_Lbl[i]];
        [Th_name_Lbl[i]	 release];
        
        
        
        Th_add_Lbl[i]			=	[[UILabel alloc] initWithFrame:CGRectMake(5, 40,230,40)];
        Th_add_Lbl[i]	.text           =  TheaterAddress[i];
        Th_add_Lbl[i].numberOfLines = 2;
        Th_add_Lbl[i]	.font = [UIFont fontWithName:@"Helvetica Neue, Regular" size: 12.0 ];
        [ Th_add_Lbl[i] setFont:[UIFont boldSystemFontOfSize:12]];

        Th_add_Lbl[i]	.backgroundColor	=	[UIColor clearColor];
        Th_add_Lbl[i]	.textColor        = [UIColor whiteColor];
        [ImagePatch[i] addSubview: Th_add_Lbl[i]];
        [Th_add_Lbl[i]	 release];
        

        
        m+=100;
       
    }
    
    VideoScroller.contentSize = CGSizeMake(320,(100*TotalNumOfRows+20));
    
    }
    
    
}

-(void)geoCodeUsingAddress: (NSString *)address and:(int)i
{
    
    // -- modified from the stackoverflow page - we use the SBJson parser instead of the string scanner --
    
    NSString       *esc_addr = [address stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
    NSString            *req = [NSString stringWithFormat: @"http://maps.google.com/maps/api/geocode/json?sensor=false&address=%@", esc_addr];
   // NSLog(@"aaaaaaaaa=%@",req);
    NSDictionary *googleResponse = [[NSString stringWithContentsOfURL: [NSURL URLWithString: req] encoding: NSUTF8StringEncoding error: NULL] JSONValue];
    
    NSDictionary    *resultsDict = [googleResponse valueForKey:  @"results"];   // get the results dictionary
    NSDictionary   *geometryDict = [   resultsDict valueForKey: @"geometry"];   // geometry dictionary within the  results dictionary
    NSDictionary   *locationDict = [  geometryDict valueForKey: @"location"];   // location dictionary within the geometry dictionary
    
    // -- you should be able to strip the latitude & longitude from google's location information (while understanding what the json parser returns) --
    
    NSLog (@"-- returning latitude & longitude from google --");
    
    NSArray *latArray = [locationDict valueForKey: @"lat"]; NSString *latString = [latArray lastObject];     // (one element) array entries provided by the json parser
    NSArray *lngArray = [locationDict valueForKey: @"lng"]; NSString *lngString = [lngArray lastObject];     // (one element) array entries provided by the json parser
    
    myLocation.latitude = [latString doubleValue];     // the json parser uses NSArrays which don't support "doubleValue"
    myLocation.longitude = [lngString doubleValue];
    
    
    TLat[i] = myLocation.latitude;
    TLon[i]= myLocation.longitude;
    NSLog(@"lat=%f",  myLocation.latitude);
    NSLog(@"lng=%f",  myLocation.longitude);
    
    
    
    // return myLocation;
}


-(void)towardsDetails:(id)sender
{
    UITapGestureRecognizer *gesture = (UITapGestureRecognizer *) sender;
    NSLog(@"tag=%d",gesture.view.tag);
    
	for (int i =0; i<TotalNumOfRows; i++) {
		Th_name_Lbl[i].textColor = [self colorWithHexString:@"a2d9fb"];
		
	
		ImagePatch1[i].backgroundColor = [self colorWithHexString:@"004aad"];
	}
	Th_name_Lbl[gesture.view.tag].textColor = [UIColor yellowColor];
	
	ImagePatch1[gesture.view.tag].backgroundColor = [self colorWithHexString:@"e1357a"];
	NSLog(@"Time=%@",Time[gesture.view.tag]);
	

    //  NSLog(@"phoneno=%@",phoneno[gesture.view.tag]);
  //  NSString    *th_lat= [NSString stringWithFormat:@"%f",tlati[gesture.view.tag]];
//    NSString      *th_lng = [NSString stringWithFormat:@"%f",tlngi[gesture.view.tag]];
    NSLog(@"lll=%@",tlati[gesture.view.tag]);
    iPhone5InSingleTheather *dvController = [[iPhone5InSingleTheather alloc] initWithNibName:@"iPhone5InSingleTheather" bundle:[NSBundle mainBundle]];
	dvController.selectedTheater =NearbyTheatersList[gesture.view.tag];
    dvController.Theater_Address = TheaterAddress[gesture.view.tag];
    dvController.Theater_latitude = tlati[gesture.view.tag];
    dvController.Theater_longitude = tlngi[gesture.view.tag];
    dvController.time1 = Time[gesture.view.tag];
    dvController.current_latitude = CurrentLatitude;
    dvController.current_longitude = CurrentLongitude;
	dvController.rate = rating[gesture.view.tag];
	dvController.bmsurl = bmsurl[gesture.view.tag];
    dvController.tomorowtime = TomorowTime[gesture.view.tag];


//    if ([phoneno[gesture.view.tag] isEqualToString:@""]) {
//            dvController.Phone_no =@"";
//        }
//      else {
//   
//     
//     dvController.Phone_no = phoneno[gesture.view.tag];
//      }
//       dvController.current_latitude = CurrentLatitude;
//        dvController.current_longitude = CurrentLongitude;
    
	[self.navigationController pushViewController:dvController animated:YES];
	[dvController release];
	dvController = nil;
    
    
}

-(void)FetchCity:(NSString *)urlString
{
    NSLog(@"FetchCity=%@",urlString);
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:urlString] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:5.0];
    
    //    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    //    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:urlString]]];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Current-Type"];
  
    
    
    NSError *errorReturned = nil;
    NSURLResponse *theResponse =[[NSURLResponse alloc]init];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&theResponse error:&errorReturned];
    
    if (errorReturned) {
        NSLog(@"errorReturned=%@",errorReturned);
        
        //        UIAlertView *alert = [[UIAlertView alloc]
        //                              initWithTitle: @"OOps"
        //                              message: @"Something went wrong"\
        //                              delegate: nil
        //                              cancelButtonTitle:@"OK"
        //                              otherButtonTitles:nil];
        //        [alert show];
        //        [alert release];
        
        // Handle error.
    }
    else
    {
        NSError *jsonParsingError = nil;
        NSArray *responseDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers|NSJSONReadingAllowFragments error:&jsonParsingError];
        
        NSLog(@"responseDict=%@",responseDict);
        //      NSArray *responseDict = [stringResponse JSONValue];
        
    
//        int i=0;
//        for (NSDictionary *actoAgent in responseDict){
//        }
    }
}
    
    
    /*NSError *errorReturned = nil;
    NSURLResponse *theResponse =[[NSURLResponse alloc]init];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&theResponse error:&errorReturned];
    
    if (errorReturned) {
        NSLog(@"errorReturned=%@",errorReturned);
        
          }
    else
    {
        //  NSError *jsonParsingError = nil;
        //     jsonArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers|NSJSONReadingAllowFragments error:&jsonParsingError];
        
        
        
        
        
        jsonArray = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding]; 
        
        NSLog(@"response==%@",jsonArray);
        
    }
    NSArray* responseDict = [(NSDictionary*)[jsonArray JSONValue] objectForKey:@"results"];
    //NSString* a1 = [(NSDictionary*)[responseDict objectForKey:@"address_components"] objectForKey:@"long_name"]; 

//     NSString  *a= [responseDict objectAtIndex:0] ; 
//    NSLog(@"a=%@",a);
    
    NSDictionary *citydata=[responseDict objectForKey:@"address_components"];

    NSLog(@"CITYS=%@",citydata);
    //  NSArray* responseDict = [jsonArray objectForKey:@"results"];
//    int i=0;
//    // int m=0;
//	for (NSDictionary *a1 in citydata){
//       	//choose a random loan
//        //  NSDictionary* map = [responseDict objectAtIndex:0];
//        
//        //fetch the data
//        cityname[i] = [a1 objectForKey:@"long_name"];
//        
//        NSLog(@"city=%@",cityname[i]);
//        i++;
//    }
    
}*/
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	if (alertView.tag==3) {
		
		
		if(buttonIndex==0)
		{
			[self back];
			
			
		}
		
		
	}
	
	
	else {
		
	}
}


@end
