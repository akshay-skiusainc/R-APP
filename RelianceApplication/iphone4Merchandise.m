//
//  iphone4Merchandise.m
//  RelianceApplication
//
//  Created by Ashwini Pawar on 19/08/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import "iphone4Merchandise.h"

@interface iphone4Merchandise ()

@end

@implementation iphone4Merchandise
@synthesize currentScrollPosition;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)getsharetext
{
    
    GlobalClass *obj=[GlobalClass getInstance];
    NSLog(@"images=%@",obj.mug);
    
    
    //        for (NSDictionary *actoAgent in obj.wallpapers)
    //        {
    
    fbsharetext = [obj.mug objectForKey:@"fb_share"];
  
    
    twtsharetext = [obj.mug objectForKey:@"twitter_share"];
    
    
    mailsharesub = [obj.mug objectForKey:@"email_subject"];
    
    
    mailsharetext = [obj.mug objectForKey:@"email_share"];
    //            break;
    //
    //        }
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

-(void)fetchAllData
{
	GlobalClass *obj1=[GlobalClass getInstance];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSString* post;

        if([obj1.Leftcheck isEqualToString:@"1"])
        {
            post = [NSString stringWithFormat:@"http://apps.medialabs24x7.com/besharam/fetch_rel_merchandise_ios.php?deviceno=%@",obj1.dev];
            
        }
        else
        {

	  post = [NSString stringWithFormat:@"http://apps.medialabs24x7.com/besharam/fetch_merchandise_ios.php?deviceno=%@",obj1.dev];
        }
	
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:post] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
	
	
	//  NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://110.175.19.95/SCMIpadDemoWebApp/CustomerList.aspx?username=02&BeginRowNo=0&LastRowNo=10"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:5.0];
	
	[request setHTTPMethod:@"GET"];
	//[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Current-Type"];
	
    NSError *errorReturned = nil;
	NSURLResponse *theResponse =[[NSURLResponse alloc]init];
	NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&theResponse error:&errorReturned];
	
	
	
	if (errorReturned) {
		NSLog(@"errorReturned=%@",errorReturned);
        [activityIndicator stopAnimating];
        
		
        //		UIAlertView* alertBox = [[ UIAlertView alloc]initWithTitle:@"Network Error" message:@"Network Not Connected" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Retry", nil ];
        //		//alertBox.tag=3;
        //		alertBox.delegate=self;
        //		[alertBox show];
		
		
		// Handle error.
	}
	else
	{
		
		
		NSLog(@"POSTING=%@",post);
		
		
		
        //		NSError *errorReturned = nil;
        //		NSURLResponse *theResponse =[[NSURLResponse alloc]init];
        //		NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&theResponse error:&errorReturned];
		
		
		NSError* error;
		NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data //1
                                                             options:kNilOptions
                                                               error:&error];
		
        
        NSDictionary* merchandise = [json objectForKey:@"merchandise"]; //2
        
		
		
        //		NSLog(@"json=%@",json);
        //
        //
        //		NSDictionary* Contests = json; //2
		
		
		
		
		GlobalClass *obj=[GlobalClass getInstance];
		obj.Merchandise=merchandise;
		
		
		
		
		
		
		
	}
	
        dispatch_async(dispatch_get_main_queue()	, ^{
            [self DisplayMerchandiseData];
        });
        
        
    });

	
	
}



