//
//  iphone5CastNCrew.m
//  YJHD
//
//  Created by Ashwini Pawar on 15/04/13.
//  Copyright (c) 2013 SKI USA 35. All rights reserved.
//

#import "iphone5CastNCrew.h"
#import "GlobalClass.h"
#import "Merchandise.h"
#import "iphone5Settings.h"
#import "iphone5GroupViewController.h"

@interface iphone5CastNCrew ()

@end

@implementation iphone5CastNCrew
UILabel * label ;
CGSize maximumLabelSize;

@synthesize ranbirCharacterView,ranbirNameView,deepikaNameView,DeepikaCharacterView,kalkiCharacterView,kalkiNameView,scroll,check,adityaChracterView,adityaNameView ,fromDetailsVC,footerView;

@synthesize ranbirCharacterLabel,ranbirLabel,bunnyLabel,deepikaCharacterLabel,DeepikaLabel,nainaLabel,aditiLabel,kalkiCharacterLabel,kalkiLabel,aviLabel,adityaChracterLabel,adityaLabel,bigView;
@synthesize  ranbirMorePics,deepikaMorePics,kalkiMorePics,adityaMorePics;
@synthesize Scroller1= _Scroller1,pagingbackground,imageView3,imageView4,productionHouseButtonRef;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(id)initwithStr:(NSString *)_fromDeatilVC
{
    if(self)
    {
        fromDetailsVC = _fromDeatilVC;
    }
    return  self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.trackedViewName=@"Cast and Crew Screen";

    //self.navigationItem.title=@"Cast And Crew";
    GlobalClass *obj1=[GlobalClass getInstance];
    
	[self DisplayCast];
    
    int m=0;
    
    for (int i=0; i<TotalData+1; i++)
    {
        PAGINGEFFECT[i]  = [[UIImageView alloc] initWithFrame:CGRectMake(296, m+180, 12,13)];
        PAGINGEFFECT[i].userInteractionEnabled=YES;
        PAGINGEFFECT[i].image= [UIImage imageNamed:@"iph5cnc_black_dot.png"];
        [self.view addSubview:PAGINGEFFECT[i]];
        PAGINGEFFECT[i].tag= i;
        
        m+=22;
    }
    
    PAGINGEFFECT[0].image= [UIImage imageNamed:@"iph5cnc_red_dot.png"];
    
    
    
	[self getdata];
    
		[_Scroller1 setContentSize:CGSizeMake(320, 464*TotalData+464)];
     bigView.frame = CGRectMake(0, 0, 320, 464*TotalData);
    
//    if ([obj1.coming isEqualToString:@"1"])
//    {
//        
//        if ([self.navigationController.navigationBar respondsToSelector:@selector( setBackgroundImage:forBarMetrics:)])
//        {
//			[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"header_bar.png"] forBarMetrics:UIBarMetricsDefault];
//            
//	    }
//    }
//	else {
//        if ([self.navigationController.navigationBar respondsToSelector:@selector( setBackgroundImage:forBarMetrics:)]){
			
//        }
    
    UIImage *buttonImage = [UIImage imageNamed:@"back-btn.png"];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:buttonImage forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, buttonImage.size.width, buttonImage.size.height);
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = customBarItem;
    
