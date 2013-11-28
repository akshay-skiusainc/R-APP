//
//  iphone4ViewController.m
//  RelianceApplication
//
//  Created by Ashwini Pawar on 13/08/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import "iphone4ViewController.h"
#import "iphone4LoginViewController.h"

@interface iphone4ViewController ()

@end

@implementation iphone4ViewController
@synthesize relLogo,besharamLogin,activityIndicator;
@synthesize relScreen,lowerBtn,lowerBtnImage,upperBtn,upperBtnImage;

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
    GlobalClass *OBJ=[GlobalClass getInstance];
    if ([OBJ.DISMISSIT isEqualToString:@"1"]) {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
       // [[UIApplication sharedApplication] setStatusBarHidden:NO];
        
        [self.navigationController popViewControllerAnimated:YES];
         [self dismissViewControllerAnimated:NO completion:nil];
    }
    
    else
    {
        
    }
     relLogo.alpha = 0.05;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [activityIndicator startAnimating];
    GlobalClass *obj=[GlobalClass getInstance];
    obj.Mid_added= [[NSMutableArray alloc] initWithCapacity:1000];
    obj.QtyOfProducts= [[NSMutableArray alloc] initWithCapacity:1000];
    
    self.view.userInteractionEnabled=NO;

    
    
    //    NSString *q = [NSString stringWithFormat:@"DROP TABLE MOVIEVIDEO"];
    //	[self saveData:q];
    //
    //
    //    NSString *ImagesTABLE = [NSString stringWithFormat: @"CREATE TABLE IF NOT EXISTS MOVIEVIDEO (id INTEGER PRIMARY KEY, youtube_link TEXT, image TEXT,  video_title TEXT, time TEXT,  singer TEXT,lyrics TEXT,music_director TEXT, music_label TEXT)"];
    //    [self saveData:ImagesTABLE];
    
    
      
   // logoTimer = [NSTimer scheduledTimerWithTimeInterval:0.06 target:self selector:@selector(highlightLogo) userInfo:nil repeats:YES];

    if ([obj.Leftcheck isEqualToString:@"1"])
    {
        NSLog(@"obj.Leftcheck isEqualToString: 1");
        //        logoTimer = [NSTimer scheduledTimerWithTimeInterval:0.06 target:self selector:@selector(spinLodingBtn) userInfo:nil repeats:YES];
        [self performSelector:@selector(spinLodingBtn) withObject:nil afterDelay:0.0];
        besharamLogin.alpha=0.0;
        relLogo.alpha=0.0;
        activityIndicator.alpha=0.0;
        relScreen.alpha=1.0;
        lowerBtnImage.alpha=1.0;
        lowerBtn.alpha=1.0;
        upperBtnImage.alpha=1.0;
        upperBtn.alpha=1.0;
        [self spinButton];
        
        
        
    }
    else
    {
        
        NSLog(@"obj.Leftcheck isEqualToString: 0");
        // [self performSelector:@selector(fetchAllData) withObject:nil afterDelay:0.0];
        logoTimer = [NSTimer scheduledTimerWithTimeInterval:0.06 target:self selector:@selector(highlightLogo) userInfo:nil repeats:YES];
        besharamLogin.alpha=1.0;
        relLogo.alpha=1.0;
        activityIndicator.alpha=1.0;
        relScreen.alpha=0.0;
        lowerBtnImage.alpha=0.0;
        lowerBtn.alpha=0.0;
        upperBtnImage.alpha=0.0;
        upperBtn.alpha=0.0;
    }


    
       //    [self performSelector:@selector(logincalled:) withObject:nil afterDelay:2.0];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)spinButton
{
    
    if (upperBtn.alpha==1.0) {
        
        [CATransaction begin];
        [CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
        CGRect frame = [upperBtn frame];
        upperBtn.layer.anchorPoint = CGPointMake(0.5, 0.5);
        upperBtn.layer.position = CGPointMake(frame.origin.x + 0.5 * frame.size.width, frame.origin.y + 0.5 * frame.size.height);
        [CATransaction commit];
        
        [CATransaction begin];
        [CATransaction setValue:(id)kCFBooleanFalse forKey:kCATransactionDisableActions];
        [CATransaction setValue:[NSNumber numberWithFloat:2.0] forKey:kCATransactionAnimationDuration];
        
        CABasicAnimation *animation;
        animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        animation.fromValue = [NSNumber numberWithFloat:0.0];
        animation.toValue = [NSNumber numberWithFloat:2 * M_PI];
        animation.timingFunction = [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionLinear];
        animation.delegate = self;
        [upperBtn.layer addAnimation:animation forKey:@"rotationAnimation"];
        
        [CATransaction commit];
    }
    
    if (lowerBtn.alpha==1.0)
    {
        [CATransaction begin];
        [CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
        CGRect frame = [lowerBtn frame];
        lowerBtn.layer.anchorPoint = CGPointMake(0.5, 0.5);
        lowerBtn.layer.position = CGPointMake(frame.origin.x + 0.5 * frame.size.width, frame.origin.y + 0.5 * frame.size.height);
        [CATransaction commit];
        
        [CATransaction begin];
        [CATransaction setValue:(id)kCFBooleanFalse forKey:kCATransactionDisableActions];
        [CATransaction setValue:[NSNumber numberWithFloat:2.0] forKey:kCATransactionAnimationDuration];
        
        CABasicAnimation *animation;
        animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        animation.fromValue = [NSNumber numberWithFloat:0.0];
        animation.toValue = [NSNumber numberWithFloat:-2 * M_PI];
        animation.timingFunction = [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionLinear];
        animation.delegate = self;
        [lowerBtn.layer addAnimation:animation forKey:@"rotationAnimation"];
        
        [CATransaction commit];
        
    }
}

- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)finished
{
	if (finished)
	{
		[self spinButton];
        
	}
}

-(void)spinLodingBtn
{
//  [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(reachabilityChanged:)
//                                                 name:kReachabilityChangedNotification
//                                               object:nil];
    
    
    Reachability * reach = [Reachability reachabilityWithHostname:@"www.google.com"];
    
    reach.reachableBlock = ^(Reachability * reachability)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self performSelector:@selector(RelianceFetchAllData) withObject:nil afterDelay:0.0];
        });
    };
    
    reach.unreachableBlock = ^(Reachability * reachability)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertView* logoutalertbox = [[ UIAlertView alloc]initWithTitle:@"Alert" message:@"Network Not Reachable" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Retry", nil ];
            logoutalertbox.delegate=self;
            [logoutalertbox show];
        });
    };
    
    [reach startNotifier];
    
    //    [logoTimer invalidate];
    //    logoTimer = nil;
    
    
    
}


