//
//  R_wallpapers_5.m
//  RelianceApplication
//
//  Created by Ashwini Pawar on 22/10/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import "R_wallpapers_5.h"

@interface R_wallpapers_5 ()

@end

@implementation R_wallpapers_5


@synthesize imageScroller,TAG,imgIndex,dwnloadProgress;
@synthesize logoTimer;
@synthesize faceBookBtn,twitterBtn,emailBtn,mainScroller,movieTable,movieSearch,movieNameArray;
@synthesize b,newTag,nX,nY,loaderCount,currentScrollPosition,finalCount;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    movieTable.hidden=YES;
    
    
    
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

-(void)getAllData
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
            
            NSDictionary *trailers = [json objectForKey:@"trailers"];
            obj.trailers = trailers;
            
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
            
        }
    }
}

-(void)timercalled
{
    [self performSelector:@selector(loadCollection) withObject:nil afterDelay:0.0];
    
    
}
- (void)viewDidLoad

{
    
    [super viewDidLoad];
    _okaybutton.enabled=NO;
    
    movieTable.hidden = YES;
    [movieTable setSeparatorColor:[self colorWithHexString:@"1f3a55"]];
    movieTable.backgroundColor  =[self colorWithHexString:@"13202d"];

    movieNameArray = [[NSMutableArray alloc]init];
    [movieNameArray insertObject:@"All" atIndex:0];
    
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
            
            
            [_priceFormatter setLocale:product.priceLocale];
            
            
            _pricelabel.text = [NSString stringWithFormat:@"fee of Rs. %@ \n to see become a premium member!",[_priceFormatter stringFromNumber:product.price]];
            NSLog(@"_products[buyB=%@", _pricelabel.text);
            
            NSLog(@"_products[buyB=%@", _pricelabel.text);
            
            
            
            
        }
    }];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(productPurchased:) name:IAPHelperProductPurchasedNotification object:nil];
    
    _IAPVIEWScroller.contentSize = CGSizeMake(320, 500);
    
    
    dwnloadProgress.alpha = 0.0;
    
    imgIndex = 0;
    
    
    
    
    
    
    
    _closeButtonView.alpha = 0.0;
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        [_activictyIndicator startAnimating];
        
        dispatch_async(dispatch_get_main_queue()	, ^{
            
            
            [self performSelector:@selector(loadCollection) withObject:nil afterDelay:0.0];
            
        });
        
        
        [_activictyIndicator stopAnimating];
        
        _activictyIndicator.alpha=0.0;
        
    });
    
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"rel_i4home_bg.jpg"]];
    
    
    
    
    if([TAG isEqual: @"REL_LEFT"])
        
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
    
    [self getsharetext];
    
    
    
}



-(void)back {
    
    
    
    if(mainScroller.alpha == 0.0)
        
    {
        
        NSLog(@"DAS");
        
        _IAPVIEW.alpha=0.0;
        _shadowImage.alpha = 1.0;
        _headerImage.alpha = 1.0;
        _headerLabel.alpha = 1.0;
        _closeButtonView.alpha = 0.0;
        mainScroller.alpha = 1.0;
        _textBackgrnd.alpha = 1.0;
        movieSearch.alpha = 1.0;
        
        
        [imageScroller removeFromSuperview];
        
        for(int a=0;a<TotalData;a++)
            
        {
            
            actionBar[a] = nil;
            
            shareView[a].alpha = 0.0;
            
            downloadButton[a].alpha = 0.0;
            
            if (view2[a]!=nil) {
                
                [view2[a] removeFromSuperview];
                
                view2[a] = nil;
                
            }
            
        }
        
        
    }
    
    else
        
    {
        
        [self.navigationController popViewControllerAnimated:YES];
        
    }
    
    
    
}

