//
//  GroupViewController.m
//  RelianceApplication
//
//  Created by Akshay on 8/25/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import "GroupViewController.h"
#import "iphone4Settings.h"
#import "iphone4Merchandise.h"

@interface GroupViewController ()

@end

@implementation GroupViewController
@synthesize titleImageBackground,titlelabel,dividerImage;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
-(void)timercalled
{
    [[VideoScroller subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [VideoScroller removeFromSuperview];
    VideoScroller=nil;
    
    
    [self DisplayGroups];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
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
            
            
            
        }
    }];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(productPurchased:) name:IAPHelperProductPurchasedNotification object:nil];
    
    self.trackedViewName=@"Group Chat Screen";

    
    GlobalClass  *obj= [GlobalClass getInstance];
    if ([obj.Leftcheck isEqualToString:@"1"])
    {
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"rel_i4home_bg.jpg"]];
        livechatgroup.textColor=[UIColor redColor];
        dividerImage.alpha = 0.0;
        titlelabel.alpha = 1.0;
        titleImageBackground.alpha = 1.0;
        livechatgroup.alpha = 0.0;
    }
    else{
        NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"app_bg_image"];
        UIImage* app_bg_image = [UIImage imageWithData:imageData];
        self.view.backgroundColor = [UIColor colorWithPatternImage:app_bg_image];
        
        livechatgroup.alpha = 1.0;
        dividerImage.alpha = 1.0;
        titlelabel.alpha = 0.0;
        titleImageBackground.alpha = 0.0;

    }


    
    [self DisplayGroups];
//    UIImage *relAppImage = [UIImage imageNamed:@"home_right_rel_icon.png"];
//    UIButton *buttonChat = [UIButton buttonWithType:UIButtonTypeCustom];
//    [buttonChat setImage:relAppImage forState:UIControlStateNormal];
//    buttonChat.frame = CGRectMake(0, 0, relAppImage.size.width, relAppImage.size.height);
//    [buttonChat addTarget:self action:@selector(toRelApp:) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *customBarItem1 = [[UIBarButtonItem alloc] initWithCustomView:buttonChat];
//    self.navigationItem.RightBarButtonItem = customBarItem1;
    
    if([_TAG isEqual: @"LEFT"] |[_TAG isEqual: @"REL_LEFT"])
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

    // Do any additional setup after loading the view from its nib.
}

-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)getdata
{
    GlobalClass *obj=[GlobalClass getInstance];
	NSLog(@"ddata=%@",obj.groups);
  	int i=0;
	for (NSDictionary *actoAgent in obj.groups)
	{
        
        if ([obj.Leftcheck isEqualToString:@"1"])
        {
            data1[i]= [actoAgent objectForKey:@"cg_id"];
            NSLog(@"cg_id=%@",data1[i]);
            
            data2[i]= [actoAgent objectForKey:@"cg_name"];
            NSLog(@"cg_name=%@",data2[i]);
            
            
            data3[i]= [actoAgent objectForKey:@"openfire_service"];
            NSLog(@"openfire_service=%@",data3[i]);
            
            
            data4[i]= [actoAgent objectForKey:@"cg_img"];
            NSLog(@"cg_img=%@",data4[i]);
            data10[i]= [actoAgent objectForKey:@"status"];
            NSLog(@"status=%@",data10[i]);
            
            i++;
        }
        
        
        else{
            
            data1[i]= [actoAgent objectForKey:@"id"];
            NSLog(@"id=%@",data1[i]);
            
            data2[i]= [actoAgent objectForKey:@"grp_name"];
            NSLog(@"grp_name=%@",data2[i]);
            
            
            data3[i]= [actoAgent objectForKey:@"openfire_service"];
            NSLog(@"openfire_service=%@",data3[i]);
            
            
            data4[i]= [actoAgent objectForKey:@"grp_image"];
            NSLog(@"grp_image=%@",data4[i]);
            data10[i]= [actoAgent objectForKey:@"status"];
            NSLog(@"status=%@",data10[i]);
       		
            i++;
        }
	}
	TotalData=i;

	
}

