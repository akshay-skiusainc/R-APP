//
//  NewsViewController.m
//  Relapp
//
//  Created by Ashwini Pawar on 05/08/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import "NewsViewController.h"
#import "GlobalClass.h"
#import "OpenNewsViewController.h"
#import "Merchandise.h"
#import "iphone5GroupViewController.h"

@interface NewsViewController ()

@end

@implementation NewsViewController
@synthesize Scroller,newsScroll,shareButton,bigBackView,bigNewsImage,bigActivityIndicator,bigDetailDesc,bigSmallDesc,footerView,mainActivityinadicator;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
       
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.trackedViewName=@"News Screen";

   // self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"home_main_bg.jpg"]];
    NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"app_bg_image"];
    UIImage* app_bg_image = [UIImage imageWithData:imageData];
    self.view.backgroundColor = [UIColor colorWithPatternImage:app_bg_image];
   
   
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"home_header_bg.jpg"] forBarMetrics:UIBarMetricsDefault];
        
    [mainActivityinadicator startAnimating];
    [self performSelector:@selector(fetchAllData) withObject:nil afterDelay:0.0];

    footerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"footer_bg.png"]];

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
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:YES];
    // [self performSelector:@selector(openFooter1:) withObject:nil afterDelay:0.01 ];
    _footerMainView.frame = CGRectMake(0, 487, _footerMainView.frame.size.width, _footerMainView.frame.size.height);
}
-(void)back {
    
    [self.navigationController popViewControllerAnimated:YES];
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

- (IBAction)myProfile:(id)sender {
    iphone5Settings *setting = [[iphone5Settings alloc]initWithNibName:@"iphone5Settings" bundle:nil];
    [self.navigationController pushViewController:setting animated:YES];
    
}



-(void)fetchAllData
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{

    GlobalClass *obj=[GlobalClass getInstance];
    
	NSString* post = [NSString stringWithFormat:@"http://apps.medialabs24x7.com/besharam/fetch_data_news.php?deviceno=%@",obj.dev];
	
	
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
		
		
		NSError* error;
		NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data //1
                                                             options:kNilOptions
                                                               error:&error];
		
		
		
		NSLog(@"json=%@",json);
		
		
		NSDictionary* newsData = [json objectForKey:@"news"]; 
		
			
		GlobalClass *obj=[GlobalClass getInstance];
		obj.news = newsData;
	        
    }
	
        dispatch_async(dispatch_get_main_queue()	, ^{
            [self DisplayNews];
            [mainActivityinadicator stopAnimating];
            mainActivityinadicator.alpha = 0.0;
        });
        
    });
	
}
-(void)getdata
{
	GlobalClass *obj=[GlobalClass getInstance];
	NSLog(@"NEWSDATA=%@",obj.news);
	
	int i=0;
	for (NSDictionary *actoAgent in obj.news)
	{
        data[i]= [actoAgent objectForKey:@"image"];
		NSLog(@"image=%@",data[i]);
        
        
        
        data1[i]= [actoAgent objectForKey:@"title"];
		NSLog(@"title=%@",data1[i]);
		
        
        data2[i]= [actoAgent objectForKey:@"description"];
		NSLog(@"description=%@",data2[i]);
        
        data3[i]= [actoAgent objectForKey:@"news_id"];
		NSLog(@"news_id=%@",data3[i]);
		i++;
    }
    TotalData = i;
    
}


