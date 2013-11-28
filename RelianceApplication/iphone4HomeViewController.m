//
//  iphone4HomeViewController.m
//  RelianceApplication
//
//  Created by Ashwini Pawar on 13/08/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import "iphone4HomeViewController.h"
#import "GlobalClass.h"
#import "iphone4CNCViewController.h"
#import "iphone4Video.h"
#import "iphone4NewsViewController.h"
#import "iphone4MainWallpapers.h"
#import "iphone4ContestViewController.h"
#import "iphone4Settings.h"
#import "iphone4Merchandise.h"
#import "GroupViewController.h"

@interface iphone4HomeViewController ()

@end

@implementation iphone4HomeViewController
@synthesize bannerBgView,footerView,totalBannerImage,footerMainView;
@synthesize image1,cat1,cat2,cat3,cat4,cat5,cat6,act1,act2,act3,act4,act5,act6;

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
    [self getdata];
     NSLog(@"totalbannerimage = %d",totalBannerImage);
	[self.view addSubview:footerMainView];
    GlobalClass *obj= [GlobalClass getInstance];
    
    if ([obj.TransStatus isEqualToString:@"1"]) {
        obj.TransStatus=@"0";
        
        
        GlobalClass *obj=[GlobalClass getInstance];
        obj.Mid_added= [[NSMutableArray alloc] initWithCapacity:1000];
        obj.QtyOfProducts= [[NSMutableArray alloc] initWithCapacity:1000];
        
        
        
        
    }
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    [footerMainView removeFromSuperview];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
   // [[UIApplication sharedApplication] setStatusBarHidden:NO];

    UIImage *image = [UIImage imageNamed:@"home_header_bg.jpg"];
    [[UINavigationBar appearance] setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    GlobalClass *OBJ=[GlobalClass getInstance];

//    [[NSUserDefaults standardUserDefaults] setObject:@"akshay111@u16930719.onlinehome-server.com" forKey:@"userID"];
//    NSString *jabberID = [[NSUserDefaults standardUserDefaults] stringForKey:@"userID"];
//    NSLog(@"JID=%@",jabberID);
//    [[NSUserDefaults standardUserDefaults] setObject:@"akshay123" forKey:@"userPassword"];

    
	if ([OBJ.fetchall isEqualToString:@"1"])
    {
        
             
        
    }
    else if ([OBJ.Leftcheck isEqualToString:@"0"])
    {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        
        iphone4ViewController *loginViewController = [[iphone4ViewController alloc] initWithNibName:@"iphone4ViewController" bundle:nil];
        //        [self.navigationController pushViewController:loginViewController animated:NO];
        [self presentModalViewController:loginViewController animated:NO];
    }
    else{
        [self.navigationController setNavigationBarHidden:YES animated:YES];

        iphone4ViewController *loginViewController = [[iphone4ViewController alloc] initWithNibName:@"iphone4ViewController" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:NO];
    }
    
    
    
    OBJ.Leftcheck=@"0";

    footerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"footer_bg.png"]];
    
    pagingbackground = [[UIImageView alloc]initWithFrame:CGRectMake(120, 169, 100, 14)];
  //  pagingbackground.image = [UIImage imageNamed:@"home_bnr_dot_bg.png"];
    [self.view addSubview:pagingbackground];
    n=0;
    progressUpdateTimer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(updateProgress:) userInfo:nil repeats:YES];
    
      
   }
-(void)updateProgress:(NSTimer *)progress

