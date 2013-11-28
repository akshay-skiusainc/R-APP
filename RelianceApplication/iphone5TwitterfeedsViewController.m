//
//  TwitterfeedsViewController.m
//  YJHD
//
//  Created by SKI USA 35 on 4/4/13.
//  Copyright (c) 2013 SKI USA 35. All rights reserved.
//

#import "iphone5TwitterfeedsViewController.h"
#import "Merchandise.h"
#import "iphone5Settings.h"
#import "iphone5GroupViewController.h"

@interface iphone5TwitterfeedsViewController ()

@end

@implementation iphone5TwitterfeedsViewController
@synthesize footerView;
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
	
	
//	if ([self.navigationController.navigationBar respondsToSelector:@selector( setBackgroundImage:forBarMetrics:)]){
//		[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"header_bar.png"] forBarMetrics:UIBarMetricsDefault];
		
	//}
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.trackedViewName=@"Twitter Feeds Screen";

    
    [self getsharetext];
    NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"app_bg_image"];
    UIImage* app_bg_image = [UIImage imageWithData:imageData];
    self.view.backgroundColor = [UIColor colorWithPatternImage:app_bg_image];
    
    footerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"footer_bg.png"]];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"home_header_bg.jpg"] forBarMetrics:UIBarMetricsDefault];