-(void)DisplayGroups
{
    //  [[NSURLCache sharedURLCache] removeAllCachedResponses];
    
	
    
    
	[self getdata];
    
    
    
    
    //    NSString *q = [NSString stringWithFormat:@"select youtube_link , image , music_director, video_title , time ,  singer ,lyrics ,id,music_label  From MOVIEVIDEO"];
    //
    //
    //	[self displayVideoData:q];
    
	
	VideoScroller			= [[UIScrollView alloc] initWithFrame:CGRectMake(10,38,299,390-30)];
	VideoScroller.userInteractionEnabled	=YES;
	VideoScroller.showsHorizontalScrollIndicator = YES;
	VideoScroller.pagingEnabled = NO;
    VideoScroller.bounces=NO;
	[self.view addSubview:VideoScroller];
	
	int m=0;
	NSLog(@"hi");
	for (int i =0; i<TotalData; i++) {
		
		NSLog(@"data2=%@",data4[i]);
		
		webwall[i]                    = [[UIWebView alloc] initWithFrame:CGRectMake(0, m, 299,100)];
		webwall[i].userInteractionEnabled=YES;
		webwall[i].delegate =self;
		webwall[i].tag=i;
        webwall[i].backgroundColor=[UIColor clearColor];
		NSURL *url = [NSURL URLWithString:data4[i]];
		//            //URL Requst Object
		NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
		//            //Load the request in the UIWebView.
		[webwall[i] loadRequest:requestObj];
		webwall[i].scrollView.bounces = NO;
		webwall[i].scrollView.scrollEnabled = NO;
        webwall[i].scalesPageToFit=YES;
        webwall[i].opaque=NO;
		//  ImagePatch[i].backgroundColor= [UIColor blueColor];
		[VideoScroller addSubview:webwall[i]];
		
		
		
        //		UITapGestureRecognizer *tapped123 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(navigate:)];
        //		tapped123.numberOfTapsRequired = 1;
        //		tapped123.delegate=self;
        //		[webwall[i] addGestureRecognizer:tapped123];
		
        if([data10[i] isEqualToString:@"1"])
        {
            premiumView[i] = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 299,100)];
            
            premiumView[i].userInteractionEnabled = NO;
            premiumView[i].backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"premi_chat.png"]];
            [webwall[i] addSubview:premiumView[i]];
            
        }
        
//        else{
//            premiumView[i].backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@""]];
//            
//        }

		
		
        ImagePatch[i]                    = [[UIImageView alloc] initWithFrame:CGRectMake(299-122, m+100-57, 118,47)];
        ImagePatch[i].userInteractionEnabled=NO;
        ImagePatch[i].image= [UIImage imageNamed:@"enter_btn.png"];
        ImagePatch[i].alpha=0.7;
		//       // ImagePatch[i].backgroundColor= [UIColor blueColor];
        [VideoScroller addSubview:ImagePatch[i]];
        //    [ImagePatch[i] release];
        ImagePatch[i].tag= i;
		
		
		
		
		MusicLabel[i] = [[UILabel alloc] initWithFrame:CGRectMake(100, 20+m, 320-25-5, 30)];
		MusicLabel[i].backgroundColor =[UIColor clearColor];
		MusicLabel[i].textColor= [UIColor whiteColor];
        //  MusicLabel[i].alpha=0.3;
        
        //	MusicLabel[i].sizeToFit=YES;
		MusicLabel[i].text=data2[i];
		MusicLabel[i].font = [UIFont fontWithName:@"Helvetica Neue" size: 21.0];
		[VideoScroller addSubview:MusicLabel[i]];
        
		
		//            UIImage *dwn = [UIImage imageNamed:@"info_icon1.png"];
		//            UIImage *dwn1 = [UIImage imageNamed:@"hover_info.png"];
		
		
        //	if ([data3[i] isEqualToString:@"1" ]) {
        
        
        UITapGestureRecognizer *tapped123 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(navigate:)];
        tapped123.numberOfTapsRequired = 1;
        tapped123.delegate=self;
        [webwall[i] addGestureRecognizer:tapped123];
        
        
        
        
        
        
