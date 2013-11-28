//
//  HelpViewController.m
//  YJHD
//
//  Created by SKI USA 35 on 4/10/13.
//  Copyright (c) 2013 SKI USA 35. All rights reserved.
//

#import "iphone5HelpViewController.h"
#import "iphone5Settings.h"
#import "Merchandise.h"
#import "iphone5GroupViewController.h"

@interface iphone5HelpViewController ()

@end

@implementation iphone5HelpViewController
@synthesize footerView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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


- (void)viewDidLoad
{
    [super viewDidLoad];
	
	
    NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"app_bg_image"];
    UIImage* app_bg_image = [UIImage imageWithData:imageData];
    self.view.backgroundColor = [UIColor colorWithPatternImage:app_bg_image];
		
	
	activityIndicator = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
	activityIndicator.center=CGPointMake(320/2, 548/2);
	// activityIndicator.transform = CGAffineTransformMakeScale(2.0, 2.0);
	[activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
	[self.view addSubview:activityIndicator];
	[activityIndicator startAnimating];
	
	
	
	[self performSelector:@selector(fetchAllData) withObject:nil afterDelay:0.0];
	// Do any additional setup after loading the view from its nib.
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
     [self.view addSubview:_footerMainView];
	
    
}
-(void)back {
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillDisappear:(BOOL)animated{
	[super viewWillDisappear:YES];
	[self.navigationController setNavigationBarHidden:NO animated:NO];

	}
-(void)viewWillAppear:(BOOL)animated
{
    	[super viewWillAppear:YES];
    	[self.navigationController setNavigationBarHidden:NO animated:NO];
    
    
    
}

-(void)fetchAllData
{
    GlobalClass *obj=[GlobalClass getInstance];
	dispatch_async(dispatch_get_global_queue(0, 0), ^{
		
		NSString* post = [NSString stringWithFormat:@"http://apps.medialabs24x7.com/besharam/fetch_data_all_faq_ios.php?deviceno=%@",obj.dev];
		
		
		
		
		
		
		NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:post] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:5.0];
		
		
		
		[request setHTTPMethod:@"GET"];
		[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Current-Type"];
		NSError *errorReturned = nil;
		NSURLResponse *theResponse =[[NSURLResponse alloc]init];
		NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&theResponse error:&errorReturned];
		
		
		if (errorReturned) {
			NSLog(@"errorReturned=%@",errorReturned);
			[activityIndicator stopAnimating];
			
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
			
			NSLog(@"json=%@",json);
			
			
//		//	NSDictionary* interviewdata = [json objectForKey:@"news"]; //2
			
			
			
			
			//	NSDictionary* fetched = [json objectForKey:@"interview"]; //2
			int i=0;
			for (NSDictionary *actoAgent in json)
			{
							
				data1[i] =[actoAgent objectForKey:@"title"];
				NSLog(@"title=%@", data1[i]);
				
				
				data2[i] =[actoAgent objectForKey:@"faq1"];
				NSLog(@"faq1=%@", data2[i]);
				
//				data3[i] =[actoAgent objectForKey:@"faq2"];
//				NSLog(@"faq2=%@", data2[i]);
//				
//				data4[i] =[actoAgent objectForKey:@"faq3"];
//				NSLog(@"faq3=%@", data2[i]);
//				
//				
//				data5[i] =[actoAgent objectForKey:@"faq4"];
//				NSLog(@"faq4=%@", data2[i]);
				
				
				
				
				
				i++;
			}
			NumOfRows=i;
			
					
			
		}
		dispatch_async(dispatch_get_main_queue()	, ^{
			[self loadtable];
            [self.view addSubview:_footerMainView];
            
		});
		
	});
}


-(void)loadtable
{
	
	
	[activityIndicator stopAnimating];
	
	
		_quotes = [[NSMutableArray alloc] init];
		
		for (int i =0; i<NumOfRows; i++) {
			
			NSString *str = [NSString stringWithFormat:@"%@",data1[i]];
			NSLog(@"data=%@",data1[i]);
			[_quotes addObject:str];
		}
		
		_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, 320, 464) style:UITableViewStylePlain];
		_tableView.dataSource = self;
		_tableView.delegate = self;
		_tableView.backgroundColor = [UIColor clearColor];
		_tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
    
		//_tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"news_background.jpg"]];
		_tableView.layer.cornerRadius=10;

		[self.view addSubview: _tableView];
    
		
}



- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
	return [_quotes count];
}


- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.backgroundColor = [self colorWithHexString:@"ffffff"];
    return YES;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	NSString* reuseIdentifier = @"Cell";
	UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
	
	if (nil == cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
		cell.textLabel.font = [UIFont systemFontOfSize:14];
		cell.textLabel.numberOfLines = 10;
	}
	
    cell.backgroundColor=[UIColor clearColor];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
	cell.textLabel.backgroundColor= [UIColor clearColor];
	cell.textLabel.text = [_quotes objectAtIndex:indexPath.row];
	
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	
	UIView *myView = [[UIView alloc] init];
    myView.backgroundColor=[UIColor whiteColor];
    myView.alpha=0.5;
	
//	if(indexPath.row % 2)
//	{
//		myView.backgroundColor = [self colorWithHexString:@"ffffff"];
//	}
//	else
//	{
//		myView.backgroundColor = [self colorWithHexString:@"ffffff"];
//	}
	//myView.alpha = 0.5;
	cell.backgroundView = myView;
	
	
//	cell.backgroundView =  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"info_full_comm_sml_box.png"] ];
    
	cell.imageView.image = [UIImage imageNamed:@"ma_faq_quest-btn.png"];
	//	cell.selectedBackgroundView =  [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:@"info_full_comm_sml_box.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0]];
	return cell;
}


#pragma mark - UITableViewDelegate methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//	CGSize size = [[_quotes objectAtIndex:indexPath.row]
//				sizeWithFont:[UIFont systemFontOfSize:14]
//				constrainedToSize:CGSizeMake(300, CGFLOAT_MAX)];
//	return size.height + 10;
	
	
	return 69;
}


- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	iphone5help2ViewController *help = [[iphone5help2ViewController alloc] initWithNibName:@"iphone5help2ViewController" bundle:nil];
	help.faq1 = data2[indexPath.row];
    
    NSLog(@"help navigation=================================================== %@", help.faq1 );
//	UINavigationController *navigationController	= [[UINavigationController alloc] initWithRootViewController:help];
//	navigationController.modalTransitionStyle		= UIModalTransitionStyleCoverVertical;
//	navigationController.modalPresentationStyle		= UIModalPresentationFormSheet;
//	navigationController.navigationBar.hidden		= YES;
//	[self presentModalViewController:navigationController animated:NO];
//	navigationController.view.superview.frame = CGRectMake(10, 100    , 300,300);//it's important to do this after
	//navigationController.view.superview.center = CGPointMake(1024/2, 768/2);

	[self.navigationController pushViewController:help animated:NO];
	//[self presentModalViewController:help animated:YES ];

	
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