{
    
//  [self performSelector:@selector(scrollTracker) withObject:self afterDelay:0.0];
    
    
    
    CGFloat currentOffset = _banner_scroll.contentOffset.x;
    
    NSLog(@"n=%d",n);

    NSLog(@"currentOffset=%f",currentOffset);
    if (n==0)
        
    {
        
        currentOffset = currentOffset + 307;
        
        NSLog(@"currentOffset2=%f",currentOffset);

        
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
    
   // [self performSelector:@selector(scrollTracker) withObject:self afterDelay:1.0];
    
    
    
}



-(void)scrollTracker
{
    
    
    for (int i=0; i<totalBannerImage; i++) {
        
        if (_banner_scroll.contentOffset.x == 307*i) {
            
            for (int i=0; i<totalBannerImage; i++) {
                
                PAGINGEFFECT[i].image= [UIImage imageNamed:@"home_bnr_black_dot.png"];
                
            }
            
            PAGINGEFFECT[i].image= [UIImage imageNamed:@"home_bnr_red_dot.png"];
            
        }
   
        
        
    }


    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesBegan");
    UITouch *touch = (UITouch *)[touches anyObject];
    start = [touch locationInView:self.view].y;
    
    NSLog(@"start = %f",start);
    if(start < 400 && footerMainView.center.y > 400)//touch was not in upper area of view AND pulldownView not visible
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

-(IBAction)toRelApp:(UIButton *)sender
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Under construction" message:@"Check Back Soon" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    
}



-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    if (directionUp)
    {
        NSLog(@"touchesEnded    ----    directionUp");
        //animate pulldownView out of visibel area
        [UIView animateWithDuration:.3 animations:^{footerMainView.center = CGPointMake(320/2, 435);}];
    }
    else if(start>=0)
    {
        NSLog(@"touchesEnded    ----    start");
        //animate pulldownView with top to mainviews top
        [UIView animateWithDuration:.3 animations:^{footerMainView.center = CGPointMake(320/2, 380);}];
    }
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:YES];
    
    NSLog(@"scrolltapped");
    [progressUpdateTimer invalidate];
    progressUpdateTimer =nil;
    // [self performSelector:@selector(openFooter1:) withObject:nil afterDelay:0.01 ];
    footerMainView.frame = CGRectMake(0, 398, footerMainView.frame.size.width, footerMainView.frame.size.height);

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

// Do any additional setup after loading the view from its nib.

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
        
        data11[j]= [actoAgent objectForKey:@"banner_iphone4_img_link"];
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
            bannerImage[a] = [[AsyncImageView alloc] initWithFrame:CGRectMake(k, 0, 307, 183)];
            
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
        
        
        UITapGestureRecognizer *webViewTapped = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openclass:)];
        webViewTapped.numberOfTapsRequired = 1;
        webViewTapped.delegate = self;
        [bannerImage[a] addGestureRecognizer:webViewTapped];

        
    }
    
    

 
    _banner_scroll.contentSize = CGSizeMake(totalBannerImage*307, 163);
    //   /////////////////////////////////VIEW1////////////////////////
    
    
    
    if (cat1 == nil)
    {
        cat1 = [[AsyncImageView alloc] initWithFrame:CGRectMake(7, 188, 100.0f, 110.0f)];
        
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
    [cat1 addGestureRecognizer:webViewTapped];
    
    
    
    //   /////////////////////////////////VIEW2////////////////////////
    
    
    if (cat2    == nil)
    {
        cat2 = [[AsyncImageView alloc] initWithFrame:CGRectMake(110, 188, 100.0f, 110.0f)];
        
        cat2.contentMode = UIViewContentModeScaleToFill;
    }
    
    cat2.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];
    
    cat2.tag=1;

    
    cat2.contentMode = UIViewContentModeScaleToFill;
    cat2.userInteractionEnabled=YES;
    //cancel any previously loading images for this view
    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:cat2];
    
    //set image URL. AsyncImageView class will then dynamically load the image
    url1 = [NSURL URLWithString:data1[1]];
    
    ((AsyncImageView *)cat2).imageURL =url1;
    // _view1 = view;
    
    [self.view addSubview:cat2];
    
    
    UITapGestureRecognizer *webViewTapped1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(catopenclass:)];
    webViewTapped1.numberOfTapsRequired = 1;
    webViewTapped1.delegate = self;
    [cat2 addGestureRecognizer:webViewTapped1];
    
    
    //   /////////////////////////////////VIEW3////////////////////////
    
    
    if (cat3    == nil)
    {
        cat3 = [[AsyncImageView alloc] initWithFrame:CGRectMake(213, 188, 100.0f, 110.0f)];
        
        cat3.contentMode = UIViewContentModeScaleToFill;
    }
    cat3.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];
    cat3.tag=2;

    
    
    cat3.contentMode = UIViewContentModeScaleToFill;
    cat3.userInteractionEnabled=YES;
    //cancel any previously loading images for this view
    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:cat3];
    
    //set image URL. AsyncImageView class will then dynamically load the image
    url1 = [NSURL URLWithString:data1[2]];
    
    ((AsyncImageView *)cat3).imageURL =url1;
    // _view1 = view;
    
    [self.view addSubview:cat3];
    
    
    UITapGestureRecognizer *webViewTapped2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(catopenclass:)];
    webViewTapped2.numberOfTapsRequired = 1;
    webViewTapped2.delegate = self;
    [cat3 addGestureRecognizer:webViewTapped2];
    
    
    
    //   /////////////////////////////////VIEW4////////////////////////
    
    
    if (cat4    == nil)
    {
        cat4 = [[AsyncImageView alloc] initWithFrame:CGRectMake(7, 301, 100.0f, 110.0f)];
        
        cat4.contentMode = UIViewContentModeScaleToFill;
    }
    cat4.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];
    cat4.tag=3;

    
    cat4.contentMode = UIViewContentModeScaleToFill;
    cat4.userInteractionEnabled=YES;
    //cancel any previously loading images for this view
    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:cat4];
    
    //set image URL. AsyncImageView class will then dynamically load the image
    url1 = [NSURL URLWithString:data1[3]];
    
    ((AsyncImageView *)cat4).imageURL =url1;
    // _view1 = view;
    
    [self.view addSubview:cat4];
    
    
    UITapGestureRecognizer *webViewTapped3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(catopenclass:)];
    webViewTapped3.numberOfTapsRequired = 1;
    webViewTapped3.delegate = self;
    [cat4 addGestureRecognizer:webViewTapped3];
    
    
    
    
    //   /////////////////////////////////VIEW5////////////////////////
    
    
    if (cat5    == nil)
    {
        cat5 = [[AsyncImageView alloc] initWithFrame:CGRectMake(110, 301, 100.0f, 110.0f)];
        
        cat5.contentMode = UIViewContentModeScaleToFill;
    }
    cat5.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];
    
    cat5.tag=4;

    cat5.contentMode = UIViewContentModeScaleToFill;
    cat5.userInteractionEnabled=YES;
    //cancel any previously loading images for this view
    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:cat5];
    
    //set image URL. AsyncImageView class will then dynamically load the image
    url1 = [NSURL URLWithString:data1[4]];
    
    ((AsyncImageView *)cat5).imageURL =url1;
    // _view1 = view;
    
    [self.view addSubview:cat5];
    
    
    UITapGestureRecognizer *webViewTapped4 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(catopenclass:)];
    webViewTapped4.numberOfTapsRequired = 1;
    webViewTapped4.delegate = self;
    [cat5 addGestureRecognizer:webViewTapped4];
    
    
    
    //   /////////////////////////////////VIEW6////////////////////////
    
    
    if (cat6    == nil)
    {
        cat6 = [[AsyncImageView alloc] initWithFrame:CGRectMake(213, 301, 100.0f, 110.0f)];
        
        cat6.contentMode = UIViewContentModeScaleToFill;
    }
    
    cat6.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];
    cat6.tag=5;

    cat6.contentMode = UIViewContentModeScaleToFill;
    cat6.userInteractionEnabled=YES;
    //cancel any previously loading images for this view
    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:cat6];
    
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
	[self.view addSubview:footerMainView];}
