//
//  PlayVideo.m
//  YJHD
//
//  Created by SKI USA 35 on 3/21/13.
//  Copyright (c) 2013 SKI USA 35. All rights reserved.
//

#import "iphone5PlayVideo.h"
#define DEGREES_TO_RADIANS(x) (M_PI * x / 180.0)

@interface iphone5PlayVideo ()

@end

@implementation iphone5PlayVideo
@synthesize idis,VideoPlay,doneButton,shareView,shareButtonView,finishButtonView,songTitle,lyrics,time,singer,VCTag,infoButtonView,infoImageView,shareImageView;
@synthesize musicDirector,musicLabel,songTitleLbl,lyricsLbl,timeLbl,singerLbl,musicLabelLbl,musicDirectorLbl,alertView,alertImgView,premiumType;
@synthesize faceBookBtn,twitterBtn,emailBtn,entity_Key,entity_name;

// viewWillAppear is called when we touch the back button on the navigation bar

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



-(id)initWithVCTag:(NSString *)_VCTag
{
    if(self){
        VCTag = _VCTag;
    }
    return  self;
}


- (void)viewDidLoad
{
	[self.navigationController setNavigationBarHidden:YES animated:NO];
    self.view.backgroundColor = [UIColor clearColor];
     //[[UIApplication sharedApplication] setStatusBarHidden:YES];
//    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
//    [UIView animateWithDuration:0.25 animations:^{
//        CGRect frame = self.VideoPlay.frame;
//        frame.origin.y -= 20;
//        frame.size.height += 20;
//        self.VideoPlay.frame = frame;
//    }];
   // [[UIApplication sharedApplication] setStatusBarOrientation: UIInterfaceOrientationPortrait];
    [super viewDidLoad];
    
    GlobalClass *obj = [GlobalClass getInstance];
    if([obj.Leftcheck isEqualToString:@"1"])
    {
        _Play_video_nav.image= [UIImage imageNamed:@"PLAY_VIDEO_NAV.jpg"];
        infoButtonView.hidden=YES;
        
    }
    else
    {
        infoButtonView.hidden=NO;
        
        _Play_video_nav.image= [UIImage imageNamed:@"video_header_bg.jpg"];
    }

    self.trackedViewName=@"Video Screen";

	 [self getsharetext];

    if([premiumType isEqualToString:@"1"])
    {
        shareButtonView.alpha = 0.0;
    }
	
    shareView.alpha = 0.0;
    [self.alertView setBackgroundColor: [self colorWithHexString:@"c8154f"]];
    [alertImgView.layer setBorderColor:[UIColor darkGrayColor].CGColor];
    [alertImgView.layer setBorderWidth:4];
    //    [alertImgView.layer setCornerRadius:10];
    alertView.alpha = 0.0;
    alertImgView.alpha=0.0;
    
//	link = [NSString stringWithFormat:@"<html><head>\
//			 <body style=\"margin:0\">\
//			 <embed id=\"yt\" src=\"%@\" type=\"application/x-shockwave-flash\" \
//			 width=\"568\" height=\"278\"></embed>\
//			 </body></html>",idis ];
//	
//	VideoPlay.delegate=self;
//
////	VideoPlay.autoresizingMask =   UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
//	
//
//	
//	[VideoPlay loadHTMLString: [NSString stringWithFormat:link] baseURL:nil];
    
//    NSString*   str = [idis stringByReplacingOccurrencesOfString:@"http://www.youtube.com/v/" withString:@""];
//
//    
//    VideoPlay.delegate=self;
//    VideoPlay.allowsInlineMediaPlayback=YES;
//    NSString    *kkey =[NSString stringWithFormat:@"http://www.youtube.com/embed/%@?playsinline=1",str];
//    
//    
//    //Create a URL object.
//    NSURL *url = [NSURL URLWithString:kkey];
//    //URL Requst Object
//    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
//    //Load the request in the UIWebView.
//    [VideoPlay loadRequest:requestObj];

    
	CGAffineTransform rotate =CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(90));
	[self.view setTransform:rotate];
	//self.view = VideoPlay;
    
