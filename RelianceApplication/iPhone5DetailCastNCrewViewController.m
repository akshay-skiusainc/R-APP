//
//  DetailCastNCrewViewController.m
//  YJHD
//
//  Created by Ashwini Pawar on 02/04/13.
//  Copyright (c) 2013 SKI USA 35. All rights reserved.
//

#import "iPhone5DetailCastNCrewViewController.h"
#import "Merchandise.h"
#import "iphone5Settings.h"
#import "iphone5GroupViewController.h"

@interface iPhone5DetailCastNCrewViewController ()

@end

@implementation iPhone5DetailCastNCrewViewController
@synthesize Scroller,barButtonItemClass,footerView;
int n;
UIViewController *topController;
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
    self.trackedViewName=@"Cast and Crew Screen";

    NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"app_bg_image"];
    UIImage* app_bg_image = [UIImage imageWithData:imageData];
    self.view.backgroundColor = [UIColor colorWithPatternImage:app_bg_image];
    
    footerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"footer_bg.png"]];
    //GlobalClass *obj1=[GlobalClass getInstance];
    [self fetchAllData];

    
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
//    [buttonChat addTarget:self action:@selector(toRelApp:) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *customBarItem1 = [[UIBarButtonItem alloc] initWithCustomView:buttonChat];
//    self.navigationItem.RightBarButtonItem = customBarItem1;
    
      
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"home_header_bg.jpg"] forBarMetrics:UIBarMetricsDefault];
    
//    if(Scroller.frame.size.height == 417)
//    {
//        self.crewView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"crew.jpg"]];
//        self.crewView.alpha = 1.0;
//        CGRect crewViewFrame = CGRectMake(0, 0, 320,416);
//        self.crewView.frame = crewViewFrame;
//        [self.Scroller addSubview:self.crewView];
//    }

//    UIImage *image = [UIImage imageNamed:@"live_chat.png"];
//    UIButton *buttonChat = [UIButton buttonWithType:UIButtonTypeCustom];
//    [buttonChat setImage:image forState:UIControlStateNormal];
//    buttonChat.frame = CGRectMake(0.0, 0.0, image.size.width, image.size.height);
//    
//    UIBarButtonItem *button1 = [[barButtonItemClass alloc] initWithCustomView:buttonChat];
//    topController.navigationItem.rightBarButtonItem = button1;
//    
//    [buttonChat addTarget:self action:@selector(showRight:) forControlEvents:UIControlEventTouchUpInside];
	
	[Scroller setContentSize:CGSizeMake(320, (416*2)+635)];


}



-(void)fetchAllData
{
	
   // GlobalClass *obj=[GlobalClass getInstance];
    
	NSString* post = [NSString stringWithFormat:@"http://apps.medialabs24x7.com/besharam/fetch_castncrew_ios.php?deviceno=365a46ab4c78825a"];
	
	
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:post] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
	
	
	//  NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://110.175.19.95/SCMIpadDemoWebApp/CustomerList.aspx?username=02&BeginRowNo=0&LastRowNo=10"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:5.0];
	
	[request setHTTPMethod:@"GET"];
	//[request setValue:@"application/x-www-form-urlencodeQBCd" forHTTPHeaderField:@"Current-Type"];
	NSError *errorReturned = nil;
	
	
	
	
	
	if (errorReturned) {
		NSLog(@"errorReturned=%@",errorReturned);
		
		
		UIAlertView* alertBox = [[ UIAlertView alloc]initWithTitle:@"Network Error" message:@"Network Not Connected" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Retry", nil ];
		//alertBox.tag=3;
		alertBox.delegate=self;
		[alertBox show];
		
		
		// Handle error.
	}
	else
	{
		
		
		NSLog(@"POSTING=%@",post);
		
		
		
		NSError *errorReturned = nil;
		NSURLResponse *theResponse =[[NSURLResponse alloc]init];
		NSData *data0 = [NSURLConnection sendSynchronousRequest:request returningResponse:&theResponse error:&errorReturned];
		
		
		NSError* error;
		NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data0 //1
                                                             options:kNilOptions
                                                               error:&error];
		
		
		
		NSLog(@"json=%@",json);
		
		
		NSDictionary* detailCast = [json objectForKey:@"castncrew"];
		NSDictionary *cast = [json objectForKey:@"cast"];
        NSDictionary *detailCrew = [json objectForKey:@"crew"];
        
		GlobalClass *obj=[GlobalClass getInstance];
		obj.detailCastnCrew = detailCast;
        obj.detailCast = cast;
        obj.detailCrew = detailCrew;
        
    }
	
    [self DisplayNews];
	
}
-(void)getdata
{
	GlobalClass *obj=[GlobalClass getInstance];
	NSLog(@"Cast=%@",obj.detailCast);
	
    int k=0;
	for (NSDictionary *actoAgent in obj.CNC)
	{
        data6[k]= [actoAgent objectForKey:@"castncrew_id"];
		NSLog(@"castncrew_id=%@",data6[k]);
        k++;
    }
    castnCrew = k;
	int i=0;
	for (NSDictionary *actoAgent in obj.detailCast)
	{
        data[i]= [actoAgent objectForKey:@"cast_id"];
		NSLog(@"cast_id=%@",data[i]);
        
        data1[i]= [actoAgent objectForKey:@"cast_name"];
		NSLog(@"cast_name=%@",data1[i]);
		
        
        data2[i]= [actoAgent objectForKey:@"cast_color"];
		NSLog(@"cast_color=%@",data2[i]);
		i++;
    }
    TotalCastData = i;
    
    
    int j = 0;
    for(NSDictionary *dict in obj.detailCrew)
    {
        data3[j] = [dict objectForKey:@"crew_header"];
        NSLog(@"crew_header = %@",data3[j]);
        
        data4[j] = [dict objectForKey:@"crew_name"];
        NSLog(@"crew_name = %@",data4[j]);
        
        data5[j] = [dict objectForKey:@"crew_color"];
        NSLog(@"crew_color = %@",data5[j]);
        j++;
    }
    TotalCrewData = j;
}


