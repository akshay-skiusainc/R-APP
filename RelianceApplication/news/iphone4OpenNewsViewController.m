//
//  iphone4OpenNewsViewController.m
//  RelianceApplication
//
//  Created by Ashwini Pawar on 13/08/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import "iphone4OpenNewsViewController.h"
#import "iphone4Merchandise.h"
#import "iphone4Settings.h"
#import "GroupViewController.h"

@interface iphone4OpenNewsViewController ()

@end

@implementation iphone4OpenNewsViewController

@synthesize tagApply,smallDescStr,detailDescStr,imageStr,middleView,closeButtonView,Scroller,emailBtn,twitterBtn,faceBookBtn;
@synthesize bigSmallDesc,bigDetailDesc,bigActivityIndicator,bigNewsImage,fbTweetView,footerView,socializeBg,actionBar;
@synthesize newsID;

CGSize maximumLabelSize;
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
   // middleView.alpha = 0.0;
    [_newsActivityIndicator startAnimating];

}
- (void)viewDidLoad
{
    [super viewDidLoad];
         [self getsharetext];
    
    NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"app_bg_image"];
    UIImage* app_bg_image = [UIImage imageWithData:imageData];
    self.view.backgroundColor = [UIColor colorWithPatternImage:app_bg_image];
    
    fbTweetView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"news_fbtwt_bg.png"]];
    footerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"footer_bg.png"]];
 
    UIImage *buttonImage = [UIImage imageNamed:@"back-btn.png"];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:buttonImage forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, buttonImage.size.width, buttonImage.size.height);
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = customBarItem;
    
//    UIImage *relAppImage = [UIImage imageNamed:@"home_right_rel_icon.png"];
//    UIButton *buttonChat = [UIButton buttonWithType:UIButtonTypeCustom];
//    [buttonChat setImage:relAppImage forState:UIControlStateNormal];
//    buttonChat.frame = CGRectMake(0, 0, relAppImage.size.width, relAppImage.size.height);
//    [buttonChat addTarget:self action:@selector(toRelApp:) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *customBarItem1 = [[UIBarButtonItem alloc] initWithCustomView:buttonChat];
//    self.navigationItem.RightBarButtonItem = customBarItem1;
    
    [self performSelector:@selector(loadNews) withObject:nil afterDelay:0.0];
    
    [_newsActivityIndicator stopAnimating];
    _newsActivityIndicator.alpha = 0.0;
    //[bigActivityIndicator startAnimating];
    fbTweetView.alpha = 0.0;

    
    NSString *entity_Key= [NSString stringWithFormat:@"%@",newsID];
    NSString *entity_name= [NSString stringWithFormat:@"%@",smallDescStr];
    self.entity = [SZEntity entityWithKey:entity_Key name:entity_name];
    actionBar = [SZActionBar defaultActionBarWithFrame:CGRectZero entity:self.entity viewController:self];
    
    actionBar.itemsLeft = [NSArray arrayWithObjects:[SZActionButton viewsButton], [actionBar.itemsRight objectAtIndex:0], [actionBar.itemsRight objectAtIndex:1], nil];
    // actionBar[i].itemsLeft = [NSArray arrayWithObjects:nil];
    // actionBar.tag=i;
    
    faceBookBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    [faceBookBtn setImage:[UIImage imageNamed:@"socialize-selectnetwork-facebook-icon.png"] forState:UIControlStateNormal];
    [faceBookBtn sizeToFit];
    [faceBookBtn addTarget:self action:@selector(fbShare:) forControlEvents:UIControlEventTouchUpInside];
    // faceBookBtn.tag=i;
    
    
    twitterBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    [twitterBtn setImage:[UIImage imageNamed:@"socialize-selectnetwork-twitter-icon.png"] forState:UIControlStateNormal];
    [twitterBtn sizeToFit];
    [twitterBtn addTarget:self action:@selector(twitter:) forControlEvents:UIControlEventTouchUpInside];
    //  faceBookBtn.tag=i;
    
    
