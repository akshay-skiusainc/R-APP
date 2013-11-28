//
//  BPhotos.m
//  RelianceApplication
//
//  Created by Akshay on 8/12/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import "BPhotos.h"
#import "iphone5Settings.h"
#import "Merchandise.h"
#import "iphone5GroupViewController.h"

@interface BPhotos ()

@end

@implementation BPhotos

@synthesize footerView,imageScroller,imgIndex,dwnloadProgress,logoTimer;
@synthesize faceBookBtn,twitterBtn,emailBtn;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)productPurchased:(NSNotification *)notification {
    
    NSString * productIdentifier = notification.object;
    NSLog(@"proo===%@",productIdentifier);
    [_products enumerateObjectsUsingBlock:^(SKProduct * product, NSUInteger idx, BOOL *stop) {
        if ([product.productIdentifier isEqualToString:productIdentifier]) {
            NSLog(@"PROCT PURCHAED");
            [self performSelector:@selector(restoreDone) withObject:nil afterDelay:0.0];
            [self performSelector:@selector(timercalled) withObject:nil afterDelay:0.0];
            
            //   [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:idx inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
            *stop = YES;
        }
    }];
    
}

- (void)buyButtonTapped:(id)sender {
    
    UIButton *buyButton = (UIButton *)sender;
    SKProduct *product = _products[buyButton.tag];
    NSLog(@"_products[buyB=%@",_products[buyButton.tag]);
    NSLog(@"Buying %@...", product.productIdentifier);
    [[RageIAPHelper sharedInstance] buyProduct:product];
    
}

-(void)restoreDone
{
    //	dispatch_async(dispatch_get_global_queue(0, 0), ^{
    
    GlobalClass *obj=[GlobalClass getInstance];
    
    NSString* post = [NSString stringWithFormat:@"http://apps.medialabs24x7.com/besharam/ios_purchase.php?deviceno=%@",obj.dev];
    
    NSLog(@"post=%@",post);
    
    
    
    
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:post] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:2.0];
    
    
    
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Current-Type"];
    NSError *errorReturned = nil;
    NSURLResponse *theResponse =[[NSURLResponse alloc]init];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&theResponse error:&errorReturned];
    
    
    if (errorReturned) {
        NSLog(@"errorReturned=%@",errorReturned);
        
        
        //			UIAlertView* alertBox = [[ UIAlertView alloc]initWithTitle:@"Network Error" message:@"Network Not Connected" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil ];
        //			alertBox.tag=3;
        //			alertBox.delegate=self;
        //			[alertBox show];
        
        
        
    }
    else
    {
        
        
        
        
        NSError* error;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data //1
                                                             options:kNilOptions
                                                               error:&error];
        NSLog(@"json=%@",json);
        
        
        [self getAllData];
        
        
    }
}

-(void)getAllData{
    
    
	
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
            
            
            
            //            obj.iapreceived=@"1";
            
        }
    }
}

-(void)timercalled
{
   // GlobalClass *obj= [GlobalClass getInstance];
    
    //    if ([obj.iapreceived isEqualToString:@"1"]) {
    //          NSLog(@"TIMERCALLED ********************");
    //        obj.iapreceived=@"0";
    //    [[VideoScroller subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    //    [VideoScroller removeFromSuperview];
    //    VideoScroller=nil;
    
    [self loadCollection];
    // [self performSelector:@selector(DisplayVideos) withObject:nil afterDelay:1.0];
    
    //        [_timer invalidate];
    //        _timer = nil;
    //
    //
    //
    //    }
    
    
    
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
  
    
    _okaybutton.enabled=NO;
    _IAPVIEW.alpha=0.0;
    _priceFormatter = [[NSNumberFormatter alloc] init];
    [_priceFormatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
    [_priceFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [[RageIAPHelper sharedInstance] requestProductsWithCompletionHandler:^(BOOL success, NSArray *products) {
        if (success) {
            NSLog(@"PPRO=%@",products);
            
            _products = [products copy];
            
            NSLog(@"PPRO=%@",_products);
            
            SKProduct * product = (SKProduct *) _products[0];
            //    cell.textLabel.text = product.localizedTitle;
            //    cell.textLabel.numberOfLines=5;
            NSLog(@"product==%@",product.localizedTitle);
            
            _okaybutton.enabled=YES;
            
            [_priceFormatter setLocale:product.priceLocale];
            _pricelabel.text = [NSString stringWithFormat:@"fee of  %@ \n to see become a premium member!",[_priceFormatter stringFromNumber:product.price]];
            
            
        }
    }];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(productPurchased:) name:IAPHelperProductPurchasedNotification object:nil];

    
    
    
    
    dwnloadProgress.alpha = 0.0;
    imgIndex = 0;
    self.trackedViewName=@"Behind The Scenes Photos Screen";
    _dwnloadButtonView.alpha = 0.0;
    _sharebtn.alpha = 0.0;
    _closeButtonView.alpha = 0.0;
    [self getsharetext];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [_activictyIndicator startAnimating];
        dispatch_async(dispatch_get_main_queue()	, ^{
			
            [self loadCollection];
		});
		
        [_activictyIndicator stopAnimating];
        _activictyIndicator.alpha=0.0;
	});
    
    footerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"footer_bg.png"]];
    NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"app_bg_image"];
    UIImage* app_bg_image = [UIImage imageWithData:imageData];
    self.view.backgroundColor = [UIColor colorWithPatternImage:app_bg_image];
    
    
    
    
    // Do any additional setup after loading the view from its nib.
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
    
}
-(IBAction)toRelApp:(UIButton *)sender
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Under construction" message:@"Check Back Soon" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    
}
- (IBAction)merchandise:(id)sender
{
       Merchandise *merchandise = [[Merchandise alloc]initWithNibName:@"Merchandise" bundle:nil];
       [self.navigationController pushViewController:merchandise animated:YES];
   
    
}

