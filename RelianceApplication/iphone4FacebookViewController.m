//
//  iphone4FacebookViewController.m
//  RelianceApplication
//
//  Created by Ashwini Pawar on 13/08/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import "iphone4FacebookViewController.h"
#import "iphone4Settings.h"
#import "iphone4Merchandise.h"
#import "GroupViewController.h"

@interface iphone4FacebookViewController ()

@end

@implementation iphone4FacebookViewController
@synthesize footerView,bigImageView,movieNameLabel,dateBigLabel,descLabel,socialFeedsBgView,singleScrollImage,singleFeedScroll;
//@synthesize faceBookBtn,twitterBtn,emailBtn;


CGSize maximumLabelSize;
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
    self.trackedViewName=@"Facebook Feed Screen";

    NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"app_bg_image"];
    UIImage* app_bg_image = [UIImage imageWithData:imageData];
    self.view.backgroundColor = [UIColor colorWithPatternImage:app_bg_image];

    
    footerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"footer_bg.png"]];
    
	activityIndicator = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
	activityIndicator.center=CGPointMake(320/2, 524/2);
	[activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
	[self.view addSubview:activityIndicator];
	[activityIndicator startAnimating];
	
	
	
    infoButton.alpha=0.0;
    
        [self performSelector:@selector(fetchAllData) withObject:nil afterDelay:0.0];
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
    
    VideoScroller.alpha=1.0;
    singleFeedScroll.alpha=0.0;
    singleScrollImage.alpha=0.0;
    _closeButton .alpha = 0.0;
}
-(void)back {
    
    [self.navigationController popViewControllerAnimated:YES];
}
-(IBAction)toRelApp:(UIButton *)sender
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Under construction" message:@"Check Back Soon" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    
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


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
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
    // [self performSelector:@selector(openFooter1:) withObject:nil afterDelay:0.01 ];
    
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

//
//- (NSString *)messageTitle
//{
//    return @"Rate YJHD";
//}
//
//- (NSString *)message
//{
//
//    return @"If you enjoy playing YJHD, would you mind taking a moment to rate it? It won’t take more than a minute. Thanks for your support!";
//}
//
//- (NSString *)cancelButtonLabel
//{
//
//    return @"No, Thanks";
//}
//
//- (NSString *)rateButtonLabel
//{
//
//    return @"Rate It Now";
//}
//
//- (NSString *)remindButtonLabel
//{
//
//    return @"Remind Me Later";
//}
//- (void)resizeAlertView:(UIAlertView *)alertView
//{
//    if (!self.disableAlertViewResizing)
//    {
//        NSInteger imageCount = 0;
//        CGFloat offset = 0.0f;
//        CGFloat messageOffset = 0.0f;
//        for (UIView *view in alertView.subviews)
//        {
//            CGRect frame = view.frame;
//            if ([view isKindOfClass:[UILabel class]])
//            {
//                UILabel *label = (UILabel *)view;
//                if ([label.text isEqualToString:alertView.title])
//                {
//                    [label sizeToFit];
//                    offset = label.frame.size.height - fmax(0.0f, 45.f - label.frame.size.height);
//                    if (label.frame.size.height > frame.size.height)
//                    {
//                        offset = messageOffset = label.frame.size.height - frame.size.height;
//                        frame.size.height = label.frame.size.height;
//                    }
//                }
//                else if ([label.text isEqualToString:alertView.message])
//                {
//                    label.lineBreakMode = NSLineBreakByWordWrapping;
//                    label.numberOfLines = 0;
//                    label.alpha = 1.0f;
//                    [label sizeToFit];
//                    offset += label.frame.size.height - frame.size.height;
//                    frame.origin.y += messageOffset;
//                    frame.size.height = label.frame.size.height;
//                }
//            }
//            else if ([view isKindOfClass:[UITextView class]])
//            {
//                view.alpha = 0.0f;
//            }
//            else if ([view isKindOfClass:[UIImageView class]])
//            {
//                if (imageCount++ > 0)
//                {
//                    view.alpha = 0.0f;
//                }
//            }
//            else if ([view isKindOfClass:[UIControl class]])
//            {
//                frame.origin.y += offset;
//            }
//            view.frame = frame;
//        }
//        CGRect frame = alertView.frame;
//        frame.origin.y -= roundf(offset/2.0f);
//        frame.size.height += offset;
//        alertView.frame = frame;
//    }
//}
//
//
//- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
//{
//    if(alertView.tag == 1)
//    {
//    GlobalClass *obj=[GlobalClass getInstance];
//
//    if (buttonIndex == alertView.cancelButtonIndex)
//    {
//        //ignore this version
//        obj.rateit=@"1";
//
//    }
//    else if (([self.cancelButtonLabel length] && buttonIndex == 2) ||
//             ([self.cancelButtonLabel length] == 0 && buttonIndex == 1))
//    {
//
//        obj.rateit=@"1";
//
//
//
//
//    }
//    else
//    {
//
//        NSString *str = [NSString stringWithFormat:@"http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=633116022&onlyLatestVersion=true&pageNumber=0&sortOrdering=1&type=Purple+Software"];
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
//
//        obj.rateit=@"1";
//
//
//    }
//    }
//    else{
//
//    }
//
//
//}