-(void)ScrollLazyLoading
{
    if(TotalData-loaderCount<10)
    {
        
        finalCount=TotalData-loaderCount;
    }
    
    
    
    
	for (int a =loaderCount; a<loaderCount+finalCount; a++)
    {
        if([data4[a]isEqualToString:movieSearch.text])
        {
            nX=160*(b%2);
            nY=226 * (b/2);
            
            bgViewStills[a] = [[UIView alloc]initWithFrame:CGRectMake(nX, nY, 150, 207)];
            bgViewStills[a].backgroundColor = [UIColor clearColor];
            [mainScroller addSubview:bgViewStills[a]];
            
            if (view3[a] == nil)
                
            {
                
                view3[a] = [[AsyncImageView alloc] initWithFrame:CGRectMake(0, 0, 150.0f, 200.0f)];
                
                
                
                view3[a].contentMode = UIViewContentModeScaleToFill;
                
            }
            
            view3[a].backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];
            view3[a].userInteractionEnabled = YES;
            
            
            
            //cancel any previously loading images for this view
            
            [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:view3[a]];
            
            
            
            //set image URL. AsyncImageView class will then dynamically load the image
            
            NSURL *url1 = [NSURL URLWithString:data2[a]];
            NSLog(@"lazyLoading Async URL Called *****************************************************************************               %@",url1);
            
            
            ((AsyncImageView *)view3[a]).imageURL =url1;
            
            [bgViewStills[a] addSubview:view3[a]];
            
            UITapGestureRecognizer *webViewTapped = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageTouched:)];
            
            webViewTapped.numberOfTapsRequired = 1;
            view3[a].tag = newTag;
            webViewTapped.delegate = self;
            
            [view3[a] addGestureRecognizer:webViewTapped];
            MovieLabelStills[a] = [[UILabel alloc] initWithFrame:CGRectMake(0,207-30, 150, 23)];
            MovieLabelStills[a].backgroundColor =[UIColor clearColor];
            //            MovieLabelStills[a].textColor= [self colorWithHexString:@"e42477"];
            MovieLabelStills[a].textColor= [UIColor whiteColor];
            MovieLabelStills[a].backgroundColor= [UIColor blackColor];
            MovieLabelStills[a].text=data4[a];
            MovieLabelStills[a].font = [UIFont boldSystemFontOfSize:18.0f];
            [bgViewStills[a] addSubview:MovieLabelStills[a]];
            
            
            
            grayImage[a] = [[UIImageView alloc]initWithFrame:CGRectMake(150-39, 10, 39, 38)];
            grayImage[a].image = [UIImage imageNamed:@"magny.png"];
            [bgViewStills[a] addSubview:grayImage[a]];
            
            
            grayImage1[a] = [[UIImageView alloc]initWithFrame:CGRectMake(8, 210+nY, 297, 16)];
            grayImage1[a].image = [UIImage imageNamed:@"divder.png"];
            [mainScroller addSubview:grayImage1[a]];
            
            
            nX = nX+160;
            nY = nY+226;
            b++;
            
            newTag++;
            //            mainScroller.contentSize = CGSizeMake(315, ((b*226)/2)+113);
        }
        
        if([movieSearch.text isEqualToString:@"All"])
        {
            nX=160*(a%2);
            nY=226 * (a/2);
            
            bgViewStills[a] = [[UIView alloc]initWithFrame:CGRectMake(nX, nY, 150, 207)];
            bgViewStills[a].backgroundColor = [UIColor clearColor];
            [mainScroller addSubview:bgViewStills[a]];
            
            if (view3[a] == nil)
                
            {
                
                view3[a] = [[AsyncImageView alloc] initWithFrame:CGRectMake(0, 0, 150.0f, 200.0f)];
                
                
                
                view3[a].contentMode = UIViewContentModeScaleToFill;
                
            }
            
            view3[a].backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];
            view3[a].userInteractionEnabled = YES;
            
            
            
            //cancel any previously loading images for this view
            
            [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:view3[a]];
            
            
            
            //set image URL. AsyncImageView class will then dynamically load the image
            
            NSURL *url1 = [NSURL URLWithString:data2[a]];
            
            
            
            ((AsyncImageView *)view3[a]).imageURL =url1;
            
            [bgViewStills[a] addSubview:view3[a]];
            
            UITapGestureRecognizer *webViewTapped = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageTouched:)];
            
            webViewTapped.numberOfTapsRequired = 1;
            view3[a].tag = a;
            webViewTapped.delegate = self;
            
            [view3[a] addGestureRecognizer:webViewTapped];
            
            
            MovieLabelStills[a] = [[UILabel alloc] initWithFrame:CGRectMake(0,207-30, 150, 23)];
            MovieLabelStills[a].backgroundColor =[UIColor clearColor];
            //            MovieLabelStills[a].textColor= [self colorWithHexString:@"e42477"];
            MovieLabelStills[a].textColor= [UIColor whiteColor];
            MovieLabelStills[a].backgroundColor= [UIColor blackColor];
            MovieLabelStills[a].text=data4[a];
            MovieLabelStills[a].font = [UIFont boldSystemFontOfSize:18.0f];
            [bgViewStills[a] addSubview:MovieLabelStills[a]];
            
            
            
            grayImage[a] = [[UIImageView alloc]initWithFrame:CGRectMake(150-39, 10, 39, 38)];
            grayImage[a].image = [UIImage imageNamed:@"magny.png"];
            [bgViewStills[a] addSubview:grayImage[a]];
            
            
            grayImage1[a] = [[UIImageView alloc]initWithFrame:CGRectMake(8, 210+nY, 297, 16)];
            grayImage1[a].image = [UIImage imageNamed:@"divder.png"];
            [mainScroller addSubview:grayImage1[a]];
            
            
            
            nX = nX+160;
            nY = nY+226;
            
            //            mainScroller.contentSize = CGSizeMake(315, ((TotalData*226)/2)+113);
        }
        
        
    }
    
    
}