-(void)getdata
{
	GlobalClass *obj=[GlobalClass getInstance];
	NSLog(@"ddata=%@",obj.Merchandise);
	int i=0;
    
	for (NSDictionary *actoAgent in obj.Merchandise)
	{
        //        data1[0]= [actoAgent objectForKey:@"response"];
        //        if ([data1[0] isEqualToString:@"FAIL"])
        //        {
        //            UIAlertView* alertBox = [[ UIAlertView alloc]initWithTitle:@"Alert" message:@"You have played all Contest" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil ];
        //            alertBox.tag=3;
        //            alertBox.delegate=self;
        //            [alertBox show];
        //
        //        }
        //
        //
        //        else{
        
        
        data1[i]= [actoAgent objectForKey:@"m_id"];
        NSLog(@"m_id=%@",data1[i]);
        
        data2[i]= [actoAgent objectForKey:@"m_prod_id"];
        NSLog(@"m_prod_id=%@",data2[i]);
        
        
        data3[i]= [actoAgent objectForKey:@"m_price"];
        NSLog(@"m_price=%@",data3[i]);
        
        
        data4[i]= [actoAgent objectForKey:@"m_desc"];
        NSLog(@"m_desc=%@",data4[i]);
        
        data5[i]= [actoAgent objectForKey:@"m_price_bg_color"];
        NSLog(@"m_price_bg_color=%@",data5[i]);
        
        
        data6[i]= [actoAgent objectForKey:@"m_desc_bg_color"];
        NSLog(@"m_desc_bg_color=%@",data6[i]);
        
        
        
        data7[i]= [actoAgent objectForKey:@"m_img_front"];
        NSLog(@"m_img_front=%@",data7[i]);
        
        data8[i]= [actoAgent objectForKey:@"m_img_side"];
        NSLog(@"m_img_side=%@",data8[i]);
        
        
        data9[i]= [actoAgent objectForKey:@"m_title"];
        NSLog(@"m_title=%@",data9[i]);
        
        data10[i]= [actoAgent objectForKey:@"m_bg_color"];
        NSLog(@"m_bg_color=%@",data10[i]);
        
        data11[i]= [actoAgent objectForKey:@"m_name"];
        NSLog(@"m_name=%@",data11[i]);
        
        data12[i]= [actoAgent objectForKey:@"m_tiny_link"];
        NSLog(@"m_tiny_link=%@",data12[i]);
        
        
        data13[i]= [actoAgent objectForKey:@"fb_share"];
        NSLog(@"fb_share=%@",data13[i]);
        
        data14[i]= [actoAgent objectForKey:@"twitter_share"];
        NSLog(@"twitter_share=%@",data14[i]);
        
        data15[i]= [actoAgent objectForKey:@"email_share"];
        NSLog(@"email_share=%@",data15[i]);
        
        
        //
        //            data11[i]= [actoAgent objectForKey:@"id"];
        //            NSLog(@"id=%@",data11[i]);
        //
        
        
        
        
        //		data8[i]= [actoAgent objectForKey:@"video_title"];
        //		NSLog(@"video_title=%@",data8[i]);
        //
        
        //		data4[i]= [actoAgent objectForKey:@"image"];
        //		NSLog(@"str=%@",data4[i]);
        
        
        i++;
    }
    TotalData=i;
    
    
    
	//}
	
}