-(void)openFeedWebPage:(id)sender
{
	
    //	UITapGestureRecognizer *gesture = (UITapGestureRecognizer *) sender;
    //	NSLog(@"tag=%d",gesture.view.tag);
    //
    //	iphone5OpenFeedsViewController *dvController = [[iphone5OpenFeedsViewController alloc] initWithNibName:@"iphone5OpenFeedsViewController" bundle:[NSBundle mainBundle]];
    //
    //	     dvController.Selected = @"Facebook Feeds";
    //
    //        dvController.strUrl = data3[gesture.view.tag];
    //
    //	[self.navigationController pushViewController:dvController animated:YES];
    //
    //	dvController = nil;
	
}


- (IBAction)merchandise:(id)sender
{
       iphone4Merchandise *merchandise = [[iphone4Merchandise alloc]initWithNibName:@"iphone4Merchandise" bundle:nil];
       [self.navigationController pushViewController:merchandise animated:YES];
    
    
}

- (IBAction)chat:(id)sender
{
      GroupViewController *group = [[GroupViewController alloc]initWithNibName:@"GroupViewController" bundle:nil];
     [self.navigationController pushViewController:group animated:YES];
    
      
}

- (IBAction)myProfile:(id)sender
{
    iphone4Settings *setting = [[iphone4Settings alloc]initWithNibName:@"iphone4Settings" bundle:nil];
    [self.navigationController pushViewController:setting animated:YES];
    
}



-(void)DisplayFeeds
{
	
	[self getdata];
     NSLog(@"Total number of Rows in FB ===== %d",TotalNumOfRows);
	infoButton.alpha=1.0;
	
	VideoScroller			= [[UIScrollView alloc] initWithFrame:CGRectMake(0,33,320,350)];
	VideoScroller.userInteractionEnabled	=YES;
	VideoScroller.showsHorizontalScrollIndicator = YES;
	VideoScroller.pagingEnabled = NO;
	[self.view addSubview:VideoScroller];
	
	int m=0;
	
    
	for (int i =0; i<TotalNumOfRows; i++)
    {
        
        
        
		NSLog(@"sharetext%@[%d]",shareText[i],i);
		ImagePatch[i] = [[UIImageView alloc] initWithFrame:CGRectMake(6, m+9, 311,312)];
		ImagePatch[i].userInteractionEnabled=YES;
		ImagePatch[i].image = [UIImage imageNamed:@"bg_box.png"];
		// ImagePatch[i].backgroundColor= [UIColor blueColor];
		[VideoScroller addSubview:ImagePatch[i]];
		ImagePatch[i].tag= i;
		
        UITapGestureRecognizer *tapped123 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openFeedWebPage:)];
        tapped123.numberOfTapsRequired = 1;
        [ImagePatch[i] addGestureRecognizer:tapped123];
		
		
		fbLogo[i] = [[UIImageView alloc] initWithFrame:CGRectMake(15, m+13, 45,39)];
		fbLogo[i].userInteractionEnabled=YES;
		fbLogo[i].image = [UIImage imageNamed:@"fb.png"];
        [VideoScroller addSubview:fbLogo[i]];
		
        
        movieLabel[i]		=	[[UILabel alloc] initWithFrame:CGRectMake(65, 15+m,291,17)];
		movieLabel[i].text           = dataMvName;
		movieLabel[i].font = [UIFont fontWithName:@"Helvetica Neue, Bold" size: 16.0 ];
		movieLabel[i].backgroundColor	=	[UIColor clearColor];
		movieLabel[i].textColor        = [UIColor whiteColor];
		movieLabel[i].numberOfLines = 1;
		
		[VideoScroller addSubview: movieLabel[i]];
        
        dateLabel[i]		=	[[UILabel alloc] initWithFrame:CGRectMake(65, 33+m,291,17)];
		dateLabel[i].text   =  data5[i];
		dateLabel[i].font = [UIFont fontWithName:@"Helvetica Neue, Bold" size: 14.0 ];
		dateLabel[i].backgroundColor	=	[UIColor clearColor];
		dateLabel[i].textColor        = [self colorWithHexString:@"001644"];
        dateLabel[i].numberOfLines = 1;
		
		[VideoScroller addSubview: dateLabel[i]];
        
        