-(void)loadCollection
{
    finalCount=10;
    if(![movieNameArray containsObject:movieSearch.text] )
    {
        UIAlertView *noMovieAlert = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"There are no posts for selected movie!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        noMovieAlert.tag = 6;
        [noMovieAlert show];
    }
    
    
    
    [[mainScroller subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [mainScroller removeFromSuperview];
    mainScroller=nil;
    
    
    [self getdata];
    
    
    activityIndicator2 = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    activityIndicator2.center=CGPointMake(320/2, 488);
    [activityIndicator2 setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [self.view addSubview:activityIndicator2];
    activityIndicator2.alpha = 0.0;

    
    
    mainScroller = [[UIScrollView alloc] initWithFrame:CGRectMake(5,83,315,504-83)];
	mainScroller.userInteractionEnabled	=YES;
    mainScroller.backgroundColor = [UIColor clearColor];
	mainScroller.showsVerticalScrollIndicator = YES;
    mainScroller.delegate = self;
	mainScroller.pagingEnabled = NO;
    mainScroller.bounces=YES;
	[self.view addSubview:mainScroller];
	
    b=0;
    newTag=0;
    nX = 0;
    nY = 0;
    loaderCount=0;
    
    if([movieSearch.text isEqualToString:@"All"])
    {
        for (int a =0; a<10; a++)
        {
            nX=160*(a%2);
            nY=226 * (a/2);
            
            bgViewStills[a] = [[UIView alloc]initWithFrame:CGRectMake(nX, nY, 150, 207)];
            bgViewStills[a].backgroundColor = [UIColor clearColor];
            [mainScroller addSubview:bgViewStills[a]];
            
            if (view3[a] == nil)
                
            {
                
                view3[a] = [[AsyncImageView alloc] initWithFrame:CGRectMake(0, 0, 150.0f, 200.0f)];
                
                
                
                view3[a].contentMode = UIViewContentModeScaleToFill;
                
            }
            
            view3[a].backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];
            view3[a].userInteractionEnabled = YES;
            
            
            
            //cancel any previously loading images for this view
            
            [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:view3[a]];
            
            
            
            //set image URL. AsyncImageView class will then dynamically load the image
            
            NSURL *url1 = [NSURL URLWithString:data2[a]];
            
            
            
            ((AsyncImageView *)view3[a]).imageURL =url1;
            
            [bgViewStills[a] addSubview:view3[a]];
            
            UITapGestureRecognizer *webViewTapped = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageTouched:)];
            
            webViewTapped.numberOfTapsRequired = 1;
            view3[a].tag = a;
            webViewTapped.delegate = self;
            
            [view3[a] addGestureRecognizer:webViewTapped];
            
            
            MovieLabelStills[a] = [[UILabel alloc] initWithFrame:CGRectMake(0,207-30, 150, 23)];
            MovieLabelStills[a].backgroundColor =[UIColor clearColor];
            //            MovieLabelStills[a].textColor= [self colorWithHexString:@"e42477"];
            MovieLabelStills[a].textColor= [UIColor whiteColor];
            MovieLabelStills[a].backgroundColor= [UIColor blackColor];
            MovieLabelStills[a].text=data4[a];
            MovieLabelStills[a].font = [UIFont boldSystemFontOfSize:18.0f];
            [bgViewStills[a] addSubview:MovieLabelStills[a]];
            
            
            
            grayImage[a] = [[UIImageView alloc]initWithFrame:CGRectMake(150-39, 10, 39, 38)];
            grayImage[a].image = [UIImage imageNamed:@"magny.png"];
            [bgViewStills[a] addSubview:grayImage[a]];
            
            
            grayImage1[a] = [[UIImageView alloc]initWithFrame:CGRectMake(8, 210+nY, 297, 16)];
            grayImage1[a].image = [UIImage imageNamed:@"divder.png"];
            [mainScroller addSubview:grayImage1[a]];
            
            
            
            nX = nX+160;
            nY = nY+226;
            
            
            mainScroller.contentSize = CGSizeMake(315, ((10*226)/2)+113);
            //currentScrollPosition=mainScroller.contentSize.height;
        }
        
        loaderCount=loaderCount+10;
    }
    
    
    
    
    
	else
    {
        NSLog(@"TotalData = %d",TotalData);
        for (int a =0; a<TotalData; a++)
        {
            if([data4[a]isEqualToString:movieSearch.text])
            {
                
                nX=160*(b%2);
                nY=226 * (b/2);
                
                bgViewStills[a] = [[UIView alloc]initWithFrame:CGRectMake(nX, nY, 150, 207)];
                bgViewStills[a].backgroundColor = [UIColor clearColor];
                [mainScroller addSubview:bgViewStills[a]];
                
                if (view3[a] == nil)
                    
                {
                    
                    view3[a] = [[AsyncImageView alloc] initWithFrame:CGRectMake(0, 0, 150.0f, 200.0f)];
                    
                    
                    
                    view3[a].contentMode = UIViewContentModeScaleToFill;
                    
                }
                
                view3[a].backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];
                view3[a].userInteractionEnabled = YES;
                
                
                
                //cancel any previously loading images for this view
                
                [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:view3[a]];
                
                
                
                //set image URL. AsyncImageView class will then dynamically load the image
                
                NSURL *url1 = [NSURL URLWithString:data2[a]];
                
                
                
                ((AsyncImageView *)view3[a]).imageURL =url1;
                
                [bgViewStills[a] addSubview:view3[a]];
                
                UITapGestureRecognizer *webViewTapped = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageTouched:)];
                
                webViewTapped.numberOfTapsRequired = 1;
                view3[a].tag = newTag;
                webViewTapped.delegate = self;
                
                [view3[a] addGestureRecognizer:webViewTapped];
                MovieLabelStills[a] = [[UILabel alloc] initWithFrame:CGRectMake(0,207-30, 150, 23)];
                MovieLabelStills[a].backgroundColor =[UIColor clearColor];
                //            MovieLabelStills[a].textColor= [self colorWithHexString:@"e42477"];
                MovieLabelStills[a].textColor= [UIColor whiteColor];
                MovieLabelStills[a].backgroundColor= [UIColor blackColor];
                MovieLabelStills[a].text=data4[a];
                MovieLabelStills[a].font = [UIFont boldSystemFontOfSize:18.0f];
                [bgViewStills[a] addSubview:MovieLabelStills[a]];
                
                
                
                grayImage[a] = [[UIImageView alloc]initWithFrame:CGRectMake(150-39, 10, 39, 38)];
                grayImage[a].image = [UIImage imageNamed:@"magny.png"];
                [bgViewStills[a] addSubview:grayImage[a]];
                
                
                grayImage1[a] = [[UIImageView alloc]initWithFrame:CGRectMake(8, 210+nY, 297, 16)];
                grayImage1[a].image = [UIImage imageNamed:@"divder.png"];
                [mainScroller addSubview:grayImage1[a]];
                
                
                nX = nX+160;
                nY = nY+226;
                b++;
                
                newTag++;
                
            }
            
        }
        mainScroller.contentSize = CGSizeMake(315, ((b*226)/2)+113);
        loaderCount=TotalData;
    }
    
    
    
    [movieTable reloadData];
    
    [self.view addSubview:movieTable];
}
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView

{
    
    activityIndicator2.alpha = 0.0;
    [activityIndicator2 stopAnimating];

    if (TotalData -loaderCount >0) {
        NSLog(@"lazy loading called");
        
        currentScrollPosition= mainScroller.contentOffset.y;
        if ( (currentScrollPosition = mainScroller.contentSize.height)) {
            mainScroller.contentSize = CGSizeMake(315 ,((loaderCount*226)/2)+226);
            
            [self ScrollLazyLoading];
            loaderCount=loaderCount+finalCount;
        }
        
    }
}


-(void)getdata

{
    
    GlobalClass *obj=[GlobalClass getInstance];
    
    NSLog(@"images=%@",obj.Dwall);
    
    [_activictyIndicator startAnimating];
    
    
    int i=0;
    
    for (NSDictionary *actoAgent in obj.Dwall)
        
    {
        
        data1[i]= [actoAgent objectForKey:@"wall_big_img"];
        NSLog(@"wall_big_img=%@",data1[i]);
        
        //        data2[i]= [actoAgent objectForKey:@"wall_small_img"];
        data2[i]= [actoAgent objectForKey:@"wall_big_img"];
        
        NSLog(@"wall_big_img=%@",data2[i]);
        
        
        NSString *timeZone =[actoAgent objectForKey:@"wall_id"];
        NSArray *newArray=[timeZone componentsSeparatedByString:@"_"];
        fbFeedId[i] = [actoAgent objectForKey:@"wall_id"];
        NSLog(@"data4  id ==== =====   %@",fbFeedId[i]);
        
        
        data3[i]= [actoAgent objectForKey:@"wall_tiny"];
        NSLog(@"wall_tiny=%@",data3[i]);
        
        
        
        data10[i]= [actoAgent objectForKey:@"status"];
        
        NSLog(@"status=%@",data10[i]);
        
        data11[i]= [actoAgent objectForKey:@"premium"];
        NSLog(@"premium=%@",data11[i]);
        
        data4[i]= [actoAgent objectForKey:@"movie_name"];
        NSLog(@"movie_name=====%@",data4[i]);
        
        if (![movieNameArray containsObject:data4[i]])
        {
            
            [movieNameArray addObject:data4[i]];
        }
        
        
        [movieTable reloadData];
        
        
        i++;
        
        
        
    }
    
    TotalData=i;
    
    [movieNameArray sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [movieNameArray count];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    for (int i =0; i<TotalData; i++)
    {
        actionBar[i] = nil;
    }
    [[mainScroller subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [mainScroller removeFromSuperview];
    mainScroller=nil;
    
    [[imageScroller subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [imageScroller removeFromSuperview];
    imageScroller=nil;
    
    
    [self performSelector:@selector(loadCollection) withObject:nil afterDelay:0.0];
    movieSearch.text=[NSString stringWithFormat:@"%@",[movieNameArray objectAtIndex:indexPath.row]];
    
    movieTable.hidden = YES;
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


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"FilmStills";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    
    cell.backgroundColor  =[self colorWithHexString:@"13202d"];
    
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    
    NSLog(@"MovieArray in cellForRow = %@",movieNameArray);
    
    cell.textLabel.text=[movieNameArray objectAtIndex:indexPath.row];
    
    
    return cell;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    if(textField == movieSearch)
    {
        NSLog(@"Ashwini");
        [self.view endEditing:YES]; // added this in for case when keyboard was already on screen
        
        
        if (movieTable.hidden) {
            movieTable.hidden = NO;
            
        }
        else
            movieTable.hidden = YES;
        
        [movieSearch resignFirstResponder];
        
    }
    return NO;
    
    
    
}
- (void)imageTouched:(UITapGestureRecognizer *)sender
{
    UITapGestureRecognizer *gesture = (UITapGestureRecognizer *) sender;
    NSLog(@"gesture.view = %d",gesture.view.tag);
    imgIndex = gesture.view.tag;
    
    
    if ([data10[imgIndex] isEqualToString:@"1"]) {
        _IAPVIEW.alpha=1.0;
        [self.view addSubview:_IAPVIEW];
        
        
        SKProduct *product = _products[0];
        
        [_priceFormatter setLocale:product.priceLocale];
        
        
        _pricelabel.text = [NSString stringWithFormat:@"fee of . %@ \n to see become a premium member!",[_priceFormatter stringFromNumber:product.price]];
        NSLog(@"_products[buyB=%@", _pricelabel.text);
        
        
    }
	
    else{
        
        [self openBigImage];
        
        
    }
    
    
    
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



-(IBAction)done

{
    
}

-(void)openBigImage

{
    _shadowImage.alpha = 0.0;
    _headerImage.alpha = 0.0;
    _headerLabel.alpha = 0.0;
    mainScroller.alpha = 0.0;
    _textBackgrnd.alpha = 0.0;
    movieSearch.alpha = 0.0;
    
    strr= [NSString stringWithFormat:@"%@",data1[imgIndex]];
    
    shareText= strr;
    
    
    
    _closeButtonView.alpha = 1.0;
    
    
    imageScroller = [[UIScrollView alloc] initWithFrame:CGRectMake(0,0,320,504)];
    
    imageScroller.userInteractionEnabled	=YES;
    imageScroller.tag = 2;
    imageScroller.pagingEnabled = YES;
    
    imageScroller.showsHorizontalScrollIndicator = YES;
    
    imageScroller.scrollEnabled = YES;
    
    // imageScroller.alpha = 0.0;
    imageScroller.delegate = self;
    
    
    int m = 0;
    
    for(int a=0;a<TotalData;a++)
        
    {
        
        if([data4[a]isEqualToString:movieSearch.text])
        {
            
            
            shareText=[NSString stringWithFormat:@"%@",data3[imgIndex]];
            
            
            
            if (view2[a] == nil)
                
            {
                
                view2[a] = [[AsyncImageView alloc] initWithFrame:CGRectMake(m+0, 0, 320.0f, 504.0f)];
                
                
                
                view2[a].contentMode = UIViewContentModeScaleToFill;
                
            }
            
            view2[a].backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];
            
            
            
            
            //cancel any previously loading images for this view
            
            [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:view2[a]];
            
            
            
            //set image URL. AsyncImageView class will then dynamically load the image
            
            NSURL *url1 = [NSURL URLWithString:data1[a]];
            
            
            
            ((AsyncImageView *)view2[a]).imageURL =url1;
            
            [imageScroller addSubview:view2[a]];
            
            
            UIView *wallpaperView = [[UIView alloc] initWithFrame:CGRectMake(m+0, 0, 320.0f, 504.0f)];
            
            wallpaperView.backgroundColor=[UIColor clearColor];
            
            wallpaperView.tag=a;
            
            [imageScroller addSubview:wallpaperView];
            
            
            
            
            
            socializeBg[a] = [[UIView alloc]initWithFrame:CGRectMake(0, 504-44, 320, 44)];
            socializeBg[a].backgroundColor = [UIColor clearColor];
            [wallpaperView addSubview:socializeBg[a]];
            
            
            
            
            // SZActionBar *actionBar=[[SZActionBar alloc]initWithFrame:CGRectZero entity:self.entity viewController:self];
            
            if (actionBar[a] == nil)
            {
                
                NSString *entity_Key= [NSString stringWithFormat:@"%@",fbFeedId[a]];
                NSString *entity_name= [NSString stringWithFormat:@"%@",data4[a]];
                self.entity = [SZEntity entityWithKey:entity_Key name:entity_name];
                actionBar[a] = [SZActionBar defaultActionBarWithFrame:CGRectZero entity:self.entity viewController:self];
                
                
                actionBar[a].itemsLeft = [NSArray arrayWithObjects:[SZActionButton viewsButton], [actionBar[a].itemsRight objectAtIndex:0], [actionBar[a].itemsRight objectAtIndex:1], nil];
                // actionBar[i].itemsLeft = [NSArray arrayWithObjects:nil];
                actionBar[a].tag=a;
                
                faceBookBtn = [[UIButton alloc] initWithFrame:CGRectZero];
                [faceBookBtn setImage:[UIImage imageNamed:@"facebook_icon.png"] forState:UIControlStateNormal];
                [faceBookBtn sizeToFit];
                [faceBookBtn addTarget:self action:@selector(fbShare:) forControlEvents:UIControlEventTouchUpInside];
                faceBookBtn.tag=a;
                
                
                twitterBtn = [[UIButton alloc] initWithFrame:CGRectZero];
                [twitterBtn setImage:[UIImage imageNamed:@"twitter_icon.png"] forState:UIControlStateNormal];
                [twitterBtn sizeToFit];
                [twitterBtn addTarget:self action:@selector(tweetShare:) forControlEvents:UIControlEventTouchUpInside];
                twitterBtn.tag=a;
                
                
                emailBtn = [[UIButton alloc] initWithFrame:CGRectZero];
                [emailBtn setImage:[UIImage imageNamed:@"email_icon.png"] forState:UIControlStateNormal];
                [emailBtn sizeToFit];
                [emailBtn addTarget:self action:@selector(mailCompose:) forControlEvents:UIControlEventTouchUpInside];
                emailBtn.tag=a;
                actionBar[a].backgroundImageView.alpha = 0.4;
                actionBar[a].betweenButtonsPadding=3.0;
                actionBar[a].itemsRight = [NSArray arrayWithObjects:faceBookBtn, twitterBtn,emailBtn, nil];
                
                
                
                [socializeBg[a] addSubview:actionBar[a]];
            }
            
            downloadHD[a] = [UIButton buttonWithType:UIButtonTypeCustom];
            
            downloadHD[a].frame = CGRectMake(145, 504-32, 49, 21);
            
            [downloadHD[a] setBackgroundImage:[UIImage imageNamed:@"wall_dawon_icon"] forState:UIControlStateNormal];
            
            // downloadButton[a].userInteractionEnabled=YES;
            
            downloadHD[a].tag=a;
            
            [downloadHD[a] addTarget:self action:@selector(downloadHDButton:) forControlEvents:UIControlEventTouchUpInside];
            
            [wallpaperView addSubview:downloadHD[a]];
            
            m=m+320;
            
        }
        if([movieSearch.text isEqualToString:@"All"])
        {
            shareText=[NSString stringWithFormat:@"%@",data3[imgIndex]];
            
            
            
            if (view2[a] == nil)
                
            {
                
                view2[a] = [[AsyncImageView alloc] initWithFrame:CGRectMake(m+0, 0, 320.0f,504.0f)];
                
                
                
                view2[a].contentMode = UIViewContentModeScaleToFill;
                
            }
            
            view2[a].backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];
            
            
            
            
            //cancel any previously loading images for this view
            
            [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:view2[a]];
            
            
            
            //set image URL. AsyncImageView class will then dynamically load the image
            
            NSURL *url1 = [NSURL URLWithString:data1[a]];
            
            
            
            ((AsyncImageView *)view2[a]).imageURL =url1;
            
            [imageScroller addSubview:view2[a]];
            
            
            UIView *wallpaperView = [[UIView alloc] initWithFrame:CGRectMake(m+0, 0, 320.0f, 504.0f)];
            
            wallpaperView.backgroundColor=[UIColor clearColor];
            
            wallpaperView.tag=a;
            
            [imageScroller addSubview:wallpaperView];
            
            
            socializeBg[a] = [[UIView alloc]initWithFrame:CGRectMake(0, 504-44, 320, 44)];
            socializeBg[a].backgroundColor = [UIColor clearColor];
            [wallpaperView addSubview:socializeBg[a]];
            
            
            
            
            // SZActionBar *actionBar=[[SZActionBar alloc]initWithFrame:CGRectZero entity:self.entity viewController:self];
            
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
                [faceBookBtn setImage:[UIImage imageNamed:@"facebook_icon.png"] forState:UIControlStateNormal];
                [faceBookBtn sizeToFit];
                [faceBookBtn addTarget:self action:@selector(fbShare:) forControlEvents:UIControlEventTouchUpInside];
                faceBookBtn.tag=a;
                
                
                twitterBtn = [[UIButton alloc] initWithFrame:CGRectZero];
                [twitterBtn setImage:[UIImage imageNamed:@"twitter_icon.png"] forState:UIControlStateNormal];
                [twitterBtn sizeToFit];
                [twitterBtn addTarget:self action:@selector(tweetShare:) forControlEvents:UIControlEventTouchUpInside];
                twitterBtn.tag=a;
                
                
                emailBtn = [[UIButton alloc] initWithFrame:CGRectZero];
                [emailBtn setImage:[UIImage imageNamed:@"email_icon.png"] forState:UIControlStateNormal];
                [emailBtn sizeToFit];
                [emailBtn addTarget:self action:@selector(mailCompose:) forControlEvents:UIControlEventTouchUpInside];
                emailBtn.tag=a;
                actionBar[a].backgroundImageView.alpha = 0.4;
                actionBar[a].betweenButtonsPadding=3.0;
                actionBar[a].itemsRight = [NSArray arrayWithObjects:faceBookBtn, twitterBtn,emailBtn, nil];
                
                
                
                [socializeBg[a] addSubview:actionBar[a]];
            }
            
            downloadHD[a] = [UIButton buttonWithType:UIButtonTypeCustom];
            
            downloadHD[a].frame = CGRectMake(145, 504-32, 49, 21);
            
            [downloadHD[a] setBackgroundImage:[UIImage imageNamed:@"wall_dawon_icon"] forState:UIControlStateNormal];
            
            // downloadButton[a].userInteractionEnabled=YES;
            
            downloadHD[a].tag=a;
            
            [downloadHD[a] addTarget:self action:@selector(downloadHDButton:) forControlEvents:UIControlEventTouchUpInside];
            
            [wallpaperView addSubview:downloadHD[a]];
            
            m=m+320;
            
        }
        
    }
    
    
    NSLog(@"imageindex======== %d",imgIndex);
    [self.imageScroller setContentOffset:CGPointMake(320*imgIndex, 0.0) animated:YES];
    
    
    
    [self.view addSubview:imageScroller];
    
    
    
    imageScroller.contentSize = CGSizeMake(m, 395);
    
    imageScroller.delegate=self;
    
    [self.view addSubview:imageScroller];
    
    imageScroller.alpha = 1.0;
    
    
    [self.view addSubview:_closeButtonView];
    
    
    for(int a=0;a<TotalData;a++)
        
    {
        shareView[a].alpha=0.0;
        
    }
    
    
    
    
    
    
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView

{
    
    activityIndicator2.alpha = 1.0;
    [activityIndicator2 startAnimating];

    
    NSLog(@"scrollViewWillBeginDragging called");
    
    
    
    for(int a=0;a<TotalData;a++)
        
    {
        shareView[a].alpha=0.0;
        
    }
    
}







- (void)shareButton:(UIButton *)sender {
    
    
    
    imgIndex= sender.tag;
    
    
    
    if(shareView[imgIndex].alpha==0.0)
        
    {
        //  socializeBg[imgIndex].alpha = 1.0;
        shareView[imgIndex].alpha = 1.0;
        
    }
    
    
    
    //     if(shareView[imgIndex].alpha == 1.0)
    
    else
        
    {
        // socializeBg[imgIndex].alpha = 0.0;
        shareView[imgIndex].alpha = 0.0;
        
    }
    
    
    
    
    
    
    
}


- (IBAction)downloadHDButton:(UIButton *)sender {
    for(int a=0;a<TotalData;a++)
        
    {
        //  socializeBg[a].alpha = 0.0;
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
        
        NSData *imgData=[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",data1[imgIndex]]]];
        
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
        
        NSData *imgData=[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",data1[imgIndex]]]];
        
        UIImage *image = [[UIImage alloc] initWithData:imgData];
        
        UIImageWriteToSavedPhotosAlbum(image, self, nil, nil);
        
        //int i= (imgData.length / )
        
        
        
        [self performSelector:@selector(Finishloader) withObject:nil afterDelay:2.0];
        
        
        
    });
    
    
    
}





-(void)Finishloader

{
    downloadHD[imgIndex].enabled = YES;
    downloadButton[imgIndex].enabled = YES;
    [_activictyIndicator stopAnimating];
    
    //	NSString	 *str= [NSString stringWithFormat:@"Downloaded wallpaper from Link %@ ",sharetext];
    
    //	self.trackedViewName=str;
    
    //
    
    //
    
    //	[[GAI sharedInstance].defaultTracker sendEventWithCategory:@"Downloaded wallpaper"
    
    //                                                    withAction:sharetext
    
    //                                                     withLabel:@"Wallpaper"
    
    //                                                     withValue:nil];
    
    
    
    UIAlertView*	alertBox = [[ UIAlertView alloc]initWithTitle:@"Success" message:@"Photo is Downloaded in Your Photo Library" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil ];
    
    [alertBox show];
    
    
    
    dwnloadProgress.alpha = 0.0;
    
    dwnloadProgress.progress = 0.4;
    
    _activictyIndicator.alpha=0.0;
    
    
    
}



- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    
    
    [self done];
    
    
    
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











-(void)getsharetext

{
    
    
    
    GlobalClass *obj=[GlobalClass getInstance];
    
    NSLog(@"images=%@",obj.wallpapers);
    
    
    
    
    
    //        for (NSDictionary *actoAgent in obj.wallpapers)
    
    //        {
    
    
    
    fbsharetext = [obj.wallpapers objectForKey:@"fb_share"];
    
    NSLog(@"fb_share=%@",fbsharetext);
    
    
    
    twtsharetext = [obj.wallpapers objectForKey:@"twitter_share"];
    
    NSLog(@"twitter_share=%@",twtsharetext);
    
    
    
    
    
    mailsharesub = [obj.wallpapers objectForKey:@"email_subject"];
    
    NSLog(@"email_subject=%@",mailsharesub);
    
    
    
    
    
    mailsharetext = [obj.wallpapers objectForKey:@"email_share"];
    
    NSLog(@"email_share=%@",mailsharetext);
    
    
    
    //            break;
    
    //
    
    //        }
    
}



#pragma mark Compose Mail

-(IBAction)mailCompose:(UIButton *)sender

{
    
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
    
    [picker addAttachmentData:imageData mimeType:@"image/jpg" fileName:data1[imgIndex]];
    
    
    
    
    
    // Set up recipients
    
    NSArray *toRecipients = [NSArray arrayWithObject:@""];
    
    NSArray *ccRecipients = [NSArray arrayWithObjects:@"", nil];
    
    //NSArray *bccRecipients = [NSArray arrayWithObject:@"fourth@example.com"];
    
    NSString	*str= [NSString stringWithFormat:@"%@  \n\n You can also download HD image from %@",mailsharetext,data2[imgIndex]];
    
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
    
    NSString *recipients = @"mailto:?cc=&subject=Check out this awesome Besharam Video ";
    
    //NSString *body = @"&body=All Dabangg 2 Movie details are Available on Dabangg2 App!";
    
    
    NSString *email = [NSString stringWithFormat:@"%@%@", recipients, string];
    
    email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
    
}



- (IBAction)tweetShare:(UIButton *)sender {
    
    NSUInteger check = [[NSUserDefaults standardUserDefaults] integerForKey:@"twtSwitch"];
    if (check==1 || check==2)
    {
        NSUserDefaults *setUserDefaults=[NSUserDefaults standardUserDefaults];
        [setUserDefaults setInteger:1 forKey:@"twtSwitch"];
        
        imgIndex=sender.tag;
        
        strr= [NSString stringWithFormat:@"%@",data3[imgIndex]];
        
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
        
        //	 NSLog(@"Unable to add the image!");
        
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
    
    else
    {
        UIAlertView *twtAlert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please go to the profile section and turn on Facebook / Twitter settings." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        twtAlert.tag=0;
        [twtAlert show];
        
    }
    
       
    
}

-(void)twitter:(UIButton *)sender{
    
    
    
    
    //	UITapGestureRecognizer *gesture = (UITapGestureRecognizer *) sender;
    
    //	NSLog(@"tag121=%@",shareText[gesture.view.tag]);
    
    NSUInteger check = [[NSUserDefaults standardUserDefaults] integerForKey:@"twtSwitch"];
    if (check==1) {
        
        
        
    }
    else
    {
        NSUserDefaults *setUserDefaults=[NSUserDefaults standardUserDefaults];
        [setUserDefaults setInteger:1 forKey:@"twtSwitch"];
        
    }
    
    
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
    
    
    
    //  Set the initial body of the Tweet
    
    // NSString * str = [NSString stringWithFormat:@"%@",twtsharetext,shareText];
    
    [tweetSheet setInitialText:twtsharetext];
    
    
    //  Adds an image to the Tweet
    
    //  For demo purposes, assume we have an image named 'larry.png'
    
    //  that we wish to attach
    
    //	if (![tweetSheet addImage:[UIImage imageNamed:@"114x114.png"]]) {
    
    //	 NSLog(@"Unable to add the image!");
    
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
    NSUInteger check = [[NSUserDefaults standardUserDefaults] integerForKey:@"fbSwitch"];
    if (check==1 || check==2)
    {
        NSUserDefaults *setUserDefaults=[NSUserDefaults standardUserDefaults];
        [setUserDefaults setInteger:1 forKey:@"fbSwitch"];
        
        int a =sender.tag;
        
        //	NSString *str=[NSString stringWithFormat:@"Downloaded this amazing wallpaper: %@ from official YJHD App. Get free copy of the App @<tiny url>",titleMusic.text];
        
        //	post = [[FBFeedPost alloc] initWithLinkPath:@"http://ow.ly/g4bRR" caption:str];
        
        strr= [NSString stringWithFormat:@"%@",data3[a]];
        
        shareText= strr;
        
        
        
        NSString *ver = [[UIDevice currentDevice] systemVersion];
        
        float ver_float = [ver floatValue];
        
        if (ver_float < 6.0)
            
        {
            
            //        sharepost = [[FBFeedPost alloc] initWithLinkPath:shareText caption:fbsharetext];
            //
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
    
    else
    {
        UIAlertView *twtAlert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please go to the profile section and turn on Facebook / Twitter settings." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        twtAlert.tag=0;
        [twtAlert show];
        
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
        
        
        
        NSString	 *STR= [NSString stringWithFormat:@"%@ - Use official Reliance Entertainment App to see all Besharam Wallpapers",data1[sendtitle]];
        
        
        
        //   [fbController addImage:[UIImage imageNamed:@"114x114.png"]];
        
        [fbController setInitialText:fbsharetext];
        
        [fbController addURL:[NSURL URLWithString:stringis]];
        
        [fbController setCompletionHandler:completionHandler];
        
        [self presentViewController:fbController animated:YES completion:nil];
        
    }
    
    
    
}

- (IBAction)closeButton:(id)sender {
    
    NSLog(@"DAS");
    
    _shadowImage.alpha = 1.0;
    _headerImage.alpha = 1.0;
    _headerLabel.alpha = 1.0;
    _closeButtonView.alpha = 0.0;
    mainScroller.alpha = 1.0;
    _textBackgrnd.alpha = 1.0;
    movieSearch.alpha = 1.0;
    
    
    [imageScroller removeFromSuperview];
    
    for(int a=0;a<TotalData;a++)
        
    {
        
        actionBar[a] = nil;
        
        shareView[a].alpha = 0.0;
        
        downloadButton[a].alpha = 0.0;
        
        if (view2[a]!=nil) {
            
            [view2[a] removeFromSuperview];
            
            view2[a] = nil;
            
        }
        
    }
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    movieTable.hidden=YES;
}


@end