//        infoVideo[i]					= [UIButton buttonWithType:UIButtonTypeInfoLight];
//        infoVideo[i].frame				= CGRectMake(299-25,m+232-30,25,25);
//        //          [infoVideo[i] setBackgroundImage:dwn forState:UIControlStateNormal];
//        //          [infoVideo[i] setBackgroundImage:dwn1 forState:UIControlStateHighlighted];
//        infoVideo[i].userInteractionEnabled = YES;
//        // [infoVideo[i] addTarget:self action:@selector(openInfoAlert:)forControlEvents:UIControlEventTouchUpInside];
//        infoVideo[i].tag=i;
//        
//        [VideoScroller addSubview:infoVideo[i]];
        
        //
        
        gapView[i] = [[UIView alloc]initWithFrame:CGRectMake(0, m+100, 299,1)];
        gapView[i].backgroundColor = [UIColor whiteColor];
        [VideoScroller addSubview:gapView[i]];
        
        UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openInfoAlert:)];
        tapped.numberOfTapsRequired = 1;
        [infoVideo[i] addGestureRecognizer:tapped];
        
        
        
        
        
        
        //			UIImage *shre = [UIImage imageNamed:@"share-32x32.png"];
        //			// UIImage *shre1 = [UIImage imageNamed:@"hover_share.png"];
        //
        //
        //			ShareVideo[i]					= [UIButton buttonWithType:UIButtonTypeCustom];
        //			ShareVideo[i].frame				= CGRectMake(283,m+124,32,32);
        //			[ShareVideo[i] setBackgroundImage:shre forState:UIControlStateNormal];
        //			//  [ShareVideo[i] setBackgroundImage:shre1 forState:UIControlStateHighlighted];
        //			ShareVideo[i].userInteractionEnabled = YES;
        //			[VideoScroller addSubview:ShareVideo[i]];
        //			ShareVideo[i].tag = i;
        //
        //
        //
        //
        //			UITapGestureRecognizer *tapped1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ActionSheet:)];
        //			tapped1.numberOfTapsRequired = 1;
        //			[ShareVideo[i] addGestureRecognizer:tapped1];
        
        
		// }
		
		
		m+=100;
		
		
		
        
        
	}
    VideoScroller.contentSize = CGSizeMake(299,100*(TotalData+0)+20);

	//VideoScroller.contentSize = CGSizeMake(299,100*(TotalData+0)+65+35);
	[self.view addSubview:_footerMainView];
    
    [self.view addSubview:_chatloginview];
    [self.view addSubview:_popupCloseButtonRef];

	//    ImagePatch[0].image = [UIImage imageNamed:@"v4.png"];
	//    ImagePatch[1].image = [UIImage imageNamed:@"v1.png"];
	//    ImagePatch[2].image = [UIImage imageNamed:@"v3.png"];
	//    ImagePatch[3].image = [UIImage imageNamed:@"v2.png"];
	
	//    AlbumImages[0] = [[NSString stringWithFormat:@"v4.png"] retain];
	//    AlbumImages[1] = [[NSString stringWithFormat:@"v1.png"] retain];
	//    AlbumImages[2] = [[NSString stringWithFormat:@"v3.png"] retain];
	//    AlbumImages[3] = [[NSString stringWithFormat:@"v2.png"] retain];
	
    //	[self.view addSubview:LOGINVIEW];
    //	[self.view addSubview:sharebtn];
    
}
-(IBAction)RESTORE:(id)sender
{
    [[RageIAPHelper sharedInstance] restoreCompletedTransactions];
    _IAPVIEW.alpha=0.0;
    
    
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
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesBegan");
    UITouch *touch = (UITouch *)[touches anyObject];
    start = [touch locationInView:self.view].y;
    
    NSLog(@"start = %f",start);
    if(start < 480 && _footerMainView.center.y > 480)//touch was not in upper area of view AND pulldownView not visible
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


- (IBAction)popupCloseButton:(id)sender {
    
    _chatloginview.alpha=0.0;
    _popupCloseButtonRef.alpha=0.0;
    _popupTextField.text=@"";
    [_popupTextField resignFirstResponder];


}

- (IBAction)popupLoginButton:(id)sender {
      if ([_popupTextField.text componentsSeparatedByString:@" "].count > 1)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error！" message:@"Please Enter Username Without space" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
        [alert show];
        [alert release];
        
    }
    else
    {
        
    
    if ([_popupTextField.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error！" message:@"Please Enter Username" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
        [alert show];
        [alert release];
    }
    //    }else
    //    {
    
    //    }
    
    else {
        
        _chatloginview.alpha=0.0;
        _popupCloseButtonRef.alpha=0.0;
        [_popupTextField resignFirstResponder];

        
        
//    NSString    *strr= [NSString stringWithFormat:@"%@@%@",_popupTextField.text,data5[1]];
        NSString    *strr= [NSString stringWithFormat:@"%@@u16930719.onlinehome-server.com",_popupTextField.text];

        [[NSUserDefaults standardUserDefaults] setObject:strr forKey:@"userID"];
        NSString *jabberID = [[NSUserDefaults standardUserDefaults] stringForKey:@"userID"];
        NSLog(@"JID=%@",jabberID);
        [[NSUserDefaults standardUserDefaults] setObject:@"akshay123" forKey:@"userPassword"];
        
        [[NSUserDefaults standardUserDefaults] setObject:data3[chatgroupid] forKey:@"GROUPNAME"];
             
        ChatViewController *loginViewController = [[ChatViewController alloc] initWithNibName:@"ChatViewController" bundle:nil];
        loginViewController.passtag=[NSString stringWithFormat:@"%d",chatgroupid+1];
        NSLog(@"tag==%d",chatgroupid);
        loginViewController.groupname=data3[chatgroupid];
        loginViewController.titlegroupname=data2[chatgroupid];

        [self.navigationController pushViewController:loginViewController animated:NO];
        _popupTextField.text=@"";


    //
    }
    }

}

-(IBAction)toRelApp:(UIButton *)sender
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Under construction" message:@"Check Back Soon" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    
}