//        sharelabel[i]		=	[[UILabel alloc] initWithFrame:CGRectMake(15, 282+m,70,17)];
//		sharelabel[i].text           =  @"Share :";
//		sharelabel[i].font = [UIFont fontWithName:@"Helvetica Neue, Bold" size: 16.0 ];
//		sharelabel[i].backgroundColor	=	[UIColor clearColor];
//		sharelabel[i].textColor        = [self colorWithHexString:@"001644"];
//        sharelabel[i].numberOfLines = 1;
//		
//		[VideoScroller addSubview: sharelabel[i]];
		
//		webwall[i] = [[UIWebView alloc] initWithFrame:CGRectMake(15, m+52, 291,161)];
//		webwall[i].userInteractionEnabled=YES;
//		webwall[i].delegate =self;
//		webwall[i].tag=i;
//		webwall[i].userInteractionEnabled=NO;
//        webwall[i].autoresizesSubviews = YES;
//        webwall[i].contentMode = UIViewContentModeScaleToFill;
//
//		NSURL *url = [NSURL URLWithString:data[i]];
//		//            //URL Requst Object
//		NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
//		//            //Load the request in the UIWebView.
//		[webwall[i] loadRequest:requestObj];
//		webwall[i].scrollView.bounces = NO;
//		webwall[i].scalesPageToFit = YES;
//		//  ImagePatch[i].backgroundColor= [UIColor blueColor];
//		[VideoScroller addSubview:webwall[i]];
        
        
    
        
        if (webwall[i] == nil)
        {
            webwall[i] = [[AsyncImageView alloc] initWithFrame:CGRectMake(15, m+52, 291,161)];
            
            webwall[i].contentMode = UIViewContentModeScaleToFill;
        }
        
        NSString * newString = [data[i] stringByReplacingOccurrencesOfString:@"_s" withString:@"_n"];
        
        NSLog(@"xx=%@xx",newString);
        

        
        webwall[i].contentMode = UIViewContentModeScaleToFill;
        webwall[i].userInteractionEnabled=YES;
        
        [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:webwall[i]];
        
        webwall[i].tag=i;
        NSURL *url1 = [NSURL URLWithString:newString];
        NSLog(@"nsurl = %@",url1);
        ((AsyncImageView *)webwall[i]).imageURL =url1;
        [VideoScroller addSubview:webwall[i]];

        UITapGestureRecognizer *webViewTapped6 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(OpenFeed:)];
        webViewTapped6.numberOfTapsRequired = 1;
        
         webViewTapped6.view.tag=i;
        webViewTapped6.delegate = self;
        
        // [webwall[i] addSubview:webViewTapped6];
        [webwall[i] addGestureRecognizer:webViewTapped6];
        
        
        socializeBg[i] = [[UIView alloc]initWithFrame:CGRectMake(15, 264+m,291,44)];
        socializeBg[i].backgroundColor = [UIColor clearColor];
        [VideoScroller addSubview:socializeBg[i]];
        
        if (actionBar[i] == nil)
        {
            
            NSString *entity_Key= [NSString stringWithFormat:@"%@",fbFeedId[i]];
            NSString *entity_name= [NSString stringWithFormat:@"%@",data3[i]];
            self.entity = [SZEntity entityWithKey:entity_Key name:entity_name];
            actionBar[i] = [SZActionBar defaultActionBarWithFrame:CGRectZero entity:self.entity viewController:self];
            actionBar[i].itemsLeft = [NSArray arrayWithObjects: [SZActionButton viewsButton],[actionBar[i].itemsRight objectAtIndex:0], [actionBar[i].itemsRight objectAtIndex:1], nil];
            // actionBar[i].itemsLeft = [NSArray arrayWithObjects:nil];
            actionBar[i].tag=i;
            
            UIButton *faceBookBtn = [[UIButton alloc] initWithFrame:CGRectZero];
            [faceBookBtn setImage:[UIImage imageNamed:@"socialize-selectnetwork-facebook-icon.png"] forState:UIControlStateNormal];
            [faceBookBtn sizeToFit];
            [faceBookBtn addTarget:self action:@selector(fbshare:) forControlEvents:UIControlEventTouchUpInside];
            faceBookBtn.tag=i;
            
            
            UIButton *twitterBtn = [[UIButton alloc] initWithFrame:CGRectZero];
            [twitterBtn setImage:[UIImage imageNamed:@"socialize-selectnetwork-twitter-icon.png"] forState:UIControlStateNormal];
            [twitterBtn sizeToFit];
            [twitterBtn addTarget:self action:@selector(twitter:) forControlEvents:UIControlEventTouchUpInside];
            twitterBtn.tag=i;
            
            
            UIButton *emailBtn = [[UIButton alloc] initWithFrame:CGRectZero];
            [emailBtn setImage:[UIImage imageNamed:@"socialize-selectnetwork-email-icon.png"] forState:UIControlStateNormal];
            [emailBtn sizeToFit];
            [emailBtn addTarget:self action:@selector(mailCompose:) forControlEvents:UIControlEventTouchUpInside];
            emailBtn.tag=i;
            
            actionBar[i].betweenButtonsPadding=5.0;
            actionBar[i].itemsRight = [NSArray arrayWithObjects:faceBookBtn, twitterBtn,emailBtn, nil];
            [socializeBg[i] addSubview:actionBar[i]];
        }

        
        
		
		Th_name_Lbl[i]		=	[[UILabel alloc] initWithFrame:CGRectMake(15, 213+m,291,50)];
		Th_name_Lbl[i].text           =  data1[i];
		Th_name_Lbl[i].font = [UIFont fontWithName:@"Helvetica Neue, Bold" size: 11.0 ];
		Th_name_Lbl[i].backgroundColor	=	[UIColor whiteColor];
		Th_name_Lbl[i].textColor        = [self colorWithHexString:@"564a50"];
		Th_name_Lbl[i].lineBreakMode = UILineBreakModeWordWrap;
		Th_name_Lbl[i].numberOfLines = 2;
		
		[VideoScroller addSubview: Th_name_Lbl[i]];
        
		
		
		//		Th_add_Lbl[i]			=	[[UILabel alloc] initWithFrame:CGRectMake(5, 50,250,20)];
		//		//  Th_add_Lbl[i]	.text           =  TheaterAddress[i];
		//		Th_add_Lbl[i].adjustsFontSizeToFitWidth= YES;
		//		Th_add_Lbl[i]	.font = [UIFont fontWithName:@"Helvetica Neue, Regular" size: 14.0 ];
		//		Th_add_Lbl[i]	.backgroundColor	=	[UIColor clearColor];
		//		Th_add_Lbl[i]	.textColor        = [self colorWithHexString:@"868686"];
		//		[ImagePatch[i] addSubview: Th_add_Lbl[i]];
		//		[Th_add_Lbl[i]	 release];
		
		
