//
//  HomeController.m
//  Relapp
//
//  Created by Akshay on 8/1/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import "HomeController.h"
#import "Merchandise.h"
#import "iphone4Settings.h"
#import "iPhoneStreamingPlayerViewController.h"
#import "BehindTheScene.h"
#import "iPhone5Daabang2SecondViewController.h"
#import "iPhone5FacebookViewController.h"
#import "iphone5TwitterfeedsViewController.h"
#import "iphone5GroupViewController.h"


@interface HomeController ()

@end

@implementation HomeController
@synthesize image1,cat1,cat2,cat3,cat4,cat5,cat6,act1,act2,act3,act4,act5,act6;

int n = 0;
CGFloat newOffset;

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
    UIImage *image = [UIImage imageNamed:@"home_header_bg.jpg"];
    [[UINavigationBar appearance] setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    [self getdata];
    [self.navigationController setNavigationBarHidden:NO animated:YES];

    [self.view addSubview:_footerMainView];
    
    
    
    GlobalClass *obj= [GlobalClass getInstance];
    
    if ([obj.TransStatus isEqualToString:@"1"]) {
        obj.TransStatus=@"0";
               
        
                GlobalClass *obj=[GlobalClass getInstance];
                obj.Mid_added= [[NSMutableArray alloc] initWithCapacity:1000];
                obj.QtyOfProducts= [[NSMutableArray alloc] initWithCapacity:1000];
        
        
        
        
    }

}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    
//    progressUpdateTimer =
//    [NSTimer
//     scheduledTimerWithTimeInterval:1.0
//     target:self
//     selector:@selector(updateProgress)
//     userInfo:nil
//     repeats:YES];
    
    
    
    NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"app_bg_image"];
    UIImage* app_bg_image = [UIImage imageWithData:imageData];
    self.view.backgroundColor = [UIColor colorWithPatternImage:app_bg_image];
    
    _footerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"footer_bg.png"]];

    GlobalClass *OBJ=[GlobalClass getInstance];
    if ([OBJ.fetchall isEqualToString:@"1"])
    {
        
        
        
    }
    else if ([OBJ.Leftcheck isEqualToString:@"0"])
    {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        
        ViewController *loginViewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
        [self presentModalViewController:loginViewController animated:NO];
    }
    else{
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        
        ViewController *loginViewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:NO];
    }
    OBJ.Leftcheck=@"0";

//	if ([OBJ.fetchall isEqualToString:@"1"])
//    {
//        
//        
//        
//       
//    }
//    
//    else{
//        [self.navigationController setNavigationBarHidden:YES animated:YES];
//
//        ViewController *loginViewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
//        [self.navigationController pushViewController:loginViewController animated:NO];
//        
//    }
//    

    pagingbackground = [[UIImageView alloc]initWithFrame:CGRectMake(120, 215, 100, 14)];
   // pagingbackground.image = [UIImage imageNamed:@"home_bnr_dot_bg.png"];
    pagingbackground.backgroundColor = [UIColor clearColor];
    [self.view addSubview:pagingbackground];
    
    
//    UIImage *relAppImage = [UIImage imageNamed:@"home_right_rel_icon.png"];
//    UIButton *buttonChat = [UIButton buttonWithType:UIButtonTypeCustom];
//    [buttonChat setImage:relAppImage forState:UIControlStateNormal];
//    buttonChat.frame = CGRectMake(0, 0, relAppImage.size.width, relAppImage.size.height);
//    [buttonChat addTarget:self action:@selector(toRelApp:) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *customBarItem1 = [[UIBarButtonItem alloc] initWithCustomView:buttonChat];
//    self.navigationItem.RightBarButtonItem = customBarItem1;
    
    // Do any additional setup after loading the view from its nib.
    n=0;
    progressUpdateTimer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(updateProgress:) userInfo:nil repeats:YES];
    
    
}
-(void)updateProgress:(NSTimer *)progress

{
    
//    if (check==3000) {
//        
//    }
//    
//    else {
    
 //   [self performSelector:@selector(scrollTracker) withObject:self afterDelay:0.0];
    
    
    
    CGFloat currentOffset = _banner_scroll.contentOffset.x;
    NSLog(@"currentOffset=%f",currentOffset);
    
    
    
    if (n==0)
        
    {
        
        currentOffset = currentOffset + 307;
        
        
        
        if(_banner_scroll.contentSize.width >currentOffset )
            
        {
            
            
            
            // CGFloat currentOffset = _banner_scroll.contentOffset.x;
            
            
            
            newOffset = currentOffset;
            
            [_banner_scroll setContentOffset:CGPointMake(newOffset,0.0) animated:YES];
            
            // n = n+307;
            
        }
        
        else{
            
            n=1;
            
        }
        
        
        
    }
    
    
    
    if (n==1) {
        
        currentOffset=currentOffset-307;
        
        if(currentOffset >=0 )
            
        {
            
            newOffset = currentOffset;
            
            [_banner_scroll setContentOffset:CGPointMake(newOffset,0.0) animated:YES];
            
            // n = n-307;
            
        }
        
        else{
            
            n=0;
            
        }
        
    }
    
    
    
}



