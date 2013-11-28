//
//  R_Home_5.m
//  RelianceApplication
//
//  Created by Ashwini Pawar on 15/10/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import "R_Home_5.h"
#import "HomeController.h"
#import "GlobalClass.h"
#import "MainWallpapers.h"
#import "ContestViewController.h"
#import "iphone5GroupViewController.h"
#import "R_FeedsVC_5.h"
#import "ViewController.h"
#import "ShortScenesVC.h"
#import "R_Awards_4.h"



@interface R_Home_5 ()

@end

@implementation R_Home_5

@synthesize bannerBgView,footerView,totalBannerImage,footerMainView;
@synthesize image1,cat1,cat2,cat3,cat4,cat5,cat6,act1,act2,act3,act4,act5,act6,cat7;

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
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    NSLog(@"totalbannerimage = %d",totalBannerImage);
	[self.view addSubview:footerMainView];
    GlobalClass *obj= [GlobalClass getInstance];
    
    if ([obj.TransStatus isEqualToString:@"1"]) {
        obj.TransStatus=@"0";
        
        
        GlobalClass *obj=[GlobalClass getInstance];
        obj.Mid_added= [[NSMutableArray alloc] initWithCapacity:1000];
        obj.QtyOfProducts= [[NSMutableArray alloc] initWithCapacity:1000];
        
        
        
        
    }
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"home_header_bg1.jpg"];
    [[UINavigationBar appearance] setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"home_bg.jpg"]];

    _mid_scroll.contentSize = CGSizeMake(640, 37);
    _bottom_scroll.contentSize = CGSizeMake(640, 230);
    
    // [[UIApplication sharedApplication] setStatusBarHidden:NO];
    
    
//    GlobalClass *OBJ=[GlobalClass getInstance];
//    
//    
//    
//    
//	if ([OBJ.fetchall isEqualToString:@"1"])
//    {
//        
//        [self.navigationController setNavigationBarHidden:NO animated:YES];
//        
//        
//    }
//    
//    else{
//        [self.navigationController setNavigationBarHidden:YES animated:YES];
//        
//        ViewController *loginViewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
////        [self presentModalViewController:loginViewController animated:NO];
//        [self.navigationController pushViewController:loginViewController animated:NO];
//
//    }
//    
    
    GlobalClass *OBJ=[GlobalClass getInstance];
    if ([OBJ.fetchall isEqualToString:@"1"])
    {
        
        
        
    }
    else if ([OBJ.Leftcheck isEqualToString:@"1"])
    {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        
        ViewController *loginViewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
        if ([OBJ.CHECK_LOADING isEqualToString:@"1"]) {
            [self.navigationController pushViewController:loginViewController animated:NO];
        OBJ.CHECK_LOADING=@"0";

        }
        else
        [self presentModalViewController:loginViewController animated:NO];
    }
    else{
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        
        ViewController *loginViewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:NO];
    }

    OBJ.Leftcheck=@"1";
    
    pagingbackground = [[UIImageView alloc]initWithFrame:CGRectMake(130, 210, 100, 14)];
    //  pagingbackground.image = [UIImage imageNamed:@"home_bnr_dot_bg.png"];
    [self.view addSubview:pagingbackground];
    n=0;
    progressUpdateTimer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(updateProgress:) userInfo:nil repeats:YES];
    
    
}
-(void)updateProgress:(NSTimer *)progress
{
    
    
    CGFloat currentOffset = _banner_scroll.contentOffset.x;
    
    NSLog(@"n=%d",n);
    
    NSLog(@"currentOffset=%f",currentOffset);
    if (n==0)
        
    {
        
        currentOffset = currentOffset + 320;
        
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
        
        currentOffset=currentOffset-320;
        
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
        
        if (_banner_scroll.contentOffset.x == 320*i) {
            
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
    
    
    
    
    for (NSDictionary *actoAgent in obj.category)
	{
        
        data1[i]= [actoAgent objectForKey:@"cat_img"];
		NSLog(@"cat_img=%@",data1[i]);
		
        
        data2[i]= [actoAgent objectForKey:@"cat_name"];
		NSLog(@"cat_name=%@",data2[i]);
		
        
		
		i++;
        
    }
	TotalData=i;
    
    
    
	NSLog(@"bannerData=%@",obj.Banner);
	
	int j=0;
	for (NSDictionary *actoAgent in obj.Banner)
	{
        
        //        data11[j]= [actoAgent objectForKey:@"banner_iphone4_img_link"];
        //		NSLog(@"banner_img_link=%@",data11[j]);
        //
        //
        //        data10[j]= [actoAgent objectForKey:@"banner_names"];
        //		NSLog(@"banner_names=%@",data10[j]);
		
        data11[j]= [actoAgent objectForKey:@"banner_img"];
		NSLog(@"banner_img=%@",data11[j]);
		
        
        data10[j]= [actoAgent objectForKey:@"banner_big_img"];
		NSLog(@"banner_big_img=%@",data10[j]);
        
        data12[j]= [actoAgent objectForKey:@"banner_title"];
		NSLog(@"banner_title=%@",data12[j]);
        
        data13[j]= [actoAgent objectForKey:@"movie_id"];
		NSLog(@"movie_id=%@",data13[j]);


		
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
            bannerImage[a] = [[AsyncImageView alloc] initWithFrame:CGRectMake(k, 0, 320, 233)];
            
            bannerImage[a].contentMode = UIViewContentModeScaleToFill;
        }
        
        bannerImage[a].backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];
        
        bannerImage[a].contentMode = UIViewContentModeScaleToFill;
        bannerImage[a].userInteractionEnabled=YES;
        
        [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:bannerImage[a]];
        
        bannerImage[a].tag=a;
        NSURL *url1 = [NSURL URLWithString:data10[a]];
        NSLog(@"nsurl = %@",url1);
        ((AsyncImageView *)bannerImage[a]).imageURL =url1;
        [_banner_scroll addSubview:bannerImage[a]];
        
        k=k+320;
        
        
        UITapGestureRecognizer *webViewTapped = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openclass:)];