-(void)DisplayMerchandiseData
{
    [self getdata];
	
	[activityIndicator stopAnimating];
	
	VideoScroller			= [[UIScrollView alloc] initWithFrame:CGRectMake(0,0,320,416)];
	VideoScroller.userInteractionEnabled	=YES;
    VideoScroller.pagingEnabled	=YES;
    VideoScroller.delegate=self;
	VideoScroller.showsHorizontalScrollIndicator = YES;
	//VideoScroller.pagingEnabled = NO;
	[self.view addSubview:VideoScroller];
    
    
    
    GlobalClass *obj1= [GlobalClass getInstance];
   	m=0;
	for (int i =0; i<TotalData; i++) {
		
        ImagePatch[i]                    = [[UIImageView alloc] initWithFrame:CGRectMake(8, m, 306,315)];
        ImagePatch[i].userInteractionEnabled=YES;
        // ImagePatch[i].image= [UIImage imageNamed:@"video_song_title.jpg"];
      
        ImagePatch[i].alpha=0.46;
        [VideoScroller addSubview:ImagePatch[i]];
        //    [ImagePatch[i] release];
        ImagePatch[i].tag= i;
        
        
		
        if (Imageview[i]    == nil)
        {
            Imageview[i] = [[AsyncImageView alloc] initWithFrame:CGRectMake(54, 22+m, 200.0f, 200.0f)];
            
            Imageview[i].contentMode = UIViewContentModeScaleAspectFit;
        }
        
        
        
        Imageview[i].userInteractionEnabled=YES;
        Imageview[i].tag=i;
        //cancel any previously loading images for this view
        [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:Imageview[i]];
        
        //set image URL. AsyncImageView class will then dynamically load the image
        NSURL *url1 = [NSURL URLWithString:data7[i]];
        
        ((AsyncImageView *)Imageview[i]).imageURL =url1;
        // _view1 = view;
        
        [VideoScroller addSubview:Imageview[i]];
		
        
        ImagePatch2[i]= [[UIImageView alloc] initWithFrame:CGRectMake(8, 320+m, 308,90)];
		ImagePatch2[i].userInteractionEnabled=YES;
        ImagePatch2[i].backgroundColor=  [self colorWithHexString:@"560048"];
		[VideoScroller addSubview:ImagePatch2[i]];
		ImagePatch2[i].tag= i;
		
		
		
        Description[i] = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 305, 90)];
		Description[i].backgroundColor =[UIColor clearColor];
        Description[i].editable=NO;
		Description[i].textColor= [self colorWithHexString:@"ffffff"];
        //	contestNo[i].sizeToFit=YES;
        //NSString    *str=[NSString stringWithFormat:@"%d",i];
		Description[i].text=data4[i];
		Description[i].font = [UIFont fontWithName:@"Helvetica Neue" size: 12.0];
        Description[i].font = [UIFont boldSystemFontOfSize:12.0f];
        // Description[i].font = [UIFont italicSystemFontOfSize:16.0f];
		[ImagePatch2[i] addSubview:Description[i]];
		
        NSString    *str= [NSString stringWithFormat:@"Rs. %@",data3[i]];
        pricebtn[i]					= [UIButton buttonWithType:UIButtonTypeCustom];
        pricebtn[i].frame				= CGRectMake(10,m+325-60,133,50);
        [pricebtn[i] setBackgroundImage:[UIImage imageNamed:@"merch_lable.png"] forState:UIControlStateNormal];
        [ pricebtn[i] setTitle:str forState:UIControlStateNormal];
        //   [pricebtn[i] setBackgroundImage:shre1 forState:UIControlStateHighlighted];
        pricebtn[i].userInteractionEnabled = YES;
        [VideoScroller addSubview:pricebtn[i]];
        pricebtn[i].tag = i;
        
               
        
        
        leftbtn[i]					= [UIButton buttonWithType:UIButtonTypeCustom];
        leftbtn[i].frame				= CGRectMake(10,195+m,72,72);
        [leftbtn[i] setBackgroundImage:[UIImage imageNamed:@"merch_left.png"] forState:UIControlStateNormal];
        [leftbtn[i] addTarget:self action:@selector(lefttap:) forControlEvents:UIControlEventTouchUpInside];
        
        //   [pricebtn[i] setBackgroundImage:shre1 forState:UIControlStateHighlighted];
        leftbtn[i].userInteractionEnabled = YES;
        [VideoScroller addSubview:leftbtn[i]];
        leftbtn[i].tag = i;
        
        
        rightbtn[i]					= [UIButton buttonWithType:UIButtonTypeCustom];
        rightbtn[i].frame				= CGRectMake(308-75,195+m,72,72);
        [rightbtn[i] setBackgroundImage:[UIImage imageNamed:@"merch_right.png"] forState:UIControlStateNormal];
        [rightbtn[i] addTarget:self action:@selector(righttap:) forControlEvents:UIControlEventTouchUpInside];
        //   [pricebtn[i] setBackgroundImage:shre1 forState:UIControlStateHighlighted];
        rightbtn[i].userInteractionEnabled = YES;
        [VideoScroller addSubview:rightbtn[i]];
        rightbtn[i].tag = i;
        
        
        
		title[i] = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 305, 18)];
		title[i].backgroundColor =[self colorWithHexString:@"560048"];
		//title[i].textColor= [UIColor whiteColor];
        title[i].text=data9[i];
        title[i].font = [UIFont fontWithName:@"Helvetica Neue" size: 14.0];
        title[i].font = [UIFont boldSystemFontOfSize:15.0f];
        
		[ImagePatch[i] addSubview:title[i]];
        
        buybtn[i]					= [UIButton buttonWithType:UIButtonTypeCustom];
        buybtn[i].frame				= CGRectMake(201,m+333-60,103,42);
        [buybtn[i] setBackgroundImage:[UIImage imageNamed:@"buynow.png"] forState:UIControlStateNormal];
        [buybtn[i] addTarget:self action:@selector(openPaymentGetway:) forControlEvents:UIControlEventTouchUpInside];
        buybtn[i].userInteractionEnabled = YES;
        [VideoScroller addSubview:buybtn[i]];
        buybtn[i].tag = i;

  /*
        socializeBg[i] = [[UIView alloc]initWithFrame:CGRectMake(8, 375+m,308,44)];
        
        socializeBg[i].backgroundColor = [UIColor clearColor];
        [VideoScroller addSubview:socializeBg[i]];
        
        // Action Bar Implimentation
        if (actionBar[i] == nil)
        {
            NSString *entity_Key= [NSString stringWithFormat:@"%@",data1[i]];
            NSString *entity_name= [NSString stringWithFormat:@"%@",data11[i]];
            self.entity = [SZEntity entityWithKey:entity_Key name:entity_name];
            actionBar[i] = [SZActionBar defaultActionBarWithFrame:CGRectZero entity:self.entity viewController:self];
            actionBar[i].itemsLeft = [NSArray arrayWithObjects:[SZActionButton viewsButton], [actionBar[i].itemsRight objectAtIndex:0], [actionBar[i].itemsRight objectAtIndex:1], nil];
            // actionBar[i].itemsLeft = [NSArray arrayWithObjects:nil];
            actionBar[i].tag=i;
            
            faceBookBtn = [[UIButton alloc] initWithFrame:CGRectZero];
            [faceBookBtn setImage:[UIImage imageNamed:@"socialize-selectnetwork-facebook-icon.png"] forState:UIControlStateNormal];
            [faceBookBtn sizeToFit];
            [faceBookBtn addTarget:self action:@selector(fbShare:) forControlEvents:UIControlEventTouchUpInside];
            faceBookBtn.tag=i;
            
            
            twitterBtn = [[UIButton alloc] initWithFrame:CGRectZero];
            [twitterBtn setImage:[UIImage imageNamed:@"socialize-selectnetwork-twitter-icon.png"] forState:UIControlStateNormal];
            [twitterBtn sizeToFit];
            [twitterBtn addTarget:self action:@selector(tweetShare:) forControlEvents:UIControlEventTouchUpInside];
            twitterBtn.tag=i;
            
            
            //            emailBtn = [[UIButton alloc] initWithFrame:CGRectZero];
            //            [emailBtn setImage:[UIImage imageNamed:@"socialize-selectnetwork-email-icon.png"] forState:UIControlStateNormal];
            //            [emailBtn sizeToFit];
            //            [emailBtn addTarget:self action:@selector(mailCompose:) forControlEvents:UIControlEventTouchUpInside];
            //            faceBookBtn.tag=i;
            
            actionBar[i].betweenButtonsPadding=5.0;
            actionBar[i].backgroundImageView.alpha = 0.5;
            actionBar[i].itemsRight = [NSArray arrayWithObjects:faceBookBtn, twitterBtn,emailBtn, nil];
            
            
            [socializeBg[i] addSubview:actionBar[i]];
        }
 
   */     
        if([obj1.Leftcheck isEqualToString:@"1"])
        {
            ImagePatch[i].backgroundColor=   [self colorWithHexString:@"ffffff"];
            ImagePatch2[i].backgroundColor=  [self colorWithHexString:@"d8d8d8"];
            
            Description[i].textColor= [self colorWithHexString:@"000000"];
            
            [pricebtn[i] setBackgroundImage:[UIImage imageNamed:@"rel_merch_lable.png"] forState:UIControlStateNormal];
            
            title[i].backgroundColor = [UIColor clearColor];
            
            title[i].textColor= [self colorWithHexString:@"00337c"];
        }
        
        else
        {
            
            ImagePatch[i].backgroundColor=   [self colorWithHexString:@"213b75"];
            ImagePatch2[i].backgroundColor=  [self colorWithHexString:@"560048"];
            
            Description[i].textColor= [self colorWithHexString:@"ffffff"];
            
            [pricebtn[i] setBackgroundImage:[UIImage imageNamed:@"merch_lable.png"] forState:UIControlStateNormal];
            
            title[i].backgroundColor =[self colorWithHexString:@"560048"];
            
            title[i].textColor= [UIColor whiteColor];

                       
        }

        
		
		m+=416;
		
		
		NSLog(@"value of i=%d",i);
		
	}
	
	VideoScroller.contentSize = CGSizeMake(320,(416*(TotalData)));
    
    //////paggin
    
    upDownArrow= [[UIImageView alloc] initWithFrame:CGRectMake(320-48, 416-32, 48,32)];
    upDownArrow.userInteractionEnabled=YES;
    upDownArrow.image = [UIImage imageNamed:@"bottom.png"];
    [self.view addSubview:upDownArrow];
    upDownArrow.alpha = 1.0;