//-(void)revertTimer

//{

//    n = n-307;

//    CGFloat currentOffset = _banner_scroll.contentOffset.x;

//    newOffset = currentOffset - 307;

//    [_banner_scroll setContentOffset:CGPointMake(newOffset,0.0) animated:YES];

//

//}

-(void)displayPaging

{
    
    int m=0;
    
    NSLog(@"totalbannerimage = %d",totalBannerImage);
    
    for (int i=0; i<totalBannerImage; i++) {
        
        
        
        NSLog(@"totalbannerimage = %d",totalBannerImage);
        
        PAGINGEFFECT[i]  = [[UIImageView alloc] initWithFrame:CGRectMake(m+5, 2, 8,9)];
        
        PAGINGEFFECT[i].userInteractionEnabled=YES;
        
        PAGINGEFFECT[i].image= [UIImage imageNamed:@"home_bnr_black_dot.png"];
        
        [pagingbackground addSubview:PAGINGEFFECT[i]];
        
        
        
        PAGINGEFFECT[i].tag= i;
        
        
        
        m+=15;
        
    }
    
    
    
    PAGINGEFFECT[0].image= [UIImage imageNamed:@"home_bnr_red_dot.png"];
    
    [NSTimer scheduledTimerWithTimeInterval:0.0 target:self selector:@selector(scrollTracker) userInfo:nil repeats:YES];
    
    //[self performSelector:@selector(scrollTracker) withObject:self afterDelay:1.0];
    
    
    
}



-(void)scrollTracker

{
    CGFloat currentOffset = _banner_scroll.contentOffset.x;
   // NSLog(@"currentOffset222=%f",currentOffset);
    
    
    for (int i=0; i<totalBannerImage; i++) {
        
        
        if (_banner_scroll.contentOffset.x == 307*i) {
            
            for (int i=0; i<totalBannerImage; i++) {
                
                PAGINGEFFECT[i].image= [UIImage imageNamed:@"home_bnr_black_dot.png"];
                
                
                
            }
            
            PAGINGEFFECT[i].image= [UIImage imageNamed:@"home_bnr_red_dot.png"];
            
            
            
        }
        
        
        
        
        
    }
    
    
    
    
    
    //    CGFloat offSet= _Scroller1.contentOffset.y;
    
    //
    
    //   NSLog(@"Offset : %f", offSet);
    
    
    
    //    if (_banner_scroll.contentOffset.x == 307)
    
    //    {
    
    //
    
    //        for (int i=0; i<totalBannerImage; i++) {
    
    //            PAGINGEFFECT[i].image= [UIImage imageNamed:@"home_bnr_black_dot.png"];
    
    //
    
    //        }
    
    //        PAGINGEFFECT[1].image= [UIImage imageNamed:@"home_bnr_red_dot.png"];
    
    //
    
    //    }
    
    //
    
    //
    
    //    else     if (_banner_scroll.contentOffset.x == 307*2) {
    
    //        for (int i=0; i<TotalData; i++) {
    
    //            PAGINGEFFECT[i].image= [UIImage imageNamed:@"home_bnr_black_dot.png"];
    
    //
    
    //        }
    
    //
    
    //        PAGINGEFFECT[2].image= [UIImage imageNamed:@"home_bnr_red_dot.png"];
    
    //
    
    //    }
    
    //
    
    //    else     if (_banner_scroll.contentOffset.x == 307*3) {
    
    //        for (int i=0; i<TotalData; i++) {
    
    //            PAGINGEFFECT[i].image= [UIImage imageNamed:@"home_bnr_black_dot.png"];
    
    //
    
    //        }
    
    //
    
    //        PAGINGEFFECT[3].image= [UIImage imageNamed:@"home_bnr_red_dot.png"];
    
    //
    
    //    }
    
    //
    
    //    else     if (_banner_scroll.contentOffset.x == 307*4) {
    
    //        for (int i=0; i<TotalData; i++) {
    
    //            PAGINGEFFECT[i].image= [UIImage imageNamed:@"home_bnr_black_dot.png"];
    
    //
    
    //        }
    
    //
    
    //        PAGINGEFFECT[4].image= [UIImage imageNamed:@"home_bnr_red_dot.png"];
    
    //
    
    //    }
    
    //
    
    //    else     if (_banner_scroll.contentOffset.x == 307*5) {
    
    //        for (int i=0; i<TotalData; i++) {
    
    //            PAGINGEFFECT[i].image= [UIImage imageNamed:@"home_bnr_black_dot.png"];
    
    //
    
    //        }
    
    //
    
    //        PAGINGEFFECT[5].image= [UIImage imageNamed:@"home_bnr_red_dot.png"];
    
    //
    
    //    }
    
    //
    
    //    else     if (_banner_scroll.contentOffset.x == 0) {
    
    //        for (int i=0; i<TotalData+1; i++) {
    
    //            PAGINGEFFECT[i].image= [UIImage imageNamed:@"home_bnr_black_dot.png"];
    
    //
    
    //        }
    
    //
    
    //        PAGINGEFFECT[0].image= [UIImage imageNamed:@"home_bnr_red_dot.png"];
    
    //
    
    //    }
    
}