//        UITapGestureRecognizer *webViewTapped = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(traillers:)];

        
        webViewTapped.numberOfTapsRequired = 1;
        webViewTapped.delegate = self;
        [bannerImage[a] addGestureRecognizer:webViewTapped];
        
        
    }
    
    
    
    
    _banner_scroll.contentSize = CGSizeMake(totalBannerImage*320, 233);
    //   /////////////////////////////////VIEW1////////////////////////
    NSURL *url1 ;
    for (int i=0; i<=6 ; i++) {
        
        if ([data2[i] isEqualToString:@"catalogue"])
        {
            if (cat1 == nil)
            {
                cat1 = [[AsyncImageView alloc] initWithFrame:CGRectMake(0, 0, 134.0f, 230.0f)];
                
                cat1.contentMode = UIViewContentModeScaleToFill;
            }
            
            cat1.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];
            
            cat1.contentMode = UIViewContentModeScaleToFill;
            cat1.userInteractionEnabled=YES;
            //cancel any previously loading images for this view
            [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:cat1];
            cat1.tag=0;
            
            //set image URL. AsyncImageView class will then dynamically load the image
            url1 = [NSURL URLWithString:data1[0]];
            
            ((AsyncImageView *)cat1).imageURL =url1;
            // _view1 = view;
            
            [_bottomview addSubview:cat1];
            
            
            UITapGestureRecognizer *webViewTapped = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(catopenclass:)];
            webViewTapped.numberOfTapsRequired = 1;
            webViewTapped.delegate = self;
            [cat1 addGestureRecognizer:webViewTapped];
            
            
        }
        if ([data2[i] isEqualToString:@"shortscenes"]) {
            
            //   /////////////////////////////////VIEW2////////////////////////
            
            
            if (cat2    == nil)
            {
                cat2 = [[AsyncImageView alloc] initWithFrame:CGRectMake(135, 0, 103.0f, 173.0f)];
                
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
            
            [_bottomview addSubview:cat2];
            
            
            UITapGestureRecognizer *webViewTapped1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(catopenclass:)];
            webViewTapped1.numberOfTapsRequired = 1;
            webViewTapped1.delegate = self;
            [cat2 addGestureRecognizer:webViewTapped1];
            
        }
        
        
        if ([data2[i] isEqualToString:@"awards"]) {
            
            //   /////////////////////////////////VIEW3////////////////////////
            
            
            if (cat3    == nil)
            {
                cat3 = [[AsyncImageView alloc] initWithFrame:CGRectMake(239, 0, 79.0f, 173.0f)];
                
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
            
            [_bottomview   addSubview:cat3];
            
            
            UITapGestureRecognizer *webViewTapped2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(catopenclass:)];
            webViewTapped2.numberOfTapsRequired = 1;
            webViewTapped2.delegate = self;
            [cat3 addGestureRecognizer:webViewTapped2];
            
        }
        
        if ([data2[i] isEqualToString:@"search"]) {
            
            
            //   /////////////////////////////////VIEW4////////////////////////
            
            
            if (cat4    == nil)
            {
                cat4 = [[AsyncImageView alloc] initWithFrame:CGRectMake(135, 174, 183.0f, 56.0f)];
                
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
            
            [_bottomview addSubview:cat4];
            
            
            UITapGestureRecognizer *webViewTapped3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(catopenclass:)];
            webViewTapped3.numberOfTapsRequired = 1;
            webViewTapped3.delegate = self;
            [cat4 addGestureRecognizer:webViewTapped3];
            
        }
        
        if ([data2[i] isEqualToString:@"downloads"]) {
            
            //   /////////////////////////////////VIEW5////////////////////////
            
            
            if (cat5    == nil)
            {
                //        cat5 = [[AsyncImageView alloc] initWithFrame:CGRectMake(319, 0, 197.0f, 186.0f)];
                cat5 = [[AsyncImageView alloc] initWithFrame:CGRectMake(515, 0, 121.0f, 187.0f)];
                
                
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
            
            [_bottomview addSubview:cat5];
            
            
            UITapGestureRecognizer *webViewTapped4 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(catopenclass:)];
            webViewTapped4.numberOfTapsRequired = 1;
            webViewTapped4.delegate = self;
            [cat5 addGestureRecognizer:webViewTapped4];
            
        }
        
        if ([data2[i] isEqualToString:@"contest"]) {
            
            
            //   /////////////////////////////////VIEW6////////////////////////
            
            
            if (cat6    == nil)
            {
                
                //        cat6 = [[AsyncImageView alloc] initWithFrame:CGRectMake(516, 0, 118.0f, 186.0f)];
                cat6 = [[AsyncImageView alloc] initWithFrame:CGRectMake(318, 0, 197.0f, 187.0f)];
                
                
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
            
            [_bottomview addSubview:cat6];
            
            
            UITapGestureRecognizer *webViewTapped5 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(catopenclass:)];
            webViewTapped5.numberOfTapsRequired = 1;
            webViewTapped5.delegate = self;
            [cat6 addGestureRecognizer:webViewTapped5];
            
        }
        
        if ([data2[i] isEqualToString:@"merchandise"]) {
            
            
            
            
            if (cat7    == nil)
            {
                cat7 = [[AsyncImageView alloc] initWithFrame:CGRectMake(318, 188, 318.0f, 42.0f)];
                
                cat7.contentMode = UIViewContentModeScaleToFill;
            }
            
            cat7.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];
            cat7.tag=6;
            
            cat7.contentMode = UIViewContentModeScaleToFill;
            cat7.userInteractionEnabled=YES;
            //cancel any previously loading images for this view
            [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:cat7];
            
            //set image URL. AsyncImageView class will then dynamically load the image
            url1 = [NSURL URLWithString:data1[6]];
            
            ((AsyncImageView *)cat7).imageURL =url1;
            // _view1 = view;
            
            [_bottomview addSubview:cat7];
            
            
            UITapGestureRecognizer *webViewTapped6 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(catopenclass:)];
            webViewTapped6.numberOfTapsRequired = 1;
            webViewTapped6.delegate = self;
            [cat7 addGestureRecognizer:webViewTapped6];
            
            
        }
        
    }
    [self displayPaging];
}