-(void)highlightLogo
{
    NSLog(@"rellogo.alpha in function = %f",relLogo.alpha);
    if(relLogo.alpha > 1)
    {
        NSLog(@"rellogo.alpha in for loop = %f",relLogo.alpha);
        [logoTimer invalidate];
        logoTimer = nil;
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(reachabilityChanged:)
                                                     name:kReachabilityChangedNotification
                                                   object:nil];
        
        Reachability * reach = [Reachability reachabilityWithHostname:@"www.google.com"];
        
        reach.reachableBlock = ^(Reachability * reachability)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                GlobalClass *obj=[GlobalClass getInstance];
                if ([obj.Leftcheck isEqualToString:@"1"])
                {
                    [self performSelector:@selector(RelianceFetchAllData) withObject:nil afterDelay:0.0];

                }
                else
                {
                    [self performSelector:@selector(fetchAllData) withObject:nil afterDelay:0.0];

                }
            });
        };
        
        reach.unreachableBlock = ^(Reachability * reachability)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                UIAlertView* logoutalertbox = [[ UIAlertView alloc]initWithTitle:@"Alert" message:@"Network Not Reachable" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Retry", nil ];
                logoutalertbox.delegate=self;
                [logoutalertbox show];
            });
        };
        
        [reach startNotifier];
        
    }
    else
    {
        relLogo.alpha = relLogo.alpha+0.03;
    }
}