//    if ([self.navigationController.navigationBar respondsToSelector:@selector( setBackgroundImage:forBarMetrics:)]){
//      [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bar_clean.png"] forBarMetrics:UIBarMetricsDefault];
//       }
//    
//   UIImage *buttonImage = [UIImage imageNamed:@"c&c_top_back_btn.png"];
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    [button setImage:buttonImage forState:UIControlStateNormal];
//    button.frame = CGRectMake(0, 0, buttonImage.size.width, buttonImage.size.height);
//    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] initWithCustomView:button];
//    self.navigationItem.leftBarButtonItem = customBarItem;
	
    shareText =[NSString    stringWithFormat:idis];
    if (actionBar == nil) {
      
        self.entity = [SZEntity entityWithKey:entity_Key name:entity_name];
        actionBar = [SZActionBar defaultActionBarWithFrame:CGRectZero entity:self.entity viewController:self];
        actionBar.itemsLeft = [NSArray arrayWithObjects:[SZActionButton viewsButton], [actionBar.itemsRight objectAtIndex:0], [actionBar.itemsRight objectAtIndex:1], nil];
        // actionBar[i].itemsLeft = [NSArray arrayWithObjects:nil];
        //actionBar[a].tag=a;
        
        faceBookBtn = [[UIButton alloc] initWithFrame:CGRectZero];
        [faceBookBtn setImage:[UIImage imageNamed:@"socialize-selectnetwork-facebook-icon.png"] forState:UIControlStateNormal];
        [faceBookBtn sizeToFit];
        [faceBookBtn addTarget:self action:@selector(fbShare:) forControlEvents:UIControlEventTouchUpInside];
        // faceBookBtn.tag=a;
        
        
        twitterBtn = [[UIButton alloc] initWithFrame:CGRectZero];
        [twitterBtn setImage:[UIImage imageNamed:@"socialize-selectnetwork-twitter-icon.png"] forState:UIControlStateNormal];
        [twitterBtn sizeToFit];
        [twitterBtn addTarget:self action:@selector(tweetShare:) forControlEvents:UIControlEventTouchUpInside];
        //faceBookBtn.tag=a;
        
        
        emailBtn = [[UIButton alloc] initWithFrame:CGRectZero];
        [emailBtn setImage:[UIImage imageNamed:@"socialize-selectnetwork-email-icon.png"] forState:UIControlStateNormal];
        [emailBtn sizeToFit];
        [emailBtn addTarget:self action:@selector(mailCompose:) forControlEvents:UIControlEventTouchUpInside];
        //faceBookBtn.tag=a;
        
        actionBar.betweenButtonsPadding=5.0;
        actionBar.itemsRight = [NSArray arrayWithObjects:faceBookBtn, twitterBtn,emailBtn, nil];
        
        [_socializebg addSubview:actionBar];
    }
    
 //   _socializebg.alpha = 0.0;

    
    if([VCTag isEqual: @"FromBehindScene"])
    {
        infoButtonView.alpha = 0.0;
        infoImageView.alpha = 0.0;
    }
	
	ActIndImage = [[UIImageView alloc] initWithFrame:CGRectMake(0,42,568,298)];
	//  ActIndImage.center = CGPointMake(320/2, 460/2);
	ActIndImage.image = [UIImage imageNamed:@"my_account_bg.jpg"];
	ActIndImage.opaque=0.5;
	[self.view addSubview:ActIndImage];
	
	activityIndicator = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
	activityIndicator.center=CGPointMake(568/2, 298/2);
	activityIndicator.transform = CGAffineTransformMakeScale(1.0, 1.0);
	[activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
	[ActIndImage addSubview:activityIndicator];
	
	
	[activityIndicator startAnimating];
	
	
	[self performSelector:@selector(unloadAct) withObject:nil afterDelay:2.0];
	


    // Do any additional setup after loading the view from its nib.
}