-(void)DisplayNews
{
    [self getdata];
    
    int m = 0;
    Scroller = [[UIScrollView alloc] initWithFrame:CGRectMake(0,15,320,489)];
    Scroller.userInteractionEnabled	=YES;
    
    Scroller.showsVerticalScrollIndicator = YES;
    Scroller.scrollEnabled = YES;
    [self.view addSubview:Scroller];
    for(int a=0;a<TotalData;a++)
    {
       

        
        backView[a] = [[UIView alloc]initWithFrame:CGRectMake(11, m, 298, 293)];
        backView[a].backgroundColor = [UIColor whiteColor];
        backView[a].userInteractionEnabled = YES;

      
        newsImage[a].userInteractionEnabled = YES;
      
        
        if (newsImage[a]    == nil)
        {
            newsImage[a] = [[AsyncImageView alloc] initWithFrame:CGRectMake(0, 0, 298, 119)];
            
            newsImage[a].contentMode = UIViewContentModeScaleToFill;
        }
        
        newsImage[a].backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];

        
        newsImage[a].userInteractionEnabled=YES;
        //cancel any previously loading images for this view
        [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:newsImage[a]];
        
        //set image URL. AsyncImageView class will then dynamically load the image
        NSURL *url1 = [NSURL URLWithString:data[a]];
        
        ((AsyncImageView *)newsImage[a]).imageURL =url1;
        // _view1 = view;
        
        [backView[a] addSubview:newsImage[a]];

        
       
        smallDesc[a] = [[UILabel alloc] initWithFrame:CGRectMake(12, 119 ,270, 70)];
		smallDesc[a].backgroundColor =[UIColor clearColor];
        if(a % 2)
        {
            smallDesc[a].textColor= [self colorWithHexString:@"a680df"];
        }
        else
        {
            smallDesc[a].textColor= [self colorWithHexString:@"4ab9c3"];
        }
        smallDesc[a].text=[data1[a] uppercaseString];
        smallDesc[a].numberOfLines = 2;
		smallDesc[a].font = [UIFont fontWithName:@"Helvetica Neue" size: 20.0];
		[backView[a] addSubview:smallDesc[a]];

        detailDesc[a] = [[UILabel alloc] initWithFrame:CGRectMake(12, 180 ,270, 80)];
		detailDesc[a].backgroundColor =[UIColor clearColor];
		detailDesc[a].textColor= [UIColor grayColor];
        detailDesc[a].numberOfLines = 5;
        detailDesc[a].text=data2[a];
		detailDesc[a].font = [UIFont fontWithName:@"Helvetica Neue" size: 15.0];
		[backView[a] addSubview:detailDesc[a]];
        
        detailButton[a] = [[UIImageView alloc]initWithFrame: CGRectMake(250, 260, 42, 32)];
     
        if(a % 2)
        {
            detailButton[a].image = [UIImage imageNamed:@"news_bnr3.png"];
        }
        else
        {
            detailButton[a].image = [UIImage imageNamed:@"news_bnr2.png"];
                   }
      //  detailButton[a].userInteractionEnabled=YES;
        detailButton[a].tag=a;
       // [detailButton[a] addTarget:self action:@selector(openNews:) forControlEvents:UIControlEventTouchUpInside];
        [backView[a] addSubview:detailButton[a]];        

        
        UITapGestureRecognizer *webViewTapped6 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openNews:)];
        backView[a].tag = a;
        webViewTapped6.numberOfTapsRequired = 1;
        webViewTapped6.delegate = self;
        [backView[a] addGestureRecognizer:webViewTapped6];
        
         [Scroller addSubview:backView[a]];
                m = m+300;
    }
    [self.view addSubview:_footerMainView];
    Scroller.contentSize = CGSizeMake(320, 300*TotalData+20);
}


- (void)openNews:(UIButton *)sender
{
      UITapGestureRecognizer *gesture = (UITapGestureRecognizer *) sender;
   // sender.tag = gesture.view.tag;
    
    NSLog(@"okokokok");
      OpenNewsViewController *openNewsVC = [[OpenNewsViewController alloc]initWithNibName:@"OpenNewsViewController" bundle:nil];
    int a= gesture.view.tag;
    openNewsVC.tagApply = a;
    openNewsVC.smallDescStr = data1[a];
    openNewsVC.detailDescStr = data2[a];
    openNewsVC.imageStr = data[a];
    openNewsVC.newsID = data3[a];
    NSLog(@"News id is  ...!! = %@",data3[a]);
    [self.navigationController pushViewController:openNewsVC animated:YES];
//
//    UINavigationController *navigationController        = [[UINavigationController alloc] initWithRootViewController:openNewsVC];
//    navigationController.modalTransitionStyle                = UIModalTransitionStyleCrossDissolve;
//    navigationController.modalPresentationStyle                = UIModalPresentationFormSheet;
//    navigationController.navigationBar.hidden                = YES;
//        
//    navigationController.view.superview.frame = CGRectMake(0, 0    , 298,470);//it's important to do this after
//    navigationController.view.superview.center = CGPointMake(298/2, 470/2);
      
   
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

- (void)shareNews:(UIButton *)sender
{
    
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(UIButton *)sender
{
    if (bigBackView.alpha == 1.0)
    {
		[bigBackView removeFromSuperview];
        bigBackView = nil;
        for(int a=0;a<TotalData;a++)
        {
            backView[a].alpha = 1.0;
        }        
   	}
    else
    {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

- (IBAction)toRelianceApp:(UIButton*)sender {
}
@end
