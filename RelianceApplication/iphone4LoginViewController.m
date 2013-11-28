//
//  iphone4LoginViewController.m
//  RelianceApplication
//
//  Created by Ashwini Pawar on 13/08/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import "iphone4LoginViewController.h"

@interface iphone4LoginViewController ()

@end

@implementation iphone4LoginViewController
@synthesize loginLabel,backButtonRef;
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
    [_CountryCode resignFirstResponder];
    [_Email1 resignFirstResponder];
    [_Number resignFirstResponder];
    [self.navigationController setNavigationBarHidden:YES animated:YES];

}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    backButtonRef.alpha = 0.0;
    _ccpatch.alpha = 0.0;
    _emailpatch.alpha = 0.0;
    _mobpatch.alpha = 0.0;
    _submit.alpha = 0.0;
    _signupbutton.alpha = 1.0;
    _CountryCode.alpha = 0.0;
    _Number.alpha = 0.0;
    _Email1.alpha = 0.0;
    
    // [[UIApplication sharedApplication] setStatusBarHidden:YES];
    // Do any additional setup after loading the view from its nib.
}

-(IBAction)facebookclicked:(id)sender
{
    
}

-(IBAction)twitterclicked:(id)sender
{
    GlobalClass *OBJ=[GlobalClass getInstance];
    OBJ.DISMISSIT=@"1";
    
    // [self dismissModalViewControllerAnimated:NO];
    
}

-(IBAction)signupclicked:(id)sender
{
    _fblogin.alpha=0.0;
    _twtlogin.alpha=0.0;
    backButtonRef.alpha = 1.0;
    _labelbtn.alpha=1.0;

    _ccpatch.alpha = 1.0;
    _emailpatch.alpha = 1.0;
    _mobpatch.alpha = 1.0;
    _submit.alpha = 1.0;
    _signupbutton.alpha = 0.0;
    _CountryCode.alpha = 1.0;
    _Number.alpha = 1.0;
    _Email1.alpha = 1.0;
    loginLabel.text = @"Enter details below to sign up";
    
    //
    //    GlobalClass *OBJ=[GlobalClass getInstance];
    //    OBJ.DISMISSIT=@"1";
    //
    //    [self dismissModalViewControllerAnimated:NO];
}





- (IBAction)openFacebookSession {
    
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        
        
        
        [self fbios6];
        
        
    }
    
    
    
    else
        
    {
        
        UIAlertView* logoutalertbox = [[ UIAlertView alloc]initWithTitle:@"Facebook login required!" message:@"To continue, please log into your Facebook Account through device settings." delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil ];
        
        //   logoutalertbox.tag=5;
        
        logoutalertbox.delegate=self;
        
        [logoutalertbox show];
        
        
        
    }
    
    
    
    
    
}



-(void)fbios6

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
                    
                    [self performSelector:@selector(reachable) withObject:nil afterDelay:1.0];

                    
                }
                    
                    break;
                    
                case SLComposeViewControllerResultDone:
                    
                {
                    
                    NSLog(@"Posted....");
                    
                    
                    
                    
                    [self performSelector:@selector(reachable) withObject:nil afterDelay:1.0];
                    
                }
                    
                    break;
                    
            }};
        
        
        
        
        
        
        
       // [fbController addImage:[UIImage imageNamed:@"114x114.png"]];
        
        [fbController setInitialText:@"Just downloaded the latest Reliance Official App"];
        
        [fbController addURL:[NSURL URLWithString:@"https://itunes.apple.com/us/app/reliance-entertainment/id683133606?ls=1&mt=8"]];
        
        [fbController setCompletionHandler:completionHandler];
        
        [self presentViewController:fbController animated:YES completion:nil];
        
    }
    
    
    
}

-(void)Finsishfbloading
{
	
	_LOGINVIEW.alpha=1.0;
	[activityIndicator stopAnimating];
}
- (IBAction)closeFacebookSession {
	NSLog(@"test");
	_LOGINVIEW.alpha=1.0;
	[activityIndicator stopAnimating];
	
	//[facebook logout:self];
	
    
    
    
	
	//[FBSession.activeSession closeAndClearTokenInformation];
}
- (void)fbDidLogout
{
	//	facebook.accessToken=nil;
	//	facebook.expirationDate=nil;
	//	[[NSUserDefaults standardUserDefaults] removeObjectForKey:@"AccessToken"];
	//	[[NSUserDefaults standardUserDefaults] removeObjectForKey:@"ExpirationDate"];
	NSLog(@"test");
	
	
	//facebook.accessToken = nil;
	NSHTTPCookie *cookie;
	NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
	for (cookie in [storage cookies])
	{
		NSString* domainName = [cookie domain];
		NSRange domainRange = [domainName rangeOfString:@"facebook"];
		if(domainRange.length > 0)
		{
			[storage deleteCookie:cookie];
		}
	}
}
-(void)fbDidLogin


