//
//  Notification.m
//  YJHD
//
//  Created by Ashwini Pawar on 09/04/13.
//  Copyright (c) 2013 SKI USA 35. All rights reserved.
//

#import "NotificationVC.h"
#import "iphone4Settings.h"
#import "GroupViewController.h"
#import "iphone4Merchandise.h"

@interface NotificationVC ()

@end

@implementation NotificationVC
@synthesize  notificationTableView;
UIView *myView1;
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
     _footerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"footer_bg.png"]];
    NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"app_bg_image"];
    UIImage* app_bg_image = [UIImage imageWithData:imageData];
    self.view.backgroundColor = [UIColor colorWithPatternImage:app_bg_image];
  //    arr = [[NSMutableArray alloc]init];
//    [arr addObject:@"YJHD- Push Notification"];
//    [arr addObject:@"Yeh Jawani Hai Deewani -Coming Soon"];
//    [arr addObject:@"YJHD-Releasing 31st May"];
//    
    GlobalClass *obj1=[GlobalClass getInstance];
//    if ([obj1.coming isEqualToString:@"1"])
//	{
//		
//		if ([self.navigationController.navigationBar respondsToSelector:@selector( setBackgroundImage:forBarMetrics:)])
//		{
//			[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"header_bar.png"] forBarMetrics:UIBarMetricsDefault];
//			
//		}
//	}
//	else {
//		if ([self.navigationController.navigationBar respondsToSelector:@selector( setBackgroundImage:forBarMetrics:)]){
//			[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bar_clean.png"] forBarMetrics:UIBarMetricsDefault];
//		}
		
//		UIImage *buttonImage = [UIImage imageNamed:@"c&c_top_back_btn.png"];
//		UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//		[button setImage:buttonImage forState:UIControlStateNormal];
//		button.frame = CGRectMake(0, 0, buttonImage.size.width, buttonImage.size.height);
//		[button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
//		UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] initWithCustomView:button];
//		self.navigationItem.leftBarButtonItem = customBarItem;
		
	//}
	obj1.coming=@"2";
    
    notificationTableView.backgroundColor = [UIColor clearColor];
	
	
	
	activityIndicator = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
	activityIndicator.center=CGPointMake(320/2, 460/2);
	// activityIndicator.transform = CGAffineTransformMakeScale(2.0, 2.0);
	[activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
	[self.view addSubview:activityIndicator];
	[activityIndicator startAnimating];
	
	
	
	[self performSelector:@selector(fetchAllData) withObject:nil afterDelay:0.0];
    
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



-(IBAction)toRelApp:(UIButton *)sender
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Under construction" message:@"Check Back Soon" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    
}

- (IBAction)chat:(id)sender
{
        GroupViewController *group = [[GroupViewController alloc]initWithNibName:@"GroupViewController" bundle:nil];
       [self.navigationController pushViewController:group animated:YES];
    
    
    
}
- (IBAction)merchandise:(id)sender
{
      iphone4Merchandise *merchandise = [[iphone4Merchandise alloc]initWithNibName:@"iphone4Merchandise" bundle:nil];
       [self.navigationController pushViewController:merchandise animated:YES];
    
}