- (IBAction)infoButton:(id)sender {
    
    
  // _socializebg.alpha = 0.0;
    
    shareImageView.alpha = 1.0;
    shareView.alpha = 0.0;
    NSLog(@"link=%@",idis);
    NSLog(@"title : %@",songTitle);
    NSLog(@"time : %@",time);
    NSLog(@"singer : %@",singer);
    NSLog(@"lyrics : %@",lyrics);
    NSLog(@"musicDirector : %@",musicDirector);
    NSLog(@"musicLabel : %@",musicLabel);
    
    songTitleLbl.text=[NSString stringWithFormat:@"%@",songTitle];
    lyricsLbl.text=[NSString stringWithFormat:@"%@",lyrics];
    timeLbl.text= [NSString stringWithFormat:@"%@",time];
    singerLbl.text=[NSString stringWithFormat:@"%@",singer];
    musicLabelLbl.text=[NSString stringWithFormat:@"%@",musicDirector];
    musicDirectorLbl.text=[NSString stringWithFormat:@"%@",musicDirector];
    if(alertView.alpha == 0.0)
    {
        alertView.alpha=1.0;
        alertImgView.alpha=1.0;
    }
    else if(alertView.alpha == 1.0)
    {
        alertView.alpha = 0.0;
        alertImgView.alpha=0.0;
    }
    
    
    
    
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

-(void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:YES];
	[self.navigationController setNavigationBarHidden:YES animated:NO];
	//[[UIApplication sharedApplication] setStatusBarOrientation: UIInterfaceOrientationLandscapeRight];
  
    NSString    *kkey;
  //str=[NSString stringWithFormat:@"http://commondatastorage.googleapis.com/besharm/behindscene_video/BESHARAM_TITLE_SONG_EDIT.mp4"];
    
    if ([idis rangeOfString:@".mp4"].location != NSNotFound)
    {
        NSLog(@" mp4 Present");
        
       
      //  VideoPlay.allowsInlineMediaPlayback=YES;
        kkey =[NSString stringWithFormat:@"%@",idis];
        
        link = [NSString stringWithFormat:@"<html><head>\
                <body style=\"margin:0\">\
                <embed id=\"yt\" src=\"%@\" type=\"application/x-shockwave-flash\" \
                width=\"568\" height=\"278\"></embed>\
                </body></html>",kkey];
        
        VideoPlay.delegate=self;
        
        	VideoPlay.autoresizingMask =   UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        VideoPlay.allowsInlineMediaPlayback=YES;

        
        
        [VideoPlay loadHTMLString: [NSString stringWithFormat:link] baseURL:nil];

        
        
        
    }
    
    else{
        NSString*   str = [idis stringByReplacingOccurrencesOfString:@"http://www.youtube.com/v/" withString:@""];
        NSLog(@"str..%@",str);
    VideoPlay.allowsInlineMediaPlayback=YES;
   kkey =[NSString stringWithFormat:@"http://www.youtube.com/embed/%@?playsinline=1",str];
        
        VideoPlay.delegate=self;
        VideoPlay.opaque=NO;
        //Create a URL object.
        shareText= idis;
        NSURL *url = [NSURL URLWithString:kkey];
        //URL Requst Object
        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
        //Load the request in the UIWebView.
        [VideoPlay loadRequest:requestObj];

 
    }
   
    
  }
-(void)viewWillDisappear:(BOOL)animated{
	[super viewWillDisappear:YES];
	[self.navigationController setNavigationBarHidden:NO animated:NO];
   
    [[UIApplication sharedApplication] setStatusBarHidden:NO];

	//[[UIApplication sharedApplication] setStatusBarOrientation: UIInterfaceOrientationPortrait];
    
   // [VideoPlay loadHTMLString:@"" baseURL:nil];

 //   [VideoPlay loadHTMLString:@"" baseURL:nil];

//
//    if ([self.navigationController.navigationBar respondsToSelector:@selector( setBackgroundImage:forBarMetrics:)]){
//        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bar_clean.png"] forBarMetrics:UIBarMetricsDefault];
//    }
}

-(IBAction)back {
	
    [VideoPlay loadHTMLString:@"" baseURL:nil];

	[self.navigationController popViewControllerAnimated:YES];
}


// pre-iOS 6 support
//- (BOOL)shouldAutorotate {
//    return YES;
//}
//
//- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
//{
//    return UIInterfaceOrientationLandscapeLeft;
//}
//- (NSUInteger)supportedInterfaceOrientations {
//    return UIInterfaceOrientationLandscapeLeft;
//}
//
//ios4 and ios5
//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
//{
//    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidUnload {
	[self setVideoPlay:nil];
    [self setDoneButton:nil];
    [self setShareView:nil];
    [self setShareButtonView:nil];
    [self setFinishButtonView:nil];
    [self setInfoButtonView:nil];
    [self setInfoImageView:nil];
	[super viewDidUnload];
}

- (IBAction)shareButton:(id)sender
{
    
//   if([premiumType isEqualToString:@"premium"])
//   {
//       UIAlertView *premiumAlret = [[UIAlertView alloc]initWithTitle:nil message:@"Sorry, sharing disabled for Premium Videos!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//       premiumAlret.tag = 6;
//       [premiumAlret show];
//    }
//    else if([premiumType isEqualToString:@"free"])
//    {
    alertImgView.alpha = 0.0;
    alertView.alpha = 0.0;
    if(_socializebg.alpha == 0.0)
    {
        _socializebg.alpha = 1.0;

        shareView.alpha=1.0;
    }
    else if(_socializebg.alpha == 1.0)
    {
        _socializebg.alpha = 0.0;

        shareView.alpha = 0.0;
    }
   // }
}