- (IBAction)merchandise:(id)sender
{
       iphone4Merchandise *merchandise = [[iphone4Merchandise alloc]initWithNibName:@"iphone4Merchandise" bundle:nil];
       [self.navigationController pushViewController:merchandise animated:YES];
  
}

-(IBAction)chat:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Under construction" message:@"Check Back Soon" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    
}
- (IBAction)myProfile:(id)sender
{
    iphone4Settings *setting = [[iphone4Settings alloc]initWithNibName:@"iphone4Settings" bundle:nil];
    [self.navigationController pushViewController:setting animated:YES];
    
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
	return YES;
}
-(IBAction)navigate:(id)sender
{
    UITapGestureRecognizer *gesture = (UITapGestureRecognizer *) sender;
    if ([data10[gesture.view.tag] isEqualToString:@"1"]) {
        _IAPVIEW.alpha=1.0;
        [self.view addSubview:_IAPVIEW];
        
        
        SKProduct *product = _products[0];
        
        [_priceFormatter setLocale:product.priceLocale];
        
        
        _pricelabel.text = [NSString stringWithFormat:@"fee of Rs. %@ \n to see become a premium member!",[_priceFormatter stringFromNumber:product.price]];
        NSLog(@"_products[buyB=%@", _pricelabel.text);
        
        
    }
	
    else{

    chatgroupid = gesture.view.tag;
    NSString *login = [[NSUserDefaults standardUserDefaults] objectForKey:@"userID"];
  //  NSString *GROUPNAME = [[NSUserDefaults standardUserDefaults] objectForKey:@"GROUPNAME"];

    NSLog(@"show  list%@",login);
    if (login!=nil) {
        [[NSUserDefaults standardUserDefaults] setObject:data3[gesture.view.tag] forKey:@"GROUPNAME"];
//        NSString *GROUPNAME = [[NSUserDefaults standardUserDefaults] stringForKey:@"GROUPNAME"];
//        NSLog(@"GROUPNAME=%@",GROUPNAME);
        ChatViewController *loginViewController = [[ChatViewController alloc] initWithNibName:@"ChatViewController" bundle:nil];
        loginViewController.passtag=[NSString stringWithFormat:@"%d",gesture.view.tag+1];
        NSLog(@"tag==%d",gesture.view.tag);
        loginViewController.groupname=data3[gesture.view.tag];
        loginViewController.titlegroupname=data2[chatgroupid];

        [self.navigationController pushViewController:loginViewController animated:NO];
        

    }
	else
    {
        
        _chatloginview.alpha=1.0;
        _popupCloseButtonRef.alpha=1.0;
    }
	}
}