- (IBAction)myProfile:(id)sender
{
    iphone4Settings *setting = [[iphone4Settings alloc]initWithNibName:@"iphone4Settings" bundle:nil];
    [self.navigationController pushViewController:setting animated:YES];
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    _footerMainView.frame = CGRectMake(0, 398, _footerMainView.frame.size.width, _footerMainView.frame.size.height);

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


-(void)getdata
{
	GlobalClass *obj=[GlobalClass getInstance];
	NSLog(@"ddata=%@",obj.Notifications);
	
	int i=0;
	for (NSDictionary *actoAgent in obj.videolinks)
	{
		data1[i]= [actoAgent objectForKey:@"title"];
		NSLog(@"title=%@",data1[i]);
		
		data2[i]= [actoAgent objectForKey:@"description"];
		NSLog(@"description=%@",data2[i]);
		
		i++;
	}
	TotalData=i;
	
}

-(void)displayNotification
{
    
}
#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//	return [arr count];
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
////    if (cell == nil) {
////        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
////    }
////    
////
////    UILabel * songLable = [[UILabel alloc]initWithFrame:CGRectMake(5, 22, 290, 25)];
////    songLable.text = [arr objectAtIndex:indexPath.row];
////    songLable.textColor = [UIColor whiteColor];
////    songLable.backgroundColor = [UIColor clearColor];
////    [cell.contentView addSubview:songLable];
//
//	
//	if (nil == cell) {
//		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
//		cell.detailTextLabel.font = [UIFont systemFontOfSize:12];
//		cell.detailTextLabel.textColor = [UIColor whiteColor];
//	//	[cell.textLabel ]
//		cell.detailTextLabel.numberOfLines = 3;
//	}
//	cell.selectionStyle = UITableViewCellSelectionStyleNone;
//	cell.detailTextLabel.text = [arr objectAtIndex:indexPath.row];
//   
//
////    
////    UIView *myView = [[UIView alloc] init];
////        myView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"box2.png"]];
////   // myView.alpha = 1.0;
////   [cell setBackgroundView:myView];
//    
////    myView1 = [[UIView alloc] init];
////    myView1.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"box1.png"]];
//   // myView1.alpha = 0.3;
//    
// // [cell setSelectedBackgroundView:myView1];
//    
//        
//    return cell;
//	
//	
//    
//    
//}
//
//
//#pragma mark - Table view delegate
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//   [[tableView cellForRowAtIndexPath:indexPath] setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"box1.png"]]];
//}
//
//- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSIndexPath *currentSelectedIndexPath = [tableView indexPathForSelectedRow];
//    if (currentSelectedIndexPath != nil)
//    {
//        [[tableView cellForRowAtIndexPath:currentSelectedIndexPath] setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"box1.png"]]];
//    }
//    
//    return indexPath;
//}
//
//
//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (cell.isSelected == YES)
//    {
//        [cell setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"box1.png"]]];
//    }
//    else
//    {
//        [cell setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"box2.png"]]];
//    }
//}
//
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 95;
//}

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
//	dispatch_async(dispatch_get_global_queue(0, 0), ^{
		
        GlobalClass *obj=[GlobalClass getInstance];
        
        NSString* post = [NSString stringWithFormat:@"http://apps.medialabs24x7.com/besharam/fetch_notifications_ios.php?deviceno=%@&notification_id=",obj.dev];
        
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
			
				
				
//            NSDictionary *resp = [json objectForKey:@"response"];
//            NSString *response;
//            for (NSDictionary *actoAgent in resp)
//            {
//                response= [actoAgent objectForKey:@"response"];
//                
//            }
//            NSLog(@"jsonn=%@",json);
//
//
//				
//            
//            if ([response isEqualToString:@"success"]) {
            
            
            NSString *response = [json objectForKey:@"response"];
            //NSString *response;
            //                    for (NSDictionary *actoAgent in resp)
            //                    {
            //                        response= [actoAgent objectForKey:@"response"];
            //
            //                    }
            
            
            
            if ([response isEqualToString:@"success"]) {

                NSDictionary *resp = [json objectForKey:@"notifications"];

				int i=0;
				for (NSDictionary *actoAgent in resp)
				{
					data1[i] =[actoAgent objectForKey:@"id"];
					NSLog(@"id=%@", data1[i]);
					
					data2[i] =[actoAgent objectForKey:@"noti_msg"];
					NSLog(@"noti_msg=%@", data2[i]);
					//
					//
					//				data3[i] =[actoAgent objectForKey:@"description"];
					//				NSLog(@"description=%@", data3[i]);
					//
					
					
					
					i++;
				}
				NumOfRows=i;
                
                [self LOADTABLE];

            }
            
            else{
                [activityIndicator stopAnimating];
//                UIAlertView *alret1 = [[UIAlertView alloc]initWithTitle:@"No New Notification" message:nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//                 [alret1 show];

                
            }
				
			//	dispatch_async(dispatch_get_main_queue()	, ^{
					
					
					
			//	});
				
				
				
			
			
		}
		
		
		
		
		
		