- (IBAction)downArrow:(id)sender
{
	[UIView beginAnimations:@"Animate Text Field Up" context:nil];
	[UIView setAnimationDuration:.3];
	[UIView setAnimationBeginsFromCurrentState:YES];
	
	shareView.frame = CGRectMake(shareView.frame.origin.x,
                                 320,
                                 shareView.frame.size.width,
                                 shareView.frame.size.height);
	[UIView commitAnimations];
}




-(void)getsharetext

{
    
    GlobalClass *obj=[GlobalClass getInstance];
    NSLog(@"images=%@",obj.videosharetext);
    
    
    //        for (NSDictionary *actoAgent in obj.wallpapers)
    //        {
    
    
    if([VCTag isEqual: @"FromBehindScene"])
    {
        fbsharetext = [obj.behindscene_video objectForKey:@"fb_share"];
        NSLog(@"fb_share=%@",fbsharetext);
        
        twtsharetext = [obj.behindscene_video objectForKey:@"twitter_share"];
        NSLog(@"twitter_share=%@",twtsharetext);
        
        
        mailsharesub = [obj.behindscene_video objectForKey:@"email_subject"];
        NSLog(@"email_subject=%@",mailsharesub);
        
        
        mailsharetext = [obj.behindscene_video objectForKey:@"email_share"];
        NSLog(@"email_share=%@",mailsharetext);
        
    }
    else{
        fbsharetext = [obj.videosharetext objectForKey:@"fb_share"];
        NSLog(@"fb_share=%@",fbsharetext);
        
        twtsharetext = [obj.videosharetext objectForKey:@"twitter_share"];
        NSLog(@"twitter_share=%@",twtsharetext);
        
        
        mailsharesub = [obj.videosharetext objectForKey:@"email_subject"];
        NSLog(@"email_subject=%@",mailsharesub);
        
        
        mailsharetext = [obj.videosharetext objectForKey:@"email_share"];
        NSLog(@"email_share=%@",mailsharetext);
        
    }
    //            break;
    //
    //        }
}

#pragma mark Compose Mail
-(IBAction)mailCompose:(id)sender
{
	
	//gesture.view.tag);
	
	
	
	
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
    NSLog(@"sharetext in MAIL = %@",shareText);
    
	MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
	picker.mailComposeDelegate = self;
    
    [picker setSubject:mailsharesub];
    
    // Set up recipients
    NSArray *toRecipients = [NSArray arrayWithObject:@""];
    NSArray *ccRecipients = [NSArray arrayWithObjects:@"", nil];
    //NSArray *bccRecipients = [NSArray arrayWithObject:@"fourth@example.com"];
    NSString	*str= [NSString stringWithFormat:@"%@ %@",shareText,mailsharetext];
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
    if (check==1) {
        
        
        
    }
    else
    {
        NSUserDefaults *setUserDefaults=[NSUserDefaults standardUserDefaults];
        [setUserDefaults setInteger:1 forKey:@"twtSwitch"];
        
    }

    NSLog(@"str=%@",shareText);
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
    NSUInteger check = [[NSUserDefaults standardUserDefaults] integerForKey:@"fbSwitch"];
    if (check==1) {
        
        
        
    }
    else
    {
        NSUserDefaults *setUserDefaults=[NSUserDefaults standardUserDefaults];
        [setUserDefaults setInteger:1 forKey:@"fbSwitch"];
        
    }
    //        NSString *str=[NSString stringWithFormat:@"Downloaded this amazing wallpaper: %@ from official YJHD App. Get free copy of the App @<tiny url>",titleMusic.text];
    //        post = [[FBFeedPost alloc] initWithLinkPath:@"http://ow.ly/g4bRR" caption:str];
    
    
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
        
        
        //   [fbController addImage:[UIImage imageNamed:@"114x114.png"]];
        [fbController setInitialText:fbsharetext];
        [fbController addURL:[NSURL URLWithString:stringis]];
        [fbController setCompletionHandler:completionHandler];
        [self presentViewController:fbController animated:YES completion:nil];
    }
    
}

-(void)unloadAct
{
	if (activityIndicator!=nil) {
		[activityIndicator removeFromSuperview];
		activityIndicator = nil;
	}
	if (ActIndImage!=nil) {
		[ActIndImage removeFromSuperview];
		ActIndImage = nil;
	}
	
	
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

/*
- (void)webViewDidFinishLoad:(UIWebView *)webView

{
	[self unloadAct];
	
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
	[self unloadAct];
}
 
 */
@end