//    UIImage *relAppImage = [UIImage imageNamed:@"home_right_rel_icon.png"];
//        UIButton *buttonChat = [UIButton buttonWithType:UIButtonTypeCustom];
//       [buttonChat setImage:relAppImage forState:UIControlStateNormal];
//       buttonChat.frame = CGRectMake(0, 0, relAppImage.size.width, relAppImage.size.height);
//        [buttonChat addTarget:self action:@selector(toRelApp:) forControlEvents:UIControlEventTouchUpInside];
//        UIBarButtonItem *customBarItem1 = [[UIBarButtonItem alloc] initWithCustomView:buttonChat];
//       self.navigationItem.RightBarButtonItem = customBarItem1;

    NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"app_bg_image"];
    UIImage* app_bg_image = [UIImage imageWithData:imageData];
    self.view.backgroundColor = [UIColor colorWithPatternImage:app_bg_image];
    
    footerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"footer_bg.png"]];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"home_header_bg.jpg"] forBarMetrics:UIBarMetricsDefault];
   // }
	//obj1.coming=@"2";
    
      
    
    scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(7, 10, 306,461)];
    scroll.userInteractionEnabled	=YES;
    scroll.alpha =0.0;
    scroll.delegate=self;
    scroll.pagingEnabled = NO;
    scroll.showsVerticalScrollIndicator = YES;
    scroll.scrollEnabled = YES;
    [scroll setContentSize:CGSizeMake(306,223)];
    
    scrollBgImage = [[UIImageView alloc]initWithFrame:CGRectMake(7, 15, 306,461)];
    scrollBgImage.backgroundColor = [UIColor blackColor];
    scrollBgImage.alpha = 0.0;
    [self.view addSubview:scrollBgImage];
    
    Description = [[UILabel alloc] initWithFrame:CGRectMake(7,20,306,441)];
    maximumLabelSize = CGSizeMake(306, 5000);
	Description.backgroundColor = [UIColor clearColor];
	
	Description.textAlignment = UITextAlignmentLeft;
	Description.numberOfLines =0;
	Description.lineBreakMode= NSLineBreakByWordWrapping;
	Description.font = [UIFont fontWithName:@"Helvitica Neue " size:14.0 ];
    [Description sizeToFit];
    NSLog(@"Check = %d",check);
    
    
    if([fromDetailsVC isEqual: @"ToCastnCrew"])
    {
        for (int i=0; i<TotalData; i++)
        {
            PAGINGEFFECT[i].alpha = 0.0;
        }
        
        
    }
    if(check == 4)
    {
        _Scroller1.scrollEnabled = NO;
    }
    else if(check == 1)
    {
        [bigView setCenter:CGPointMake(160, 401)];
        _Scroller1.scrollEnabled = NO;
       
        
    }
    else if(check == 2)
    {
        [bigView setCenter:CGPointMake(160,0)];
    
        _Scroller1.scrollEnabled = NO;
    }
    else if(check == 3)
    {
        [bigView setCenter:CGPointMake(160,-401)];
            _Scroller1.scrollEnabled = NO;
    }
    
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(scrollTracker) userInfo:nil repeats:YES];
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