//	obj1.coming=@"2";
	activityIndicator = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
	activityIndicator.center=CGPointMake(320/2, 524/2);
	//  activityIndicator.transform = CGAffineTransformMakeScale(2.0, 2.0);
	[activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
	[self.view addSubview:activityIndicator];
	[activityIndicator startAnimating];
	
	
	
	
	[self performSelector:@selector(Fetchtwt) withObject:nil afterDelay:0.0];
	// Do any additional setup after loading the view from its nib.
	
//	infoButton = [UIButton buttonWithType:UIButtonTypeCustom];
//	infoButton.frame= CGRectMake(0,0,42,35);
	
//	[infoButton setBackgroundImage:[UIImage imageNamed:@"refresh_icon.png"] forState:UIControlStateNormal];
//	[infoButton addTarget:self action:@selector(refreshnews) forControlEvents:UIControlEventTouchUpInside];
//	[self.view addSubview:infoButton];
//	UIBarButtonItem* RefreshButton = [[UIBarButtonItem alloc] initWithCustomView:infoButton];
	//self.navigationItem.rightBarButtonItem = RefreshButton;
	
    
    infoButton.alpha=0.0;

    GlobalClass *obj = [GlobalClass getInstance];
    if ([obj.rateit isEqualToString:@"1"]) {
        
    }
    
    else{
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:self.messageTitle
//                                                        message:self.message
//                                                       delegate:(id <UIAlertViewDelegate>)self
//                                              cancelButtonTitle:[self.cancelButtonLabel length] ? self.cancelButtonLabel: nil
//                                              otherButtonTitles:self.rateButtonLabel, nil];
//        alert.tag = 1;
//        if ([self.remindButtonLabel length])
//        {
//            [alert addButtonWithTitle:self.remindButtonLabel];
//        }
//        
//        [alert show];
        
    }
    
    
//    UIImage *relAppImage = [UIImage imageNamed:@"home_right_rel_icon.png"];
//    UIButton *buttonChat = [UIButton buttonWithType:UIButtonTypeCustom];
//    [buttonChat setImage:relAppImage forState:UIControlStateNormal];
//    buttonChat.frame = CGRectMake(0, 0, relAppImage.size.width, relAppImage.size.height);
//    [buttonChat addTarget:self action:@selector(toRelApp:) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *customBarItem1 = [[UIBarButtonItem alloc] initWithCustomView:buttonChat];
//    self.navigationItem.RightBarButtonItem = customBarItem1;
    
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
- (IBAction)openFooter:(id)sender
{
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



- (NSString *)messageTitle
{
    return @"Rate YJHD";
}

- (NSString *)message
{
    
    return @"If you enjoy playing YJHD, would you mind taking a moment to rate it? It won’t take more than a minute. Thanks for your support!";
}

- (NSString *)cancelButtonLabel
{
    
    return @"No, Thanks";
}

- (NSString *)rateButtonLabel
{
    
    return @"Rate It Now";
}

- (NSString *)remindButtonLabel
{
    
    return @"Remind Me Later";
}
- (void)resizeAlertView:(UIAlertView *)alertView
{
    if (!self.disableAlertViewResizing)
    {
        NSInteger imageCount = 0;
        CGFloat offset = 0.0f;
        CGFloat messageOffset = 0.0f;
        for (UIView *view in alertView.subviews)
        {
            CGRect frame = view.frame;
            if ([view isKindOfClass:[UILabel class]])
            {
                UILabel *label = (UILabel *)view;
                if ([label.text isEqualToString:alertView.title])
                {
                    [label sizeToFit];
                    offset = label.frame.size.height - fmax(0.0f, 45.f - label.frame.size.height);
                    if (label.frame.size.height > frame.size.height)
                    {
                        offset = messageOffset = label.frame.size.height - frame.size.height;
                        frame.size.height = label.frame.size.height;
                    }
                }
                else if ([label.text isEqualToString:alertView.message])
                {
                    label.lineBreakMode = NSLineBreakByWordWrapping;
                    label.numberOfLines = 0;
                    label.alpha = 1.0f;
                    [label sizeToFit];
                    offset += label.frame.size.height - frame.size.height;
                    frame.origin.y += messageOffset;
                    frame.size.height = label.frame.size.height;
                }
            }
            else if ([view isKindOfClass:[UITextView class]])
            {
                view.alpha = 0.0f;
            }
            else if ([view isKindOfClass:[UIImageView class]])
            {
                if (imageCount++ > 0)
                {
                    view.alpha = 0.0f;
                }
            }
            else if ([view isKindOfClass:[UIControl class]])
            {
                frame.origin.y += offset;
            }
            view.frame = frame;
        }
        CGRect frame = alertView.frame;
        frame.origin.y -= roundf(offset/2.0f);
        frame.size.height += offset;
        alertView.frame = frame;
    }
}


- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if(alertView.tag == 1)
    {
    GlobalClass *obj=[GlobalClass getInstance];
    
    if (buttonIndex == alertView.cancelButtonIndex)
    {
        //ignore this version
        obj.rateit=@"1";
        
    }
    else if (([self.cancelButtonLabel length] && buttonIndex == 2) ||
             ([self.cancelButtonLabel length] == 0 && buttonIndex == 1))
    {
        
        obj.rateit=@"1";
        
    }
    else
    {
        
        NSString *str = [NSString stringWithFormat:@"http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=633116022&onlyLatestVersion=true&pageNumber=0&sortOrdering=1&type=Purple+Software"];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
        
        obj.rateit=@"1";
        
        
    }
    }
    else
    {
        
    }
    
}




-(void)openFeedWebPage:(id)sender
{
	
	
//	
//	iphone5OpenFeedsViewController *dvController = [[iphone5OpenFeedsViewController alloc] initWithNibName:@"iphone5OpenFeedsViewController" bundle:[NSBundle mainBundle]];
//	
//	dvController.Selected = @"Twitter Feeds";
//	
//	
//	[self.navigationController pushViewController:dvController animated:YES];
//	
//	dvController = nil;
//	
}

-(void)refreshnews
{
	infoButton.alpha=0.0;
	for (int i =0; i<TotalNumOfRows; i++) {
		{
			if (ImagePatch[i]!=nil) {
				[ImagePatch[i] removeFromSuperview];
				ImagePatch[i]=nil;
			}}
		
		
		
	}
	if (VideoScroller!=nil) {
		[VideoScroller removeFromSuperview];
		VideoScroller=nil;
	}
	
	
	//	if (ImageBck!=nil) {
	//		[ImageBck removeFromSuperview];
	//		ImageBck=nil;
	//	}
	
	
	
	
	
		activityIndicator = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
		activityIndicator.center=CGPointMake(320/2, 548/2);
		activityIndicator.transform = CGAffineTransformMakeScale(2.0, 2.0);
		[activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
		[self.view addSubview:activityIndicator];
	[activityIndicator startAnimating];
	
	[self performSelector:@selector(Fetchtwt) withObject:nil afterDelay:0.0];
	
	//[self DesignHeader];
	//[self DisplayFeeds];
	//[self performSelector:@selector(loadShares) withObject:nil afterDelay:0.0];
	
}

-(void)DisplayFeeds
{
	
    infoButton.alpha=1.0;

	
	
	VideoScroller = [[UIScrollView alloc] initWithFrame:CGRectMake(0,50,320,454)];
	VideoScroller.userInteractionEnabled	=YES;
	VideoScroller.showsVerticalScrollIndicator = YES;
	VideoScroller.pagingEnabled = NO;
    VideoScroller.scrollEnabled = YES;
    VideoScroller.delegate = self;

	[self.view addSubview:VideoScroller];
	
	int m=0;
	for (int i =0; i<TotalNumOfRows; i++) {
		
		tweet[i] = [[UIImageView alloc]initWithFrame:CGRectMake(7, m+10, 59, 50)];
        tweet[i].image = [UIImage imageNamed:@"tw_ic.png"];
        [VideoScroller addSubview:tweet[i]];
        
        
        
		NSLog(@"sharetext%@[%d]",shareText[i],i);
		ImagePatch[i] = [[UIImageView alloc] initWithFrame:CGRectMake(60, m+10, 256,199)];
		ImagePatch[i].userInteractionEnabled=YES;
		ImagePatch[i].image = [UIImage imageNamed:@"bg_boxtweet.png"];
		// ImagePatch[i].backgroundColor= [UIColor blueColor];
		[VideoScroller addSubview:ImagePatch[i]];
		ImagePatch[i].tag= i;
		
		UITapGestureRecognizer *tapped123 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openFeedWebPage:)];
		tapped123.numberOfTapsRequired = 1;
		[ImagePatch[i] addGestureRecognizer:tapped123];
        
        socializeBg[i] = [[UIView alloc]initWithFrame:CGRectMake(79, m+203-44, 231, 44)];
        socializeBg[i].backgroundColor = [UIColor clearColor];
        socializeBg[i].layer.cornerRadius = 5.0;
        socializeBg[i].clipsToBounds = YES;
        [VideoScroller addSubview:socializeBg[i]];
    
        // Action Bar Implimentation
        if (actionBar[i] == nil)
        {
            NSString *entity_Key= [NSString stringWithFormat:@"%@",shareText[i]];
            NSString *entity_name= [NSString stringWithFormat:@"%@",shareText[i]];
            self.entity = [SZEntity entityWithKey:entity_Key name:entity_name];
            actionBar[i] = [SZActionBar defaultActionBarWithFrame:CGRectZero entity:self.entity viewController:self];
            actionBar[i].itemsLeft = [NSArray arrayWithObjects:[SZActionButton viewsButton], [actionBar[i].itemsRight objectAtIndex:0], [actionBar[i].itemsRight objectAtIndex:1], nil];
            // actionBar[i].itemsLeft = [NSArray arrayWithObjects:nil];
            actionBar[i].tag=i;
            
            faceBookBtn = [[UIButton alloc] initWithFrame:CGRectZero];
            [faceBookBtn setImage:[UIImage imageNamed:@"share-btn.png"] forState:UIControlStateNormal];
            [faceBookBtn sizeToFit];
            [faceBookBtn addTarget:self action:@selector(showShareOptions:) forControlEvents:UIControlEventTouchUpInside];
            faceBookBtn.tag=i;
            
            
//            twitterBtn = [[UIButton alloc] initWithFrame:CGRectZero];
//            [twitterBtn setImage:[UIImage imageNamed:@"socialize-selectnetwork-twitter-icon.png"] forState:UIControlStateNormal];
//            [twitterBtn sizeToFit];
//            [twitterBtn addTarget:self action:@selector(twitter:) forControlEvents:UIControlEventTouchUpInside];
//            faceBookBtn.tag=i;
//            
//            
//            emailBtn = [[UIButton alloc] initWithFrame:CGRectZero];
//            [emailBtn setImage:[UIImage imageNamed:@"socialize-selectnetwork-email-icon.png"] forState:UIControlStateNormal];
//            [emailBtn sizeToFit];
//            [emailBtn addTarget:self action:@selector(mailCompose:) forControlEvents:UIControlEventTouchUpInside];
//            faceBookBtn.tag=i;
            
            actionBar[i].betweenButtonsPadding=2.0;
            actionBar[i].itemsRight = [NSArray arrayWithObjects:faceBookBtn, twitterBtn,emailBtn, nil];
            
           // actionBar[i].backgroundImageView.alpha = 0.0f;
            [socializeBg[i] addSubview:actionBar[i]];
        }

        
        
        
				
		Th_name_Lbl[i]		=	[[UILabel alloc] initWithFrame:CGRectMake(25, 0,220,140)];
		Th_name_Lbl[i].text           =  shareText[i];
		Th_name_Lbl[i].font = [UIFont fontWithName:@"Helvetica Neue, Bold" size: 9.0 ];
		Th_name_Lbl[i].backgroundColor	=	[UIColor clearColor];
		Th_name_Lbl[i].textColor        = [UIColor blackColor];
		Th_name_Lbl[i].lineBreakMode = UILineBreakModeWordWrap;
		Th_name_Lbl[i].numberOfLines = 8;
		
		[ImagePatch[i] addSubview: Th_name_Lbl[i]];
		
//		reply[i] = [UIButton buttonWithType:UIButtonTypeCustom];
//        reply[i].frame = CGRectMake(15, 155, 83, 32);
//        [reply[i] setBackgroundImage:[UIImage imageNamed:@"reply.png"] forState:UIControlStateNormal];
//        reply[i].userInteractionEnabled=YES;
//        reply[i].tag=i;
//       // [reply[i] addTarget:self action:@selector(ranbirCharacterButton:) forControlEvents:UIControlEventAllEvents];
//        [ImagePatch[i] addSubview:reply[i]];
        
        dividerImage[i] = [[UIImageView alloc]initWithFrame:CGRectMake(105, 148, 1, 45)];
        dividerImage[i].image = [UIImage imageNamed:@"divdertweet.png"];
        [ImagePatch[i] addSubview:dividerImage[i]];

         tweetView[i] = [[UIView alloc]initWithFrame:CGRectMake(185, m+204, 125, 40)];
        tweetView[i].backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];
        tweetView[i].tag=i;
        tweetView[i].alpha=0.0;
        [VideoScroller addSubview:tweetView[i]];
        
		for (int j=0; j<3; j++) {
			
			
			Publish[j] = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
			Publish[j].userInteractionEnabled=YES;
			Publish[1].image = [UIImage imageNamed:@"ic.png"];
			Publish[0].image = [UIImage imageNamed:@"fb_ic12.png"];
			Publish[2].image = [UIImage imageNamed:@"emailtweet.png"];
			[tweetView[i] addSubview:Publish[j]];
		//	u+=35;
		}
		Publish[0].frame = CGRectMake(0, 0, 40, 40);
		Publish[1].frame = CGRectMake(45, 0, 40, 40);

		Publish[2].frame = CGRectMake(85, 0, 40 , 40);

		
		Publish[0].tag= i;
		UITapGestureRecognizer *fb = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fbshare:)];
		fb.numberOfTapsRequired = 1;
		[Publish[0] addGestureRecognizer:fb];
		
		
		
		Publish[1].tag=i;
		UITapGestureRecognizer *tweet1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(twitter:)];
		tweet1.numberOfTapsRequired = 1;
		[Publish[1] addGestureRecognizer:tweet1];
		
		
		
		Publish[2].tag=i;
		UITapGestureRecognizer *mailto = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(mailCompose:)];
		mailto.numberOfTapsRequired = 1;
		[Publish[2] addGestureRecognizer:mailto];
		
		
		if (i%2) {
            ImagePatch[i].frame = CGRectMake(7, m+10, 256, 199);
			ImagePatch[i].image= [UIImage imageNamed:@"bg_box2tweet.png"];
            socializeBg[i].frame = CGRectMake(12,m+204-44, 231, 44);
            tweet[i].frame = CGRectMake(253, m+10, 59, 50);
			tweetView[i].frame =CGRectMake(117, m+204, 125, 40);
            Th_name_Lbl[i].frame = CGRectMake(15, 5, 220, 140);
            
            reply[i].frame = CGRectMake(5, 155, 83, 32);
            
            dividerImage[i].frame = CGRectMake(89, 148, 1, 45);

			Publish[0].frame = CGRectMake(0, 0, 40, 40);
			Publish[1].frame = CGRectMake(45, 0, 40, 40);
			
			Publish[2].frame = CGRectMake(85, 0, 40, 40);

		}
		m+=254;
	}
	
	VideoScroller.contentSize = CGSizeMake(320,(254*TotalNumOfRows+20));
	
	[activityIndicator stopAnimating];
	
	[self.view addSubview:_footerMainView];
	
	
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    for (int j=0; j<TotalNumOfRows; j++)
    {
        tweetView[j].alpha = 0.0;
    }

}