-(void)Displayimage
{
    
    
    
}


-(void)openclass:(UITapGestureRecognizer *)sender
{
    
    UITapGestureRecognizer *gesture = (UITapGestureRecognizer *) sender;
    NSLog(@"openMovieDetailsforID=%@",data1[gesture.view.tag]);
    R_OpenMovie_5 *pg = [[R_OpenMovie_5 alloc]initWithNibName:@"R_OpenMovie_5" bundle:nil];
    pg.getiID= data13[gesture.view.tag];
    [self.navigationController pushViewController:pg animated:YES];

    
    
  /*  UITapGestureRecognizer *gesture = (UITapGestureRecognizer *) sender;
    NSLog(@"tag121=%@",data10[gesture.view.tag]);
    
      
    if ([data10[gesture.view.tag] isEqualToString:@"merchandise"]) {
        Merchandise *loginViewController = [[Merchandise alloc] initWithNibName:@"Merchandise" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:YES];
        
    }
    
    
    if ([data10[gesture.view.tag] isEqualToString:@"facebook"]) {
        R_FeedsVC_5 *loginViewController = [[R_FeedsVC_5 alloc] initWithNibName:@"R_FeedsVC_5" bundle:nil];
        loginViewController.FEEDTAG = @"FacebookTag";
        [self.navigationController pushViewController:loginViewController animated:YES];
        
    }
    
    if ([data10[gesture.view.tag] isEqualToString:@"contest"]) {
        R_iPhone5ContestViewController *loginViewController = [[R_iPhone5ContestViewController alloc] initWithNibName:@"R_iPhone5ContestViewController" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:YES];
        
    }
    
    
    if ([data10[gesture.view.tag] isEqualToString:@"twitter"]) {
        R_FeedsVC_5 *loginViewController = [[R_FeedsVC_5 alloc] initWithNibName:@"R_FeedsVC_5" bundle:nil];
        loginViewController.FEEDTAG = @"TwitterTag";
        
        [self.navigationController pushViewController:loginViewController animated:YES];
        
    }
    
    
    
    if ([data10[gesture.view.tag] isEqualToString:@"search"]) {
        R_MovieSearch_5 *loginViewController = [[R_MovieSearch_5 alloc] initWithNibName:@"R_MovieSearch_5" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:NO];
        
        
        
    }
    
    
    if ([data10[gesture.view.tag] isEqualToString:@"downloads"]) {
        R_wallpapers_5 *loginViewController = [[R_wallpapers_5 alloc] initWithNibName:@"R_wallpapers_5" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:NO];
        
    }
    
    if ([data10[gesture.view.tag] isEqualToString:@"catalogue"]) {
        R_MovieCatalogue_5 *loginViewController = [[R_MovieCatalogue_5 alloc] initWithNibName:@"R_MovieCatalogue_5" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:NO];
    }
    
    if ([data10[gesture.view.tag] isEqualToString:@"shortscenes"])
    {
        ShortScenesVC *loginViewController = [[ShortScenesVC alloc] initWithNibName:@"ShortScenesVC" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:NO];
    }
    
   
    if ([data10[gesture.view.tag] isEqualToString:@"awards"]) {
        R_Awards_4 *loginViewController = [[R_Awards_4 alloc] initWithNibName:@"R_Awards_4" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:NO];
    }
    
    if ([data10[gesture.view.tag] isEqualToString:@"video"])
    {
        R_Trailers_5 *loginViewController = [[R_Trailers_5 alloc] initWithNibName:@"R_Trailers_5" bundle:nil];
        loginViewController.moviename = data12[gesture.view.tag];
         NSLog(@"data12is=%@",data12[gesture.view.tag]);
        [self.navigationController pushViewController:loginViewController animated:NO];
    }
    
    else{
        
        
    }
    
*/
    
    
      
    
}