-(void)DisplayCast
{
    [self getdata];
    int m= 0;
    for(int i=0;i<TotalData;i++)
    {
      
        webImageView[i] = [[UIWebView alloc] initWithFrame:CGRectMake(7, m+0, 306,430)];
		webImageView[i].userInteractionEnabled=YES;
		webImageView[i].delegate =self;
		webImageView[i].tag=i;
		NSURL *url = [NSURL URLWithString:data[i]];
		//            //URL Requst Object
		NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
		//            //Load the request in the UIWebView.
		[webImageView[i] loadRequest:requestObj];
		webImageView[i].scrollView.bounces = NO;
		webImageView[i].scrollView.scrollEnabled = NO;
        webImageView[i].scalesPageToFit = YES;
        webImageView[i].backgroundColor = [UIColor clearColor];
        webImageView[i].opaque = NO;
		[bigActivityIndicator[i] stopAnimating];

		[bigView addSubview:webImageView[i]];
        
        
        BlackImage[i] = [[UIImageView alloc]initWithFrame:CGRectMake(0, 430-30, 306, 30)];
        BlackImage[i].backgroundColor = [UIColor blackColor];
        BlackImage[i].alpha = 0.7;
        [webImageView[i] addSubview:BlackImage[i]];
        
        castNameLabel[i] = [[UILabel alloc] initWithFrame:CGRectMake(5, 3 ,300, 25)];
		castNameLabel[i].backgroundColor =[UIColor clearColor];
		castNameLabel[i].textColor= [UIColor whiteColor];
        castNameLabel[i].numberOfLines = 2;
        castNameLabel[i].text=webtitle[i];
		castNameLabel[i].font = [UIFont fontWithName:@"Helvetica Neue" size: 18.0];
		[BlackImage[i] addSubview:castNameLabel[i]];

        
        charSketchButton[i] = [UIButton buttonWithType:UIButtonTypeCustom];
        charSketchButton[i].frame = CGRectMake(7, 430+m, 196, 31);
        [charSketchButton[i] setBackgroundImage:[UIImage imageNamed:@"iph5cnc_character_scetch_btn.jpg"] forState:UIControlStateNormal];
        charSketchButton[i].userInteractionEnabled=YES;
        charSketchButton[i].tag=i;
        [charSketchButton[i] addTarget:self action:@selector(ranbirCharacterButton:) forControlEvents:UIControlEventTouchUpInside];
        [bigView addSubview:charSketchButton[i]];
        
        
        dwnloadWallButton[i] = [UIButton buttonWithType:UIButtonTypeCustom];
        dwnloadWallButton[i].frame = CGRectMake(203, 430+m, 110, 31);
        [dwnloadWallButton[i] setBackgroundImage:[UIImage imageNamed:@"iph5cnc_more_photos_btn.jpg"] forState:UIControlStateNormal];
        dwnloadWallButton[i].userInteractionEnabled=YES;
        dwnloadWallButton[i].tag=i;
        [dwnloadWallButton[i] addTarget:self action:@selector(Downloads:) forControlEvents:UIControlEventTouchUpInside];
        [bigView addSubview:dwnloadWallButton[i]];
        
        blackDwnView[i] = [[UIImageView alloc]initWithFrame:CGRectMake(7, m+461, 306, 3)];
        blackDwnView[i].image = [UIImage imageNamed:@"cnc_btn_btttom_border.jpg"];
        [bigView addSubview:blackDwnView[i]];
        
       
        m=m+464;
    }
      bigView.frame = CGRectMake(0, 0, 320, 464*TotalData);
    
    productionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    productionButton.frame = CGRectMake(7, m, 306, 464);
    [productionButton setBackgroundImage:[UIImage imageNamed:@"color_pacth_400x400.png"] forState:UIControlStateNormal];
    
    
    UIActivityIndicatorView* productionActivityIndicator = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    [productionActivityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
    productionActivityIndicator.center = CGPointMake(productionButton.frame.size.width/2,productionButton.frame.size.height/2);
    [productionButton addSubview:productionActivityIndicator];
    [productionActivityIndicator startAnimating];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), ^(void) {
        NSURL *url = [NSURL URLWithString:prodImageStr];
        NSLog(@"URL...!!!! %@",url);
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        UIImage *image1 = [UIImage imageWithData:imageData];
        [productionButton setBackgroundImage:image1 forState:UIControlStateNormal];
        [productionActivityIndicator stopAnimating];
    });
    
    productionButton.userInteractionEnabled=YES;
    [productionButton addTarget:self action:@selector(buttonProductionDetails:) forControlEvents:UIControlEventTouchUpInside];
    [_Scroller1 addSubview:productionButton];

   
}




-(void)viewWillAppear:(BOOL)animated{
  
    
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(20,10,300,20)];
    
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:@"Helvetica Neue Bold" size: 20.0];
    [label setFont:[UIFont boldSystemFontOfSize:20]];
    
    Description.text = @" ";
    label.text = @" ";
}


-(void)scrollTracker
{
    
    for (int i=0; i<TotalData+1; i++) {
        if (_Scroller1.contentOffset.y == 464*i) {
            for (int i=0; i<TotalData+1; i++) {
                PAGINGEFFECT[i].image= [UIImage imageNamed:@"iph5cnc_black_dot.png"];
                
            }
            PAGINGEFFECT[i].image= [UIImage imageNamed:@"iph5cnc_red_dot.png"];
            
        }
        
        
    }
  
    
}
-(void)getdata
{
	GlobalClass *obj=[GlobalClass getInstance];
	NSLog(@"ddata=%@",obj.CNC);
	
	int i=0;
	for (NSDictionary *actoAgent in obj.CNC)
	{
        data[i]= [actoAgent objectForKey:@"big_image"];
		NSLog(@"big_image=%@",data[i]);
        
		webtitle[i]= [actoAgent objectForKey:@"actor_name"];
		NSLog(@"actor_name=%@",webtitle[i]);
		
		webdesc[i]= [actoAgent objectForKey:@"description"];
		NSLog(@"description=%@",webdesc[i]);
		i++;
        
        
	}
    TotalData = i;
    
    for(NSDictionary *producationImage in obj.productionImage)
    {
        
        prodImageStr= [producationImage objectForKey:@"production_img"];
		NSLog(@"production_img=%@",prodImageStr);
        
    }



}