-(void)fetchAllData
{
    
    NSLog(@"iphone4viewcontroller called ***************************");
	
	GlobalClass *obj=[GlobalClass getInstance];
    if ([obj.MOVIE_DATA isEqualToString:@"0"]) {

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
		
        
        if (!errorReturned) {
            NSLog(@"errorReturned=%@",errorReturned);
            

		NSError* error;
		NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data //1
                                                             options:kNilOptions
                                                               error:&error];
		
		
		
		NSLog(@"json=%@",json);
		
		
		NSDictionary* interviewdata = [json objectForKey:@"bs_video"]; //2
		
		NSDictionary* onsetdata = [json objectForKey:@"bs_photo"]; //2
		
		NSDictionary* videodata = [json objectForKey:@"video_links"]; //2
		
		
		NSDictionary* wallpaperdata = [json objectForKey:@"small_wallpaper"]; //2
		NSDictionary* book = [json objectForKey:@"bookmyshow"]; //2
		NSDictionary* feedback1 = [json objectForKey:@"feedback"]; //2
		NSDictionary* music = [json objectForKey:@"music"]; //2
		NSDictionary* notifications = [json objectForKey:@"notifications"]; //2
		NSDictionary* cnc = [json objectForKey:@"castncrew"];
        NSDictionary* dirnote = [json objectForKey:@"directors_note"];
        NSDictionary    *category = [json objectForKey:@"cat_items"];
        NSDictionary    *BS_COVER = [json objectForKey:@"bs_cover"];
        NSDictionary    *banner = [json objectForKey:@"banner"];
       NSDictionary *appData = [json objectForKey:@"app_data"];
        NSDictionary *productionForCNC = [json objectForKey:@"production"];
        NSDictionary *sharetext = [json objectForKey:@"share_txt"];
        NSDictionary *fbtoken = [json objectForKey:@"facebook"];
            NSDictionary *iapp = [json objectForKey:@"arr_ios_keys"];

            NSDictionary *bookmyshow = [json objectForKey:@"bookmyshow"];
            
            
            GlobalClass *obj=[GlobalClass getInstance];
            for (NSDictionary *actoAgent in bookmyshow)
            {
                obj.bms_link= [actoAgent objectForKey:@"web_link"];
                
            }
		obj.str = interviewdata;
		obj.onset = onsetdata;
		obj.videolinks = videodata;
		obj.Dwall = wallpaperdata;
		obj.Bookmyshow = book;
		obj.Feedback=feedback1;
		obj.music=music;
		obj.CNC=cnc;
        obj.directorsNote=dirnote;
        obj.category=category;
        obj.BTS=BS_COVER;
        obj.Banner = banner;
        obj.appData=appData;
        obj.productionImage = productionForCNC;
        obj.groups = [json objectForKey:@"groups"];
        obj.fbtoken=fbtoken;
		obj.Notifications=notifications;
        //  obj.Contests=Contests;
        
        for (NSDictionary *actoAgent in dirnote)
        {
            obj.dirnote= [actoAgent objectForKey:@"image"];
            
        }
            for (NSDictionary *actoAgent in iapp)
            {
                obj.IAPProduct1= [actoAgent objectForKey:@"wall_key"];
                NSLog(@"IAPProduct1=%@",obj.IAPProduct1);
                
            }

        
        for (NSDictionary *actoAgent in sharetext)
        {
            obj.videosharetext= [actoAgent objectForKey:@"videos"];
            NSLog(@"sharetext=%@",obj.videosharetext);
            
        }
        
        for (NSDictionary *actoAgent in sharetext)
        {
            obj.wallpapers= [actoAgent objectForKey:@"wallpapers"];
            NSLog(@"sharetext=%@",obj.wallpapers);
            
        }
        for (NSDictionary *actoAgent in sharetext)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
        {
            obj.behindscene_video= [actoAgent objectForKey:@"behindscene_video"];
            NSLog(@"behindscene_video=%@",obj.behindscene_video);
            
        }
        
        for (NSDictionary *actoAgent in sharetext)
        {
            obj.behindscene_images= [actoAgent objectForKey:@"behindscene_images"];
            NSLog(@"behindscene_images=%@",obj.behindscene_images);
        }
        
        for (NSDictionary *actoAgent in sharetext)
        {
            obj.newsshare= [actoAgent objectForKey:@"news"];
            NSLog(@"newsshare=%@",obj.newsshare);
            
        }
        
        
        
        for (NSDictionary *actoAgent in sharetext)
        {
            obj.twitter= [actoAgent objectForKey:@"twitter"];
            NSLog(@"twitter=%@",obj.twitter);
            
        }
        
        for (NSDictionary *actoAgent in sharetext)
        {
            obj.facebook= [actoAgent objectForKey:@"facebook"];
            NSLog(@"facebook=%@",obj.facebook);
            
        }
        
        for (NSDictionary *actoAgent in sharetext)
        {
            obj.mug= [actoAgent objectForKey:@"mug"];
            NSLog(@"mug=%@",obj.mug);
            
        }
        
        
        for (NSDictionary *actoAgent in sharetext)
        {
            obj.Tshirt= [actoAgent objectForKey:@"Tshirt"];
            NSLog(@"Tshirt=%@",obj.Tshirt);
            
        }
        
        for (NSDictionary *actoAgent in sharetext)
        {
            obj.movie_poster= [actoAgent objectForKey:@"movie_poster"];
            NSLog(@"movie_poster=%@",obj.movie_poster);
            
        }
        
        
        
        
        
        
        
        for (NSDictionary *actoAgent1 in obj.appData)
        {
            NSString *appBG= [actoAgent1 objectForKey:@"app_bgmain_ios"];
            NSLog(@"App Bg is = %@",appBG);
            NSString *appID= [actoAgent1 objectForKey:@"app_id"];
            NSString *appMovieName = [actoAgent1 objectForKey:@"app_movie_name"];
            
            NSString *appBG1= [actoAgent1 objectForKey:@"app_bgnav_ios"];

            
            if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"app_bgmain_ios"]isEqualToString:appBG ]) {
                
                NSLog(@"Same Background Image **  \n%@ \n%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"app_bgmain_ios"],appBG);
            }
            else{
                
                
                NSURL *url = [NSURL URLWithString:appBG];
                NSData *imageData = [NSData dataWithContentsOfURL:url];
                UIImage *image = [UIImage imageWithData:imageData];
                
                NSURL *url1 = [NSURL URLWithString:appBG1];
                NSData *imageData1 = [NSData dataWithContentsOfURL:url1];
                UIImage *image1 = [UIImage imageWithData:imageData1];

                
                NSUserDefaults *setUserDefaults=[NSUserDefaults standardUserDefaults];
                [setUserDefaults setObject:UIImageJPEGRepresentation(image,1.0) forKey:@"app_bg_image"];
                [setUserDefaults setObject:appBG forKey:@"app_bgmain_ios"];
                [setUserDefaults setObject:appID forKey:@"app_id"];
                [setUserDefaults setObject:appMovieName forKey:@"app_movie_name"];
                [setUserDefaults setObject:UIImageJPEGRepresentation(image1,1.0) forKey:@"app_bgnav_ios"];
            }
            
        }
        
        NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"app_bg_image"];
        UIImage* app_bg_image = [UIImage imageWithData:imageData];
        self.view.backgroundColor = [UIColor colorWithPatternImage:app_bg_image];
        
        GlobalClass *OBJ=[GlobalClass getInstance];
        OBJ.fetchall=@"1";

             /*
         for (NSDictionary *actoAgent in obj.videolinks)
         {
         
         
         //            data1[i]= [actoAgent objectForKey:@"cat_img_link"];
         //            NSLog(@"cat_img_link=%@",data1[i]);
         //
         //
         //            VideoLinksfromServer[i]= [actoAgent objectForKey:@"youtube_link"];
         //            NSLog(@"video_link=%@",VideoLinksfromServer[i]);
         //
         //            data2[i]= [actoAgent objectForKey:@"image"];
         //            NSLog(@"image=%@",data2[i]);
         //
         //
         //            data3[i]= [actoAgent objectForKey:@"status"];
         //            NSLog(@"status=%@",data3[i]);
         //
         //
         //            data4[i]= [actoAgent objectForKey:@"video_title"];
         //            NSLog(@"video_title=%@",data4[i]);
         //
         //            data5[i]= [actoAgent objectForKey:@"time"];
         //            NSLog(@"time=%@",data5[i]);
         //
         //
         //            data6[i]= [actoAgent objectForKey:@"singer"];
         //            NSLog(@"singer=%@",data6[i]);
         //
         //
         //
         //            data7[i]= [actoAgent objectForKey:@"lyrics"];
         //            NSLog(@"lyrics=%@",data7[i]);
         //
         //            data8[i]= [actoAgent objectForKey:@"link_id"];
         //            NSLog(@"link_id=%@",data8[i]);
         //
         
         
         
         NSString *insertSQL = [NSString stringWithFormat: @"INSERT INTO MOVIEVIDEO(id, youtube_link , image ,  video_title , time ,  singer ,lyrics ,music_director , music_label ) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\")",[actoAgent objectForKey:@"link_id"], [actoAgent objectForKey:@"youtube_link"], [actoAgent objectForKey:@"image"], [actoAgent objectForKey:@"video_title"], [actoAgent objectForKey:@"time"], [actoAgent objectForKey:@"singer"], [actoAgent objectForKey:@"lyrics"], [actoAgent objectForKey:@"music_director"], [actoAgent objectForKey:@"music_label"]];
         [self saveData:insertSQL];
         
         }
		 */
		
	}
    
    
	
    //[self getdata];
    
    [activityIndicator stopAnimating];
    activityIndicator=nil;
    [activityIndicator removeFromSuperview];
	[self performSelector:@selector(logincalled:) withObject:nil afterDelay:0.0];
        obj.MOVIE_DATA=@"1";
        obj.REL_DATA=@"0";


    }
    }
    else
        NSLog(@"move data already fetched");
}