-(void)Displayimage
{
    
    
    
}


-(void)openclass:(UITapGestureRecognizer *)sender
{
    UITapGestureRecognizer *gesture = (UITapGestureRecognizer *) sender;
    NSLog(@"tag121=%@",data10[gesture.view.tag]);
    
    if ([data10[gesture.view.tag] isEqualToString:@"videos"] ) {
        iphone4Video *loginViewController = [[iphone4Video alloc] initWithNibName:@"iphone4Video" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:YES];

    }
    
    
  else  if ([data10[gesture.view.tag] isEqualToString:@"songs"]) {
        iPhone4StreamingPlayerViewController *loginViewController1 = [[iPhone4StreamingPlayerViewController alloc] initWithNibName:@"iPhone4StreamingPlayerViewController" bundle:nil];
        [self.navigationController pushViewController:loginViewController1 animated:YES];
        
    }

    
  else  if ([data10[gesture.view.tag] isEqualToString:@"behindscence"]) {
      iphone4BehindtheScene *loginViewController = [[iphone4BehindtheScene alloc] initWithNibName:@"iphone4BehindtheScene" bundle:nil];
      [self.navigationController pushViewController:loginViewController animated:YES];
      
  }
    
  else  if ([data10[gesture.view.tag] isEqualToString:@"merchandise"]) {
      iphone4Merchandise *loginViewController = [[iphone4Merchandise alloc] initWithNibName:@"iphone4Merchandise" bundle:nil];
      [self.navigationController pushViewController:loginViewController animated:YES];
//      UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Under construction" message:@"Check Back Soon" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//      [alert show];
      
  }
    
  else  if ([data10[gesture.view.tag] isEqualToString:@"castncrew"]) {
      iphone4CNCViewController *loginViewController = [[iphone4CNCViewController alloc] initWithNibName:@"iphone4CNCViewController" bundle:nil];
      [self.navigationController pushViewController:loginViewController animated:YES];
      
  }

    
  else  if ([data10[gesture.view.tag] isEqualToString:@"theater"]) {
      iPhone4Daabang2SecondViewController *loginViewController = [[iPhone4Daabang2SecondViewController alloc] initWithNibName:@"iPhone4Daabang2SecondViewController" bundle:nil];
      [self.navigationController pushViewController:loginViewController animated:YES];
      
  }

  else  if ([data10[gesture.view.tag] isEqualToString:@"facebook"]) {
      iphone4FacebookViewController *loginViewController = [[iphone4FacebookViewController alloc] initWithNibName:@"iphone4FacebookViewController" bundle:nil];
      [self.navigationController pushViewController:loginViewController animated:YES];
      
  }
    
  else  if ([data10[gesture.view.tag] isEqualToString:@"contest"]) {
      iphone4ContestViewController *loginViewController = [[iphone4ContestViewController alloc] initWithNibName:@"iphone4ContestViewController" bundle:nil];
      [self.navigationController pushViewController:loginViewController animated:YES];
      
  }

    
  else  if ([data10[gesture.view.tag] isEqualToString:@"twitter"]) {
      iphone4TwitterViewController *loginViewController = [[iphone4TwitterViewController alloc] initWithNibName:@"iphone4TwitterViewController" bundle:nil];
      [self.navigationController pushViewController:loginViewController animated:YES];
      
  }


    
  else  if ([data10[gesture.view.tag] isEqualToString:@"news"]) {
      iphone4NewsViewController *loginViewController = [[iphone4NewsViewController alloc] initWithNibName:@"iphone4NewsViewController" bundle:nil];
      [self.navigationController pushViewController:loginViewController animated:NO];
      

      
  }

    
  else  if ([data10[gesture.view.tag] isEqualToString:@"wallpaper"]) {
      iphone4MainWallpapers *loginViewController = [[iphone4MainWallpapers alloc] initWithNibName:@"iphone4MainWallpapers" bundle:nil];
      [self.navigationController pushViewController:loginViewController animated:NO];

      
      
      
  }

  else  if ([data10[gesture.view.tag] isEqualToString:@"synopsis"]) {
      SynopsisViewController *loginViewController = [[SynopsisViewController alloc] initWithNibName:@"SynopsisViewController" bundle:nil];
      [self.navigationController pushViewController:loginViewController animated:NO];
      
      
      
      
  }

  

}