-(void)back {
    
    if(scroll.alpha == 0.0)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else{
      
        scrollBgImage.alpha = 0.0;
        scroll.alpha = 0.0;
        self.view.alpha = 1.0;
        scroll.bounds = CGRectMake(0, 0, 320, 461);
        for (int i=0; i<TotalData; i++)
        {
            if([fromDetailsVC isEqual: @"ToCastnCrew"])
            {
                PAGINGEFFECT[i].alpha = 0.0;
                
            }
            else
            {
                 dwnloadWallButton[i].alpha = 1.0;
                PAGINGEFFECT[i].alpha = 1.0;
                 charSketchButton[i].alpha = 1.0;
                dwnloadWallButton[i].alpha = 1.0;
                pagingbackground.alpha = 1.0;
                blackDwnView[i].alpha = 1.0;
            }
            
        }

    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonProductionDetails:(id)sender {
    iPhone5DetailCastNCrewViewController *detailCastVC = [[iPhone5DetailCastNCrewViewController alloc]initWithNibName:@"iPhone5DetailCastNCrewViewController" bundle:nil];
    [self.navigationController pushViewController:detailCastVC animated:YES];
}

- (IBAction)ranbirCharacterButton:(UIButton*)sender {
    
    scrollBgImage.alpha =0.5;
    scroll.alpha = 1.0;
    scroll.backgroundColor = [UIColor clearColor];
    scroll.frame = CGRectMake(7, 15, 306,461);
    scroll.contentSize = CGSizeMake(306, 1000);
    scroll.scrollEnabled = YES;
    Description.textColor = [UIColor whiteColor];
   
    label.textColor = [UIColor whiteColor];
    Description.text = @" ";
    label.text = @" ";

    for (int i=0; i<TotalData; i++)
    {
        blackDwnView[i].alpha = 0.0;
  
    if([sender tag ]==i)
    {
        
        
        NSLog(@"sender tag = %d",[sender tag]);
        
        Description.text = @" ";
        label.text = @" ";
        
        label.text = webtitle[i];
        [label sizeToFit];
        [scroll addSubview:label];
        
        CGSize expectedLabelSize = [webdesc[i] sizeWithFont:Description.font constrainedToSize:maximumLabelSize lineBreakMode:Description.lineBreakMode];
        
        CGRect newFrame = Description.frame;
        newFrame.size.height = expectedLabelSize.height;
        Description.frame = CGRectMake(10, 55, 300, expectedLabelSize.height);
        scroll.contentSize=CGSizeMake(306, expectedLabelSize.height+100);
        NSLog(@"height-=%f",expectedLabelSize.height);
        Description.text=webdesc[i];
        [Description sizeToFit];
        //        [self.view addSubview:scroll];
        Description.alpha = 1.0;
        [scroll addSubview:Description];
        
    }
}

    [self.view addSubview:scroll];
    [self.view addSubview:_footerMainView];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    
    Description.text = @" ";
    label.text = @" ";
    scroll.alpha = 0.0;
    scrollBgImage.alpha = 0.0;

//    [label removeFromSuperview];
//    
//    label =nil;

    
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
-(IBAction)Downloads:(id)sender
{
	MainWallpapers *loginViewController = [[MainWallpapers alloc] initWithNibName:@"MainWallpapers" bundle:nil];
	[self.navigationController pushViewController:loginViewController animated:NO];
	
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
	NSLog(@"yes");
	for (int i =0; i<TotalData; i++) {
		
		
		if (webView.tag==i) {
			
			
			ActIndImage1[i] = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,306,461)];
			//  ActIndImage1[i].center = CGPointMake(320/2, 460/2);
			ActIndImage1[i].image = [UIImage imageNamed:@"color_pacth_400x400.png"];
			ActIndImage1[i].alpha=0.7;
			[webImageView[i] addSubview:ActIndImage1[i]];
			
			activityIndicator1[i] = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
			activityIndicator1[i].center=CGPointMake(306/2, 461/2);
			//activityIndicator1[i].transform = CGAffineTransformMakeScale(1.0, 1.0);
			[activityIndicator1[i] setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
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


@end