-(void)showShareOptions:(UIButton *)sender
{
    
    if (tweetView[[sender tag]].alpha==0.0) {
        tweetView[[sender tag]].alpha=1.0;
    }
    else
    {
        tweetView[[sender tag]].alpha=0.0;
    }
}

-(void)back {
	
	[self.navigationController popViewControllerAnimated:YES];
	
	// Do any additional setup after loading the view from its nib.
}


-(void)getsharetext
{
    
    GlobalClass *obj=[GlobalClass getInstance];
    NSLog(@"images=%@",obj.twitter);
    
    
    //        for (NSDictionary *actoAgent in obj.wallpapers)
    //        {
    
    fbsharetext = [obj.twitter objectForKey:@"fb_share"];
    NSLog(@"fb_share=%@",fbsharetext);
    
    twtsharetext = [obj.twitter objectForKey:@"twitter_share"];
    NSLog(@"twitter_share=%@",twtsharetext);
    
    
    mailsharesub = [obj.twitter objectForKey:@"email_subject"];
    NSLog(@"email_subject=%@",mailsharesub);
    
    
    mailsharetext = [obj.twitter objectForKey:@"email_share"];
    NSLog(@"email_share=%@",mailsharetext);
    
    //            break;
    //
    //        }
}



-(void)Fetchtwt
{
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{

    GlobalClass *obj=[GlobalClass getInstance];
    
	NSString* urlString = [NSString stringWithFormat:@"http://apps.medialabs24x7.com/besharam/get_twitter_tweets.php?deviceno=%@",obj.dev];
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:urlString] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
	
	//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
	//    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:urlString]]];
	[request setHTTPMethod:@"GET"];
	[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Current-Type"];
	// NSError *errorReturned = nil;
	// NSURLResponse *theResponse =[[NSURLResponse alloc]init];
	// NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&theResponse error:&errorReturned];
	
	NSURLResponse *response;
	NSData *urlData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
	NSString *stringResponse = [[NSString alloc] initWithData:urlData encoding:NSASCIIStringEncoding];
	NSLog(@"%@",stringResponse);
	//[activityIndicator stopAnimating];
	
	NSArray *responseDict = [stringResponse JSONValue];
	
	
	int i = 0;
	for (NSString *FetchTweets in responseDict){
		
		
		tweets[i]= [NSString stringWithFormat:@"%@",FetchTweets];
		
		NSLog(@"FbFeeds[i]=%@",tweets[i]);
		shareText[i] = [NSString stringWithFormat:@"%@",tweets[i]];
		
		i++;
	}
	divider=i;
	NSLog(@"divider=%d",divider);
	
	TotalNumOfRows=i;
	
        dispatch_async(dispatch_get_main_queue()	, ^{
            [self DisplayFeeds];
        });
        
    });

}