-(void)catopenclass:(UITapGestureRecognizer *)sender
{
    UITapGestureRecognizer *gesture = (UITapGestureRecognizer *) sender;
    NSLog(@"tag121=%d",gesture.view.tag);
    

    if ([data2[gesture.view.tag] isEqualToString:@"merchandise"]) {
        Merchandise *loginViewController = [[Merchandise alloc] initWithNibName:@"Merchandise" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:YES];
 
    }

    
    if ([data2[gesture.view.tag] isEqualToString:@"facebook"]) {
        R_FeedsVC_5 *loginViewController = [[R_FeedsVC_5 alloc] initWithNibName:@"R_FeedsVC_5" bundle:nil];
        loginViewController.FEEDTAG = @"FacebookTag";
        [self.navigationController pushViewController:loginViewController animated:YES];
        
    }
    
    if ([data2[gesture.view.tag] isEqualToString:@"contest"]) {
        R_iPhone5ContestViewController *loginViewController = [[R_iPhone5ContestViewController alloc] initWithNibName:@"R_iPhone5ContestViewController" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:YES];
        
    }
    
    
    if ([data2[gesture.view.tag] isEqualToString:@"twitter"]) {
        R_FeedsVC_5 *loginViewController = [[R_FeedsVC_5 alloc] initWithNibName:@"R_FeedsVC_5" bundle:nil];
        loginViewController.FEEDTAG = @"TwitterTag";

        [self.navigationController pushViewController:loginViewController animated:YES];
        
    }
    
    
    
    if ([data2[gesture.view.tag] isEqualToString:@"search"]) {
        R_MovieSearch_5 *loginViewController = [[R_MovieSearch_5 alloc] initWithNibName:@"R_MovieSearch_5" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:NO];
        
        
        
    }
    
    
    if ([data2[gesture.view.tag] isEqualToString:@"downloads"]) {
        R_wallpapers_5 *loginViewController = [[R_wallpapers_5 alloc] initWithNibName:@"R_wallpapers_5" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:NO];
        
    }
    
    if ([data2[gesture.view.tag] isEqualToString:@"catalogue"]) {
        R_MovieCatalogue_5 *loginViewController = [[R_MovieCatalogue_5 alloc] initWithNibName:@"R_MovieCatalogue_5" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:NO];
    }
    
    if ([data2[gesture.view.tag] isEqualToString:@"shortscenes"])
    {
        iPhone5ShortScenesVC *loginViewController = [[iPhone5ShortScenesVC alloc] initWithNibName:@"iPhone5ShortScenesVC" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:NO];
    }
    
    if ([data2[gesture.view.tag] isEqualToString:@"awards"])
    {
        R_Awards_4 *loginViewController = [[R_Awards_4 alloc] initWithNibName:@"R_Awards_4" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:NO];
    }
    
    
    else{
        
         
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
    
      
}
-(IBAction)Contest:(id)sender
{
    ContestViewController *loginViewController = [[ContestViewController alloc] initWithNibName:@"ContestViewController" bundle:nil];
    [self.navigationController pushViewController:loginViewController animated:NO];
    
    
}

-(IBAction)news:(id)sender
{
    //    iphone4NewsViewController *loginViewController = [[iphone4NewsViewController alloc] initWithNibName:@"iphone4NewsViewController" bundle:nil];
    //    [self.navigationController pushViewController:loginViewController animated:NO];
    
    
}

-(IBAction)Videos:(id)sender
{
    //    iphone4Video *loginViewController = [[iphone4Video alloc] initWithNibName:@"iphone4Video" bundle:nil];
    //    [self.navigationController pushViewController:loginViewController animated:NO];
    
    
}
-(IBAction)Wallpapers:(id)sender
{
    //    iphone4MainWallpapers *loginViewController = [[iphone4MainWallpapers alloc] initWithNibName:@"iphone4MainWallpapers" bundle:nil];
    //    [self.navigationController pushViewController:loginViewController animated:NO];
    
    
}

-(IBAction)merchandaise:(id)sender
{
        Merchandise *loginViewController = [[Merchandise alloc] initWithNibName:@"Merchandise" bundle:nil];
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


- (IBAction)traillers:(id)sender {
    
    R_Trailers_5 *loginViewController = [[R_Trailers_5 alloc] initWithNibName:@"R_Trailers_5" bundle:nil];
    [self.navigationController pushViewController:loginViewController animated:NO];

}

- (IBAction)nowPlaying:(id)sender {
    R_MovieCatalogue_5 *loginViewController = [[R_MovieCatalogue_5 alloc] initWithNibName:@"R_MovieCatalogue_5" bundle:nil];
    [self.navigationController pushViewController:loginViewController animated:NO];
}

- (IBAction)memorabillaStore:(id)sender {
    Merchandise *loginViewController = [[Merchandise alloc] initWithNibName:@"Merchandise" bundle:nil];
    [self.navigationController pushViewController:loginViewController animated:NO];

}

- (IBAction)socialFeeds:(id)sender {
    R_FeedsVC_5 *loginViewController = [[R_FeedsVC_5 alloc] initWithNibName:@"R_FeedsVC_5" bundle:nil];
    
//    loginViewController.TAG = @"REL_LEFT";
    loginViewController.FEEDTAG = @"FacebookTag";
    [self.navigationController pushViewController:loginViewController animated:NO];
}

- (IBAction)chatRoom:(id)sender {
    iphone5GroupViewController *chatting = [[iphone5GroupViewController alloc]initWithNibName:@"iphone5GroupViewController" bundle:nil];
    [self.navigationController pushViewController:chatting animated:YES];
}
@end