//-(void)updateProgress
//{
//    
//    
//    if(_banner_scroll.contentSize.width > n)
//    {
//    CGFloat currentOffset = _banner_scroll.contentOffset.x;
//    newOffset = currentOffset + 307;
//         [_banner_scroll setContentOffset:CGPointMake(newOffset,0.0) animated:YES];
//        n = n+307;
//}
//    
//    if(_banner_scroll.contentSize.width < n)
//    {
//        [self revertTimer];
//               
//    }
//    
//}

-(void)revertTimer
{
    n = n-307;
    CGFloat currentOffset = _banner_scroll.contentOffset.x;
    newOffset = currentOffset - 307;
    [_banner_scroll setContentOffset:CGPointMake(newOffset,0.0) animated:YES];

}
/*

-(void)displayPaging
{
    int m=0;
    NSLog(@"totalbannerimage = %d",totalBannerImage);
    for (int i=0; i<totalBannerImage; i++) {
        
        NSLog(@"totalbannerimage = %d",totalBannerImage);
        PAGINGEFFECT[i]  = [[UIImageView alloc] initWithFrame:CGRectMake(m+5, 2, 8,9)];
        PAGINGEFFECT[i].userInteractionEnabled=YES;
        PAGINGEFFECT[i].image= [UIImage imageNamed:@"home_bnr_black_dot.png"];
        [pagingbackground addSubview:PAGINGEFFECT[i]];
        
        PAGINGEFFECT[i].tag= i;
        
        m+=15;
    }
    
    PAGINGEFFECT[0].image= [UIImage imageNamed:@"home_bnr_red_dot.png"];
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(scrollTracker) userInfo:nil repeats:YES];
    
}

-(void)scrollTracker
{
    //    CGFloat offSet= _Scroller1.contentOffset.y;
    //
    //   NSLog(@"Offset : %f", offSet);
    
    if (_banner_scroll.contentOffset.x == 307)
    {
        
        for (int i=0; i<totalBannerImage; i++) {
            PAGINGEFFECT[i].image= [UIImage imageNamed:@"home_bnr_black_dot.png"];
            
        }
        PAGINGEFFECT[1].image= [UIImage imageNamed:@"home_bnr_red_dot.png"];
        
    }
    
    
    else     if (_banner_scroll.contentOffset.x == 307*2) {
        for (int i=0; i<TotalData; i++) {
            PAGINGEFFECT[i].image= [UIImage imageNamed:@"home_bnr_black_dot.png"];
            
        }
        
        PAGINGEFFECT[2].image= [UIImage imageNamed:@"home_bnr_red_dot.png"];
        
    }
    
    else     if (_banner_scroll.contentOffset.x == 307*3) {
        for (int i=0; i<TotalData; i++) {
            PAGINGEFFECT[i].image= [UIImage imageNamed:@"home_bnr_black_dot.png"];
            
        }
        
        PAGINGEFFECT[3].image= [UIImage imageNamed:@"home_bnr_red_dot.png"];
        
    }
    
    else     if (_banner_scroll.contentOffset.x == 307*4) {
        for (int i=0; i<TotalData; i++) {
            PAGINGEFFECT[i].image= [UIImage imageNamed:@"home_bnr_black_dot.png"];
            
        }
        
        PAGINGEFFECT[4].image= [UIImage imageNamed:@"home_bnr_red_dot.png"];
        
    }
    
    else     if (_banner_scroll.contentOffset.x == 307*5) {
        for (int i=0; i<TotalData; i++) {
            PAGINGEFFECT[i].image= [UIImage imageNamed:@"home_bnr_black_dot.png"];
            
        }
        
        PAGINGEFFECT[5].image= [UIImage imageNamed:@"home_bnr_red_dot.png"];
        
    }
    
    else     if (_banner_scroll.contentOffset.x == 0) {
        for (int i=0; i<TotalData+1; i++) {
            PAGINGEFFECT[i].image= [UIImage imageNamed:@"home_bnr_black_dot.png"];
            
        }
        
        PAGINGEFFECT[0].image= [UIImage imageNamed:@"home_bnr_red_dot.png"];
        
    }
    
    
    
    
    
    
}

*/

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
    NSLog(@"scrolltapped");
    [progressUpdateTimer invalidate];
    progressUpdateTimer =nil;
     _footerMainView.frame = CGRectMake(0, 487, _footerMainView.frame.size.width, _footerMainView.frame.size.height);
    // [self performSelector:@selector(openFooter1:) withObject:nil afterDelay:0.01 ];
       
}
//////////////////////////FetchAllData////////////////////////////////////////////////////////
-(void)fetchAllData
{
    GlobalClass *obj=[GlobalClass getInstance];
    
	NSString* post = [NSString stringWithFormat:@"http://apps.medialabs24x7.com/besharam/fetch_data_all_downloads_ios.php?deviceno=%@",obj.dev];
	
	
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
		NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&theResponse error:&errorReturned];
		
		
		NSError* error;
		NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data //1
                                                             options:kNilOptions
                                                               error:&error];
		
		
		
		NSLog(@"json=%@",json);
		
		
		NSDictionary* interviewdata = [json objectForKey:@"interview"]; //2
		
		NSDictionary* onsetdata = [json objectForKey:@"ontheset"]; //2
		
		NSDictionary* videodata = [json objectForKey:@"video_links"]; //2
		
		
		NSDictionary* wallpaperdata = [json objectForKey:@"small_wallpaper"]; //2
		NSDictionary* book = [json objectForKey:@"bookmyshow"]; //2
		NSDictionary* feedback1 = [json objectForKey:@"feedback"]; //2
		NSDictionary* music = [json objectForKey:@"music"]; //2
		NSDictionary* notifications = [json objectForKey:@"notifications"]; //2
		NSDictionary* cnc = [json objectForKey:@"castncrew"];
        NSDictionary* dirnote = [json objectForKey:@"directors_note"];
        NSDictionary    *category = [json objectForKey:@"cat_items"];
        
        //2
        //2
		//NSDictionary* Contests = [json objectForKey:@"contest"]; //2
        
        
		
		
		GlobalClass *obj=[GlobalClass getInstance];
		obj.str = interviewdata;
		obj.onset = onsetdata;
		obj.videolinks = videodata;
		obj.Dwall = wallpaperdata;
		obj.Bookmyshow = book;
		obj.Feedback=feedback1;
		obj.music=music;
		obj.CNC=cnc;
        obj.category=category;

        
		obj.Notifications=notifications;
        //  obj.Contests=Contests;
        
        for (NSDictionary *actoAgent in dirnote)
        {
            obj.dirnote= [actoAgent objectForKey:@"image"];
            
        }
        
        
		
		
		
		
		
	}
	
    [self getdata];
	
}