-(void)RelianceFetchAllData
{
    
    NSLog(@"iphone4viewcontroller called ***************************");
	
	GlobalClass *obj=[GlobalClass getInstance];
    if ([obj.REL_DATA isEqualToString:@"0"]) {

	NSString*   post = [NSString stringWithFormat:@"http://apps.medialabs24x7.com/besharam/fetch_all_rel_ios.php?deviceno=%@",obj.dev];
	
	
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
		
        
        if (!errorReturned) {
            NSLog(@"errorReturned=%@",errorReturned);
            
            
            NSError* error;
            NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data //1
                                                                 options:kNilOptions
                                                                   error:&error];
            
            
            
            NSLog(@"json=%@",json);
            
            
            NSDictionary* interviewdata = [json objectForKey:@"bs_video"]; //2
            
            NSDictionary* onsetdata = [json objectForKey:@"bs_photo"]; //2
            
            NSDictionary* videodata = [json objectForKey:@"shortscenes"]; //2
            
            
            NSDictionary* wallpaperdata = [json objectForKey:@"wallpapers"]; //2
            NSDictionary* book = [json objectForKey:@"bookmyshow"]; //2
            NSDictionary* feedback1 = [json objectForKey:@"feedback"]; //2
            NSDictionary* music = [json objectForKey:@"music"]; //2
            NSDictionary* notifications = [json objectForKey:@"notifications"]; //2
            NSDictionary* cnc = [json objectForKey:@"castncrew"];
            NSDictionary* dirnote = [json objectForKey:@"directors_note"];
            NSDictionary    *category = [json objectForKey:@"cat_items"];
            NSDictionary    *BS_COVER = [json objectForKey:@"bs_cover"];
            NSDictionary    *banner = [json objectForKey:@"banner"];
            NSDictionary *appData = [json objectForKey:@"app_data"];
            NSDictionary *productionForCNC = [json objectForKey:@"production"];
            NSDictionary *sharetext = [json objectForKey:@"share_text"];
            NSDictionary *fbtoken = [json objectForKey:@"facebook_feed"];
            NSDictionary *iapp = [json objectForKey:@"arr_ios_keys"];
            
            NSDictionary *bookmyshow = [json objectForKey:@"bookmyshow"];
            NSDictionary *movie = [json objectForKey:@"movie"];
            NSDictionary *trailers = [json objectForKey:@"trailers"];
            NSDictionary *award_cat = [json objectForKey:@"award_cat"];
            NSDictionary *award_movie = [json objectForKey:@"award_movie"];
            NSDictionary *movie_Category = [json objectForKey:@"movie_cat"];
            NSDictionary *award_info = [json objectForKey:@"award_info"];
            
            GlobalClass *obj=[GlobalClass getInstance];
            for (NSDictionary *actoAgent in bookmyshow)
            {
                obj.bms_link= [actoAgent objectForKey:@"web_link"];
                
            }
            obj.trailers = trailers;
            obj.awardCat = award_cat;
            obj.awardInfo = award_info;
            obj.awardMovie = award_movie;
            obj.movieCategory = movie_Category;
            obj.moviedata = movie;
            obj.str = interviewdata;
            obj.onset = onsetdata;
            obj.videolinks = videodata;
            obj.Dwall = wallpaperdata;
            obj.Bookmyshow = book;
            obj.Feedback=feedback1;
            obj.music=music;
            obj.CNC=cnc;
            obj.directorsNote=dirnote;
            obj.category=category;
            obj.BTS=BS_COVER;
            obj.Banner = banner;
            obj.appData=appData;
            obj.productionImage = productionForCNC;
            obj.groups = [json objectForKey:@"groups"];
            obj.fbtoken=fbtoken;
            obj.Notifications=notifications;
            //  obj.Contests=Contests;
            
            for (NSDictionary *actoAgent in dirnote)
            {
                obj.dirnote= [actoAgent objectForKey:@"image"];
                
            }
            
            
            for (NSDictionary *actoAgent in iapp)
            {
                obj.IAPProduct1= [actoAgent objectForKey:@"wall_key"];
                NSLog(@"IAPProduct1=%@",obj.IAPProduct1);
                
            }
            
            
            for (NSDictionary *actoAgent in sharetext)
            {
                obj.videosharetext= [actoAgent objectForKey:@"trailer"];
                NSLog(@"trailer=%@",obj.videosharetext);
                
            }
            
            for (NSDictionary *actoAgent in sharetext)
            {
                obj.moviesharetxt= [actoAgent objectForKey:@"movie_catalogue"];
                NSLog(@"trailer=%@",obj.moviesharetxt);
                
            }

            for (NSDictionary *actoAgent in sharetext)
            {
                obj.wallpapers= [actoAgent objectForKey:@"wallpapers"];
                NSLog(@"wallpapers=%@",obj.wallpapers);
                
            }
            for (NSDictionary *actoAgent in sharetext)
            {
                obj.behindscene_video= [actoAgent objectForKey:@"shortscene"];
                NSLog(@"shortscene=%@",obj.behindscene_video);
                
            }
            
            for (NSDictionary *actoAgent in sharetext)
            {
                obj.behindscene_images= [actoAgent objectForKey:@"behindscene_images"];
                NSLog(@"behindscene_images=%@",obj.behindscene_images);
                
            }
            
//            for (NSDictionary *actoAgent in sharetext)
//            {
//                obj.newsshare= [actoAgent objectForKey:@"news"];
//                NSLog(@"newsshare=%@",obj.newsshare);
//                
//            }
            
            
            
            for (NSDictionary *actoAgent in sharetext)
            {
                obj.twitter= [actoAgent objectForKey:@"twitter"];
                NSLog(@"twitter=%@",obj.twitter);
                
            }
            
            for (NSDictionary *actoAgent in sharetext)
            {
                obj.facebook= [actoAgent objectForKey:@"facebook"];
                NSLog(@"facebook=%@",obj.facebook);
                
            }
            
            for (NSDictionary *actoAgent in sharetext)
            {
                obj.mug= [actoAgent objectForKey:@"mug"];
                NSLog(@"mug=%@",obj.mug);
                
            }
            
            
            for (NSDictionary *actoAgent in sharetext)
            {
                obj.Tshirt= [actoAgent objectForKey:@"Tshirt"];
                NSLog(@"Tshirt=%@",obj.Tshirt);
                
            }
            
            for (NSDictionary *actoAgent in sharetext)
            {
                obj.movie_poster= [actoAgent objectForKey:@"movie_poster"];
                NSLog(@"movie_poster=%@",obj.movie_poster);
                
            }
            
            
            
     
            GlobalClass *OBJ=[GlobalClass getInstance];
            OBJ.fetchall=@"1";
            
             
        }
        
        
        
        //[self getdata];
        
        [activityIndicator stopAnimating];
        activityIndicator=nil;
        [activityIndicator removeFromSuperview];
        [self performSelector:@selector(logincalled:) withObject:nil afterDelay:0.0];
        
        [self.navigationController setNavigationBarHidden:YES animated:YES];
//        [self dismissViewControllerAnimated:NO completion:nil];
//        [self.navigationController popViewControllerAnimated:NO];

        obj.REL_DATA=@"1";
        obj.MOVIE_DATA=@"0";

    }
    
    }
    else
        NSLog(@"rel data already fetched");
    
}



-(IBAction)logincalled:(id)sender
{
    GlobalClass *obj=[GlobalClass getInstance];
    obj.navchecking=@"1";
    self.view.userInteractionEnabled=YES;

    
    NSString *q = [NSString stringWithFormat:@"select NAME From USER WHERE ID=1"];
	[self displayAll:q];
	//
	//
	if (MobileNo !=nil) {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        
        GlobalClass *OBJ=[GlobalClass getInstance];
        OBJ.DISMISSIT=@"1";
        [self.navigationController popViewControllerAnimated:NO];
        [self dismissViewControllerAnimated:NO completion:nil];
  	}
	
	else
	{
		[self.navigationController setNavigationBarHidden:YES animated:YES];
		
        iphone4LoginViewController *loginViewController = [[iphone4LoginViewController alloc] initWithNibName:@"iphone4LoginViewController" bundle:nil];
        [self.navigationController pushViewController:loginViewController animated:NO];

       // [self presentViewController:loginViewController animated:YES completion:nil];
		
		
		
	}
	
    
    
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:YES];
    [logoTimer invalidate];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