//    int n =0;
//    
//    for (int i=0; i<TotalData; i++) {
//        
//        //        pagingbackground = [[UIImageView alloc]initWithFrame:CGRectMake(289, 170, 24, 99)];
//        //        pagingbackground.image = [UIImage imageNamed:@"iph5cnc_dot_bg.png"];
//        //        //pagingbackground.alpha = 0.7;
//        //        [self.view addSubview:pagingbackground];
//        
////        PAGINGEFFECT[i]  = [[UIImageView alloc] initWithFrame:CGRectMake(296, m+70, 12,13)];
//        PAGINGEFFECT[i]  = [[UIImageView alloc] initWithFrame:CGRectMake(308, m+5, 6,6)];
//
//        PAGINGEFFECT[i].userInteractionEnabled=YES;
//        PAGINGEFFECT[i].image= [UIImage imageNamed:@"iph5cnc_black_dot.png"];
//        //       // ImagePatch[i].backgroundColor= [UIColor blueColor];
//        [self.view addSubview:PAGINGEFFECT[i]];
//        //    [ImagePatch[i] release];
//        PAGINGEFFECT[i].tag= i;
//        
//        m+=8;
//    }
//    
//    PAGINGEFFECT[0].image= [UIImage imageNamed:@"iph5cnc_red_dot.png"];
//    
    
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(scrollTracker) userInfo:nil repeats:YES];
    
    
    
    
    
}
-(void)scrollTracker
{
//    //    CGFloat offSet= _Scroller1.contentOffset.y;
//    //
//    //   NSLog(@"Offset : %f", offSet);
//    
//    for (int i=0; i<TotalData; i++) {
//        if (VideoScroller.contentOffset.y == 416*i) {
//            for (int i=0; i<TotalData; i++) {
//                PAGINGEFFECT[i].image= [UIImage imageNamed:@"iph5cnc_black_dot.png"];
//                
//            }
//            PAGINGEFFECT[i].image= [UIImage imageNamed:@"iph5cnc_red_dot.png"];
//            
//        }
//        
//        
//    }
    
}
-(void)opencart:(id)sender
{
    GlobalClass *obj=[GlobalClass getInstance];
    if(obj.Mid_added.count>0)
    {
        
        AddToCart *pg = [[AddToCart alloc]initWithNibName:@"AddToCart" bundle:nil];
        //  pg.getamount= data3[gesture.view.tag];
        [self.navigationController pushViewController:pg animated:YES];
        
        
        
    }
    
    else
    {
        
        UIAlertView* logoutalertbox = [[ UIAlertView alloc]initWithTitle:@"Please Check" message:@"No Product Added to Cart, Please add the products to proceed" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil ];
        logoutalertbox.delegate=self;
        [logoutalertbox show];
        
        
    }
    

      
    
}