{
	http://tinyurl.com/rel-iphone
	activityIndicator = [[UIActivityIndicatorView alloc]init];
	activityIndicator.center=CGPointMake(320/2, 460/2);
	activityIndicator.transform = CGAffineTransformMakeScale(2.0, 2.0);
	[activityIndicator setBackgroundColor:[UIColor blackColor]];
	[activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
	[self.view addSubview:activityIndicator];
	[activityIndicator startAnimating];
    
	
    
	//	[[NSUserDefaults standardUserDefaults] setObject:facebook.accessToken forKey:@"AccessToken"];
	//	[[NSUserDefaults standardUserDefaults] setObject:facebook.expirationDate forKey:@"ExpirationDate"];
	
	//[facebook requestWithGraphPath: @"me/" andDelegate: self];
	
	//	NSMutableDictionary*  _permissions =  [[NSMutableDictionary dictionaryWithObjectsAndKeys: @"email", @"read_stream",nil] retain];
	//
	//	[facebook requestWithGraphPath:@"me/"  andParams:_permissions andHttpMethod:@"POST" andDelegate:self];
	//[self sharefeedonfb1];
	
    
	
	/*NSString *insertSQL = [NSString stringWithFormat: @"INSERT INTO USER (ID, NAME ,  PHONE , EMAIL , IMAGE ) VALUES (\"%@\",\"%@\",\"%@\",\"%@\",\"%@\")",@"1", @"Akshay", @"", @"",nil];
     NSLog(@"query=%@",insertSQL);
     [self saveData:insertSQL];
     [self dismissModalViewControllerAnimated:YES];
     
     Overlaybtn = [UIButton buttonWithType:UIButtonTypeCustom];
     Overlaybtn.frame=CGRectMake(0, 0,  320, 460);
     
     [Overlaybtn setBackgroundImage:[UIImage imageNamed:@"overlay_screen.jpg"] forState:UIControlStateNormal];
     //[Coverflow[i] setBackgroundImage:CoverImage[i] forState:UIControlStateHighlighted];
     
     [Overlaybtn addTarget:self action:@selector(overlay) forControlEvents:UIControlEventTouchUpInside];
     [self.view addSubview:  Overlaybtn];
	 */
	_LOGINVIEW.alpha=1.0;
	[activityIndicator stopAnimating];
	
    
    
}


- (IBAction)twitterButtonPressed {
	//Get a reference to the application delegate.
	AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
	
	//Get Twitter account, stored in on the device, for the first time.
	[appDelegate getTwitterAccountOnCompletion:^(ACAccount *twitterAccount){
		//If we successfully retrieved a Twitter account
		if(twitterAccount) {
			//Make sure anything UI related happens on the main queue
			dispatch_async(dispatch_get_main_queue(), ^{
				[self loadUserDetails];
			});
		}
	}];
}



#pragma mark Account Data
- (void)loadUserDetails {
	//If the user is logged in using Twitter
	//Get a reference to the application delegate.
	AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
	//Get a reference to the Twitter account stored on the device.
	[appDelegate getTwitterAccountOnCompletion:^(ACAccount *twitterAccount){
		if(twitterAccount) {
			NSURL *credentialsUrl = [NSURL URLWithString:@"http://api.twitter.com/1/account/verify_credentials.json"];
			TWRequest *credentialsRequest = [[TWRequest alloc] initWithURL:credentialsUrl
                                                                parameters:nil
                                                             requestMethod:TWRequestMethodGET];
			
			//Be sure to attach the Twitter ACAccount object to the request.
			credentialsRequest.account = twitterAccount;
			[credentialsRequest performRequestWithHandler:^(NSData *responseData,
                                                            NSHTTPURLResponse *urlResponse,
                                                            NSError *error) {
				//If there is an error, display a message to the user.
				if(error != nil) {
                    //	[self displayErrorMessage];
					return;
				}
				
				// Parse the JSON response
				NSError *jsonError = nil;
				id response = [NSJSONSerialization JSONObjectWithData:responseData
                                                              options:0
                                                                error:&jsonError];
				
				//If the JSON parser has thrown an error, display a message to the user.
				if(jsonError != nil) {
                    //	[self displayErrorMessage];
					return;
				}
				
				NSString *name = [response objectForKey:@"name"];
				NSString *screenName = [response objectForKey:@"screen_name"];
                if (!name) {
                    
                }
                else{
                    NSString *insertSQL = [NSString stringWithFormat: @"INSERT INTO USER (ID, NAME ,  PHONE , EMAIL , USERNAME,  IMAGE ) VALUES (\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\")",@"1", name, @"", name, @"",nil];
                    
                    NSLog(@"query=%@",insertSQL);
                    [self saveData:insertSQL];
                    NSUserDefaults *setUserDefaults=[NSUserDefaults standardUserDefaults];
                    [setUserDefaults setInteger:2 forKey:@"fbSwitch"];
                    [setUserDefaults setInteger:1 forKey:@"twtSwitch"];

                    _Email1.text = name;

				}


				//Retrieve the users profile image.
				NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.twitter.com/1/users/profile_image/?screen_name=%@&size=bigger", screenName]];
				//	NSData *data = [NSData dataWithContentsOfURL:url];
				//	UIImage *img = [[UIImage alloc] initWithData:data];
				
				
				NSLog(@"name=%@",name);
                
                NAMSIS=name;


             			
				//Store the loaded data in the properties
				//					self.name = name;
				//					self.username = screenName;
				//					self.userPhotoView = [[UIImageView alloc] initWithImage:img];
				//					self.userDataLoaded = YES;
			}];
			
			//Retrieve the users tweets
			NSURL *timelineUrl = [NSURL URLWithString:@"http://api.twitter.com/1/statuses/user_timeline.json"];
			TWRequest *timelineRequest = [[TWRequest alloc] initWithURL:timelineUrl
                                                             parameters:nil
                                                          requestMethod:TWRequestMethodGET];
			
			//Be sure to attach the Twitter ACAccount object to the request.
			timelineRequest.account = twitterAccount;
			[timelineRequest performRequestWithHandler:^(NSData *responseData,
                                                         NSHTTPURLResponse *urlResponse,
                                                         NSError *error) {
				//If there is an error, display a message to the user.
				if(error != nil) {
					//[self displayErrorMessage];
					return;
				}
				
				// Parse the JSON response
				NSError *jsonError = nil;
				id response = [NSJSONSerialization JSONObjectWithData:responseData
                                                              options:0
                                                                error:&jsonError];
				
				//If the JSON parser has thrown an error, display a message to the user.
				if(jsonError != nil){
                    //	[self displayErrorMessage];
					return;
				}
				
				//Get the last tweet of the user.
				NSString *lastTweetText = [[response objectAtIndex:0] objectForKey:@"text"];
				//					self.status = lastTweetText;
				//					self.timelineDataLoaded = YES;
			}];
		}
	}];
	//[self performSelector:@selector(dismissit) withObject:nil afterDelay:1.0];
	
}

-(void)dismissit
{
	activityIndicator = [[UIActivityIndicatorView alloc]init];
	activityIndicator.center=CGPointMake(320/2, 460/2);
	activityIndicator.transform = CGAffineTransformMakeScale(2.0, 2.0);
	[activityIndicator setBackgroundColor:[UIColor blackColor]];
	[activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
	[self.view addSubview:activityIndicator];
	[activityIndicator startAnimating];
    
	/*NSString *insertSQL = [NSString stringWithFormat: @"INSERT INTO USER (ID, NAME ,  PHONE , EMAIL , IMAGE ) VALUES (\"%@\",\"%@\",\"%@\",\"%@\",\"%@\")",@"1", @"AKSHAY", @"", @"",nil];
     NSLog(@"query=%@",insertSQL);
     [self saveData:insertSQL];
     
     
     [self dismissModalViewControllerAnimated:YES];
     
     
     Overlaybtn = [UIButton buttonWithType:UIButtonTypeCustom];
     Overlaybtn.frame=CGRectMake(0, 0,  320, 460);
     
     [Overlaybtn setBackgroundImage:[UIImage imageNamed:@"overlay_screen.jpg"] forState:UIControlStateNormal];
     //[Coverflow[i] setBackgroundImage:CoverImage[i] forState:UIControlStateHighlighted];
     
     [Overlaybtn addTarget:self action:@selector(overlay) forControlEvents:UIControlEventTouchUpInside];
     [self.view addSubview:  Overlaybtn];
	 */
	
	[self performSelector:@selector(processing) withObject:nil  afterDelay:0.0 ];
    
    
}

-(IBAction)twitter{
	
	
	[self performSelector:@selector(keyboardWillHide:) withObject:nil afterDelay:0.0];
    
    
	NSString* shareText = [NSString stringWithFormat:@"Just downloaded the latest Reliance Official App from http://tinyurl.com/rel-iphone"];
	
	
	
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
				//	[self performSelector:@selector(reachable) withObject:nil afterDelay:1.0];
              //  [self performSelector:@selector(reachable) withObject:nil afterDelay:1.0];

				//  This means the user cancelled without sending the Tweet
				break;
			case TWTweetComposeViewControllerResultDone:
				NSLog(@"DONE");
                
				[self performSelector:@selector(reachable) withObject:nil afterDelay:1.0];
				
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
	[tweetSheet setInitialText:shareText];
	
	//  Adds an image to the Tweet
	//  For demo purposes, assume we have an image named 'larry.png'
	//  that we wish to attach
	if (![tweetSheet addImage:[UIImage imageNamed:@"DB257_1000_result.png"]]) {
		NSLog(@"Unable to add the image!");
	}
	
	//  Add an URL to the Tweet.  You can add multiple URLs.
	if (![tweetSheet addURL:[NSURL URLWithString:@"http://twitter.com/"]]){
		NSLog(@"Unable to add the URL!");
	}
	
	//  Presents the Tweet Sheet to the user
	[self presentViewController:tweetSheet animated:NO completion:^{
		NSLog(@"Tweet sheet has been presented.");
	}];
}



-(IBAction)reachable
{
    
	
	
	
	
	Reachability * reach = [Reachability reachabilityWithHostname:@"www.google.com"];
	
	reach.reachableBlock = ^(Reachability * reachability)
	{
		dispatch_async(dispatch_get_main_queue(), ^{
			[self dismissit];
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


-(void) checkNetworkStatus:(NSNotification *)notice
{
	// called after network status changes
	NetworkStatus internetStatus = [internetReachable currentReachabilityStatus];
	switch (internetStatus)
	{
		case NotReachable:
		{
			NSLog(@"The internet is down.");
			
			if (tt==1) {
				
				
				UIAlertView *alert = [[ UIAlertView alloc]initWithTitle:@"Network Error" message:@"Network Not Connected" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Retry", nil ];
				[alert show];
				
				tt=2;
			}
			
			else {
				
			}
			break;
		}
		case ReachableViaWiFi:
		{
			NSLog(@"The internet is working via WIFI.");
			[self dismissit];
			
			
			break;
		}
		case ReachableViaWWAN:
		{
			NSLog(@"The internet is working via WWAN.");
			[self dismissit];
			
			break;
		}
	}
	
	/*NetworkStatus hostStatus = [hostReachable currentReachabilityStatus];
	 switch (hostStatus)
	 {
	 case NotReachable:
	 {
	 NSLog(@"A gateway to the host server is down.");
	 UIAlertView *alert = [[ UIAlertView alloc]initWithTitle:@"Network Error" message:@"Network Not Connected" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil ];
	 [alert show];
	 [alert   release];
	 
	 break;
	 }
	 case ReachableViaWiFi:
	 {
	 NSLog(@"A gateway to the host server is working via WIFI.");
	 
	 break;
	 }
	 case ReachableViaWWAN:
	 {
	 NSLog(@"A gateway to the host server is working via WWAN.");
	 
	 break;
	 }
	 }*/
	tt=1;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(IBAction)Submit:(id)sender

{
    [self performSelector:@selector(keyboardWillHide:) withObject:nil afterDelay:0.0];
    
	// _LOGINVIEW.alpha=0.5;
	activityIndicator = [[UIActivityIndicatorView alloc]init];
	activityIndicator.center=CGPointMake(320/2, 460/2);
    activityIndicator.transform = CGAffineTransformMakeScale(2.0, 2.0);
	[activityIndicator setBackgroundColor:[UIColor blackColor]];
	[activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
	[self.view addSubview:activityIndicator];
    [activityIndicator startAnimating];
    
	[_Email1 resignFirstResponder];
	[_Number resignFirstResponder];
    
    
    
	[self validateEmailWithString:_Email1.text];
	if (stricterFilter && [_Number.text length]==10) {
		[self performSelector:@selector(processing) withObject:nil  afterDelay:0.0 ];
        
        NSString *insertSQL = [NSString stringWithFormat: @"INSERT INTO USER (ID, NAME ,  PHONE , EMAIL , USERNAME,  IMAGE ) VALUES (\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\")",@"1", _Email1.text, _Number.text, _Email1.text, @"",nil];
        NSLog(@"query=%@",insertSQL);
        [self saveData:insertSQL];
        NSUserDefaults *setUserDefaults=[NSUserDefaults standardUserDefaults];
        [setUserDefaults setInteger:2 forKey:@"fbSwitch"];
        [setUserDefaults setInteger:2 forKey:@"twtSwitch"];
        
	}
    
    else 	if ([_Number.text length]!=10) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Login Failed" message:@"Please enter 10 Digit Mobile Number" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil ];
		[alert show];
        _LOGINVIEW.alpha=1.0;
		[activityIndicator stopAnimating];
        
	}
	else if (!stricterFilter) {
        
		UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Login Failed" message:@"Please Enter Email in XYZ@abc.com" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil ];
		[alert show];
		
		_LOGINVIEW.alpha=1.0;
		[activityIndicator stopAnimating];
        
	}
    
    
}

- (IBAction)backButton:(id)sender {
    
    _fblogin.alpha=1.0;
    _twtlogin.alpha=1.0;
    backButtonRef.alpha = 0.0;
    _labelbtn.alpha=1.0;
    
    _ccpatch.alpha = 0.0;
    _emailpatch.alpha = 0.0;
    _mobpatch.alpha = 0.0;
    _submit.alpha = 0.0;
    _signupbutton.alpha = 1.0;
    _CountryCode.alpha = 0.0;
    _Number.alpha = 0.0;
    _Email1.alpha = 0.0;
    loginLabel.text = @"Login Here";

}

-(void)processing
{
	GlobalClass *obj=[GlobalClass getInstance];
    
	
    NSString *post = [NSString stringWithFormat:@"country_code=%@&phone=%@&email=%@&deviceno=%@&username=%@",_CountryCode.text,_Number.text,_Email1.text,obj.dev,_username.text];
	NSLog(@"post=%@",post);
	
	[[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reachabilityChanged:)
                                                 name:kReachabilityChangedNotification
                                               object:nil];
	
	Reachability * reach = [Reachability reachabilityWithHostname:@"www.google.com"];
	
	reach.reachableBlock = ^(Reachability * reachability)
	{
		dispatch_async(dispatch_get_main_queue(), ^{
			[self ValidateLogin:post];
			
			
			
			if ([responseD isEqualToString:@"fail"] || [responseD isEqualToString:@"success"] || [responseD isEqualToString:@"FAIL"]) {
				
                //				NSString *insertSQL = [NSString stringWithFormat: @"INSERT INTO USER (ID, NAME ,  PHONE , EMAIL , IMAGE ) VALUES (\"%@\",\"%@\",\"%@\",\"%@\",\"%@\")",@"1", userid, _Number.text,  _Email1.text ,nil];
                //				[self saveData:insertSQL];
                //
                
                Overlaybtn = [UIButton buttonWithType:UIButtonTypeCustom];
				Overlaybtn.frame=CGRectMake(0, 0,  320, 460);
				
				[Overlaybtn setBackgroundImage:[UIImage imageNamed:@"iphone-4_overlay.jpg"] forState:UIControlStateNormal];
				//[Coverflow[i] setBackgroundImage:CoverImage[i] forState:UIControlStateHighlighted];
				
				[Overlaybtn addTarget:self action:@selector(overlay) forControlEvents:UIControlEventTouchUpInside];
				[self.view addSubview:  Overlaybtn];

                //[self overlay];
			}
			
			
			
			else
			{
                
                //                Overlaybtn = [UIButton buttonWithType:UIButtonTypeCustom];
                //				Overlaybtn.frame=CGRectMake(0, 0,  320, 460);
                //
                //				[Overlaybtn setBackgroundImage:[UIImage imageNamed:@"overlay_screen.jpg"] forState:UIControlStateNormal];
                //				//[Coverflow[i] setBackgroundImage:CoverImage[i] forState:UIControlStateHighlighted];
                //
                //				[Overlaybtn addTarget:self action:@selector(overlay) forControlEvents:UIControlEventTouchUpInside];
                //				[self.view addSubview:  Overlaybtn];
                
				UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Login Failed" message:@"SomeThing gone Wrong, Please Check the details Provided" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil ];
				[alert show];
				
			}
		});
	};
	
	reach.unreachableBlock = ^(Reachability * reachability)
	{
		dispatch_async(dispatch_get_main_queue(), ^{
			if (ntcheck==1) {
                
                UIAlertView* logoutalertbox = [[ UIAlertView alloc]initWithTitle:@"Alert" message:@"Network Not Reachable" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Retry", nil ];
                logoutalertbox.delegate=self;
                [logoutalertbox show];
                
                _LOGINVIEW.alpha=1.0;
                [activityIndicator stopAnimating];
                
                ntcheck=2;
                
			}
		});
	};
	
	[reach startNotifier];
    
	
    /*	dispatch_async(dispatch_get_global_queue(0, 0), ^{
     
     [self ValidateLogin:post];
     
     
     
     if ([responseD isEqualToString:@"FAIL"] || [responseD isEqualToString:@"SUCCESS"]) {
     
     NSString *insertSQL = [NSString stringWithFormat: @"INSERT INTO USER (ID, NAME ,  PHONE , EMAIL , IMAGE ) VALUES (\"%@\",\"%@\",\"%@\",\"%@\",\"%@\")",@"1", @"Akshay", _Number.text,  _Email1.text ,nil];
     [self saveData:insertSQL];
     
     
     Overlaybtn = [UIButton buttonWithType:UIButtonTypeCustom];
     Overlaybtn.frame=CGRectMake(0, 0,  320, 460);
     
     [Overlaybtn setBackgroundImage:[UIImage imageNamed:@"overlay.jpg"] forState:UIControlStateNormal];
     //[Coverflow[i] setBackgroundImage:CoverImage[i] forState:UIControlStateHighlighted];
     
     [Overlaybtn addTarget:self action:@selector(overlay) forControlEvents:UIControlEventTouchUpInside];
     [self.view addSubview:  Overlaybtn];
     }
     
     
     
     else
     {
     UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Login Failed" message:@"SomeThing gone Wrong, Please Check the details Provided" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil ];
     [alert show];
     
     }
     
     
     });*/
    
    
}

-(IBAction)overlay
{
	
	
    GlobalClass *OBJ=[GlobalClass getInstance];
    OBJ.DISMISSIT=@"1";
    //
    //  [self dismissModalViewControllerAnimated:NO];
    
    
    [self.navigationController popViewControllerAnimated:NO];
    
	/*NSString *post = [NSString stringWithFormat:@"country_code=%@&phone=%@&email=%@",_CountryCode.text,_Number.text,_Email1.text];
     NSLog(@"post=%@",post);
     [self ValidateLogin:post];
     
     
     if ([responseD isEqualToString:@"FAIL"] || [responseD isEqualToString:@"SUCCESS"]) {
     
     NSString *insertSQL = [NSString stringWithFormat: @"INSERT INTO USER (ID, NAME ,  PHONE , EMAIL , IMAGE ) VALUES (\"%@\",\"%@\",\"%@\",\"%@\",\"%@\")",@"1", @"Akshay", _Number.text,  _Email1.text ,nil];
     [self saveData:insertSQL];
     
     
     [self.navigationController setNavigationBarHidden:NO animated:NO];
     
     [[self.navigationController viewControllers] objectAtIndex:0];
     
     [self.navigationController popViewControllerAnimated:NO];
     }
     
     
     else
     {
     UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Login Failed" message:@"SomeThing gone Wrong, Please Check the details Provided" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil ];
     [alert show];
     
     }*/
}

-(void)ValidateLogin:(NSString *)post
{
    //post = [NSString stringWithFormat:@"phone=%@&email=%@",@"null",@"null"];
	
    
	
    //post = [NSString stringWithFormat:@"phone=%@&email=%@",@"1234567890",@"rohan.k@skiusainc.com"];
	NSLog(@"POST=%@",post);
	
    //	dispatch_async(dispatch_get_main_queue()	, ^{
	
    
	
	NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
	NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
	
	[request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://apps.medialabs24x7.com/besharam/check_login.php"]]];
	[request setHTTPMethod:@"POST"];
	[request setValue:postLength forHTTPHeaderField:@"Content-Length"];
	[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Current-Type"];
	[request setHTTPBody:postData];
	
	NSURLResponse *response;
	NSData *urlData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
	NSString *stringResponse = [[NSString alloc] initWithData:urlData encoding:NSASCIIStringEncoding];
	NSLog(@"response1=%@",stringResponse);
	
	
	NSError* error;
	NSDictionary* responseDict = [NSJSONSerialization JSONObjectWithData:urlData //1
                                                                 options:kNilOptions
                                                                   error:&error];
	//
	////
	//NSArray *responseDict = [stringResponse JSONValue];
	
	for (NSDictionary *actoAgent in responseDict){
		
		NSString  *response1 =[actoAgent objectForKey:@"response"];
		
		responseD = [NSString stringWithFormat:@"%@",response1];
		
		NSLog(@"responseD=%@",responseD);
		
        //		NSString  *UID  =[actoAgent objectForKey:@"userid"];
        //
        //
        //		userid = [NSString stringWithFormat:@"%@",UID];
        //
        //		NSLog(@"userid=%@",userid);
        
		
	}
    
    
    //	});
	
}


-(void)keyboardWillShow:(id)sender
{
    
	[UIView beginAnimations:@"Animate Text Field Up" context:nil];
	[UIView setAnimationDuration:.3];
	[UIView setAnimationBeginsFromCurrentState:YES];
	
	_LOGINVIEW.frame = CGRectMake(_LOGINVIEW.frame.origin.x,
                                  -170,
                                  _LOGINVIEW.frame.size.width,
                                  _LOGINVIEW.frame.size.height);
	
	[UIView commitAnimations];
	
	
}


-(void)keyboardWillHide:(id)sender
{
	[UIView beginAnimations:@"Animate Text Field Up" context:nil];
	[UIView setAnimationDuration:.3];
	[UIView setAnimationBeginsFromCurrentState:YES];
	
	_LOGINVIEW.frame = CGRectMake(_LOGINVIEW.frame.origin.x,
                                  0,
                                  _LOGINVIEW.frame.size.width,
                                  _LOGINVIEW.frame.size.height);
	
	[UIView commitAnimations];
	
	
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	
	if (textField.tag==0) {
        //	[self loadCountryCodes];
		[UIView beginAnimations:@"Animate Text Field Up" context:nil];
		[UIView setAnimationDuration:.3];
		[UIView setAnimationBeginsFromCurrentState:YES];
		
		_LOGINVIEW.frame = CGRectMake(_LOGINVIEW.frame.origin.x,
                                      0,
                                      _LOGINVIEW.frame.size.width,
                                      _LOGINVIEW.frame.size.height);
		
		[UIView commitAnimations];
		
		[textField resignFirstResponder];
        
        
	}
	
	
	else {
        [UIView beginAnimations:@"Animate Text Field Up" context:nil];
        [UIView setAnimationDuration:.3];
        [UIView setAnimationBeginsFromCurrentState:YES];
        
        _LOGINVIEW.frame = CGRectMake(_LOGINVIEW.frame.origin.x,
                                      0,
                                      _LOGINVIEW.frame.size.width,
                                      _LOGINVIEW.frame.size.height);
        
        [UIView commitAnimations];
        
        [textField resignFirstResponder];
	}
	return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
	if (textField.tag==0) {
		[self unloadCountryCode];
        
		[self loadCountryCodes];
		//[textField resignFirstResponder];
		
        //		[UIView beginAnimations:@"Animate Text Field Up" context:nil];
        //		[UIView setAnimationDuration:.3];
        //		[UIView setAnimationBeginsFromCurrentState:YES];
        //
        //		_LOGINVIEW.frame = CGRectMake(_LOGINVIEW.frame.origin.x,
        //							    -200,
        //							    _LOGINVIEW.frame.size.width,
        //							    _LOGINVIEW.frame.size.height);
        //
        //		[UIView commitAnimations];
		
		[_CountryCode resignFirstResponder];
        //		[_Number resignFirstResponder];
        //		[_Email1 resignFirstResponder];
		
		
		[self performSelector:@selector(keyboardWillHide:) withObject:nil afterDelay:0.0];
        
	}
	
	else{
		
		[self unloadCountryCode];
		
		[UIView beginAnimations:@"Animate Text Field Up" context:nil];
		[UIView setAnimationDuration:.3];
		[UIView setAnimationBeginsFromCurrentState:YES];
		
		_LOGINVIEW.frame = CGRectMake(_LOGINVIEW.frame.origin.x,
                                      -200,
                                      _LOGINVIEW.frame.size.width,
                                      _LOGINVIEW.frame.size.height);
		
		[UIView commitAnimations];
		
		
		
	}
	
}




-(void)unloadCountryCode
{
	
	//	Number.userInteractionEnabled=YES;
	//	Email1.userInteractionEnabled=YES;
	
	if (pickerView!=nil) {
		[pickerView removeFromSuperview];
		pickerView=nil;
	}
	
	if (pickerView!=nil) {
		[pickerView removeFromSuperview];
		pickerView=nil;
	}
	
	
	if (closeit!=nil) {
		[closeit removeFromSuperview];
		closeit=nil;
	}
	
	//btn.alpha=1;
}
-(IBAction)loadCountryCodes
{
	//[self performSelector:@selector(keyboardWillHide:) withObject:nil afterDelay:0.0];
    //	[_CountryCode resignFirstResponder];
    //	[_Number resignFirstResponder];
    //	[_Email1 resignFirstResponder];
    
    
	//	Number.userInteractionEnabled=NO;
	//	Email1.userInteractionEnabled=NO;
	CodeSelector = [[NSMutableArray alloc] init];
	[CodeSelector addObject:@"India +(91)"];
	[CodeSelector addObject:@"UnitedStates +(1)"];
	[CodeSelector addObject:@"Canada +(1)"];
	[CodeSelector addObject:@"UnitedKingdom +(44)"];
	[CodeSelector addObject:@"Australia +(61)"];
	[CodeSelector addObject:@"Pakistan +(92)"];
	[CodeSelector addObject:@"UnitedArabEmirates +(971)"];
	[CodeSelector addObject:@"Afghanistan +(93)"];
	[CodeSelector addObject:@"Albania +(355)"];
	[CodeSelector addObject:@"Algeria +(213)"];
	[CodeSelector addObject:@"AmericanSamoa +(1684)"];
	[CodeSelector addObject:@"Andorra +(376)"];
	[CodeSelector addObject:@"Angola +(244)"];
	[CodeSelector addObject:@"Anguilla +(1264)"];
	[CodeSelector addObject:@"Antarctica +(672)"];
	[CodeSelector addObject:@"AntiguaandBarbuda +(1268)"];
	[CodeSelector addObject:@"Argentina +(54)"];
	[CodeSelector addObject:@"Armenia +(374)"];
	[CodeSelector addObject:@"Aruba +(297)"];
	[CodeSelector addObject:@"Austria +(43)"];
	[CodeSelector addObject:@"Azerbaijan +(994)"];
	[CodeSelector addObject:@"Bahamas +(1242)"];
	[CodeSelector addObject:@"Bahrain +(973)"];
	[CodeSelector addObject:@"Bangladesh +(880)"];
	[CodeSelector addObject:@"Barbados +(1246)"];
	[CodeSelector addObject:@"Belarus +(375)"];
	[CodeSelector addObject:@"Belgium +(32)"];
	[CodeSelector addObject:@"Belize +(501)"];
	[CodeSelector addObject:@"Benin +(229)"];
	[CodeSelector addObject:@"Bermuda +(1441)"];
	[CodeSelector addObject:@"Bhutan +(975)"];
	[CodeSelector addObject:@"Bolivia +(591)"];
	[CodeSelector addObject:@"BosniaandHerzegovina +(387)"];
	[CodeSelector addObject:@"Botswana +(267)"];
	[CodeSelector addObject:@"Brazil +(55)"];
	[CodeSelector addObject:@"BritishVirginIslands +(1284)"];
	[CodeSelector addObject:@"Brunei +(673)"];
	[CodeSelector addObject:@"Bulgaria +(359)"];
	[CodeSelector addObject:@"BurkinaFaso +(226)"];
	[CodeSelector addObject:@"Burma(Myanmar) +(95)"];
	[CodeSelector addObject:@"Burundi +(257)"];
	[CodeSelector addObject:@"Cambodia +(855)"];
	[CodeSelector addObject:@"Cameroon +(237)"];
	[CodeSelector addObject:@"CapeVerde +(238)"];
	[CodeSelector addObject:@"CaymanIslands +(1345)"];
	[CodeSelector addObject:@"CentralAfricanRepublic +(236)"];
	[CodeSelector addObject:@"Chad +(235)"];
	[CodeSelector addObject:@"Chile +(56)"];
	[CodeSelector addObject:@"China +(86)"];
	[CodeSelector addObject:@"ChristmasIsland +(61)"];
	[CodeSelector addObject:@"Cocos(Keeling)Islands +(61)"];
	[CodeSelector addObject:@"Colombia +(57)"];
	[CodeSelector addObject:@"Comoros +(269)"];
	[CodeSelector addObject:@"CookIslands +(682)"];
	[CodeSelector addObject:@"CostaRica +(506)"];
	[CodeSelector addObject:@"Croatia +(385)"];
	[CodeSelector addObject:@"Cuba +(53)"];
	[CodeSelector addObject:@"Cyprus +(357)"];
	[CodeSelector addObject:@"CzechRepublic +(420)"];
	[CodeSelector addObject:@"DemocraticRepublicoftheCongo +(243)"];
	[CodeSelector addObject:@"Denmark +(45)"];
	[CodeSelector addObject:@"Djibouti +(253)"];
	[CodeSelector addObject:@"Dominica +(1767)"];
	[CodeSelector addObject:@"DominicanRepublic +(1809)"];
	[CodeSelector addObject:@"Ecuador +(593)"];
	[CodeSelector addObject:@"Egypt +(20)"];
	[CodeSelector addObject:@"ElSalvador +(503)"];
	[CodeSelector addObject:@"EquatorialGuinea +(240)"];
	[CodeSelector addObject:@"Eritrea +(291)"];
	[CodeSelector addObject:@"Estonia +(372)"];
	[CodeSelector addObject:@"Ethiopia +(251)"];
	[CodeSelector addObject:@"FalklandIslands +(500)"];
	[CodeSelector addObject:@"FaroeIslands +(298)"];
	[CodeSelector addObject:@"Fiji +(679)"];
	[CodeSelector addObject:@"Finland +(358)"];
	[CodeSelector addObject:@"France +(33)"];
	[CodeSelector addObject:@"FrenchPolynesia +(689)"];
	[CodeSelector addObject:@"Gabon +(241)"];
	[CodeSelector addObject:@"Gambia +(220)"];
	[CodeSelector addObject:@"GazaStrip +(970)"];
	[CodeSelector addObject:@"Georgia +(995)"];
	[CodeSelector addObject:@"Germany +(49)"];
	[CodeSelector addObject:@"Ghana +(233)"];
	[CodeSelector addObject:@"Gibraltar +(350)"];
	[CodeSelector addObject:@"Greece +(30)"];
	[CodeSelector addObject:@"Greenland +(299)"];
	[CodeSelector addObject:@"Grenada +(1473)"];
	[CodeSelector addObject:@"Guam +(1671)"];
	[CodeSelector addObject:@"Guatemala +(502)"];
	[CodeSelector addObject:@"Guinea +(224)"];
	[CodeSelector addObject:@"Guinea-Bissau +(245)"];
	[CodeSelector addObject:@"Guyana +(592)"];
	[CodeSelector addObject:@"Haiti +(509)"];
	[CodeSelector addObject:@"HolySee(VaticanCity) +(39)"];
	[CodeSelector addObject:@"Honduras +(504)"];
	[CodeSelector addObject:@"HongKong +(852)"];
	[CodeSelector addObject:@"Hungary +(36)"];
	[CodeSelector addObject:@"Iceland +(354)"];
	[CodeSelector addObject:@"Indonesia +(62)"];
	[CodeSelector addObject:@"Iran +(98)"];
	[CodeSelector addObject:@"Iraq +(964)"];
	[CodeSelector addObject:@"Ireland +(353)"];
	[CodeSelector addObject:@"IsleofMan +(44)"];
	[CodeSelector addObject:@"Israel +(972)"];
	[CodeSelector addObject:@"Italy +(39)"];
	[CodeSelector addObject:@"IvoryCoast +(225)"];
	[CodeSelector addObject:@"Jamaica +(1876)"];
	[CodeSelector addObject:@"Japan +(81)"];
	[CodeSelector addObject:@"Jordan +(962)"];
	[CodeSelector addObject:@"Kazakhstan +(7)"];
	[CodeSelector addObject:@"Kenya +(254)"];
	[CodeSelector addObject:@"Kiribati +(686)"];
	[CodeSelector addObject:@"Kosovo +(381)"];
	[CodeSelector addObject:@"Kuwait +(965)"];
	[CodeSelector addObject:@"Kyrgyzstan +(996)"];
	[CodeSelector addObject:@"Laos +(856)"];
	[CodeSelector addObject:@"Latvia +(371)"];
	[CodeSelector addObject:@"Lebanon +(961)"];
	[CodeSelector addObject:@"Lesotho +(266)"];
	[CodeSelector addObject:@"Liberia +(231)"];
	[CodeSelector addObject:@"Libya +(218)"];
	[CodeSelector addObject:@"Liechtenstein +(423)"];
	[CodeSelector addObject:@"Lithuania +(370)"];
	[CodeSelector addObject:@"Luxembourg +(352)"];
	[CodeSelector addObject:@"Macau +(853)"];
	[CodeSelector addObject:@"Macedonia +(389)"];
	[CodeSelector addObject:@"Madagascar +(261)"];
	[CodeSelector addObject:@"Malawi +(265)"];
	[CodeSelector addObject:@"Malaysia +(60)"];
	[CodeSelector addObject:@"Maldives +(960)"];
	[CodeSelector addObject:@"Mali +(223)"];
	[CodeSelector addObject:@"Malta +(356)"];
	[CodeSelector addObject:@"MarshallIslands +(692)"];
	[CodeSelector addObject:@"Mauritania +(222)"];
	[CodeSelector addObject:@"Mauritius +(230)"];
	[CodeSelector addObject:@"Mayotte +(262)"];
	[CodeSelector addObject:@"Mexico +(52)"];
	[CodeSelector addObject:@"Micronesia +(691)"];
	[CodeSelector addObject:@"Moldova +(373)"];
	[CodeSelector addObject:@"Monaco +(377)"];
	[CodeSelector addObject:@"Mongolia +(976)"];
	[CodeSelector addObject:@"Montenegro +(382)"];
	[CodeSelector addObject:@"Montserrat +(1664)"];
	[CodeSelector addObject:@"Morocco +(212)"];
	[CodeSelector addObject:@"Mozambique +(258)"];
	[CodeSelector addObject:@"Namibia +(264)"];
	[CodeSelector addObject:@"Nauru +(674)"];
	[CodeSelector addObject:@"Nepal +(977)"];
	[CodeSelector addObject:@"Netherlands +(31)"];
	[CodeSelector addObject:@"NetherlandsAntilles +(599)"];
	[CodeSelector addObject:@"NewCaledonia +(687)"];
	[CodeSelector addObject:@"NewZealand +(64)"];
	[CodeSelector addObject:@"Nicaragua +(505)"];
	[CodeSelector addObject:@"Niger +(227)"];
	[CodeSelector addObject:@"Nigeria +(234)"];
	[CodeSelector addObject:@"Niue +(683)"];
	[CodeSelector addObject:@"NorfolkIsland +(672)"];
	[CodeSelector addObject:@"NorthKorea +(850)"];
	[CodeSelector addObject:@"NorthernMarianaIslands +(1670)"];
	[CodeSelector addObject:@"Norway +(47)"];
	[CodeSelector addObject:@"Oman +(968)"];
	[CodeSelector addObject:@"Palau +(680)"];
	[CodeSelector addObject:@"Panama +(507)"];
	[CodeSelector addObject:@"PapuaNewGuinea +(675)"];
	[CodeSelector addObject:@"Paraguay +(595)"];
	[CodeSelector addObject:@"Peru +(51)"];
	[CodeSelector addObject:@"Philippines +(63)"];
	[CodeSelector addObject:@"PitcairnIslands +(870)"];
	[CodeSelector addObject:@"Poland +(48)"];
	[CodeSelector addObject:@"Portugal +(351)"];
	[CodeSelector addObject:@"PuertoRico +(1)"];
	[CodeSelector addObject:@"Qatar +(974)"];
	[CodeSelector addObject:@"RepublicoftheCongo +(242)"];
	[CodeSelector addObject:@"Romania +(40)"];
	[CodeSelector addObject:@"Russia +(7)"];
	[CodeSelector addObject:@"Rwanda +(250)"];
	[CodeSelector addObject:@"SaintBarthelemy +(590)"];
	[CodeSelector addObject:@"SaintHelena +(290)"];
	[CodeSelector addObject:@"SaintKittsandNevis +(1869)"];
	[CodeSelector addObject:@"SaintLucia +(1758)"];
	[CodeSelector addObject:@"SaintMartin +(1599)"];
	[CodeSelector addObject:@"SaintPierreandMiquelon +(508)"];
	[CodeSelector addObject:@"SaintVincentandtheGrenadines +(1784)"];
	[CodeSelector addObject:@"Samoa +(685)"];
	[CodeSelector addObject:@"SanMarino +(378)"];
	[CodeSelector addObject:@"SaoTomeandPrincipe +(239)"];
	[CodeSelector addObject:@"SaudiArabia +(966)"];
	[CodeSelector addObject:@"Senegal +(221)"];
	[CodeSelector addObject:@"Serbia +(381)"];
	[CodeSelector addObject:@"Seychelles +(248)"];
	[CodeSelector addObject:@"SierraLeone +(232)"];
	[CodeSelector addObject:@"Singapore +(65)"];
	[CodeSelector addObject:@"Slovakia +(421)"];
	[CodeSelector addObject:@"Slovenia +(386)"];
	[CodeSelector addObject:@"SolomonIslands +(677)"];
	[CodeSelector addObject:@"Somalia +(252)"];
	[CodeSelector addObject:@"SouthAfrica +(27)"];
	[CodeSelector addObject:@"SouthKorea +(82)"];
	[CodeSelector addObject:@"Spain +(34)"];
	[CodeSelector addObject:@"SriLanka +(94)"];
	[CodeSelector addObject:@"Sudan +(249)"];
	[CodeSelector addObject:@"Suriname +(597)"];
	[CodeSelector addObject:@"Swaziland +(268)"];
	[CodeSelector addObject:@"Sweden +(46)"];
	[CodeSelector addObject:@"Switzerland +(41)"];
	[CodeSelector addObject:@"Syria +(963)"];
	[CodeSelector addObject:@"Taiwan +(886)"];
	[CodeSelector addObject:@"Tajikistan +(992)"];
	[CodeSelector addObject:@"Tanzania +(255)"];
	[CodeSelector addObject:@"Thailand +(66)"];
	[CodeSelector addObject:@"Timor-Leste +(670)"];
	[CodeSelector addObject:@"Togo +(228)"];
	[CodeSelector addObject:@"Tokelau +(690)"];
	[CodeSelector addObject:@"Tonga +(676)"];
	[CodeSelector addObject:@"TrinidadandTobago +(1868)"];
	[CodeSelector addObject:@"Tunisia +(216)"];
	[CodeSelector addObject:@"Turkey +(90)"];
	[CodeSelector addObject:@"Turkmenistan +(993)"];
	[CodeSelector addObject:@"TurksandCaicosIslands +(1649)"];
	[CodeSelector addObject:@"Tuvalu +(688)"];
	[CodeSelector addObject:@"Uganda +(256)"];
	[CodeSelector addObject:@"Ukraine +(380)"];
	[CodeSelector addObject:@"Uruguay +(598)"];
	[CodeSelector addObject:@"USVirginIslands +(1340)"];
	[CodeSelector addObject:@"Uzbekistan +(998)"];
	[CodeSelector addObject:@"Vanuatu +(678)"];
	[CodeSelector addObject:@"Venezuela +(58)"];
	[CodeSelector addObject:@"Vietnam +(84)"];
	[CodeSelector addObject:@"WallisandFutuna +(681)"];
	[CodeSelector addObject:@"WestBank +(970)"];
	[CodeSelector addObject:@"Yemen +(967)"];
	[CodeSelector addObject:@"Zambia +(260)"];
	[CodeSelector addObject:@"Zimbabwe +(263)"];
	
	
	CodeSet = [[NSMutableArray alloc] init];
	
	
	[CodeSet addObject:@"91"];
	[CodeSet addObject:@"1"];
	[CodeSet addObject:@"1"];
	[CodeSet addObject:@"44"];
	[CodeSet addObject:@"61"];
	[CodeSet addObject:@"92"];
	[CodeSet addObject:@"971"];
	[CodeSet addObject:@"93"];
	[CodeSet addObject:@"355"];
	[CodeSet addObject:@"213"];
	[CodeSet addObject:@"1684"];
	[CodeSet addObject:@"376"];
	[CodeSet addObject:@"244"];
	[CodeSet addObject:@"1264"];
	[CodeSet addObject:@"672"];
	[CodeSet addObject:@"1268"];
	[CodeSet addObject:@"54"];
	[CodeSet addObject:@"374"];
	[CodeSet addObject:@"297"];
	[CodeSet addObject:@"43"];
	[CodeSet addObject:@"994"];
	[CodeSet addObject:@"1242"];
	[CodeSet addObject:@"973"];
	[CodeSet addObject:@"880"];
	[CodeSet addObject:@"1246"];
	[CodeSet addObject:@"375"];
	[CodeSet addObject:@"32"];
	[CodeSet addObject:@"501"];
	[CodeSet addObject:@"229"];
	[CodeSet addObject:@"1441"];
	[CodeSet addObject:@"975"];
	[CodeSet addObject:@"591"];
	[CodeSet addObject:@"387"];
	[CodeSet addObject:@"267"];
	[CodeSet addObject:@"55"];
	[CodeSet addObject:@"1284"];
	[CodeSet addObject:@"673"];
	[CodeSet addObject:@"359"];
	[CodeSet addObject:@"226"];
	[CodeSet addObject:@"95"];
	[CodeSet addObject:@"257"];
	[CodeSet addObject:@"855"];
	[CodeSet addObject:@"237"];
	[CodeSet addObject:@"238"];
	[CodeSet addObject:@"1345"];
	[CodeSet addObject:@"236"];
	[CodeSet addObject:@"235"];
	[CodeSet addObject:@"56"];
	[CodeSet addObject:@"86"];
	[CodeSet addObject:@"61"];
	[CodeSet addObject:@"61"];
	[CodeSet addObject:@"57"];
	[CodeSet addObject:@"269"];
	[CodeSet addObject:@"682"];
	[CodeSet addObject:@"506"];
	[CodeSet addObject:@"385"];
	[CodeSet addObject:@"53"];
	[CodeSet addObject:@"357"];
	[CodeSet addObject:@"420"];
	[CodeSet addObject:@"243"];
	[CodeSet addObject:@"45"];
	[CodeSet addObject:@"253"];
	[CodeSet addObject:@"1767"];
	[CodeSet addObject:@"1809"];
	[CodeSet addObject:@"593"];
	[CodeSet addObject:@"20"];
	[CodeSet addObject:@"503"];
	[CodeSet addObject:@"240"];
	[CodeSet addObject:@"291"];
	[CodeSet addObject:@"372"];
	[CodeSet addObject:@"251"];
	[CodeSet addObject:@"500"];
	[CodeSet addObject:@"298"];
	[CodeSet addObject:@"679"];
	[CodeSet addObject:@"358"];
	[CodeSet addObject:@"33"];
	[CodeSet addObject:@"689"];
	[CodeSet addObject:@"241"];
	[CodeSet addObject:@"220"];
	[CodeSet addObject:@"970"];
	[CodeSet addObject:@"995"];
	[CodeSet addObject:@"49"];
	[CodeSet addObject:@"233"];
	[CodeSet addObject:@"350"];
	[CodeSet addObject:@"30"];
	[CodeSet addObject:@"299"];
	[CodeSet addObject:@"1473"];
	[CodeSet addObject:@"1671"];
	[CodeSet addObject:@"502"];
	[CodeSet addObject:@"224"];
	[CodeSet addObject:@"245"];
	[CodeSet addObject:@"592"];
	[CodeSet addObject:@"509"];
	[CodeSet addObject:@"39"];
	[CodeSet addObject:@"504"];
	[CodeSet addObject:@"852"];
	[CodeSet addObject:@"36"];
	[CodeSet addObject:@"354"];
	[CodeSet addObject:@"62"];
	[CodeSet addObject:@"98"];
	[CodeSet addObject:@"964"];
	[CodeSet addObject:@"353"];
	[CodeSet addObject:@"972"];
	[CodeSet addObject:@"39"];
	[CodeSet addObject:@"225"];
	[CodeSet addObject:@"1876"];
	[CodeSet addObject:@"81"];
	[CodeSet addObject:@"962"];
	[CodeSet addObject:@"7"];
	[CodeSet addObject:@"254"];
	[CodeSet addObject:@"686"];
	[CodeSet addObject:@"381"];
	[CodeSet addObject:@"965"];
	[CodeSet addObject:@"996"];
	[CodeSet addObject:@"856"];
	[CodeSet addObject:@"371"];
	[CodeSet addObject:@"961"];
	[CodeSet addObject:@"266"];
	[CodeSet addObject:@"231"];
	[CodeSet addObject:@"218"];
	[CodeSet addObject:@"423"];
	[CodeSet addObject:@"370"];
	[CodeSet addObject:@"352"];
	[CodeSet addObject:@"853"];
	[CodeSet addObject:@"389"];
	[CodeSet addObject:@"261"];
	[CodeSet addObject:@"265"];
	[CodeSet addObject:@"60"];
	[CodeSet addObject:@"960"];
	[CodeSet addObject:@"223"];
	[CodeSet addObject:@"356"];
	[CodeSet addObject:@"692"];
	[CodeSet addObject:@"222"];
	[CodeSet addObject:@"230"];
	[CodeSet addObject:@"262"];
	[CodeSet addObject:@"52"];
	[CodeSet addObject:@"691"];
	[CodeSet addObject:@"373"];
	[CodeSet addObject:@"377"];
	[CodeSet addObject:@"976"];
	[CodeSet addObject:@"382"];
	[CodeSet addObject:@"1664"];
	[CodeSet addObject:@"212"];
	[CodeSet addObject:@"258"];
	[CodeSet addObject:@"264"];
	[CodeSet addObject:@"674"];
	[CodeSet addObject:@"977"];
	[CodeSet addObject:@"31"];
	[CodeSet addObject:@"599"];
	[CodeSet addObject:@"687"];
	[CodeSet addObject:@"64"];
	[CodeSet addObject:@"505"];
	[CodeSet addObject:@"227"];
	[CodeSet addObject:@"234"];
	[CodeSet addObject:@"683"];
	[CodeSet addObject:@"672"];
	[CodeSet addObject:@"850"];
	[CodeSet addObject:@"1670"];
	[CodeSet addObject:@"47"];
	[CodeSet addObject:@"968"];
	[CodeSet addObject:@"680"];
	[CodeSet addObject:@"507"];
	[CodeSet addObject:@"675"];
	[CodeSet addObject:@"595"];
	[CodeSet addObject:@"51"];
	[CodeSet addObject:@"63"];
	[CodeSet addObject:@"870"];
	[CodeSet addObject:@"48"];
	[CodeSet addObject:@"351"];
	[CodeSet addObject:@"1"];
	[CodeSet addObject:@"974"];
	[CodeSet addObject:@"242"];
	[CodeSet addObject:@"40"];
	[CodeSet addObject:@"7"];
	[CodeSet addObject:@"250"];
	[CodeSet addObject:@"590"];
	[CodeSet addObject:@"290"];
	[CodeSet addObject:@"1869"];
	[CodeSet addObject:@"1758"];
	[CodeSet addObject:@"1599"];
	[CodeSet addObject:@"508"];
	[CodeSet addObject:@"1784"];
	[CodeSet addObject:@"685"];
	[CodeSet addObject:@"378"];
	[CodeSet addObject:@"239"];
	[CodeSet addObject:@"966"];
	[CodeSet addObject:@"221"];
	[CodeSet addObject:@"381"];
	[CodeSet addObject:@"248"];
	[CodeSet addObject:@"232"];
	[CodeSet addObject:@"65"];
	[CodeSet addObject:@"421"];
	[CodeSet addObject:@"386"];
	[CodeSet addObject:@"677"];
	[CodeSet addObject:@"252"];
	[CodeSet addObject:@"27"];
	[CodeSet addObject:@"82"];
	[CodeSet addObject:@"34"];
	[CodeSet addObject:@"94"];
	[CodeSet addObject:@"249"];
	[CodeSet addObject:@"597"];
	[CodeSet addObject:@"268"];
	[CodeSet addObject:@"46"];
	[CodeSet addObject:@"41"];
	[CodeSet addObject:@"963"];
	[CodeSet addObject:@"886"];
	[CodeSet addObject:@"992"];
	[CodeSet addObject:@"255"];
	[CodeSet addObject:@"66"];
	[CodeSet addObject:@"670"];
	[CodeSet addObject:@"228"];
	[CodeSet addObject:@"690"];
	[CodeSet addObject:@"676"];
	[CodeSet addObject:@"1868"];
	[CodeSet addObject:@"216"];
	[CodeSet addObject:@"90"];
	[CodeSet addObject:@"993"];
	[CodeSet addObject:@"1649"];
	[CodeSet addObject:@"688"];
	[CodeSet addObject:@"256"];
	[CodeSet addObject:@"380"];
	[CodeSet addObject:@"44"];
	[CodeSet addObject:@"598"];
	[CodeSet addObject:@"1340"];
	[CodeSet addObject:@"998"];
	[CodeSet addObject:@"678"];
	[CodeSet addObject:@"58"];
	[CodeSet addObject:@"84"];
	[CodeSet addObject:@"681"];
	[CodeSet addObject:@"970"];
	[CodeSet addObject:@"67"];
	[CodeSet addObject:@"260"];
	[CodeSet addObject:@"263"];
	
	
	
	
	
	
	
	pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0,5,320,300)];
	//pickerView.center = CGPointMake(10,  320/2);
	pickerView.delegate = self;
	pickerView.tag=1;
	pickerView.showsSelectionIndicator = YES;
	[self.view addSubview:pickerView];
	
	//btn.alpha	= 0;
    //	closeit					= [UIButton buttonWithType:UIButtonTypeCustom];
    //	closeit.frame			=CGRectMake(250/2-35+0,400-10-15	,75,34);
    //	//closeit.center = CGPointMake(320/2,  210);
    //	closeit.userInteractionEnabled=YES;
    //	[closeit setBackgroundImage:[UIImage imageNamed:@"done_btn.png"] forState:UIControlStateNormal];
    //	[closeit addTarget:self action:@selector(unloadCountryCode) forControlEvents:UIControlEventTouchUpInside];
    //	[self.view addSubview:closeit];
	
	
	
	//	StatusSubmit = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"submitmail.png"]];
	//	//StatusSubmit.frame = CGRectMake(196/4, 165, 100, 32);
	//	StatusSubmit.frame = CGRectMake(504-20+(196/4),180,100,32);
	//	StatusSubmit.userInteractionEnabled = YES;
	//	[self.view addSubview:StatusSubmit];
	//	[StatusSubmit release];
	//
	//	StatusLabel = [[UILabel alloc] initWithFrame:CGRectMake(508,13,186,27)];
	//	StatusLabel.backgroundColor =[UIColor clearColor];
	//	StatusLabel.font = [UIFont fontWithName:@"Helvetica Neue" size: 17.0];
	//	[self.view addSubview:StatusLabel];
	//	[StatusLabel release];
	
}


#pragma mark -
#pragma mark Picker View Methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
	
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
	return [CodeSelector count];
	
	
	
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	return [CodeSelector objectAtIndex:row];
	
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	NSLog(@"Selected Type: %@. Index of selected Type: %i", [CodeSelector objectAtIndex:row], row);
	_CountryCode.text=[NSString stringWithFormat:@"%@",[CodeSet objectAtIndex:row]];
	// StatusLabel.text=[NSString stringWithFormat:@"%@",[TIMESelector objectAtIndex:row]];
	NSLog(@"MailTime.text=%@",_CountryCode.text);
	[pickerView removeFromSuperview];
	//[self unloadCountryCode];
}

-(void)pickerViewDidReceiveTouch:(UIPickerView *)pickerView {
	
	[self.view endEditing:YES];
	[self unloadCountryCode];
    //	[_CountryCode resignFirstResponder];
    //	[_Number resignFirstResponder];
    //	[_Email1 resignFirstResponder];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	//If the user touched on our view we set the text field to resign
	//first responder to minimize the keyboard
	
	
	[self unloadCountryCode];
	[_CountryCode resignFirstResponder];
	[_Number resignFirstResponder];
	[_Email1 resignFirstResponder];
    
	
	[self performSelector:@selector(keyboardWillHide:) withObject:nil afterDelay:0.0];
    
	
    
	//   [self ReverseAnimation];
	
	
	
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	
	
	if ([touch view]==_ccpatch) {
		
		[self unloadCountryCode];
		
		[self loadCountryCodes];
		//[textField resignFirstResponder];
		
		//		[UIView beginAnimations:@"Animate Text Field Up" context:nil];
		//		[UIView setAnimationDuration:.3];
		//		[UIView setAnimationBeginsFromCurrentState:YES];
		//
		//		_LOGINVIEW.frame = CGRectMake(_LOGINVIEW.frame.origin.x,
		//							    -200,
		//							    _LOGINVIEW.frame.size.width,
		//							    _LOGINVIEW.frame.size.height);
		//
		//		[UIView commitAnimations];
		
		[_CountryCode resignFirstResponder];
		//		[_Number resignFirstResponder];
		//		[_Email1 resignFirstResponder];
		
		
		[self performSelector:@selector(keyboardWillHide:) withObject:nil afterDelay:0.0];
        
		
	}
}

- (BOOL)validateEmailWithString:(NSString*)email
{
	NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
	NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
	if( [emailTest evaluateWithObject:email] == YES){
		stricterFilter = TRUE;
		NSLog(@"Match!");
	} else {
		stricterFilter = FALSE;
		NSLog(@"No match!");
		
	}
}

- (IBAction)termsButton:(id)sender {
	
	[self.navigationController setNavigationBarHidden:NO animated:YES];
	[self performSelector:@selector(keyboardWillHide:) withObject:nil afterDelay:0.0];
    
	
    	R_iphone4PolicyViewController *policy = [[R_iphone4PolicyViewController alloc]initWithNibName:@"R_iphone4PolicyViewController" bundle:nil];
    policy.TAGIS=@"1";
    	[self.navigationController pushViewController:policy animated:YES];
}




- (IBAction)getMeButtonTapped:(id)sender {
    if(!_accountStore)
        _accountStore = [[ACAccountStore alloc] init];
    
    ACAccountType *facebookTypeAccount = [_accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierFacebook];
    
    [_accountStore requestAccessToAccountsWithType:facebookTypeAccount
                                           options:@{ACFacebookAppIdKey: @"131830717001239", ACFacebookPermissionsKey: @[@"email"]}
                                        completion:^(BOOL granted, NSError *error) {
                                            if(granted){
                                                NSArray *accounts = [_accountStore accountsWithAccountType:facebookTypeAccount];
                                                _facebookAccount = [accounts lastObject];
                                                NSLog(@"Success");
                                                
                                                [self me];
                                            }else{
                                                // ouch
                                                NSLog(@"Fail");
                                                NSLog(@"Error: %@", error);
                                            }
                                        }];
}

- (void)me{
    NSURL *meurl = [NSURL URLWithString:@"https://graph.facebook.com/me"];
    
    SLRequest *merequest = [SLRequest requestForServiceType:SLServiceTypeFacebook
                                              requestMethod:SLRequestMethodGET
                                                        URL:meurl
                                                 parameters:nil];
    
    merequest.account = _facebookAccount;
    
    [merequest performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
        NSString *meDataString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
        
        NSLog(@"%@", meDataString);
        
        
		NSDictionary* json = [NSJSONSerialization JSONObjectWithData:responseData //1
                                                             options:kNilOptions
                                                               error:&error];
		
        
        
        NSString *name = [json objectForKey:@"email"];
        NSLog(@"email=%@",name);
        _Email1.text = name;

        
        NSString *insertSQL = [NSString stringWithFormat: @"INSERT INTO USER (ID, NAME ,  PHONE , EMAIL , USERNAME,  IMAGE ) VALUES (\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\")",@"1", name, @"", name, @"",nil];
        NSLog(@"query=%@",insertSQL);
        [self saveData:insertSQL];
        NSUserDefaults *setUserDefaults=[NSUserDefaults standardUserDefaults];
        [setUserDefaults setInteger:1 forKey:@"fbSwitch"];
        [setUserDefaults setInteger:2 forKey:@"twtSwitch"];

        
        
    }];
    
}


@end