-(IBAction)chat:(id)sender
{
    iphone5GroupViewController *group = [[iphone5GroupViewController alloc]initWithNibName:@"iphone5GroupViewController" bundle:nil];
    [self.navigationController pushViewController:group animated:YES];
}

- (IBAction)myProfile:(id)sender
{
    iphone5Settings *setting = [[iphone5Settings alloc]initWithNibName:@"iphone5Settings" bundle:nil];
    [self.navigationController pushViewController:setting animated:YES];
    
}



-(void)back {
    if(_sharebtn.alpha ==1.0)
    {
        NSLog(@"DAS");
        vw_CollectionView.alpha=1.0;
        _sharebtn.alpha=0.0;
        _closebtn.alpha=0.0;
        _dwnloadButtonView.alpha = 0.0;
        _headerLabel.alpha = 1.0;
        _headerImageView.alpha = 1.0;
        _closeButtonView.alpha = 0.0;
        
       [imageScroller removeFromSuperview];
    }
    else
    {
        [self.navigationController popViewControllerAnimated:YES];
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
- (void)loadCollection
{
    [self getdata];

    ic_CoverFlow.dataSource=nil;
    [ic_CoverFlow removeFromSuperview];
    ic_CoverFlow=nil;
    
    [vw_CollectionView removeFromSuperview];
    vw_CollectionView =nil;

	vw_CollectionView					= [[UIView alloc] initWithFrame:CGRectMake(0, 100, 320, 280)];
	vw_CollectionView.alpha				= 1.0;
	[self.view addSubview:vw_CollectionView];
	
	ic_CoverFlow								= [[iCarousel alloc] initWithFrame:CGRectMake(0, 0, 320, 274)];
	ic_CoverFlow.delegate						= self;
	ic_CoverFlow.dataSource						= self;
	ic_CoverFlow.type							= iCarouselTypeCoverFlow;
	[vw_CollectionView addSubview:ic_CoverFlow];
    
    [self->ic_CoverFlow scrollToItemAtIndex:1 animated:YES];
    
}

-(void)getdata
{
    GlobalClass *obj=[GlobalClass getInstance];
    NSLog(@"images=%@",obj.onset);
    [_activictyIndicator startAnimating];
    
    
    int i=0;
	for (NSDictionary *actoAgent in obj.onset)
	{
		
        data3[i]= [actoAgent objectForKey:@"bs_photo_link"];
       	NSLog(@"bs_photo_link=%@",data3[i]);
        
        NSString *timeZone =[actoAgent objectForKey:@"bs_photo_link"];
        NSArray *newArray=[timeZone componentsSeparatedByString:@"_"];
        fbFeedId[i] = [actoAgent objectForKey:@"bs_photo_link"];
        NSLog(@"data4  id ==== =====   %@",fbFeedId[i]);
        
        
        data2[i]= [actoAgent objectForKey:@"bs_photo_hd_image"];
        NSLog(@"bs_photo_hd_image=%@",data2[i]);
        
        data1[i]= [actoAgent objectForKey:@"bs_photo_tiny"];
		NSLog(@"bs_photo_tiny=%@",data1[i]);
       
        data10[i]= [actoAgent objectForKey:@"status"];
        
        NSLog(@"data10=%@",data10[i]);
        //		data5[i]= [actoAgent objectForKey:@"time"];
        //		NSLog(@"time=%@",data5[i]);
        //
        //
        //		data6[i]= [actoAgent objectForKey:@"singer"];
        //		NSLog(@"singer=%@",data6[i]);
        //
        //
        //
        //		data7[i]= [actoAgent objectForKey:@"lyrics"];
        //		NSLog(@"lyrics=%@",data7[i]);
        //
        //		data8[i]= [actoAgent objectForKey:@"link_id"];
        //		NSLog(@"link_id=%@",data8[i]);
        //
		
		
        //		data8[i]= [actoAgent objectForKey:@"video_title"];
        //		NSLog(@"video_title=%@",data8[i]);
        //
		
		//		data4[i]= [actoAgent objectForKey:@"image"];
		//		NSLog(@"str=%@",data4[i]);
		
		
		i++;
        
        
        
        //        NSString *str =	[NSString stringWithFormat:@"wall_thumb%d.jpg", index+1];
        //
        //
        //        webwall[i]                    = [[UIWebView alloc] init];
        //		webwall[i].userInteractionEnabled=YES;
        //		webwall[i].delegate =self;
        //		webwall[i].tag=i;
        //		NSURL *url = [NSURL URLWithString:data1[i]];
        //		//            //URL Requst Object
        //		NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
        //		//            //Load the request in the UIWebView.
        //		[webwall[i] loadRequest:requestObj];
        //		webwall[i].scrollView.bounces = NO;
        //		webwall[i].scrollView.scrollEnabled = NO;
        
        
        
        //UIImageView *img_CoverFlow	= [[UIImageView alloc] initWithImage:[UIImage imageNamed:str]];
        
        //  return webwall[i];
    }
	TotalData=i;
    
}
#pragma mark Carousel Functions
- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return TotalData;
}

//- (UIView *)carousel:(iCarousel *)carousel placeholderViewAtIndex:(NSUInteger)index;
//{
//    UIImageView *img_CoverFlow	= [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wall_full2.jpg"]];
//    return img_CoverFlow;
//
//
//}
- (BOOL)carouselShouldWrap:(iCarousel *)carousel
{
    //wrap all carousels
    return YES;
}
//- (NSUInteger)numberOfPlaceholdersInCarousel:(iCarousel *)carousel
//{
//    //note: placeholder views are only displayed on some carousels if wrapping is disabled
//    return TotalData;
//}

- (CGFloat)carouselItemWidth:(iCarousel *)carousel
{
    //usually this should be slightly wider than the item views
    return 260;
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    if (view == nil)
    {
        view = [[AsyncImageView alloc] initWithFrame:CGRectMake(0, 0, 220.0f, 320.0f)];
        
        view.contentMode = UIViewContentModeScaleAspectFill;
    }
    
    view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];

    
    //cancel any previously loading images for this view
    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:view];
    
    //set image URL. AsyncImageView class will then dynamically load the image
    NSURL *url = [NSURL URLWithString:data3[index]];
    
    ((AsyncImageView *)view).imageURL =url;
    