-(void)catopenclass:(UITapGestureRecognizer *)sender
{
    UITapGestureRecognizer *gesture = (UITapGestureRecognizer *) sender;
    NSLog(@"tag121=%@",data10[gesture.view.tag]);
    
    if ([data2[gesture.view.tag] isEqualToString:@"videos"] ) {
        iphone4Video *loginViewController = [[iphone4Video alloc] initWithNibName:@"iphone4Video" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:YES];
        
    }
    
    
    else  if ([data2[gesture.view.tag] isEqualToString:@"songs"]) {
        iPhone4StreamingPlayerViewController *loginViewController = [[iPhone4StreamingPlayerViewController alloc] initWithNibName:@"iPhone4StreamingPlayerViewController" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:YES];
        
    }
    
    
    else  if ([data2[gesture.view.tag] isEqualToString:@"behindscence"]) {
        iphone4BehindtheScene *loginViewController = [[iphone4BehindtheScene alloc] initWithNibName:@"iphone4BehindtheScene" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:YES];
        
    }
    
    else  if ([data2[gesture.view.tag] isEqualToString:@"merchandise"]) {
        iphone4Merchandise *loginViewController = [[iphone4Merchandise alloc] initWithNibName:@"iphone4Merchandise" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:YES];
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Under construction" message:@"Check Back Soon" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//        [alert show];
    }
    
    else  if ([data2[gesture.view.tag] isEqualToString:@"castncrew"]) {
        iphone4CNCViewController *loginViewController = [[iphone4CNCViewController alloc] initWithNibName:@"iphone4CNCViewController" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:YES];
        
    }
    
    
    else  if ([data2[gesture.view.tag] isEqualToString:@"theater"]) {
        iPhone4Daabang2SecondViewController *loginViewController = [[iPhone4Daabang2SecondViewController alloc] initWithNibName:@"iPhone4Daabang2SecondViewController" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:YES];
        
    }
    
    else  if ([data2[gesture.view.tag] isEqualToString:@"facebook"]) {
        iphone4FacebookViewController *loginViewController = [[iphone4FacebookViewController alloc] initWithNibName:@"iphone4FacebookViewController" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:YES];
        
    }
    
    else  if ([data2[gesture.view.tag] isEqualToString:@"contest"]) {
        iphone4ContestViewController *loginViewController = [[iphone4ContestViewController alloc] initWithNibName:@"iphone4ContestViewController" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:YES];
        
    }
    
    
    else  if ([data2[gesture.view.tag] isEqualToString:@"twitter"]) {
        iphone4TwitterViewController *loginViewController = [[iphone4TwitterViewController alloc] initWithNibName:@"iphone4TwitterViewController" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:YES];
        
    }
    
    
    
    else  if ([data2[gesture.view.tag] isEqualToString:@"news"]) {
        iphone4NewsViewController *loginViewController = [[iphone4NewsViewController alloc] initWithNibName:@"iphone4NewsViewController" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:NO];
        
        
        
    }
    
    
    else  if ([data2[gesture.view.tag] isEqualToString:@"wallpaper"]) {
        iphone4MainWallpapers *loginViewController = [[iphone4MainWallpapers alloc] initWithNibName:@"iphone4MainWallpapers" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:NO];
        
        
        
        
    }
    
    else  if ([data2[gesture.view.tag] isEqualToString:@"synopsis"]) {
        SynopsisViewController *loginViewController = [[SynopsisViewController alloc] initWithNibName:@"SynopsisViewController" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:NO];
        
        
        
        
    }

    
    
    
}