//	});
	
        
	
}
-(void)LOADTABLE
{
	[activityIndicator stopAnimating];
	arr = [[NSMutableArray alloc] init];
	
	for (int a =0; a<NumOfRows; a++) {
		
		NSString *str = [NSString stringWithFormat:@"%@", data2[a]];
		NSLog(@"data=%@",data2[a]);
		//[arr addObject:str];
	}
	
	
//	notificationTableView = [[UITableView alloc] initWithFrame:CGRectMake(7, 0, 308, 392) style:UITableViewStylePlain];
//	notificationTableView.dataSource = self;
//	notificationTableView.delegate = self;
//	notificationTableView.backgroundColor = [UIColor clearColor];
//	notificationTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//	
//	[self.view addSubview: notificationTableView];
    
    int m=0;
	NSLog(@"hi");
	for (int i =0; i<NumOfRows; i++)
    {
        imagewall[i] = [[UIImageView alloc] initWithFrame:CGRectMake(7, m+20, 308,95)];
		imagewall[i].userInteractionEnabled=YES;
        imagewall[i].image = [UIImage imageNamed:@"box2.png"];
		imagewall[i].tag=i;
        [_notiScroll addSubview:imagewall[i]];
        
//        NSString    *str=[NSString stringWithFormat:@"R-Push %d",i];
//        mainLabel[i] = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 500, 30)];
//		mainLabel[i].backgroundColor =[UIColor clearColor];
//		mainLabel[i].textColor= [UIColor whiteColor];
//        mainLabel[i].text=str;
//		mainLabel[i].font = [UIFont fontWithName:@"Helvetica Neue" size: 18.0];
//		[imagewall[i] addSubview:mainLabel[i]];
        
        subLabel[i] = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 290, 85)];
		subLabel[i].backgroundColor =[UIColor clearColor];
        subLabel[i].numberOfLines = 5;
		subLabel[i].textColor= [UIColor whiteColor];
        subLabel[i].text=data2[i];
        
		subLabel[i].font = [UIFont fontWithName:@"Helvetica Neue" size: 12.0];
		[imagewall[i] addSubview:subLabel[i]];
        
        
        closeButton[i] = [[UIButton alloc] initWithFrame:CGRectMake(289, m+10, 31,34)];
		closeButton[i].userInteractionEnabled=YES;
        closeButton[i].tag=i;
        [closeButton[i] addTarget:self action:@selector(close:)forControlEvents:UIControlEventTouchUpInside];
        closeButton[i].backgroundColor =  [UIColor colorWithPatternImage:[UIImage imageNamed:@"close1.png"]];
		closeButton[i].tag=i;
        [_notiScroll addSubview:closeButton[i]];
        
        
        m+=100;
        
    }
    _notiScroll.contentSize = CGSizeMake(306, 105*NumOfRows);

    
    
    [self.view addSubview:_footerMainView];
	

}

-(void)close:(UIButton*) sender
{
    [activityIndicator startAnimating];

    for (int i =0; i<NumOfRows; i++)
    {
        [mainLabel[i] removeFromSuperview];
     
        mainLabel[i] = nil;
		[subLabel[i] removeFromSuperview];

        subLabel[i] = nil;
        
        
        [closeButton[i] removeFromSuperview];

        closeButton[i] = nil;
        
        
        [imagewall[i] removeFromSuperview];

        imagewall[i] = nil;

  
        
    }


      //  dispatch_async(dispatch_get_global_queue(0, 0), ^{
            
            GlobalClass *obj=[GlobalClass getInstance];
            
            NSString* post = [NSString stringWithFormat:@"http://apps.medialabs24x7.com/besharam/fetch_notifications_update_ios.php?deviceno=%@&notification_id=%@",obj.dev,data1[sender.tag]];
            NSLog(@"postt=%@",post);
              
                    
                
                
                
                NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:post] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:5.0];
                
                
                
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
                    
                    NSString *response = [json objectForKey:@"response"];
                    //NSString *response;
//                    for (NSDictionary *actoAgent in resp)
//                    {
//                        response= [actoAgent objectForKey:@"response"];
//                        
//                    }
                    
                    
                    
                    if ([response isEqualToString:@"success"]) {
                        
                        NSDictionary *resp = [json objectForKey:@"notifications"];
                        
                        int i=0;
                        for (NSDictionary *actoAgent in resp)
                        {
                            data1[i] =[actoAgent objectForKey:@"id"];
                            NSLog(@"id=%@", data1[i]);
                            
                            data2[i] =[actoAgent objectForKey:@"noti_msg"];
                            NSLog(@"noti_msg=%@", data2[i]);
                            //
                            //
                            //				data3[i] =[actoAgent objectForKey:@"description"];
                            //				NSLog(@"description=%@", data3[i]);
                            //
                            
                            
                            
                            i++;
                        }
                        NumOfRows=i;
                        
                        [self LOADTABLE];

                    }
                    
                    else{
                        [activityIndicator stopAnimating];

//                        UIAlertView *alret1 = [[UIAlertView alloc]initWithTitle:@"No New Notification" message:nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//                        [alret1 show];

                    }
                    
                 //   dispatch_async(dispatch_get_main_queue()	, ^{
                        
                        
                        
                //    });
                    
                    
                    
                    
                    
                }
            
            
            
            
            
            
  //      });
	
	   
    
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
     _footerMainView.frame = CGRectMake(0, 398, _footerMainView.frame.size.width, _footerMainView.frame.size.height);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setNotificationTableView:nil];
    [super viewDidUnload];
}
@end