-(void)getdata
{
	GlobalClass *obj=[GlobalClass getInstance];
	NSLog(@"ddata=%@",obj.category);
	
    int i=0;
    
    
    for (NSDictionary *actoAgent1 in obj.appData)
    {
        NSString *appBG= [actoAgent1 objectForKey:@"app_bgmain_ios"];
        NSLog(@"App Bg is = %@",appBG);
        NSString *appID= [actoAgent1 objectForKey:@"app_id"];
        NSString *appMovieName = [actoAgent1 objectForKey:@"app_movie_name"];
        
        if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"app_bgmain_ios"]isEqualToString:appBG ]) {
            
            NSLog(@"Same Background Image **  \n%@ \n%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"app_bgmain_ios"],appBG);
        }
        else{
            
            NSURL *url = [NSURL URLWithString:appBG];
            NSData *imageData = [NSData dataWithContentsOfURL:url];
            UIImage *image = [UIImage imageWithData:imageData];
            
            NSUserDefaults *setUserDefaults=[NSUserDefaults standardUserDefaults];
            [setUserDefaults setObject:UIImageJPEGRepresentation(image,1.0) forKey:@"app_bg_image"];
            [setUserDefaults setObject:appBG forKey:@"app_bgmain_ios"];
            [setUserDefaults setObject:appID forKey:@"app_id"];
            [setUserDefaults setObject:appMovieName forKey:@"app_movie_name"];
        }
        
    }
    
    NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"app_bg_image"];
    UIImage* app_bg_image = [UIImage imageWithData:imageData];
    self.view.backgroundColor = [UIColor colorWithPatternImage:app_bg_image];
    
	
    
   
	

    
    for (NSDictionary *actoAgent in obj.category)
	{
        
        data1[i]= [actoAgent objectForKey:@"cat_img_link"];
		NSLog(@"cat_img_link=%@",data1[i]);
		
        
        data2[i]= [actoAgent objectForKey:@"cat_name"];
		NSLog(@"cat_name=%@",data2[i]);
		
        
		
		i++;
	}
	TotalData=i;

    
    
    NSLog(@"bannerData=%@",obj.Banner);
	
	int j=0;
	for (NSDictionary *actoAgent in obj.Banner)
	{
        
        data11[j]= [actoAgent objectForKey:@"banner_img_link"];
		NSLog(@"banner_img_link=%@",data11[j]);
		
        
        data10[j]= [actoAgent objectForKey:@"banner_names"];
		NSLog(@"banner_names=%@",data10[j]);
		
        
		
		j++;
	}
    totalBannerImage = j;
    NSLog(@"totalbannerimage = %d",totalBannerImage);
     int k = 0;
    for (int a = 0; a<totalBannerImage; a++) {
        
        
        //bannerImage[a] = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 163)];
        
        bannerActivityIndicator[a] = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
        [bannerActivityIndicator[a] setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
        bannerActivityIndicator[a].center = CGPointMake(bannerImage[a].frame.size.width/2,bannerImage[a].frame.size.height/2);
        [bannerImage[a] addSubview:activityIndicator[a]];
        [bannerActivityIndicator[a] startAnimating];
        
        if (bannerImage[a] == nil)
        {
            bannerImage[a] = [[AsyncImageView alloc] initWithFrame:CGRectMake(k, 0, 307, 230)];
            
            bannerImage[a].contentMode = UIViewContentModeScaleToFill;
        }
        
        bannerImage[a].backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];
        
        bannerImage[a].contentMode = UIViewContentModeScaleToFill;
        bannerImage[a].userInteractionEnabled=YES;
        
        [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:bannerImage[a]];
        
          bannerImage[a].tag=a;
        NSURL *url1 = [NSURL URLWithString:data11[a]];
        NSLog(@"nsurl = %@",url1);
        ((AsyncImageView *)bannerImage[a]).imageURL =url1;
        [_banner_scroll addSubview:bannerImage[a]];
        k=k+307;
        
        UITapGestureRecognizer *webViewTapped6 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openclass:)];
        webViewTapped6.numberOfTapsRequired = 1;
        webViewTapped6.delegate = self;
        [bannerImage[a] addGestureRecognizer:webViewTapped6];
    }
    
    _banner_scroll.contentSize = CGSizeMake(totalBannerImage*307, 210);
    
    //   /////////////////////////////////VIEW1////////////////////////

    
    if (cat1 == nil)
    {
        cat1 = [[AsyncImageView alloc] initWithFrame:CGRectMake(7, 246, 100.0f, 122.0f)];
        
        cat1.contentMode = UIViewContentModeScaleToFill;
    }
    
    cat1.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];

    
    cat1.contentMode = UIViewContentModeScaleToFill;
    cat1.userInteractionEnabled=YES;
    //cancel any previously loading images for this view
    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:cat1];
     cat1.tag=0;
    //set image URL. AsyncImageView class will then dynamically load the image
    NSURL *url1 = [NSURL URLWithString:data1[0]];
    
    ((AsyncImageView *)cat1).imageURL =url1;
    // _view1 = view;
    
    [self.view addSubview:cat1];
    
    
    UITapGestureRecognizer *webViewTapped = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(catopenclass:)];
    webViewTapped.numberOfTapsRequired = 1;
    webViewTapped.delegate = self;
    webViewTapped.view.tag=cat1.tag=0;
    [cat1 addGestureRecognizer:webViewTapped];
    
    
    
    //   /////////////////////////////////VIEW2////////////////////////
    
    
    if (cat2    == nil)
    {
        cat2 = [[AsyncImageView alloc] initWithFrame:CGRectMake(110, 246, 100.0f, 122.0f)];
        
        cat2.contentMode = UIViewContentModeScaleToFill;
    }
    
    cat2.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];

    
    cat2.contentMode = UIViewContentModeScaleToFill;
    cat2.userInteractionEnabled=YES;
    //cancel any previously loading images for this view
    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:cat2];
    
    //set image URL. AsyncImageView class will then dynamically load the image
    url1 = [NSURL URLWithString:data1[1]];
    
    ((AsyncImageView *)cat2).imageURL =url1;
    // _view1 = view;
     cat2.tag=1;
    [self.view addSubview:cat2];
    
    
    UITapGestureRecognizer *webViewTapped1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(catopenclass:)];
    webViewTapped1.numberOfTapsRequired = 1;
    webViewTapped1.delegate = self;
     webViewTapped1.view.tag=cat2.tag;
    [cat2 addGestureRecognizer:webViewTapped1];
    
    
    //   /////////////////////////////////VIEW3////////////////////////
    
    
    if (cat3    == nil)
    {
        cat3 = [[AsyncImageView alloc] initWithFrame:CGRectMake(212, 246, 100.0f, 122.0f)];
        
        cat3.contentMode = UIViewContentModeScaleToFill;
    }
    
    
    cat3.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];

    cat3.contentMode = UIViewContentModeScaleToFill;
    cat3.userInteractionEnabled=YES;
    //cancel any previously loading images for this view
    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:cat3];
    
    //set image URL. AsyncImageView class will then dynamically load the image
    url1 = [NSURL URLWithString:data1[2]];
    
    ((AsyncImageView *)cat3).imageURL =url1;
    // _view1 = view;
     cat3.tag=2;
    [self.view addSubview:cat3];
    
    
    UITapGestureRecognizer *webViewTapped2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(catopenclass:)];
    webViewTapped2.numberOfTapsRequired = 1;
    webViewTapped2.delegate = self;
    [cat3 addGestureRecognizer:webViewTapped2];
    
    
    
    //   /////////////////////////////////VIEW4////////////////////////
    
    
    if (cat4    == nil)
    {
        cat4 = [[AsyncImageView alloc] initWithFrame:CGRectMake(7, 371, 100.0f, 122.0f)];
        
        cat4.contentMode = UIViewContentModeScaleToFill;
    }
    
    
    cat4.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];

    cat4.contentMode = UIViewContentModeScaleToFill;
    cat4.userInteractionEnabled=YES;
    //cancel any previously loading images for this view
    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:cat4];
    
    //set image URL. AsyncImageView class will then dynamically load the image
    url1 = [NSURL URLWithString:data1[3]];
    
    ((AsyncImageView *)cat4).imageURL =url1;
    // _view1 = view;
     cat4.tag=3;
    [self.view addSubview:cat4];
    
    
    UITapGestureRecognizer *webViewTapped3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(catopenclass:)];
    webViewTapped3.numberOfTapsRequired = 1;
    webViewTapped3.delegate = self;
    [cat4 addGestureRecognizer:webViewTapped3];
    
    
    
    
    //   /////////////////////////////////VIEW5////////////////////////
    
    
    if (cat5    == nil)
    {
        cat5 = [[AsyncImageView alloc] initWithFrame:CGRectMake(110, 371, 100.0f, 122.0f)];
        
        cat5.contentMode = UIViewContentModeScaleToFill;
    }
    
    cat5.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];

    
    cat5.contentMode = UIViewContentModeScaleToFill;
    cat5.userInteractionEnabled=YES;
    //cancel any previously loading images for this view
    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:cat5];
    
    //set image URL. AsyncImageView class will then dynamically load the image
    url1 = [NSURL URLWithString:data1[4]];
    
    ((AsyncImageView *)cat5).imageURL =url1;
    // _view1 = view;
     cat5.tag=4;
    [self.view addSubview:cat5];
    
    
    UITapGestureRecognizer *webViewTapped4 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(catopenclass:)];
    webViewTapped4.numberOfTapsRequired = 1;
    webViewTapped4.delegate = self;
    [cat5 addGestureRecognizer:webViewTapped4];
    
    
    
    //   /////////////////////////////////VIEW6////////////////////////
    
    
    if (cat6    == nil)
    {
        cat6 = [[AsyncImageView alloc] initWithFrame:CGRectMake(212, 371, 100.0f, 122.0f)];
        
        cat6.contentMode = UIViewContentModeScaleToFill;
    }
    
    
    cat6.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];

    cat6.contentMode = UIViewContentModeScaleToFill;
    cat6.userInteractionEnabled=YES;
    //cancel any previously loading images for this view
    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:cat6];
     cat6.tag=5;
    //set image URL. AsyncImageView class will then dynamically load the image
    url1 = [NSURL URLWithString:data1[5]];
    
    ((AsyncImageView *)cat6).imageURL =url1;
    // _view1 = view;
    
    [self.view addSubview:cat6];
    
    
    UITapGestureRecognizer *webViewTapped5 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(catopenclass:)];
    webViewTapped5.numberOfTapsRequired = 1;
    webViewTapped5.delegate = self;
    [cat6 addGestureRecognizer:webViewTapped5];
    
    [self displayPaging];
    [self.view addSubview:_footerMainView];
	
}

