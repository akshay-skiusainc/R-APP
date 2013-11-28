//
//  PolicyViewController.m
//  YJHD
//
//  Created by Ashwini Pawar on 03/04/13.
//  Copyright (c) 2013 SKI USA 35. All rights reserved.
//

#import "iphone5PolicyViewController.h"
#import "iphone5Settings.h"
#import "Merchandise.h"
#import "iphone5GroupViewController.h"

@interface iphone5PolicyViewController ()

@end

@implementation iphone5PolicyViewController
@synthesize Scroller,policyLabel,footerView,TAGIS;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"app_bg_image"];
    UIImage* app_bg_image = [UIImage imageWithData:imageData];
    self.view.backgroundColor = [UIColor colorWithPatternImage:app_bg_image];
    
        
    [Scroller setContentSize:CGSizeMake(320, 504*5)];

	
	activityIndicator = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
	activityIndicator.center=CGPointMake(320/2, 548/2);
	// activityIndicator.transform = CGAffineTransformMakeScale(2.0, 2.0);
	[activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
	[self.view addSubview:activityIndicator];
	[activityIndicator startAnimating];
	
    if ([TAGIS isEqualToString:@"1"]) {
        _footerMainView.alpha = 0.0;
        
        
    }
	
	[self performSelector:@selector(fetchAllData) withObject:nil afterDelay:0.0];

	
	
	//Scroller.contentSize=CGSizeMake(320, 7000);

//    UIImage *relAppImage = [UIImage imageNamed:@"home_right_rel_icon.png"];
//    UIButton *buttonChat = [UIButton buttonWithType:UIButtonTypeCustom];
//    [buttonChat setImage:relAppImage forState:UIControlStateNormal];
//    buttonChat.frame = CGRectMake(0, 0, relAppImage.size.width, relAppImage.size.height);
//    [buttonChat addTarget:self action:@selector(toRelApp:) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *customBarItem1 = [[UIBarButtonItem alloc] initWithCustomView:buttonChat];
//    self.navigationItem.RightBarButtonItem = customBarItem1;
    
    // Do any additional setup after loading the view from its nib.
    UIImage *buttonImage = [UIImage imageNamed:@"back-btn.png"];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:buttonImage forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, buttonImage.size.width, buttonImage.size.height);
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = customBarItem;
    
	
    
}
-(void)back {
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillDisappear:(BOOL)animated{
	[super viewWillDisappear:YES];
    if ([TAGIS isEqualToString:@"1"]) {
     [self.navigationController setNavigationBarHidden:YES animated:NO];
        
    }
	[self.navigationController setNavigationBarHidden:NO animated:NO];
	
}

-(void)fetchAllData
{
	dispatch_async(dispatch_get_global_queue(0, 0), ^{
		
        GlobalClass *obj=[GlobalClass getInstance];
		NSString* post = [NSString stringWithFormat:@"http://apps.medialabs24x7.com/besharam/fetch_privacy_ios.php?deviceno=%@",obj.dev];
		
		
		
		
		
		
		NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:post] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:5.0];
		
		
		
		[request setHTTPMethod:@"GET"];
		[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Current-Type"];
		NSError *errorReturned = nil;
		NSURLResponse *theResponse =[[NSURLResponse alloc]init];
		NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&theResponse error:&errorReturned];
		
		
		if (errorReturned) {
			NSLog(@"errorReturned=%@",errorReturned);
			[activityIndicator stopAnimating];
//			
//			UIAlertView* alertBox = [[ UIAlertView alloc]initWithTitle:@"Network Error" message:@"Network Not Connected" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Retry", nil ];
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
			
			
			//		NSURLResponse *response;
			//		NSData *urlData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
			//		NSString *stringResponse = [[NSString alloc] initWithData:urlData encoding:NSASCIIStringEncoding];
			//		NSLog(@"response1=%@",stringResponse);
			//
			//		//
			//		////
			//		NSArray *responseDict = [stringResponse JSONValue];
			
			//	for (NSDictionary *actoAgent in responseDict){
			
			
			// NSLog(@"json: %@", json); //3
			
			
			
			
			//for (NSDictionary *actoAgent in responseDict){
			
		//	NSLog(@"json=%@",json);
			
			
            for (NSDictionary *actoAgent in json)
            {
                description = [actoAgent    objectForKey:@"p_content"];
                
                NSLog(@"description=%@",description);
                
            }

			
			
			//	NSDictionary* fetched = [json objectForKey:@"interview"]; //2
//			int i=1;
//			for (NSDictionary *actoAgent in interviewdata)
//			{
//				description =[actoAgent objectForKey:@"description"];
//				NSLog(@"smallImage=%@", description);
//				
//							
//				
//				
//					
//		}
		dispatch_async(dispatch_get_main_queue()	, ^{
			CGSize maximumLabelSize = CGSizeMake(315, 7200);
			
			CGSize expectedLabelSize = [description sizeWithFont:policyLabel.font constrainedToSize:maximumLabelSize lineBreakMode:policyLabel.lineBreakMode];
			
			CGRect newFrame = policyLabel.frame;
			newFrame.size.height = expectedLabelSize.height;
			policyLabel.frame = CGRectMake(17, 63, 285, expectedLabelSize.height);
			Scroller.contentSize=CGSizeMake(320, expectedLabelSize.height+200);
			NSLog(@"height-=%f",expectedLabelSize.height);
			Scroller.userInteractionEnabled	=YES;
			Scroller.showsVerticalScrollIndicator = YES;
			Scroller.scrollEnabled = YES;
			
			policyLabel.text=description;
			
			
			[activityIndicator stopAnimating];




			//[self FetchPrivacy];
		});
		}
	});
    
    [self.view addSubview:_footerMainView];
}

				
				

				
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
        NSLog(@"touchesEnded    ----    directionUp");//Ashwini
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



- (IBAction)toRelApp:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Under construction" message:@"Check Back Soon" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    
}
//Ashwini
- (IBAction)myProfile:(id)sender {
    iphone5Settings *setting = [[iphone5Settings alloc]initWithNibName:@"iphone5Settings" bundle:nil];
    [self.navigationController pushViewController:setting animated:YES];
    
}
//- (IBAction)shareButton:(id)sender {
//    if(fbTweetView.alpha == 0.0)
//    {
//        fbTweetView.alpha = 1.0;
//    }
//    else if(fbTweetView.alpha ==1.0)
//    {
//        fbTweetView.alpha = 0.0;
//    }
//    
//}



@end