-(void)DisplayNews
{
    [self getdata];
    
    int m = 0;
    Scroller = [[UIScrollView alloc] initWithFrame:CGRectMake(0,0,320,504)];
    Scroller.userInteractionEnabled	=YES;
    
    Scroller.showsVerticalScrollIndicator = YES;
    Scroller.scrollEnabled = YES;
    [self.view addSubview:Scroller];
    
    UILabel *castHeadLabel = [[UILabel alloc] initWithFrame:CGRectMake(135, 0 ,230, 35)];
    castHeadLabel.backgroundColor =[UIColor clearColor];
    castHeadLabel.textColor= [UIColor whiteColor];
    castHeadLabel.numberOfLines = 1;
    castHeadLabel.text=@"Cast";
    castHeadLabel.font = [UIFont fontWithName:@"Helvetica Neue" size: 25.0];
    castHeadLabel.font = [UIFont boldSystemFontOfSize:20.0];
    [Scroller addSubview:castHeadLabel];
    
    
    for(int a=0;a<TotalCastData;a++)
    {
        imageViewForCast[a] = [[UIImageView alloc]initWithFrame:CGRectMake(10, m+50, 300, 49)];
        NSLog(@"data2[a] = %@",data2[a]);
        NSString *str = [data2[a] substringFromIndex:1];
        NSLog(@"str = %@",str);
        imageViewForCast[a].backgroundColor = [self colorWithHexString:str];
        imageViewForCast[a].alpha = 0.4;
        [Scroller addSubview:imageViewForCast[a]];
        
        labelbutton[a] = [UIButton buttonWithType:UIButtonTypeCustom];
        labelbutton[a].frame = CGRectMake(10, m+50, 240, 49);
        labelbutton[a].backgroundColor = [UIColor clearColor];
        labelbutton[a].userInteractionEnabled=YES;
        labelbutton[a].tag=a+1;
        // [labelbutton[a] addTarget:self action:@selector(characterDetails:) forControlEvents:UIControlEventTouchUpInside];
        
        
        castLabel[a] = [[UILabel alloc] initWithFrame:CGRectMake(10, 7 ,300, 30)];
		castLabel[a].backgroundColor =[UIColor clearColor];
		castLabel[a].textColor= [UIColor whiteColor];
        
        if(data1[a].length <=25)
        {
            castLabel[a].frame= CGRectMake(10, 7, 300, 30);
            imageViewForCast[a].frame= CGRectMake(10, m+50, 300, 49);
            castLabel[a].numberOfLines = 1;
            
        }
        else if(data1[a].length >25)
        {
            castLabel[a].frame= CGRectMake(10, 7, 300,80);
            imageViewForCast[a].frame= CGRectMake(10, m+50, 300, 100);
            castLabel[a].numberOfLines = 3;
            m=m+50;
        }
        
        castLabel[a].numberOfLines = 2;
        castLabel[a].text=data1[a];
		castLabel[a].font = [UIFont fontWithName:@"Helvetica Neue" size: 18.0];
		[labelbutton[a] addSubview:castLabel[a]];
        
        [Scroller addSubview:labelbutton[a]];
        
        m=m+69;
        n =m+30;
    }
    NSLog(@"total cast data = %d",TotalCastData);
    NSLog(@"n = %d",n);
    
    UILabel *crewLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(135, n+12 ,230, 35)];
    crewLabel1.backgroundColor =[UIColor clearColor];
    crewLabel1.textColor= [UIColor whiteColor];
    crewLabel1.numberOfLines = 1;
    crewLabel1.text=@"Crew";
    crewLabel1.font = [UIFont fontWithName:@"Helvetica Neue" size: 25.0];
    crewLabel1.font = [UIFont boldSystemFontOfSize:20.0];
    [Scroller addSubview:crewLabel1];
    
    for(int b=0;b<TotalCrewData;b++)
    {
        crewHeadLabel[b] = [[UILabel alloc] initWithFrame:CGRectMake(15, n+52 ,300, 15)];
		crewHeadLabel[b].backgroundColor =[UIColor clearColor];
		crewHeadLabel[b].textColor= [UIColor blackColor];
        crewHeadLabel[b].numberOfLines = 1;
        crewHeadLabel[b].text=data3[b];
		crewHeadLabel[b].font = [UIFont fontWithName:@"Helvetica Neue" size: 15.0];
		[Scroller addSubview:crewHeadLabel[b]];
        
        
        imageViewForCrew[b] = [[UIImageView alloc]initWithFrame:CGRectMake(10, n+70, 300, 49)];
        NSLog(@"data2[a] = %@",data5[b]);
        NSString *str = [data5[b] substringFromIndex:1];
        NSLog(@"str = %@",str);
        imageViewForCrew[b].backgroundColor = [self colorWithHexString:str];
        imageViewForCrew[b].alpha = 0.4;
        [Scroller addSubview:imageViewForCrew[b]];
        
        labelbutton1[b] = [UIButton buttonWithType:UIButtonTypeCustom];
        labelbutton1[b].frame = CGRectMake(10, n+70, 240, 49);
        labelbutton1[b].backgroundColor = [UIColor clearColor];
        labelbutton1[b].userInteractionEnabled=YES;
        labelbutton1[b].tag=b+1;
        // [labelbutton[a] addTarget:self action:@selector(characterDetails:) forControlEvents:UIControlEventTouchUpInside];
        
        
        crewLabel[b] = [[UILabel alloc] initWithFrame:CGRectMake(10, 7 ,300, 30)];
		crewLabel[b].backgroundColor =[UIColor clearColor];
		crewLabel[b].textColor= [UIColor whiteColor];
        if(data4[b].length <=25)
        {
            crewLabel[b].frame= CGRectMake(10, 7, 300, 30);
            imageViewForCrew[b].frame= CGRectMake(10, n+70, 300, 49);
            crewLabel[b].numberOfLines = 1;
            
        }
        else if(data4[b].length >25)
        {
            crewLabel[b].frame= CGRectMake(10, 7, 300,80);
            imageViewForCrew[b].frame= CGRectMake(10, n+70, 300, 100);
            crewLabel[b].numberOfLines = 3;
            n=n+50;
        }
        
        
        crewLabel[b].text=data4[b];
		crewLabel[b].font = [UIFont fontWithName:@"Helvetica Neue" size: 18.0];
		[labelbutton1[b] addSubview:crewLabel[b]];
        
        [Scroller addSubview:labelbutton1[b]];
        
        n=n+82;
    }
    NSLog(@"total crew data = %d",TotalCrewData);
    
    
    Scroller.contentSize = CGSizeMake(320, (82*TotalCastData)+(82*TotalCrewData)+100);
    [self.view addSubview:_footerMainView];
    
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