-(void)openclass:(UITapGestureRecognizer *)sender
{
    UITapGestureRecognizer *gesture = (UITapGestureRecognizer *) sender;
    NSLog(@"tag121Opeen=%@",data10[gesture.view.tag]);
    
    if ([data10[gesture.view.tag] isEqualToString:@"videos"] )
    {
        iphone5Video *loginViewController = [[iphone5Video alloc] initWithNibName:@"iphone5Video" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:YES];
        
    }
    
    
    else  if ([data10[gesture.view.tag] isEqualToString:@"songs"]) {
        iPhoneStreamingPlayerViewController *loginViewController = [[iPhoneStreamingPlayerViewController alloc] initWithNibName:@"iPhoneStreamingPlayerViewController" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:YES];
        
    }
    
    
    else  if ([data10[gesture.view.tag] isEqualToString:@"behindscence"]) {
        BehindTheScene *loginViewController = [[BehindTheScene alloc] initWithNibName:@"BehindTheScene" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:YES];
        
    }
    
    else  if ([data10[gesture.view.tag] isEqualToString:@"merchandise"]) {
        
        Merchandise *loginViewController = [[Merchandise alloc] initWithNibName:@"Merchandise" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:YES];
    }
    
    else  if ([data10[gesture.view.tag] isEqualToString:@"castncrew"]) {
        iphone5CastNCrew *loginViewController = [[iphone5CastNCrew alloc] initWithNibName:@"iphone5CastNCrew" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:YES];
        
    }
    
    
    else  if ([data10[gesture.view.tag] isEqualToString:@"theater"]) {
       iPhone5Daabang2SecondViewController *loginViewController = [[iPhone5Daabang2SecondViewController alloc] initWithNibName:@"iPhone5Daabang2SecondViewController" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:YES];
        
    }
    
    else  if ([data10[gesture.view.tag] isEqualToString:@"facebook"]) {
        iPhone5FacebookViewController *loginViewController = [[iPhone5FacebookViewController alloc] initWithNibName:@"iPhone5FacebookViewController" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:YES];
        
    }
    
    else  if ([data10[gesture.view.tag] isEqualToString:@"contest"]) {
        ContestViewController *loginViewController = [[ContestViewController alloc] initWithNibName:@"ContestViewController" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:YES];
        
    }
    
    
    else  if ([data10[gesture.view.tag] isEqualToString:@"twitter"]) {
        iphone5TwitterfeedsViewController *loginViewController = [[iphone5TwitterfeedsViewController alloc] initWithNibName:@"iphone5TwitterfeedsViewController" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:YES];
        
    }
    
    
    
    else  if ([data10[gesture.view.tag] isEqualToString:@"news"]) {
        NewsViewController *loginViewController = [[NewsViewController alloc] initWithNibName:@"NewsViewController" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:NO];
        
        
        
    }
    
    
    else  if ([data10[gesture.view.tag] isEqualToString:@"wallpaper"]) {
        MainWallpapers *loginViewController = [[MainWallpapers alloc] initWithNibName:@"MainWallpapers" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:NO];
        
        
        
        
    }
    
    
    else  if ([data10[gesture.view.tag] isEqualToString:@"synopsis"]) {
        iphone5Synopsis *loginViewController = [[iphone5Synopsis alloc] initWithNibName:@"iphone5Synopsis" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:NO];
        
        
        
        
    }

    
}