//    emailBtn = [[UIButton alloc] initWithFrame:CGRectZero];
//    [emailBtn setImage:[UIImage imageNamed:@"socialize-selectnetwork-email-icon.png"] forState:UIControlStateNormal];
//    [emailBtn sizeToFit];
//    [emailBtn addTarget:self action:@selector(mailCompose:) forControlEvents:UIControlEventTouchUpInside];
    //  faceBookBtn.tag=i;
    
    actionBar.betweenButtonsPadding=5.0;
    actionBar.itemsRight = [NSArray arrayWithObjects:faceBookBtn, twitterBtn,emailBtn, nil];
    
    [socializeBg addSubview:actionBar];
    //[socializeBg addSubview:actionBar];

}
//- (IBAction)fbShare:(id)sender {
//    //	NSString *str=[NSString stringWithFormat:@"Downloaded this amazing wallpaper: %@ from official YJHD App. Get free copy of the App @<tiny url>",titleMusic.text];
//    //	post = [[FBFeedPost alloc] initWithLinkPath:@"http://ow.ly/g4bRR" caption:str];
//	
//	
//	
//    
//    NSString *ver = [[UIDevice currentDevice] systemVersion];
//    float ver_float = [ver floatValue];
//    if (ver_float < 6.0)
//    {
//        NSString		*STR= [NSString stringWithFormat:@"%@ - I am using App to read Besharam related exciting News",data1[sendtitle]];
//        
//        sharepost = [[FBFeedPost alloc] initWithLinkPath:shareText caption:STR];
//        [self sharefeedonfb1:sharepost];
//        
//    }
//    else
//    {
//        
//        
//        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
//            
//            
//            [self fbios6:shareText];
//            
//        }
//        
//        else
//        {
//            UIAlertView* logoutalertbox = [[ UIAlertView alloc]initWithTitle:@"Facebook login required!" message:@"To continue, please log into your Facebook Account through device settings." delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil ];
//            //   logoutalertbox.tag=5;
//            logoutalertbox.delegate=self;
//            [logoutalertbox show];
//            
//        }
//        
//        
//    }
//    
//    
//}
//

-(void)loadNews
{
  
    
    //dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), ^(void) {
//    NSURL *url = [NSURL URLWithString:imageStr];
//    NSData *imageData1 = [NSData dataWithContentsOfURL:url];
//    UIImage *image1 = [UIImage imageWithData:imageData1];
//    bigNewsImage.image = image1;
   
 
     
    
    bigNewsImage.userInteractionEnabled = YES;
    
    
    if (bigNewsImage    == nil)
    {
        bigNewsImage = [[AsyncImageView alloc] initWithFrame:CGRectMake(0, 0, 298, 119)];
        
        bigNewsImage.contentMode = UIViewContentModeScaleToFill;
    }
    
    bigNewsImage.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];

    
    bigNewsImage.userInteractionEnabled=YES;
    //cancel any previously loading images for this view
    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:bigNewsImage];
    
    //set image URL. AsyncImageView class will then dynamically load the image
    NSURL *url1 = [NSURL URLWithString:imageStr];
    
    ((AsyncImageView *)bigNewsImage).imageURL =url1;
    [middleView addSubview:bigNewsImage];
    [middleView addSubview:fbTweetView];
    if(tagApply % 2)
    {
        bigSmallDesc.textColor= [self colorWithHexString:@"a680df"];
    }
    else
    {
        bigSmallDesc.textColor= [self colorWithHexString:@"4ab9c3"];
    }
    
	//NSString	*str= [NSString stringWithFormat:@"\"%@\"%@ ",sharetweet[gesture.view.tag],twtsharetext];
    if ([smallDescStr length ]>47) {
        strr= [smallDescStr substringToIndex:47];
        
    }
    else
    {
        strr= smallDescStr;
    }

  //  strr= [smallDescStr substringToIndex:47];
    NSLog(@"estttt=%@",strr);
    
    bigSmallDesc.text=[smallDescStr uppercaseString];
    shareText= smallDescStr;
    maximumLabelSize = CGSizeMake(280, 5000);
    CGSize expectedLabelSize = [detailDescStr sizeWithFont:bigDetailDesc.font constrainedToSize:maximumLabelSize lineBreakMode:bigDetailDesc.lineBreakMode];
    
    CGRect newFrame = bigDetailDesc.frame;
    newFrame.size.height = expectedLabelSize.height;
    bigDetailDesc.frame = CGRectMake(2, 0, 280, expectedLabelSize.height);
    bigDetailDesc.userInteractionEnabled = YES;
    NSLog(@"height-=%f",expectedLabelSize.height);
    Scroller.contentSize=CGSizeMake(283, expectedLabelSize.height+10
                                    );
    bigDetailDesc.text=detailDescStr;
    middleView.alpha = 1.0;
}