//		UIImageView *img= [[UIImageView alloc] initWithFrame:CGRectMake(160, 256, 150, 44)];
//        img.backgroundColor =[UIColor blackColor];
//        img.image=[UIImage imageNamed:@"action-bar-bg.png"];
//        [ImagePatch[i] addSubview:img];
//
//		for (int j=0; j<3; j++) {
//			
//			
//			Publish[j]= [[UIImageView alloc] initWithFrame:CGRectMake(85, 256+5, 39, 39)];
//			Publish[j].userInteractionEnabled=YES;
//			Publish[1].image = [UIImage imageNamed:@"twitter1.png"];
//			Publish[0].image = [UIImage imageNamed:@"fb_ic1.png"];
//			Publish[2].image = [UIImage imageNamed:@"email1.png"];
//			[ImagePatch[i] addSubview:Publish[j]];
//			//	u+=35;
//		}
//		Publish[0].frame = CGRectMake(70+100, 256, 32, 32);
//		Publish[1].frame = CGRectMake(110+100, 256, 32, 32);
//		
//		Publish[2].frame = CGRectMake(150+100, 256, 32, 32);
//		
//		        
//		Publish[0].tag= i;
//		UITapGestureRecognizer *fb = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fbshare:)];
//		fb.numberOfTapsRequired = 1;
//		[Publish[0] addGestureRecognizer:fb];
//		
//		
//		
//		Publish[1].tag=i;
//		UITapGestureRecognizer *tweet = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(twitter:)];
//		tweet.numberOfTapsRequired = 1;
//		[Publish[1] addGestureRecognizer:tweet];
//		
//		
//		
//		Publish[2].tag=i;
//		UITapGestureRecognizer *mailto = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(mailCompose:)];
//		mailto.numberOfTapsRequired = 1;
//		[Publish[2] addGestureRecognizer:mailto];
		
        m+=325;
		
	}
	
	VideoScroller.contentSize = CGSizeMake(320,365*TotalNumOfRows+20);
	
	[activityIndicator stopAnimating];
    [self.view addSubview:_footerMainView];
}