-(void)loadimage
{
    NSURL *imageurl = [NSURL URLWithString:@"http://apps.medialabs24x7.com/besharam/upload/category_items/home_cnc_btn.jpg"];
    
    NSData *imagedata = [[NSData alloc]initWithContentsOfURL:imageurl];
    
    UIImage *image = [UIImage imageWithData: imagedata];
    
    [image1 setImage: image];
}

-(IBAction)back:(id)sender
{
    // [[[self parentViewController]parentViewController]dismissViewControllerAnimated:YES completion:nil];
    //   [self dismissViewControllerAnimated:YES completion:nil];
    [self dismissModalViewControllerAnimated:YES];
    
}

-(IBAction)castncrew:(id)sender
{
   
//    iphone4Merchandise *loginViewController = [[iphone4Merchandise alloc] initWithNibName:@"iphone4Merchandise" bundle:nil];
//    [self.navigationController pushViewController:loginViewController animated:NO];
    
          UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Under construction" message:@"Check Back Soon" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
 
}
-(IBAction)Contest:(id)sender
{
    iphone4ContestViewController *loginViewController = [[iphone4ContestViewController alloc] initWithNibName:@"iphone4ContestViewController" bundle:nil];
    [self.navigationController pushViewController:loginViewController animated:NO];
    
    
}

-(IBAction)news:(id)sender
{
    iphone4NewsViewController *loginViewController = [[iphone4NewsViewController alloc] initWithNibName:@"iphone4NewsViewController" bundle:nil];
    [self.navigationController pushViewController:loginViewController animated:NO];
    
    
}

-(IBAction)Videos:(id)sender
{
    iphone4Video *loginViewController = [[iphone4Video alloc] initWithNibName:@"iphone4Video" bundle:nil];
    [self.navigationController pushViewController:loginViewController animated:NO];
    
    
}
-(IBAction)Wallpapers:(id)sender
{
    iphone4MainWallpapers *loginViewController = [[iphone4MainWallpapers alloc] initWithNibName:@"iphone4MainWallpapers" bundle:nil];
    [self.navigationController pushViewController:loginViewController animated:NO];
    
    
}

-(IBAction)merchandaise:(id)sender
{
    iphone4CNCViewController *loginViewController = [[iphone4CNCViewController alloc] initWithNibName:@"iphone4CNCViewController" bundle:nil];
    [self.navigationController pushViewController:loginViewController animated:NO];
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