//    if([data10[index] isEqualToString:@"1"])
//    {
//        
//        premiumView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 220.0f, 320.0f)];
//        premiumView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"premi_all.png"]];
//        [view addSubview:premiumView];
//        
//    }
//    else{
//        premiumView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@""]];
//        
//    }

    UIImageView *zoomButton = [[UIImageView alloc]initWithFrame:CGRectMake(220-47, 1, 44, 42)];
    zoomButton.image = [UIImage imageNamed:@"magnify.png"];
    [view addSubview:zoomButton];
    
    return view;
    
}

-(IBAction)IAPCANCELED
{
    _IAPVIEW.alpha=0.0;
    
}
-(IBAction)IAPCALLED
{
    SKProduct *product = _products[0];
    
    [_priceFormatter setLocale:product.priceLocale];
    
    
    _pricelabel.text = [NSString stringWithFormat:@"fee of Rs. %@ \n to see become a premium member!",[_priceFormatter stringFromNumber:product.price]];
    NSLog(@"_products[buyB=%@", _pricelabel.text);
    NSLog(@"Buying %@...", product.productIdentifier);
    [[RageIAPHelper sharedInstance] buyProduct:product];
    
    _IAPVIEW.alpha=0.0;
    
    
}
-(IBAction)RESTORE:(id)sender
{
    [[RageIAPHelper sharedInstance] restoreCompletedTransactions];
    _IAPVIEW.alpha=0.0;
    
    
}

//- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index
//{
//
//
//	//NSString *str =	[NSString stringWithFormat:@"wall_thumb1.jpg"];
//
////
////    NSString *str =	[NSString stringWithFormat:@"wall_thumb%d.jpg", index+1];
//
////    webwall                   = [[UIWebView alloc] init];
////    webwall.userInteractionEnabled=YES;
////    webwall.delegate =self;
////    webwall.tag=index;
////    NSURL *url = [NSURL URLWithString:data1[index]];
////    //            //URL Requst Object
////    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
////    //            //Load the request in the UIWebView.
////    [webwall loadRequest:requestObj];
////    webwall.scrollView.bounces = NO;
////    webwall.scrollView.scrollEnabled = NO;
////
////    return webwall;
//
//
//
//   // dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), ^(void) {
//
//     //   dispatch_async(dispatch_get_main_queue()	, ^{
//
//
//        NSURL *url = [NSURL URLWithString:data2[index]];
//        NSData *imageData = [NSData dataWithContentsOfURL:url];
//        UIImage *image = [UIImage imageWithData:imageData];
//
//        UIImageView *img_CoverFlow	= [[UIImageView alloc] initWithImage:image highlightedImage:[UIImage imageNamed:@"wall_full2.jpg"]];
////
////
//
//
//
//
// //   UIView *view = webwall;
//
//    return img_CoverFlow;
//
//
//    [_activictyIndicator startAnimating];
//
//
//  //  });
//
//
//
//
//}
-(void)carouselCurrentItemIndexUpdated:(iCarousel *)carousel
{
    [_activictyIndicator stopAnimating];
    _activictyIndicator.alpha=0.0;
    
}

- (void)carousel:(iCarousel *)_carousel didSelectItemAtIndex:(NSInteger)index
{
    imgIndex = index;
    NSLog(@"index=%d",index);
    if ([data10[index] isEqualToString:@"1"]) {
        _IAPVIEW.alpha=1.0;
        [self.view addSubview:_IAPVIEW];
        NSLog(@"FANDUUUUUU...*******");
        
        SKProduct *product = _products[0];
        
        [_priceFormatter setLocale:product.priceLocale];
        
        
        _pricelabel.text = [NSString stringWithFormat:@"fee of %@ \n to see become a premium member!",[_priceFormatter stringFromNumber:product.price]];
        NSLog(@"_products[buyB=%@", _pricelabel.text);
        
        
    }
	
    else{
        
        
        [self openBigImage];
        
    }
    

}