-(void)WRITECOMMENT:(id)sender{
	
	UITapGestureRecognizer *gesture = (UITapGestureRecognizer *) sender;
	NSLog(@"tag121=%@",shareText[gesture.view.tag]);
	
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
	
	NSString *str= [NSString stringWithFormat:@""];
	//  Set the initial body of the Tweet
	[tweetSheet setInitialText:str];
	
	//  Adds an image to the Tweet
	//  For demo purposes, assume we have an image named 'larry.png'
	//  that we wish to attach
    //	if (![tweetSheet addImage:[UIImage imageNamed:@"114x114.png"]]) {
    //		NSLog(@"Unable to add the image!");
    //	}
	
	//  Add an URL to the Tweet.  You can add multiple URLs.
    //	if (![tweetSheet addURL:[NSURL URLWithString:@"http://twitter.com/"]]){
    //		NSLog(@"Unable to add the URL!");
    //	}
	
	//  Presents the Tweet Sheet to the user
	[self presentViewController:tweetSheet animated:NO completion:^{
		NSLog(@"Tweet sheet has been presented.");
	}];
}

-(IBAction)fbshare:(UITapGestureRecognizer *)sender
{
	UITapGestureRecognizer *gesture = (UITapGestureRecognizer *) sender;
	NSLog(@"tag121=%@",shareText[gesture.view.tag]);
    
    NSString *ver = [[UIDevice currentDevice] systemVersion];
    float ver_float = [ver floatValue];
    if (ver_float < 6.0)
    {
        
        NSString	*str=[NSString stringWithFormat:@"%@  “News Headline'' - Using App to read Besharam related exciting News @http://tinyurl.com/off-yjhd",shareText[gesture.view.tag]];
        
        //        sharepost = [[FBFeedPost alloc] initWithPostMessage:str];
        //        [self sharefeedonfb1:sharepost];
        
    }
    else{
        
        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
            
            
            [self fbios6:shareText[gesture.view.tag]];
            
            
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


-(void)twitter:(UITapGestureRecognizer *)sender{
	
	UITapGestureRecognizer *gesture = (UITapGestureRecognizer *) sender;
	NSLog(@"tag121=%@",shareText[gesture.view.tag]);
	
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
	[tweetSheet setInitialText:shareText[gesture.view.tag]];
	
	//  Adds an image to the Tweet
	//  For demo purposes, assume we have an image named 'larry.png'
	//  that we wish to attach
    //	if (![tweetSheet addImage:[UIImage imageNamed:@"114x114.png"]]) {
    //		NSLog(@"Unable to add the image!");
    //	}
    //
    //	//  Add an URL to the Tweet.  You can add multiple URLs.
    //	if (![tweetSheet addURL:[NSURL URLWithString:@"http://twitter.com/"]]){
    //		NSLog(@"Unable to add the URL!");
    //	}
	
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
        
        
        // NSString	*str = [NSString stringWithFormat:@"%@  -For more tweets download official App @ http://tinyurl.com/off-yjhd",shareText[gesture.view.tag]];
        //  [fbController addImage:[UIImage imageNamed:@"114x114.png"]];
        [fbController setInitialText:stringis];
        // [fbController addURL:[NSURL URLWithString:stringis]];
        [fbController setCompletionHandler:completionHandler];
        [self presentViewController:fbController animated:YES completion:nil];
    }
    
}


-(void)mailCompose:(UITapGestureRecognizer *)sender
{
	
	UITapGestureRecognizer *gesture = (UITapGestureRecognizer *) sender;
	NSLog(@"tag=%d",gesture.view.tag);
	
	
	
	
	Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
	if (mailClass != nil)
	{
		// We must always check whether the current device is configured for sending emails
		
		if ([mailClass canSendMail])
		{
			[self displayComposerSheet:shareText[gesture.view.tag]];
		}
		
		else
		{
			[self launchMailAppOnDevice:shareText[gesture.view.tag]];
		}
	}
	
	else
	{
		[self launchMailAppOnDevice:shareText[gesture.view.tag]];
	}
	
}


#pragma mark Compose Mail

// Displays an email composition interface inside the application. Populates all the Mail fields.
-(void)displayComposerSheet:(NSString*)String
{
	MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
	picker.mailComposeDelegate = self;
	
	[picker setSubject:mailsharesub];
	
 	// Set up recipients
	NSArray *toRecipients = [NSArray arrayWithObject:@""];
	NSArray *ccRecipients = [NSArray arrayWithObjects:@"", nil];
	//NSArray *bccRecipients = [NSArray arrayWithObject:@"fourth@example.com"];
	
	[picker setToRecipients:toRecipients];
	[picker setCcRecipients:ccRecipients];
	//	[picker setBccRecipients:bccRecipients];
	
	
	NSString	*str = [NSString stringWithFormat:@"%@ \n \n %@",String,mailsharetext];
    NSLog(@"asdad=%@",str);
	// Fill out the email body text
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
	NSString *recipients = @"mailto:?cc=&subject=Tweet shared from Yeh Jawaani Hai Deewani Official App";
	//NSString *body = @"&body=All Dabangg 2 Movie details are Available on Dabangg2 App!";
	
	NSString *email = [NSString stringWithFormat:@"%@%@", string];
	email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