-(void)catopenclass:(UITapGestureRecognizer *)sender
{
    UITapGestureRecognizer *gesture = (UITapGestureRecognizer *) sender;
    NSLog(@"tag121Catopen=%@     ------  %d",data10[gesture.view.tag],gesture.view.tag);
    
    if ([data2[gesture.view.tag] isEqualToString:@"videos"] ) {
        iphone5Video *loginViewController = [[iphone5Video alloc] initWithNibName:@"iphone5Video" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:YES];
        
    }
    
    
    else  if ([data2[gesture.view.tag] isEqualToString:@"songs"]) {
        iPhoneStreamingPlayerViewController *loginViewController = [[iPhoneStreamingPlayerViewController alloc] initWithNibName:@"iPhoneStreamingPlayerViewController" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:YES];
        
    }
    
    
    else  if ([data2[gesture.view.tag] isEqualToString:@"behindscence"]) {
        BehindTheScene *loginViewController = [[BehindTheScene alloc] initWithNibName:@"BehindTheScene" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:YES];
        
    }
    
    else  if ([data2[gesture.view.tag] isEqualToString:@"merchandise"]) {
        Merchandise *loginViewController = [[Merchandise alloc] initWithNibName:@"Merchandise" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:YES];

    }
    
    else  if ([data2[gesture.view.tag] isEqualToString:@"castncrew"]) {
        
        NSLog(@"Ashwini cast n crew");
        iphone5CastNCrew *loginViewController = [[iphone5CastNCrew alloc] initWithNibName:@"iphone5CastNCrew" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:YES];
        
    }
    
    
    else  if ([data2[gesture.view.tag] isEqualToString:@"theater"]) {
        iPhone5Daabang2SecondViewController *loginViewController = [[iPhone5Daabang2SecondViewController alloc] initWithNibName:@"iPhone5Daabang2SecondViewController" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:YES];
        
    }
    
    else  if ([data2[gesture.view.tag] isEqualToString:@"facebook"]) {
        iPhone5FacebookViewController *loginViewController = [[iPhone5FacebookViewController alloc] initWithNibName:@"iPhone5FacebookViewController" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:YES];
        
    }
    
    else  if ([data2[gesture.view.tag] isEqualToString:@"contest"]) {
        ContestViewController *loginViewController = [[ContestViewController alloc] initWithNibName:@"ContestViewController" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:YES];
        
    }
    
    
    else  if ([data2[gesture.view.tag] isEqualToString:@"twitter"]) {
        iphone5TwitterfeedsViewController *loginViewController = [[iphone5TwitterfeedsViewController alloc] initWithNibName:@"iphone5TwitterfeedsViewController" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:YES];
        
    }
    
    
    
    else  if ([data2[gesture.view.tag] isEqualToString:@"news"]) {
        NewsViewController *loginViewController = [[NewsViewController alloc] initWithNibName:@"NewsViewController" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:NO];
        
        
        
    }
    
    
    else  if ([data2[gesture.view.tag] isEqualToString:@"wallpaper"]) {
        MainWallpapers *loginViewController = [[MainWallpapers alloc] initWithNibName:@"MainWallpapers" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:NO];
        
        
        
        
    }
    
    else  if ([data2[gesture.view.tag] isEqualToString:@"synopsis"]) {
        iphone5Synopsis *loginViewController = [[iphone5Synopsis alloc] initWithNibName:@"iphone5Synopsis" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:NO];
        
        
        
        
    }

    
    
}