-(void)getsharetext
{
    
    GlobalClass *obj=[GlobalClass getInstance];
    NSLog(@"images=%@",obj.newsshare);
    
    
    //        for (NSDictionary *actoAgent in obj.wallpapers)
    //        {
    
    fbsharetext = [obj.newsshare objectForKey:@"fb_share"];
    NSLog(@"fb_share=%@",fbsharetext);
    
    twtsharetext = [obj.newsshare objectForKey:@"twitter_share"];
    NSLog(@"twitter_share=%@",twtsharetext);
    
    
    mailsharesub = [obj.newsshare objectForKey:@"email_subject"];
    NSLog(@"email_subject=%@",mailsharesub);
    
    
    mailsharetext = [obj.newsshare objectForKey:@"email_share"];
    NSLog(@"email_share=%@",mailsharetext);
    
    //            break;
    //
    //        }
}


-(IBAction)toRelApp:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Under construction" message:@"Check Back Soon" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    
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



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
     fbTweetView.alpha = 0.0;
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
    // [self performSelector:@selector(openFooter1:) withObject:nil afterDelay:0.01 ];
   
}
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)tweetShare:(id)sender {
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
    NSString		*str= [NSString stringWithFormat:@"\"%@\" %@",strr,twtsharetext];
    NSLog(@"tw=%@",str);

	
	//NSString *strtweet= [NSString stringWithFormat:@"Reading exciting news on the official Yeh Jawaani Hai Deewani App. Get free copy of the App @http://tinyurl.com/off-yjhd"];
	
	//  Set the initial body of the Tweet
	[tweetSheet setInitialText:str];
	
	//  Adds an image to the Tweet
	//  For demo purposes, assume we have an image named 'larry.png'
	//  that we wish to attach
	if (![tweetSheet addImage:[UIImage imageNamed:str]]) {
		NSLog(@"Unable to add the image!");
	}
	
//	//  Add an URL to the Tweet.  You can add multiple URLs.
//	if (![tweetSheet addURL:[NSURL URLWithString:@"http://twitter.com/"]]){
//		NSLog(@"Unable to add the URL!");
//	}
	
	//  Presents the Tweet Sheet to the user
	[self presentViewController:tweetSheet animated:NO completion:^{
		NSLog(@"Tweet sheet has been presented.");
	}];
    
}

- (IBAction)openFooter:(id)sender {
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



- (IBAction)shareButton:(id)sender {
    if(fbTweetView.alpha == 0.0)
    {
        fbTweetView.alpha = 1.0;
    }
    else if(fbTweetView.alpha ==1.0)
    {
        fbTweetView.alpha = 0.0;
    }
    
}



- (IBAction)fbShare:(UIButton *)sender {
    //	NSString *str=[NSString stringWithFormat:@"Downloaded this amazing wallpaper: %@ from official YJHD App. Get free copy of the App @<tiny url>",titleMusic.text];
    //	post = [[FBFeedPost alloc] initWithLinkPath:@"http://ow.ly/g4bRR" caption:str];
	
	
	
    
    NSString *ver = [[UIDevice currentDevice] systemVersion];
    float ver_float = [ver floatValue];
    if (ver_float < 6.0)
    {
        //        NSString		*STR= [NSString stringWithFormat:@"%@ - I am using App to read Besharam related exciting News",data1[sendtitle]];
        //
        //        shareText = [[FBFeedPost alloc] initWithLinkPath:shareText caption:STR];
        //  [self sharefeedonfb1:fbsharetext];
        
    }
    else
    {
        
        
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
    
    
}


-(void)twitter:(UIButton *)sender{
	
    //	UITapGestureRecognizer *gesture = (UITapGestureRecognizer *) sender;
    //	NSLog(@"tag121=%@",shareText[gesture.view.tag]);
	
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
    NSString * str = [NSString stringWithFormat:@"\"%@\"%@",shareText,twtsharetext];
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
        
        NSString		*STR= [NSString stringWithFormat:@"\"%@\" %@",shareText,fbsharetext];
        
      //  [fbController addImage:[UIImage imageNamed:@"114x114.png"]];
        [fbController setInitialText:STR];
        [fbController addURL:[NSURL URLWithString:stringis]];
        [fbController setCompletionHandler:completionHandler];
        [self presentViewController:fbController animated:YES completion:nil];
    }
    
}


@end