- (void)OpenFeed:(UITapGestureRecognizer*)sender
{
    UITapGestureRecognizer *gesture = (UITapGestureRecognizer *) sender;
    int index = gesture.view.tag;
    _closeButton.alpha = 1.0;
    VideoScroller.alpha=0.0;
    singleFeedScroll.alpha=1.0;
    singleScrollImage.alpha = 1.0;
    
    if (bigImageView == nil)
    {
        bigImageView = [[AsyncImageView alloc] initWithFrame:CGRectMake(5, 52, 291,257)];
        
        bigImageView.contentMode = UIViewContentModeScaleToFill;
    }
    
    
    
    NSString * newString = [data[index] stringByReplacingOccurrencesOfString:@"_s" withString:@"_n"];
    
    NSLog(@"xx=%@xx",newString);
    
    
    
    bigImageView.contentMode = UIViewContentModeScaleToFill;
    bigImageView.userInteractionEnabled=YES;
    
    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:bigImageView];
    
    bigImageView.tag=index;
    NSURL *url1 = [NSURL URLWithString:newString];
    NSLog(@"nsurl = %@",url1);
    ((AsyncImageView *)bigImageView).imageURL =url1;
    [singleFeedScroll addSubview:bigImageView];
    
    movieNameLabel.text = dataMvName;
    dateBigLabel.text = data5[index];
    
    
    
    maximumLabelSize = CGSizeMake(300, 5000);
    CGSize expectedLabelSize = [data1[index] sizeWithFont:descLabel.font constrainedToSize:maximumLabelSize lineBreakMode:descLabel.lineBreakMode];
    
    CGRect newFrame = descLabel.frame;
    newFrame.size.height = expectedLabelSize.height;
    
    NSLog(@"height-=%f",expectedLabelSize.height);
    
    descLabel.text  =  data1[index];
    [descLabel sizeToFit];
   
    if (actionBarDetail == nil)
    {
        
        NSString *entity_Key= [NSString stringWithFormat:@"%@",fbFeedId[index]];
        NSString *entity_name= [NSString stringWithFormat:@"%@",data3[index]];
        self.entity = [SZEntity entityWithKey:entity_Key name:entity_name];
        actionBarDetail = [SZActionBar defaultActionBarWithFrame:CGRectZero entity:self.entity viewController:self];
        actionBarDetail.itemsLeft = [NSArray arrayWithObjects: [SZActionButton viewsButton],[actionBarDetail.itemsRight objectAtIndex:0], [actionBarDetail.itemsRight objectAtIndex:1], nil];
        // actionBar[i].itemsLeft = [NSArray arrayWithObjects:nil];
       // actionBardetail.tag=i;
        
        UIButton *faceBookBtn = [[UIButton alloc] initWithFrame:CGRectZero];
        [faceBookBtn setImage:[UIImage imageNamed:@"socialize-selectnetwork-facebook-icon.png"] forState:UIControlStateNormal];
        [faceBookBtn sizeToFit];
        faceBookBtn.tag=index;
        [faceBookBtn addTarget:self action:@selector(fbshare1:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        UIButton *twitterBtn = [[UIButton alloc] initWithFrame:CGRectZero];
        [twitterBtn setImage:[UIImage imageNamed:@"socialize-selectnetwork-twitter-icon.png"] forState:UIControlStateNormal];
        [twitterBtn sizeToFit];
        twitterBtn.tag=index;
        [twitterBtn addTarget:self action:@selector(twitter1:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        UIButton *emailBtn = [[UIButton alloc] initWithFrame:CGRectZero];
        [emailBtn setImage:[UIImage imageNamed:@"socialize-selectnetwork-email-icon.png"] forState:UIControlStateNormal];
        [emailBtn sizeToFit];
        emailBtn.tag=index;
        [emailBtn addTarget:self action:@selector(mailCompose1:) forControlEvents:UIControlEventTouchUpInside];
        
        
        actionBarDetail.betweenButtonsPadding=5.0;
        actionBarDetail.itemsRight = [NSArray arrayWithObjects:faceBookBtn, twitterBtn,emailBtn, nil];
        [socialFeedsBgView addSubview:actionBarDetail];
    }

    socialFeedsBgView.frame = CGRectMake(0, 317+descLabel.frame.size.height+10, 302, 39);
    singleFeedScroll.contentSize=CGSizeMake(302, descLabel.frame.size.height+368);
    
}

- (IBAction)close:(UIButton *)sender
{
    _closeButton.alpha = 0.0;
    singleScrollImage.alpha = 0.0;
    singleFeedScroll.alpha = 0.0;
    VideoScroller.alpha = 1.0;
    ((AsyncImageView *)bigImageView).image = nil;
    actionBarDetail=nil;
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
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    for (int i =0; i<TotalNumOfRows; i++)
    {
        [commentTextField[i] resignFirstResponder];
    }
    return YES;
}




- (void)textFieldDidEndEditing:(UITextField *)textField
{
    for (int i =0; i<TotalNumOfRows; i++)
    {
        commentTextField[i].text = @"";
        
    }
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Your comment is submitted" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK ", nil];
    [alert show];
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
	
	
	
	
	
	//	activityIndicator = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
	//	activityIndicator.center=CGPointMake(320/2, 460/2);
	//	// activityIndicator.transform = CGAffineTransformMakeScale(2.0, 2.0);
	//	[activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
	//	[self.view addSubview:activityIndicator];
    //	[activityIndicator startAnimating];
    //
    //	[self Fetchfbfeeds];
	
	
	activityIndicator = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
	activityIndicator.center=CGPointMake(320/2, 548/2);
	// activityIndicator.transform = CGAffineTransformMakeScale(2.0, 2.0);
	[activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
	[self.view addSubview:activityIndicator];
	[activityIndicator startAnimating];
	
	
	
	[self performSelector:@selector(Fetchfbfeeds) withObject:nil afterDelay:0.0];
    
	//[self DesignHeader];
	//[self DisplayFeeds];
	//[self performSelector:@selector(loadShares) withObject:nil afterDelay:0.0];
	
}


-(void)Fetchfbfeeds
{
    //	NSString*  urlString = [NSString stringWithFormat:@"http://apps.micrositeads.com/yjhd/get_fb_statuses.php"];
    //	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:urlString] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
    //
    //	//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    //	//    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:urlString]]];
    //	[request setHTTPMethod:@"GET"];
    //	[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Current-Type"];
    //	// NSError *errorReturned = nil;
    //	// NSURLResponse *theResponse =[[NSURLResponse alloc]init];
    //	// NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&theResponse error:&errorReturned];
    //
    //	NSURLResponse *response;
    //	NSData *urlData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    //	NSString *stringResponse = [[NSString alloc] initWithData:urlData encoding:NSASCIIStringEncoding];
    //	NSLog(@"%@",stringResponse);
    //	//[activityIndicator stopAnimating];
    //
    //	NSArray *responseDict = [stringResponse JSONValue];
    //
    //
    //	int i = 0;
    //	for (NSDictionary *actoAgent in responseDict)
    //	{
    //
    //		data1[i] = [actoAgent objectForKey:@"fbfeeds"];
    //		data2[i] = [actoAgent objectForKey:@"fbfeedspic"];
    //		data3[i] = [actoAgent objectForKey:@"fbfeedspagelink"];
    //		data4[i] = [actoAgent objectForKey:@"fb_sendto_tweet"];
    //
    //
    //
    ////		tweets[i]= [NSString stringWithFormat:@"%@",FetchTweets];
    ////
    //		NSLog(@"FbFeeds[i]=%@",data4[i]);
    //		shareText[i] = [NSString stringWithFormat:@"%@",data1[i]];
    //		sharetweet[i] = [NSString stringWithFormat:@"%@",data4[i]];
    //
    //		i++;
    //	}
    //	divider=i;
    //	NSLog(@"divider=%d",divider);
    //
    //	TotalNumOfRows=i;
    //
    //
    //	[self DisplayFeeds];
    
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

-(void)fetchAllData
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
  
    GlobalClass *obj=[GlobalClass getInstance];
  //  NSString* post = [NSString stringWithFormat:@"http://apps.medialabs24x7.com/besharam/get_fb_statuses.php?deviceno=%@",obj.dev];
    NSString* post ;
    
	NSLog(@"NEWSDATA=%@",obj.fbtoken);
    
//    NSString *FBID = [obj.fbtoken objectForKey:@"facebook_id"];
//    NSString *ACCESSTOKEN = [obj.fbtoken objectForKey:@"access_token"];
//
//    post = [NSString stringWithFormat:@"https://graph.facebook.com/%@/feed?access_token=%@",FBID,ACCESSTOKEN];

	for (NSDictionary *actoAgent in obj.fbtoken)
	{
        
        FBID = [actoAgent objectForKey:@"facebook_id"];
        ACCESSTOKEN = [actoAgent objectForKey:@"access_token"];
        
        post = [NSString stringWithFormat:@"https://graph.facebook.com/%@/feed?access_token=%@",FBID,ACCESSTOKEN];
        NSLog(@"URL=%@",post);

    
    }
//    NSString* post = [NSString stringWithFormat:@"https://graph.facebook.com/138678122924136/feed?access_token=CAAJ25V5uwFYBAGmlqwYCnRcVisipE44HpeE95aY9yclh4SclyI0pPvGukVoZCxLI9DvZBNsCqAhIiu7kTW0tdzvwaFLrmhy7DIZCn0LdOdCd1cN9vdZAQE3LvQEK021KUgf2tCQa2KICOIMPFqK9fhFLDU6mKEgZD"];
	
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:post] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:300.0];
	
	
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
		NSData *getdata = [NSURLConnection sendSynchronousRequest:request returningResponse:&theResponse error:&errorReturned];
		
		
		NSError* error;
		NSDictionary* json = [NSJSONSerialization JSONObjectWithData:getdata //1
                                                             options:kNilOptions
                                                               error:&error];
		
		
		
		NSLog(@"json=%@",json);
		
		
		
		//NSDictionary* newsData = [json objectForKey:@"news"];
        NSDictionary *getdata1 = [json objectForKey:@"data"];

        
		GlobalClass *obj=[GlobalClass getInstance];
		obj.FBSTATUS = getdata1;
        
    }
        dispatch_async(dispatch_get_main_queue()	, ^{
            [self DisplayFeeds];
        });

  
    });
	
}