-(void)openPaymentGetway:(UIButton*)sender
{
//    UITapGestureRecognizer *gesture = (UITapGestureRecognizer *) sender;
//    NSLog(@"tag=%d",gesture.view.tag);
    
    GlobalClass *obj=[GlobalClass getInstance];
    if (![obj.Mid_added containsObject:data1[sender.tag]])
    {
        
        [obj.Mid_added addObject:data1[sender.tag]];
        NSLog(@"Mid_addedtag=%@",obj.Mid_added);
        
        AddToCart *pg = [[AddToCart alloc]initWithNibName:@"AddToCart" bundle:nil];
        //  pg.getamount= data3[gesture.view.tag];
        [self.navigationController pushViewController:pg animated:YES];
    }
    
    
    else
    {
        
        UIAlertView* logoutalertbox = [[ UIAlertView alloc]initWithTitle:@"Please Check" message:@"Product Already Added in Cart" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil ];
        logoutalertbox.delegate=self;
        [logoutalertbox show];
        
        
    }
    
    /*	int i=0;
     if ([obj.Mid_added count]>0) {
     
     for (i=0; i<[obj.Mid_added count]; i++ ) {
     
     NSLog(@"middata=%@",obj.Mid_added);
     NSLog(@"data1[gesture.view.tag]=%@",data1[gesture.view.tag]);
     
     
     if (data1[gesture.view.tag]== [obj.Mid_added objectAtIndex:i]) {
     
     UIAlertView* logoutalertbox = [[ UIAlertView alloc]initWithTitle:@"Please Check" message:@"Product Already Added in Cart" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil ];
     logoutalertbox.delegate=self;
     [logoutalertbox show];
     
     }
     
     else
     {
     [obj.Mid_added addObject:data1[gesture.view.tag]];
     NSLog(@"Mid_addedtag=%@",obj.Mid_added);
     
     AddToCart *pg = [[AddToCart alloc]initWithNibName:@"AddToCart" bundle:nil];
     //  pg.getamount= data3[gesture.view.tag];
     [self.navigationController pushViewController:pg animated:YES];
     
     break;
     
     }
     
     }
     
     }
     else
     {
     [obj.Mid_added addObject:data1[gesture.view.tag]];
     NSLog(@"Mid_addedtag=%@",obj.Mid_added);
     
     AddToCart *pg = [[AddToCart alloc]initWithNibName:@"AddToCart" bundle:nil];
     //  pg.getamount= data3[gesture.view.tag];
     [self.navigationController pushViewController:pg animated:YES];
     }
     
     
     
     */
    
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.trackedViewName=@"Merchandise Screen";

   
    
        GlobalClass *obj=[GlobalClass getInstance];
    if (!obj.Mid_added) {
        NSLog(@"testt");
        obj.Mid_added= [[NSMutableArray alloc] initWithCapacity:1000];
        obj.QtyOfProducts= [[NSMutableArray alloc] initWithCapacity:1000];

    }
    
    activityIndicator = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
	activityIndicator.center=CGPointMake(320/2, 460/2);
	// activityIndicator.transform = CGAffineTransformMakeScale(2.0, 2.0);
	[activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
	[self.view addSubview:activityIndicator];
	[activityIndicator startAnimating];
	
    if([obj.Leftcheck isEqualToString:@"1"])
    {
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"rel_i4home_bg.jpg"]];
 
    }
    else
    {

    NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"app_bg_image"];
    UIImage* app_bg_image = [UIImage imageWithData:imageData];
    self.view.backgroundColor = [UIColor colorWithPatternImage:app_bg_image];
    
	}
	
	[self performSelector:@selector(fetchAllData) withObject:nil afterDelay:0.0];
    
    GlobalClass *obj1=[GlobalClass getInstance];
    if([obj1.Leftcheck isEqualToString:@"1"])
    {
        relAppImage1 = [UIImage imageNamed:@"shoppingRel.png"];

    }
    
    else
    {

        relAppImage1 = [UIImage imageNamed:@"merchandise_cart_icon.jpg"];
    }
    UIButton *buttonChat1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonChat1 setImage:relAppImage1 forState:UIControlStateNormal];
    buttonChat1.frame = CGRectMake(0, 5, relAppImage1.size.width, relAppImage1.size.height);
     [buttonChat1 addTarget:self action:@selector(opencart:) forControlEvents:UIControlEventTouchUpInside];
   UIBarButtonItem *customBarItem11 = [[UIBarButtonItem alloc] initWithCustomView:buttonChat1];
   self.navigationItem.RightBarButtonItem = customBarItem11;

    
    
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
    
    
}
-(void)shareclicked:(UIButton*)sender
{
    sharetag =[sender tag];
    NSLog(@"sharetag=%d",sharetag);
    [self shareButton];
}
-(void)back {
    
    GlobalClass *obj=[GlobalClass getInstance];
    
    [obj.Mid_added removeAllObjects];
    [obj.QtyOfProducts removeAllObjects];
    obj.Mid_added =nil;
    obj.QtyOfProducts =nil;

    
    [self.navigationController popViewControllerAnimated:YES];
}