-(void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:YES];
//	[self.navigationController setNavigationBarHidden:NO animated:NO];
//	if ([self.navigationController.navigationBar respondsToSelector:@selector( setBackgroundImage:forBarMetrics:)]){
//		[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bar_clean.png"] forBarMetrics:UIBarMetricsDefault];
//	}
//	
}

-(void)viewWillDisappear:(BOOL)animated{
	[super viewWillDisappear:YES];
//	[self.navigationController setNavigationBarHidden:NO animated:NO];
//	if ([self.navigationController.navigationBar respondsToSelector:@selector( setBackgroundImage:forBarMetrics:)]){
//		[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bar_clean.png"] forBarMetrics:UIBarMetricsDefault];
//	}
	
}
-(void)back {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)toChat
{
//    GroupchatViewController *loginViewController = [[GroupchatViewController alloc] initWithNibName:@"GroupchatViewController" bundle:nil];
//	[self.navigationController pushViewController:loginViewController animated:NO];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setScroller:nil];

    [super viewDidUnload];
}
- (IBAction)ranbirInfo:(UIButton*)sender {
    iphone5CastNCrew * castnCrew1 = [[iphone5CastNCrew alloc]initwithStr:@"ToCastnCrew"];
    castnCrew1.check = [sender tag];
    [self.navigationController pushViewController:castnCrew1 animated:YES];
}

- (IBAction)DeepikaInfo:(UIButton*)sender {
    iphone5CastNCrew * castnCrew1 = [[iphone5CastNCrew alloc]initwithStr:@"ToCastnCrew"];
    castnCrew1.check = [sender tag];
    [self.navigationController pushViewController:castnCrew1 animated:YES];
}

- (IBAction)kalkiInfo:(UIButton*)sender {
   iphone5CastNCrew * castnCrew1 = [[iphone5CastNCrew alloc]initwithStr:@"ToCastnCrew"];
    castnCrew1.check = [sender tag];
    [self.navigationController pushViewController:castnCrew1 animated:YES];
}

- (IBAction)adityaInfo:(UIButton*)sender {
   iphone5CastNCrew * castnCrew1 = [[iphone5CastNCrew alloc]initwithStr:@"ToCastnCrew"];
	castnCrew1.check = [sender tag];
    [self.navigationController pushViewController:castnCrew1 animated:YES];
}

@end