- (IBAction)myProfile:(id)sender
{
    iphone5Settings *setting = [[iphone5Settings alloc]initWithNibName:@"iphone5Settings" bundle:nil];
    [self.navigationController pushViewController:setting animated:YES];
    
}

-(IBAction)toRelApp:(UIButton *)sender
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Under construction" message:@"Check Back Soon" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    
}

- (IBAction)merchandise:(id)sender
{
    Merchandise *loginViewController = [[Merchandise alloc] initWithNibName:@"Merchandise" bundle:nil];
    [self.navigationController pushViewController:loginViewController animated:YES];
}
- (IBAction)chat:(id)sender
{
       iphone5GroupViewController *group = [[iphone5GroupViewController alloc]initWithNibName:@"iphone5GroupViewController" bundle:nil];
      [self.navigationController pushViewController:group animated:YES];
    
      
}


-(void)Displayimage
{
    
    
  
}
//-(void)DisplayCategory
//{
//	
////	[self getdata];
//    int m=0;
//    for(int a=0;a<6;a++)
//    {
//        bannerImage[a] = [[UIImageView alloc] initWithFrame:CGRectMake(0, m, 355, 230)];
//        bannerImage[a].userInteractionEnabled = YES;
//        [self.descriptionScroll addSubview:bannerImage[a]];
//        
//        UITapGestureRecognizer *webViewTapped = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openDetails:)];
//		webViewTapped.numberOfTapsRequired = 1;
//        bannerImage[a].tag = a;
//		[bannerImage[a] addGestureRecognizer:webViewTapped];
//        
//        activityIndicator[a] = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
//        [activityIndicator[a] setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
//        activityIndicator[a].center = CGPointMake(bannerImage[a].frame.size.width/2,bannerImage[a].frame.size.height/2);
//        [bannerImage[a] addSubview:activityIndicator[a]];
//        [activityIndicator[a] startAnimating];
//        
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), ^(void) {
//            
//            NSURL *url = [NSURL URLWithString:data2[a]];
//            NSData *imageData = [NSData dataWithContentsOfURL:url];
//            UIImage *image = [UIImage imageWithData:imageData];
//            
//            bannerImage[a].image = image;
//            b=a;
//            [activityIndicator[a] stopAnimating];
//            
//        });
//        
//        m+=230;
//    }
//    
//    descriptionScroll.contentSize = CGSizeMake(355, TotalData*230);
//    
//}


-(void)loadimage
{
    NSURL *imageurl = [NSURL URLWithString:@"http://apps.medialabs24x7.com/besharam/upload/category_items/home_cnc_btn.jpg"];
    
    NSData *imagedata = [[NSData alloc]initWithContentsOfURL:imageurl];
    
    UIImage *image = [UIImage imageWithData: imagedata];
    
    [image1 setImage: image];
}



-(IBAction)castncrew:(id)sender
{
    iphone5CastNCrew *loginViewController = [[iphone5CastNCrew alloc] initWithNibName:@"iphone5CastNCrew" bundle:nil];
    [self.navigationController pushViewController:loginViewController animated:NO];
    
    
}
-(IBAction)Contest:(id)sender
{
    ContestViewController *loginViewController = [[ContestViewController alloc] initWithNibName:@"ContestViewController" bundle:nil];
    [self.navigationController pushViewController:loginViewController animated:NO];
    
 
}

-(IBAction)news:(id)sender
{
    NewsViewController *loginViewController = [[NewsViewController alloc] initWithNibName:@"NewsViewController" bundle:nil];
    [self.navigationController pushViewController:loginViewController animated:NO];
    
    
}

-(IBAction)Videos:(id)sender
{
    iphone5Video *loginViewController = [[iphone5Video alloc] initWithNibName:@"iphone5Video" bundle:nil];
    [self.navigationController pushViewController:loginViewController animated:NO];
    
    
}
-(IBAction)Wallpapers:(id)sender
{
    MainWallpapers *loginViewController = [[MainWallpapers alloc] initWithNibName:@"MainWallpapers" bundle:nil];
    [self.navigationController pushViewController:loginViewController animated:NO];
    
    
}

-(IBAction)merchandaise:(id)sender
{
    Merchandise *loginViewController = [[Merchandise alloc] initWithNibName:@"Merchandise" bundle:nil];
    [self.navigationController pushViewController:loginViewController animated:YES];

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

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate; // called on finger up if user dragged. decelerate is true if it will continue moving afterwards
{
    NSLog(@"scrolltapped");
    [progressUpdateTimer invalidate];
    progressUpdateTimer =nil;
   }



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