-(IBAction)toRelApp:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Under construction" message:@"Check Back Soon" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];

}

-(IBAction)righttap:(UIButton*)sender
{
    int i = [sender tag ];
    [Imageview[i] removeFromSuperview];
    Imageview[i] =nil;
    
    if (Imageview[i]    == nil)
    {
        Imageview[i] = [[AsyncImageView alloc] initWithFrame:CGRectMake(54, ImagePatch[i].frame.origin.y+35, 209.0f, 240.0f)];
        
        Imageview[i].contentMode = UIViewContentModeScaleAspectFit;
    }
    
    
    
    Imageview[i].contentMode = UIViewContentModeScaleAspectFit;
    Imageview[i].userInteractionEnabled=YES;
    //cancel any previously loading images for this view
    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:Imageview[i]];
    
    //set image URL. AsyncImageView class will then dynamically load the image
    NSURL *url1 = [NSURL URLWithString:data8[i]];
    
    ((AsyncImageView *)Imageview[i]).imageURL =url1;
    // _view1 = view;
    
    
    [VideoScroller addSubview:Imageview[i]];
    
    
    
    
}




-(IBAction)lefttap:(UIButton*)sender
{
    int i = [sender tag ];
    NSLog(@"tag==%d",1);
    [Imageview[i] removeFromSuperview];
    Imageview[i] =nil;
    
    if (Imageview[i]    == nil)
    {
        Imageview[i] = [[AsyncImageView alloc] initWithFrame:CGRectMake(54, ImagePatch[i].frame.origin.y+35, 209.0f, 240.0f)];
        
        Imageview[i].contentMode = UIViewContentModeScaleAspectFit;
    }
    
    
    
    Imageview[i].contentMode = UIViewContentModeScaleAspectFit;
    Imageview[i].userInteractionEnabled=YES;
    //cancel any previously loading images for this view
    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:Imageview[i]];
    
    //set image URL. AsyncImageView class will then dynamically load the image
    NSURL *url1 = [NSURL URLWithString:data7[i]];
    
    ((AsyncImageView *)Imageview[i]).imageURL =url1;
    // _view1 = view;
    
    
    [VideoScroller addSubview:Imageview[i]];
    
    
    
}