-(void)getsharetext
{
    
    GlobalClass *obj=[GlobalClass getInstance];
    NSLog(@"images=%@",obj.facebook);
    
    
    //        for (NSDictionary *actoAgent in obj.wallpapers)
    //        {
    
    fbsharetext = [obj.facebook objectForKey:@"fb_share"];
    NSLog(@"fb_share=%@",fbsharetext);
    
    twtsharetext = [obj.facebook objectForKey:@"twitter_share"];
    NSLog(@"twitter_share=%@",twtsharetext);
    
    
    mailsharesub = [obj.facebook objectForKey:@"email_subject"];
    NSLog(@"email_subject=%@",mailsharesub);
    
    
    mailsharetext = [obj.facebook objectForKey:@"email_share"];
    NSLog(@"email_share=%@",mailsharetext);
    
    //            break;
    //
    //        }
}


-(void)getdata
{ 
    [self getsharetext];
    
    GlobalClass *obj=[GlobalClass getInstance];

    for (NSDictionary *actoAgent in obj.appData)
    {
        dataMvName= [actoAgent objectForKey:@"app_movie_name"];
        NSLog(@"app_movie_name=%@",dataMvName);
        
    }
    
	NSLog(@"NEWSDATA=%@",obj.FBSTATUS);
	
	int i=0;
	for (NSDictionary *actoAgent in obj.FBSTATUS)
	{
        NSDictionary *from = [actoAgent objectForKey:@"from"];
        NSString *getid = [from objectForKey:@"id"];
            NSLog(@"idiss=%@",getid);

            
        if ([getid isEqualToString:FBID]) {
            
            data6[i]= [from objectForKey:@"name"];

            NSString    *msg= [actoAgent objectForKey:@"message"];
            NSString    *pic= [actoAgent objectForKey:@"picture"];

            if (msg!=nil && pic!=nil) {
                data1[i] = [actoAgent objectForKey:@"message"];

                NSString *timeZone =[actoAgent objectForKey:@"id"];
                NSArray *newArray=[timeZone componentsSeparatedByString:@"_"];
                fbFeedId[i] = [newArray objectAtIndex:1];
                NSLog(@"data4  id ==== =====   %@",fbFeedId[i]);

            NSString *t_st = @"_s";
            NSRange rang =[pic rangeOfString:t_st options:NSCaseInsensitiveSearch];
            
            if (rang.length == [t_st length])
            {
                NSLog(@"done");
                
                data[i] = [actoAgent objectForKey:@"picture"];
                data1[i] = [actoAgent objectForKey:@"message"];
                data3[i] = [actoAgent objectForKey:@"link"];
                data4[i] = [actoAgent objectForKey:@"icon"];
                data5[i] = [actoAgent objectForKey:@"created_time"];
                
                NSArray *components = [data5[i] componentsSeparatedByString:@"T"];
                
               data5[i]=  [components objectAtIndex:0]; //should be SiteName
               // [components objectAtIndex:1]; // should be http://Link.com

                
                shareText[i] = data1[i];
                sharetweet[i] = data1[i];
                i++;

            }
                
            else
            {
                NSLog(@"not done");
            }
                
            }
            

        }

        
       TotalNumOfRows = i;  
        
        
    }
   
    
}