//-(IBAction)done
//{
//    NSLog(@"DAS");
//    vw_CollectionView.alpha=1.0;
//    _sharebtn.alpha=0.0;
//    _closebtn.alpha=0.0;
//
//
//
//	if (view2!=nil) {
//		[view2 removeFromSuperview];
//		view2 = nil;
//	}
//}
-(void)openBigImage

{
    
    // [_activictyIndicator startAnimating];
    
    
    
    [UIView beginAnimations:@"Animate Text Field Up" context:nil];
    
    [UIView setAnimationDuration:.3];
    
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    self.view.frame = CGRectMake(self.view.frame.origin.x,
                                 
                                 0,
                                 
                                 self.view.frame.size.width,
                                 
                                 self.view.frame.size.height);
    
    [UIView commitAnimations];
    
    
    
    
    
    strr= [NSString stringWithFormat:@"%@",data3[imgIndex]];
    
    shareText= strr;
    
    
    
    _closeButtonView.alpha = 1.0;
    
    _headerImageView.alpha = 0.0;
    
    _headerLabel.alpha = 0.0;
    
    vw_CollectionView.alpha=0.0;
    
    
    
    
    
    
    
    
    
    imageScroller = [[UIScrollView alloc] initWithFrame:CGRectMake(7,0,306,504)];
    
    imageScroller.userInteractionEnabled	=YES;
    
    imageScroller.pagingEnabled = YES;

    imageScroller.showsHorizontalScrollIndicator = YES;
    
    imageScroller.scrollEnabled = YES;
    
    imageScroller.alpha = 0.0;
    
    
    
    int m = 0;
    
    for(int a=0;a<TotalData;a++)
        
    {
        
        if ([data10[a] isEqualToString:@"0"]) {
        
        m = 306*a;
        
        shareText=[NSString stringWithFormat:@"%@",data3[imgIndex]];
        
        
        
        if (view2[a] == nil)
            
        {
            
            view2[a] = [[AsyncImageView alloc] initWithFrame:CGRectMake(m+0, 0, 306.0f, 504.0f)];
            
            
            
            view2[a].contentMode = UIViewContentModeScaleToFill;
            
        }
        
        view2[a].backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];
        
        
        //        downloadButton[a] = [UIButton buttonWithType:UIButtonTypeCustom];
        
        //        downloadButton[a].frame = CGRectMake(m+0, 0, 306, 478);
        
        //        downloadButton[a].userInteractionEnabled=YES;
        
        //        downloadButton[a].tag=a;
        
        //        downloadButton[a].backgroundColor = [UIColor clearColor];
        
        //        [downloadButton[a] addTarget:self action:@selector(displayButtons:) forControlEvents:UIControlEventTouchUpInside];
        
        //        [imageScroller addSubview:downloadButton[a]];
        
        
        
        
        
        //cancel any previously loading images for this view
        
        [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:view2[a]];
        
        
        
        //set image URL. AsyncImageView class will then dynamically load the image
        
        NSURL *url1 = [NSURL URLWithString:data3[a]];
        
        
        
        ((AsyncImageView *)view2[a]).imageURL =url1;
        
        [imageScroller addSubview:view2[a]];
        
        
        
        
        
        
        
        
        
        //        UITapGestureRecognizer *webViewTapped = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dow)];
        
        //        webViewTapped.numberOfTapsRequired = 1;
        
        //        webViewTapped.delegate = self;
        
        //        [view2[a] addGestureRecognizer:webViewTapped];
        
        UIView *wallpaperView = [[UIView alloc] initWithFrame:CGRectMake(m+0, 0, 306.0f, 504.0f)];
        
        wallpaperView.backgroundColor=[UIColor clearColor];
        
        wallpaperView.tag=a;
        
        [imageScroller addSubview:wallpaperView];
        
        
        
//        downloadButton[a] = [UIButton buttonWithType:UIButtonTypeCustom];
//        
//        downloadButton[a].frame = CGRectMake(0, 504-44, 52, 48);
//        
//        [downloadButton[a] setBackgroundImage:[UIImage imageNamed:@"wall_dawon_icon"] forState:UIControlStateNormal];
//        
//        // downloadButton[a].userInteractionEnabled=YES;
//        
//        downloadButton[a].tag=a;
//        
//        [downloadButton[a] addTarget:self action:@selector(downloadButton:) forControlEvents:UIControlEventTouchUpInside];
//        
//        [wallpaperView addSubview:downloadButton[a]];
        
        downloadHD[a] = [UIButton buttonWithType:UIButtonTypeCustom];
        
        downloadHD[a].frame = CGRectMake(0, 504-92, 52, 48);
        
        [downloadHD[a] setBackgroundImage:[UIImage imageNamed:@"hd_icon.png"] forState:UIControlStateNormal];
        
        // downloadButton[a].userInteractionEnabled=YES;
        
        downloadHD[a].tag=a;
        
        [downloadHD[a] addTarget:self action:@selector(downloadHDButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [wallpaperView addSubview:downloadHD[a]];
        
            
            
            socializeBg[a] = [[UIView alloc]initWithFrame:CGRectMake(0, 504-44, 306, 44)];
            socializeBg[a].backgroundColor = [UIColor clearColor];
            [wallpaperView addSubview:socializeBg[a]];
            
            
            if (actionBar[a] == nil)
            {
                
                NSString *entity_Key= [NSString stringWithFormat:@"%@",fbFeedId[a]];
                NSString *entity_name= [NSString stringWithFormat:@"%@",data3[a]];
                self.entity = [SZEntity entityWithKey:entity_Key name:entity_name];
                actionBar[a] = [SZActionBar defaultActionBarWithFrame:CGRectZero entity:self.entity viewController:self];
                
                
                actionBar[a].itemsLeft = [NSArray arrayWithObjects:[SZActionButton viewsButton], [actionBar[a].itemsRight objectAtIndex:0], [actionBar[a].itemsRight objectAtIndex:1], nil];
                // actionBar[i].itemsLeft = [NSArray arrayWithObjects:nil];
                actionBar[a].tag=a;
                
                faceBookBtn = [[UIButton alloc] initWithFrame:CGRectZero];
                [faceBookBtn setImage:[UIImage imageNamed:@"socialize-selectnetwork-facebook-icon.png"] forState:UIControlStateNormal];
                [faceBookBtn sizeToFit];
                [faceBookBtn addTarget:self action:@selector(fbShare:) forControlEvents:UIControlEventTouchUpInside];
                faceBookBtn.tag=a;
                
                
                twitterBtn = [[UIButton alloc] initWithFrame:CGRectZero];
                [twitterBtn setImage:[UIImage imageNamed:@"socialize-selectnetwork-twitter-icon.png"] forState:UIControlStateNormal];
                [twitterBtn sizeToFit];
                [twitterBtn addTarget:self action:@selector(tweetShare:) forControlEvents:UIControlEventTouchUpInside];
                twitterBtn.tag=a;
                
                
                emailBtn = [[UIButton alloc] initWithFrame:CGRectZero];
                [emailBtn setImage:[UIImage imageNamed:@"socialize-selectnetwork-email-icon.png"] forState:UIControlStateNormal];
                [emailBtn sizeToFit];
                [emailBtn addTarget:self action:@selector(mailCompose:) forControlEvents:UIControlEventTouchUpInside];
                emailBtn.tag=a;
                
                actionBar[a].betweenButtonsPadding=5.0;
                actionBar[a].itemsRight = [NSArray arrayWithObjects:faceBookBtn, twitterBtn,emailBtn, nil];
                
                
                
                [socializeBg[a] addSubview:actionBar[a]];
            }
//        shareButton[a] = [UIButton buttonWithType:UIButtonTypeCustom];
//        
//        shareButton[a].frame = CGRectMake(260, 430, 52, 48);
//        
//        [shareButton[a] setBackgroundImage:[UIImage imageNamed:@"wall_sahre_icon.png"] forState:UIControlStateNormal];
//        
//        //shareButton[a].userInteractionEnabled=YES;
//        
//        shareButton[a].tag=a;
//        
//        [shareButton[a] addTarget:self action:@selector(shareButton:) forControlEvents:UIControlEventTouchUpInside];
//        
//        [wallpaperView addSubview:shareButton[a]];
//        
//        
//        
//        shareView[a] = [[UIView alloc]initWithFrame:CGRectMake(263, 296, 42, 133)];
//        
//        shareView[a].backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"wall_socialicon_bg"]]
//        
//        ;
//        
//        shareView[a].tag = a;
//        
//        
//        
//        
//        
//        fbButton[a] = [UIButton buttonWithType:UIButtonTypeCustom];
//        
//        fbButton[a].frame = CGRectMake(3, 6, 37, 37);
//        
//        [fbButton[a] setBackgroundImage:[UIImage imageNamed:@"wall_fbicon"] forState:UIControlStateNormal];
//        
//        fbButton[a].userInteractionEnabled=YES;
//        
//        fbButton[a].tag=a;
//        
//        [fbButton[a] addTarget:self action:@selector(fbShare:) forControlEvents:UIControlEventTouchUpInside];
//        
//        [shareView[a] addSubview:fbButton[a]];
//        
//        
//        
//        twtButton[a] = [UIButton buttonWithType:UIButtonTypeCustom];
//        
//        twtButton[a].frame = CGRectMake(3, 45, 37, 37);
//        
//        [twtButton[a] setBackgroundImage:[UIImage imageNamed:@"wall_twticon"] forState:UIControlStateNormal];
//        
//        twtButton[a].userInteractionEnabled=YES;
//        
//        twtButton[a].tag=a;
//        
//        [twtButton[a] addTarget:self action:@selector(tweetShare:) forControlEvents:UIControlEventTouchUpInside];
//        
//        [shareView[a] addSubview:twtButton[a]];
//        
//        
//        
//        mailButton[a] = [UIButton buttonWithType:UIButtonTypeCustom];
//        
//        mailButton[a].frame = CGRectMake(3, 84, 37, 37);
//        
//        [mailButton[a] setBackgroundImage:[UIImage imageNamed:@"wall_emailicon"] forState:UIControlStateNormal];
//        
//        mailButton[a].userInteractionEnabled=YES;
//        
//        mailButton[a].tag=a;
//        
//        [mailButton[a] addTarget:self action:@selector(mailCompose:) forControlEvents:UIControlEventTouchUpInside];
//        
//        [shareView[a] addSubview:mailButton[a]];
//        
//        [wallpaperView addSubview:shareView[a]];
//        
        m=m+306;
        
        
        
    }
    
    }
    
    [self.imageScroller setContentOffset:CGPointMake(306*imgIndex, 0.0) animated:YES];
    
    
    
    [self.view addSubview:imageScroller];
    
    
    
    
    
    
    
    imageScroller.contentSize = CGSizeMake(306*TotalData, 478);
    
    imageScroller.delegate=self;
    
    [self.view addSubview:imageScroller];
    
    imageScroller.alpha = 1.0;
    
    
    
    //
    
    //    [imageScroller addSubview:_dwnloadButtonView];
    
    //    [imageScroller addSubview:_sharebtn];
    
    //    [imageScroller addSubview:_closebtn];
    
    //    [imageScroller addSubview:_fbtwitShareView];
    
    
    
    
    
    
    
    //    _dwnloadButtonView.alpha = 1.0;
    
    //    _sharebtn.alpha=1.0;
    
    //    _closebtn.alpha=1.0;
    
    //    [self.view addSubview:_sharebtn];
    
    //    [self.view addSubview:_closebtn];
    
    //    [self.view addSubview:_fbtwitShareView];
    
    //    [self.view addSubview:_dwnloadButtonView];
    
    [self.view addSubview:_closeButtonView];
    
    [self.view addSubview:_footerMainView];
    
    
    
    
    
    for(int a=0;a<TotalData;a++)
        
    {
      //  socializeBg[a].alpha = 0.0;

        shareView[a].alpha=0.0;
        
    }
    
    
    
    
    
    
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView

{
    
    NSLog(@"scrollViewWillBeginDragging called");
    
    
    
    for(int a=0;a<TotalData;a++)
        
    {
        //socializeBg[a].alpha = 0.0;

        shareView[a].alpha=0.0;
        
    }
    
}







- (void)shareButton:(UIButton *)sender {
    
    
    
    imgIndex= sender.tag;
    
    
    
    if(shareView[imgIndex].alpha==0.0)
        
    {
        
        shareView[imgIndex].alpha = 1.0;
       // socializeBg[imgIndex].alpha = 1.0;

    }
    
    
    
    //     if(shareView[imgIndex].alpha == 1.0)
    
    else
        
    {
        //socializeBg[imgIndex].alpha = 0.0;

        shareView[imgIndex].alpha = 0.0;
        
    }
    
    
    
    
    
    
    
}


- (IBAction)downloadHDButton:(UIButton *)sender {
    
    for(int a=0;a<TotalData;a++)
        
    {
       // socializeBg[a].alpha = 0.0;
        shareView[a].alpha=0.0;
        
    }
    imgIndex= sender.tag;
    downloadButton[imgIndex].enabled = NO;
    dwnloadProgress.alpha = 1.0;
    
    dwnloadProgress.progress = 0.2;
    
    [view2[imgIndex] addSubview:dwnloadProgress];
    
    _activictyIndicator.alpha=1.0;
    
    [self.view addSubview:_activictyIndicator];
    
    [_activictyIndicator startAnimating];
    
    
    
    logoTimer = [NSTimer scheduledTimerWithTimeInterval:0.06 target:self selector:@selector(downloadProgress:) userInfo:nil repeats:YES];
    
    [self performSelector:@selector(downloadingHDImage) withObject:nil afterDelay:0.0];
    
}
-(void)downloadingHDImage

{
    
    
    
    dispatch_async(dispatch_get_main_queue()	, ^{
        
        NSData *imgData=[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",data2[imgIndex]]]];
        
        UIImage *image = [[UIImage alloc] initWithData:imgData];
        
        UIImageWriteToSavedPhotosAlbum(image, self, nil, nil);
        
        //int i= (imgData.length / )
        
        
        
        [self performSelector:@selector(Finishloader) withObject:nil afterDelay:2.0];
        
        
        
    });
    
    
    
}


- (IBAction)downloadButton:(UIButton *)sender {
    for(int a=0;a<TotalData;a++)
        
    {
       // socializeBg[a].alpha = 0.0;
        shareView[a].alpha=0.0;
        
    }
    imgIndex= sender.tag;
     downloadHD[imgIndex].enabled = NO;
    dwnloadProgress.alpha = 1.0;
    
    dwnloadProgress.progress = 0.2;
    
    [view2[imgIndex] addSubview:dwnloadProgress];
    
    _activictyIndicator.alpha=1.0;
    
    [self.view addSubview:_activictyIndicator];
    
    [_activictyIndicator startAnimating];
    
    
    
    logoTimer = [NSTimer scheduledTimerWithTimeInterval:0.06 target:self selector:@selector(downloadProgress:) userInfo:nil repeats:YES];
    
    [self performSelector:@selector(downloadingImage) withObject:nil afterDelay:0.0];
    
}



-(void)downloadProgress:(int)progress

{
    
    
    
    
    
    dwnloadProgress.progress = dwnloadProgress.progress + 0.1;
    
    
    
    
    
    
    
}
-(void)downloadingImage
{
	dispatch_async(dispatch_get_main_queue()	, ^{
		UIImage *image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",data3[imgIndex]]]]];
		UIImageWriteToSavedPhotosAlbum(image, self, nil, nil);
        [self performSelector:@selector(Finishloader) withObject:nil afterDelay:2.0];
        
	});
    
}

-(void)Finishloader
{
    downloadButton[imgIndex].enabled = YES;
     downloadHD[imgIndex].enabled = YES;
	[_activictyIndicator stopAnimating];
    //	NSString	 *str= [NSString stringWithFormat:@"Downloaded wallpaper from Link %@ ",sharetext];
    //	self.trackedViewName=str;
    //
    //
    [[GAI sharedInstance].defaultTracker sendEventWithCategory:@"Behind The Scenes Photos "
                                                    withAction:data1[imgIndex]
                                                     withLabel:@"Photos"
                                                     withValue:nil];

    
    
	UIAlertView*	alertBox = [[ UIAlertView alloc]initWithTitle:@"Success" message:@"Photo is Downloaded in Your Photo Library" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil ];
	[alertBox show];
    
    dwnloadProgress.alpha = 0.0;
    dwnloadProgress.progress = 0.4;

    _activictyIndicator.alpha=0.0;
    
}


-(void)getsharetext
{
    
    GlobalClass *obj=[GlobalClass getInstance];
    NSLog(@"images=%@",obj.behindscene_images);
    
    
    //        for (NSDictionary *actoAgent in obj.wallpapers)
    //        {
    
    fbsharetext = [obj.behindscene_images objectForKey:@"fb_share"];
    NSLog(@"fb_share=%@",fbsharetext);
    
    twtsharetext = [obj.behindscene_images objectForKey:@"twitter_share"];
    NSLog(@"twitter_share=%@",twtsharetext);
    
    
    mailsharesub = [obj.behindscene_images objectForKey:@"email_subject"];
    NSLog(@"email_subject=%@",mailsharesub);
    
    
    mailsharetext = [obj.behindscene_images objectForKey:@"email_share"];
    NSLog(@"email_share=%@",mailsharetext);
    
    //            break;
    //
    //        }
}

#pragma mark Compose Mail
-(IBAction)mailCompose:(UIButton *)sender
{
	
	//gesture.view.tag);
	
	imgIndex=sender.tag;
	
	
	Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
	if (mailClass != nil)
	{
		// We must always check whether the current device is configured for sending emails
		
		if ([mailClass canSendMail])
		{
			[self displayComposerSheet:shareText];
		}
		
		else
		{
			[self launchMailAppOnDevice:shareText];
		}
	}
	
	else
	{
		[self launchMailAppOnDevice:shareText];
	}
	
}
// Displays an email composition interface inside the application. Populates all the Mail fields.
-(void)displayComposerSheet:(NSString*)String
{
    
	MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
	picker.mailComposeDelegate = self;
    
    [picker setSubject:mailsharesub];
    
    UIGraphicsBeginImageContext(view2[imgIndex].frame.size);
    [view2[imgIndex].layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image= UIGraphicsGetImageFromCurrentImageContext();
    NSData *imageData = UIImageJPEGRepresentation(image,1);
    [picker addAttachmentData:imageData mimeType:@"image/jpg" fileName:data3[imgIndex]];
    

    
    // Set up recipients
    NSArray *toRecipients = [NSArray arrayWithObject:@""];
    NSArray *ccRecipients = [NSArray arrayWithObjects:@"", nil];
    //NSArray *bccRecipients = [NSArray arrayWithObject:@"fourth@example.com"];
    NSString	*str= [NSString stringWithFormat:@"%@ \n\n You can also download Behind The Scene HD image from %@",mailsharetext,data2[imgIndex]];
    [picker setToRecipients:toRecipients];
    [picker setCcRecipients:ccRecipients];
    NSString *emailBody = str;
    [picker setMessageBody:emailBody isHTML:NO];
    
    
	[self presentModalViewController:picker animated:YES];
}


// Dismisses the email composition interface when users tap Cancel or Send. Proceeds to update the message field with the result of the operation.
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
	//	message.hidden = NO;
	// Notifies users about errors associated with the interface
	switch (result)
	{
		case MFMailComposeResultCancelled:
			//[self dismissModalViewControllerAnimated:YES];
			//message.text = @"Result: canceled";
			break;
		case MFMailComposeResultSaved:
			//[self dismissModalViewControllerAnimated:YES];
			//message.text = @"Result: saved";
			break;
		case MFMailComposeResultSent:
			//message.text = @"Result: sent";
			//[self dismissModalViewControllerAnimated:YES];
			break;
		case MFMailComposeResultFailed:
			//message.text = @"Result: failed";
			//[self dismissModalViewControllerAnimated:YES];
			break;
		default:
			//message.text = @"Result: not sent";
			//[self dismissModalViewControllerAnimated:YES];
			break;
	}
	[self dismissModalViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark Workaround

// Launches the Mail application on the device.
-(void)launchMailAppOnDevice:(NSString*)string
{
	NSString *recipients = @"mailto:?cc=&subject=Check out this awesome Yeh Jawaani Hai Deewani Video ";
	//NSString *body = @"&body=All Dabangg 2 Movie details are Available on Dabangg2 App!";
	
	NSString *email = [NSString stringWithFormat:@"%@%@", recipients, string];
	email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
}

- (IBAction)tweetShare:(UIButton *)sender {
    imgIndex=sender.tag;
    strr= [NSString stringWithFormat:@"%@",data1[imgIndex]];
    shareText= strr;
    //  Create an instance of the Tweet Sheet
	TWTweetComposeViewController *tweetSheet =
	[[TWTweetComposeViewController alloc] init];
	
	// Sets the completion handler.  Note that we don't know which thread the
	// block will be called on, so we need to ensure that any UI updates occur
	// on the main queue
	tweetSheet.completionHandler = ^(TWTweetComposeViewControllerResult result) {
		switch(result) {
			case TWTweetComposeViewControllerResultCancelled:
				//  This means the user cancelled without sending the Tweet
				break;
			case TWTweetComposeViewControllerResultDone:
				//  This means the user hit 'Send'
				break;
		}
		
		
		//  dismiss the Tweet Sheet
		dispatch_async(dispatch_get_main_queue(), ^{
			[self dismissViewControllerAnimated:NO completion:^{
				NSLog(@"Tweet Sheet has been dismissed.");
			}];
		});
	};
	//NSString	*str= [NSString stringWithFormat:@"Downloaded wallpaper:%@ from official Besharam App. Get free copy of App @http://tinyurl.com/off-yjhd",shareText];
    
	
	//NSString *strtweet= [NSString stringWithFormat:@"Reading exciting news on the official Yeh Jawaani Hai Deewani App. Get free copy of the App @http://tinyurl.com/off-yjhd"];
	
	//  Set the initial body of the Tweet
	[tweetSheet setInitialText:twtsharetext];
	
	//  Adds an image to the Tweet
	//  For demo purposes, assume we have an image named 'larry.png'
	//  that we wish to attach
//	if (![tweetSheet addImage:[UIImage imageNamed:shareText]]) {
//		NSLog(@"Unable to add the image!");
//	}
	
	//  Add an URL to the Tweet.  You can add multiple URLs.
	if (![tweetSheet addURL:[NSURL URLWithString:shareText]]){
		NSLog(@"Unable to add the URL!");
	}
	
	//  Presents the Tweet Sheet to the user
	[self presentViewController:tweetSheet animated:NO completion:^{
		NSLog(@"Tweet sheet has been presented.");
	}];
    
}

- (IBAction)fbShare:(UIButton *)sender
{
    imgIndex=sender.tag;
    //	NSString *str=[NSString stringWithFormat:@"Downloaded this amazing wallpaper: %@ from official YJHD App. Get free copy of the App @<tiny url>",titleMusic.text];
    //	post = [[FBFeedPost alloc] initWithLinkPath:@"http://ow.ly/g4bRR" caption:str];
	
    strr= [NSString stringWithFormat:@"%@",data1[imgIndex]];
    shareText= strr;
    
    NSString *ver = [[UIDevice currentDevice] systemVersion];
    float ver_float = [ver floatValue];
    if (ver_float < 6.0)
    {
        
//        sharepost = [[FBFeedPost alloc] initWithLinkPath:shareText caption:fbsharetext];
//        [self sharefeedonfb1:sharepost];
        
    }
    else{
        
        
        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
            
            
            [self fbios6:shareText];
            
            
        }
        
        else
        {
            UIAlertView* logoutalertbox = [[ UIAlertView alloc]initWithTitle:@"Facebook login required!" message:@"To continue, please log into your Facebook Account through device settings." delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil ];
            //   logoutalertbox.tag=5;
            logoutalertbox.delegate=self;
            [logoutalertbox show];
            
        }
        
        
    }
    
	
    
}

-(void)fbios6:(NSString*)stringis
{
    NSLog(@"stringsis=%@",stringis);
    SLComposeViewController *fbController=[SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
    {
        SLComposeViewControllerCompletionHandler __block completionHandler=^(SLComposeViewControllerResult result){
            
            [fbController dismissViewControllerAnimated:YES completion:nil];
            
            switch(result){
                case SLComposeViewControllerResultCancelled:
                default:
                {
                    NSLog(@"Cancelled.....");
                    
                }
                    break;
                case SLComposeViewControllerResultDone:
                {
                    NSLog(@"Posted....");
                }
                    break;
            }};
        
        NSString		*STR= [NSString stringWithFormat:@"%@ %@",stringis, fbsharetext];
        
        //   [fbController addImage:[UIImage imageNamed:@"114x114.png"]];
        [fbController setInitialText:STR];
        [fbController addURL:[NSURL URLWithString:stringis]];
        [fbController setCompletionHandler:completionHandler];
        [self presentViewController:fbController animated:YES completion:nil];
    }
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    // [self done];
    
}


- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"yes");
    [self.view addSubview:_activictyIndicator];
    _activictyIndicator.alpha = 1.0;
    [_activictyIndicator startAnimating];
    
    
    
    
    
}
-(void)unloadAct
{
    _activictyIndicator.alpha=0.0;
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView

{
    [self unloadAct];
    
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    // [self unloadAct];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (IBAction)closeButton:(UIButton *)sender {
    NSLog(@"DAS");
    vw_CollectionView.alpha=1.0;
    
    _closebtn.alpha=0.0;
    
    _headerLabel.alpha = 1.0;
    _headerImageView.alpha = 1.0;
    _closeButtonView.alpha = 0.0;
    
    [imageScroller removeFromSuperview];
    for(int a=0;a<TotalData;a++)
        
    {
        //socializeBg[a].alpha=0.0;
        actionBar[a] = nil;
        
    }
}

@end