- (IBAction)shareButton {
    if(_fbTweetView.alpha == 0.0)
    {
        _fbTweetView.alpha = 1.0;
    }
    else if(_fbTweetView.alpha ==1.0)
    {
        _fbTweetView.alpha = 0.0;
    }
    
    [self.view addSubview:_fbTweetView];
}

- (IBAction)fbShare:(UIButton *)sender {
    
     sharetag =[sender tag];
    //	NSString *str=[NSString stringWithFormat:@"Downloaded this amazing wallpaper: %@ from official YJHD App. Get free copy of the App @<tiny url>",titleMusic.text];
    //	post = [[FBFeedPost alloc] initWithLinkPath:@"http://ow.ly/g4bRR" caption:str];
	
	
    _fbTweetView.alpha=0.0;

    
    NSString *ver = [[UIDevice currentDevice] systemVersion];
    float ver_float = [ver floatValue];
    if (ver_float < 6.0)
    {
        NSString		*STR= [NSString stringWithFormat:@"%@ - I am using App to read Besharam related exciting News",data1[0]];
//        
//        sharepost = [[FBFeedPost alloc] initWithLinkPath:data9[0] caption:STR];
//        [self sharefeedonfb1:sharepost];
        
    }
    else
    {
        
        
        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
            
            
            [self fbios6:data12[0]];
            
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

- (IBAction)tweetShare:(UIButton *)sender {
     sharetag =[sender tag];
    _fbTweetView.alpha=0.0;
    //  Create an instance of the Tweet Sheet
    NS_DEPRECATED(NA, NA, 5_0, 6_0) __attribute__((visibility("default")))

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
//	NSString	*str= [NSString stringWithFormat:@"\"%@\"- Read this news on Besharam App downloaded @http://tinyurl.com/off-yjhd",shareTWEET[0]];
    
	
	//NSString *strtweet= [NSString stringWithFormat:@"Reading exciting news on the official Yeh Jawaani Hai Deewani App. Get free copy of the App @http://tinyurl.com/off-yjhd"];
	
	//  Set the initial body of the Tweet
    GlobalClass *obj=[GlobalClass getInstance];

        //   [tweetSheet setInitialText:[obj.mug objectForKey:@"twitter_share"]];
        [tweetSheet setInitialText:data14[sharetag]];
        
        
 

    
    
	
	//  Adds an image to the Tweet
	//  For demo purposes, assume we have an image named 'larry.png'
	//  that we wish to attach
//	if (![tweetSheet addImage:[UIImage imageNamed:data9[0]]]) {
//		NSLog(@"Unable to add the image!");
//	}
	
	//  Add an URL to the Tweet.  You can add multiple URLs.
	if (![tweetSheet addURL:[NSURL URLWithString:data12[sharetag]]]){
		NSLog(@"Unable to add the URL!");
	}
	
	//  Presents the Tweet Sheet to the user
	[self presentViewController:tweetSheet animated:NO completion:^{
		NSLog(@"Tweet sheet has been presented.");
	}];
    
}


-(void)fbios6:(NSString*)stringis
{
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
        
        
     //   NSString		*STR= [NSString stringWithFormat:@"%@ - I am using App to read Besharam related exciting News",data1[0]];
        
     //   [fbController addImage:[UIImage imageNamed:@"114x114.png"]];
        GlobalClass *obj=[GlobalClass getInstance];
        [fbController setInitialText:data13[sharetag]];
        
        [fbController addURL:[NSURL URLWithString:data12[sharetag]]];
        [fbController setCompletionHandler:completionHandler];
        [self presentViewController:fbController animated:YES completion:nil];
    }
    
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView

{
    upDownArrow.alpha = 0.0;

}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView

{
    upDownArrow.alpha = 1.0;

    currentScrollPosition= VideoScroller.contentOffset.y;
    NSLog(@"currentScrollPosition ***********************   = %f",VideoScroller.contentOffset.y);

    if(VideoScroller.contentOffset.y <= 416)
    {
        upDownArrow.image = [UIImage imageNamed:@"bottom.png"];
    }

  if ( VideoScroller.contentOffset.y+416 >= VideoScroller.contentSize.height)
    {
        upDownArrow.image = [UIImage imageNamed:@"top.png"];
    }

    
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate; // called on finger up if user dragged. decelerate is true if it will continue moving afterwards
{
    _fbTweetView.alpha=0.0;
    upDownArrow.alpha = 1.0;

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    _fbTweetView.alpha=0.0;
}
//-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    NSLog(@"touchesMoved");
//    if(start < 0)
//    {
//        return;
//    }
//    UITouch *touch = (UITouch *)[touches anyObject];
//    CGFloat now = [touch locationInView:self.view].y;
//    CGFloat diff = now - start;
//    directionUp = diff > 0;//directionUp is a BOOL member of this view
//    //    float nuCenterY = footerMainView.center.y + diff;
//    //    footerMainView.center = CGPointMake(footerMainView.center.x, nuCenterY);
//    start = now;
//}
//
//
//-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    
//    if (directionUp)
//    {
//        NSLog(@"touchesEnded    ----    directionUp");
//        //animate pulldownView out of visibel area
//        [UIView animateWithDuration:.3 animations:^{_footerMainView.center = CGPointMake(320/2, 435);}];
//    }
//    else if(start>=0)
//    {
//        NSLog(@"touchesEnded    ----    start");
//        //animate pulldownView with top to mainviews top
//        [UIView animateWithDuration:.3 animations:^{_footerMainView.center = CGPointMake(320/2, 380);}];
//    }
//}
//-(void)viewDidDisappear:(BOOL)animated
//{
//    [super viewDidDisappear:YES];
//    _footerMainView.frame = CGRectMake(0, 398, _footerMainView.frame.size.width, _footerMainView.frame.size.height);
//}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