-(IBAction)twitter1:(UIButton*)sender{
	
    
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
	
    
    NSString*  strr;
	//NSString	*str= [NSString stringWithFormat:@"\"%@\"%@ ",sharetweet[gesture.view.tag],twtsharetext];
    if ([sharetweet[sender.tag] length ]>81) {
        strr= [sharetweet[sender.tag] substringToIndex:81];
        
    }
    else
    {
        strr= sharetweet[sender.tag];
    }
    
    
    // [self fbios6:strr];
    
    
    
    NSString	*str= [NSString stringWithFormat:@"\"%@..\"%@",strr,twtsharetext];
    
	//  Set the initial body of the Tweet
	[tweetSheet setInitialText:str];
	
    
	//NSString	*str= [NSString stringWithFormat:@"\"%@\"%@ ",sharetweet[gesture.view.tag],twtsharetext];
    //    NSString	*str= [NSString stringWithFormat:@"\"%@\"",twtsharetext];
    //
    //	//  Set the initial body of the Tweet
    //	[tweetSheet setInitialText:str];
	
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

-(IBAction)fbshare1:(UIButton *)sender
{
	
	
    NSString *ver = [[UIDevice currentDevice] systemVersion];
    float ver_float = [ver floatValue];
    if (ver_float < 6.0)
    {
        
        NSString	*str=[NSString stringWithFormat:@"%@“News Headline'' - Using App to read Besharam related exciting News @http://tinyurl.com/off-yjhd",shareText[sender.tag]];
        
//        sharepost = [[FBFeedPost alloc] initWithPostMessage:str];
//        [self sharefeedonfb1:sharepost];
        
    }
    else{
        
        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
            
            
            [self fbios6:shareText[sender.tag]];
            
            
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

-(IBAction)mailCompose1:(UIButton*)sender
{
    Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
	if (mailClass != nil)
	{
		// We must always check whether the current device is configured for sending emails
		
		if ([mailClass canSendMail])
		{
			[self displayComposerSheet:shareText[sender.tag]];
		}
		
		else
		{
			[self launchMailAppOnDevice:shareText[sender.tag]];
		}
	}
	
	else
	{
		[self launchMailAppOnDevice:shareText[sender.tag]];
	}
    
}




-(void)twitter:(UIButton *)sender{
    
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
	NSString*  strr;
	//NSString	*str= [NSString stringWithFormat:@"\"%@\"%@ ",sharetweet[gesture.view.tag],twtsharetext];
    if ([sharetweet[[sender tag]] length ]>81) {
        strr= [sharetweet[[sender tag]] substringToIndex:81];

    }
    else
    {
    strr= sharetweet[[sender tag]];
    }
   // [self fbios6:strr];

    
 
  //  NSString	*str= [NSString stringWithFormat:@"\"%@\"%@",strr,twtsharetext];
    NSString	*str= [NSString stringWithFormat:@"\"%@..\"%@",strr,twtsharetext];
    NSLog(@"twitttter=%@",str);

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

-(IBAction)fbshare:(UIButton *)sender
{	
    NSString *ver = [[UIDevice currentDevice] systemVersion];
    float ver_float = [ver floatValue];
    if (ver_float < 6.0)
    {
        
//        NSString	*str=[NSString stringWithFormat:@"%@  “News Headline'' - Using App to read Besharam related exciting News @http://tinyurl.com/off-yjhd",shareText[gesture.view.tag]];
//        
//        sharepost = [[FBFeedPost alloc] initWithPostMessage:str];
//        [self sharefeedonfb1:sharepost];
        
    }
    else{
        
        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
            
          NSString*  strr= [shareText[[sender tag]] substringToIndex:47];

            [self fbios6:strr];
            
            
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
        

        NSString *strr= [NSString stringWithFormat:@"%@ %@",stringis,fbsharetext];
        NSLog(@"test===%@",strr);
      //  [fbController addImage:[UIImage imageNamed:@"114x114.png"]];
        [fbController setInitialText:strr];
        // [fbController addURL:[NSURL URLWithString:stringis]];
        [fbController setCompletionHandler:completionHandler];
        [self presentViewController:fbController animated:YES completion:nil];
    }
    
}


-(void)mailCompose:(UIButton *)sender
{
	Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
	if (mailClass != nil)
	{
		// We must always check whether the current device is configured for sending emails
		
		if ([mailClass canSendMail])
		{
			[self displayComposerSheet:shareText[[sender tag]]];
		}
		
		else
		{
			[self launchMailAppOnDevice:shareText[[sender tag]]];
		}
	}
	
	else
	{
		[self launchMailAppOnDevice:shareText[[sender tag]]];
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
	
	
	NSString	*str =[NSString stringWithFormat:@"%@ \n \n-%@",String,fbsharetext];
    
   	
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
	NSString *recipients = @"mailto:?cc=&subject=Facebook post shared from Reliance Official App";
	//NSString *body = @"&body=All Dabangg 2 Movie details are Available on Dabangg2 App!";
	
	NSString	*str =[NSString stringWithFormat:@"%@ \n \n-%@",string,fbsharetext];
    
	NSString *email = [NSString stringWithFormat:@"%@%@", recipients, str];
	email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