- (void)webViewDidStartLoad:(UIWebView *)webView
{
	NSLog(@"yes");
	for (int i =0; i<TotalData; i++) {
		
		
		if (webView.tag==i) {
			
			
			ActIndImage1[i] = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,299,100)];
			//  ActIndImage1[i].center = CGPointMake(320/2, 460/2);
			ActIndImage1[i].image = [UIImage imageNamed:@"color_pacth_400x400.png"];
			ActIndImage1[i].alpha = 0.7;
			[webwall[i] addSubview:ActIndImage1[i]];
			
			activityIndicator1[i] = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
			activityIndicator1[i].center=CGPointMake(299/2, 100/2);
			//activityIndicator1[i].transform = CGAffineTransformMakeScale(1.0, 1.0);
			[activityIndicator1[i] setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
			[ActIndImage1[i] addSubview:activityIndicator1[i]];
			
			
			[activityIndicator1[i] startAnimating];
			
		}
		
		
		
		else {
			
		}
	}
	
	//[self performSelector:@selector(unloadAct) withObject:nil afterDelay:0.2];
	
	
}




-(void)unloadAct:(int)i
{
	
	NSLog(@"unloadAct=%d",i);
	[activityIndicator1[i] stopAnimating];
	if (activityIndicator1[i]!=nil) {
		[activityIndicator1[i] removeFromSuperview];
		activityIndicator1[i] = nil;
	}
	if (ActIndImage1[i]!=nil) {
		[ActIndImage1[i] removeFromSuperview];
		ActIndImage1[i] = nil;
	}
	
}
- (void)webViewDidFinishLoad:(UIWebView *)webView

{
	
	for (int i =0; i<TotalData; i++) {
		
		if (webView.tag == i) {
			[self unloadAct:i];
			
		}
	}
	
	
	
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
	for (int i =0; i<TotalData; i++) {
		if (webView.tag == i) {
			[self unloadAct:i];
			
		}
	}
}


-(void)group1
{
    
    NSString *jabberID = [[NSUserDefaults standardUserDefaults] stringForKey:@"userID"];
    //  NSString *ROOMID = [XMPPJID jidWithString:@"villan@conference.medialabs24x7.com"];
    
    XMPPRoomCoreDataStorage *rosterstorage = [[XMPPRoomCoreDataStorage alloc] init];
    XMPPRoom* xmppRoom = [[XMPPRoom alloc] initWithRoomStorage:rosterstorage jid:[XMPPJID jidWithString:@"movieconversation@conference.u16930719.onlinehome-server.com"] dispatchQueue:dispatch_get_main_queue()];
    rosterstorage=nil;
    
    [xmppRoom leaveRoom];
    [xmppRoom deactivate];
    [xmppRoom removeDelegate:self];
    
    if ([xmppRoom isJoined]) {
        NSLog(@"alreadyjoined");
        
    }
    else{
        
        [xmppRoom activate:xmppStream];
        [xmppRoom joinRoomUsingNickname:jabberID history:nil];
        
        [xmppRoom fetchConfigurationForm];
        [xmppRoom configureRoomUsingOptions:nil];
        [xmppRoom addDelegate:self  delegateQueue:dispatch_get_main_queue()];
        XMPPJID *xmppJID=[XMPPJID jidWithString:jabberID];
        [xmppRoom inviteUser:xmppJID withMessage:@"Join Group1."];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
