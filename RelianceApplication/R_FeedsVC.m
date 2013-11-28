//
//  R_FeedsVC.m
//  RelianceApplication
//
//  Created by Ashwini Pawar on 14/10/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import "R_FeedsVC.h"

@interface R_FeedsVC ()

@end

@implementation R_FeedsVC
@synthesize FEEDTAG,faceBookButton,twitterButton;
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
    
    [self getsharetext];

    check=0;
    check1=0;
    self.trackedViewName=@"Facebook Feed Screen";
    
       self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"rel_i4home_bg.jpg"]];
    VideoScroller.alpha = 0.0;
    VideoScrollerTweet.alpha = 1.0;
    
	activityIndicator = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
	activityIndicator.center=CGPointMake(320/2, 416/2);
	[activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
	[self.view addSubview:activityIndicator];
	[activityIndicator startAnimating];
	
    _singleFeedScroll.alpha=0.0;
    _singleScrollImage.alpha=0.0;
    _closeButton .alpha = 0.0;
	
    self.trackedViewName=@"Reliance Feeds Screen";
    
    VideoScrollerTweet.alpha = 0.0;
    VideoScroller.alpha = 0.0;
    if([FEEDTAG isEqualToString: @"TwitterTag"])
    {
        [faceBookButton setBackgroundImage:[UIImage imageNamed:@"fb_btn.png"] forState:UIControlStateNormal];
        [twitterButton setBackgroundImage:[UIImage imageNamed:@"twitter_btn_h.png"] forState:UIControlStateNormal];
        [self performSelector:@selector(Fetchtwt) withObject:nil afterDelay:0.0];
        
        
    }
    else if ([FEEDTAG isEqualToString:@"FacebookTag"])
    {
        [faceBookButton setBackgroundImage:[UIImage imageNamed:@"fbfeed_btn_black.png"] forState:UIControlStateNormal];
        [twitterButton setBackgroundImage:[UIImage imageNamed:@"twitter_btn.png"] forState:UIControlStateNormal];
        [self performSelector:@selector(fetchAllData) withObject:nil afterDelay:0.0];
        
    }

   // [self performSelector:@selector(fetchAllData) withObject:nil afterDelay:0.0];
    if([_TAG isEqual: @"REL_LEFT"])
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
-(void)back {
    
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)DisplayFeedsTweets
{

    VideoScrollerTweet			= [[UIScrollView alloc] initWithFrame:CGRectMake(8,100,304,316)];
	VideoScrollerTweet.userInteractionEnabled	=YES;
	VideoScrollerTweet.showsHorizontalScrollIndicator = YES;
    VideoScrollerTweet.delegate=self;
	VideoScrollerTweet.pagingEnabled = NO;
	[self.view addSubview:VideoScrollerTweet];
   
    int m=0;
	for (int i =0; i<TotalNumOfTweets; i++)
    {
        NSLog(@"sharetext%@[%d]",shareText[i],i);
        ImagePatchTweet[i] = [[UIImageView alloc] initWithFrame:CGRectMake(1, m+10, 302,194)];
        ImagePatchTweet[i].userInteractionEnabled=YES;
        ImagePatchTweet[i].image = [UIImage imageNamed:@"twitter_feed_rightbox.png"];
        [VideoScrollerTweet addSubview:ImagePatchTweet[i]];
        ImagePatchTweet[i].tag= i;
        
        
        
        socializeBgtweet[i] = [[UIView alloc]initWithFrame:CGRectMake(71, 190-44, 231, 44)];
        socializeBgtweet[i].backgroundColor = [UIColor clearColor];
        socializeBgtweet[i].layer.cornerRadius = 5.0;
        socializeBgtweet[i].clipsToBounds = YES;
        
        [ImagePatchTweet[i] addSubview:socializeBgtweet[i]];
        
        if (tweetActionBar[i] == nil)
        {
            NSString *entity_Key= [NSString stringWithFormat:@"%@",shareText[i]];
            NSString *entity_name= [NSString stringWithFormat:@"%@",shareText[i]];
            self.entity = [SZEntity entityWithKey:entity_Key name:entity_name];
            tweetActionBar[i] = [SZActionBar defaultActionBarWithFrame:CGRectZero entity:self.entity viewController:self];
            tweetActionBar[i].itemsLeft = [NSArray arrayWithObjects:[SZActionButton viewsButton], [tweetActionBar[i].itemsRight objectAtIndex:0], [tweetActionBar[i].itemsRight objectAtIndex:1], nil];
            // actionBar[i].itemsLeft = [NSArray arrayWithObjects:nil];
            tweetActionBar[i].tag=i;
            
            UIButton * tweet_faceBookBtn = [[UIButton alloc] initWithFrame:CGRectZero];
            [tweet_faceBookBtn setImage:[UIImage imageNamed:@"share-btn.png"] forState:UIControlStateNormal];
            [tweet_faceBookBtn sizeToFit];
            [tweet_faceBookBtn addTarget:self action:@selector(showShareOptions:) forControlEvents:UIControlEventTouchUpInside];
            tweet_faceBookBtn.tag=i;
            
            
            tweetActionBar[i].betweenButtonsPadding=2.0;
            tweetActionBar[i].itemsRight = [NSArray arrayWithObjects:tweet_faceBookBtn, nil];
            
            
            [socializeBgtweet[i] addSubview:tweetActionBar[i]];
        }
        
        
        Th_name_Lbl[i]		=	[[UILabel alloc] initWithFrame:CGRectMake(75, 0,220,140)];
        Th_name_Lbl[i].text           =  shareText[i];
        Th_name_Lbl[i].font = [UIFont fontWithName:@"Helvetica Neue, Bold" size: 9.0 ];
        Th_name_Lbl[i].backgroundColor	=	[UIColor clearColor];
        Th_name_Lbl[i].textColor        = [UIColor blackColor];
        Th_name_Lbl[i].lineBreakMode = UILineBreakModeWordWrap;
        Th_name_Lbl[i].numberOfLines = 8;
        
        [ImagePatchTweet[i] addSubview: Th_name_Lbl[i]];
        
        
        tweetView[i] = [[UIView alloc]initWithFrame:CGRectMake(178, m+200, 125, 40)];
        tweetView[i].backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];
        tweetView[i].tag=i;
        tweetView[i].alpha=0.0;
        [VideoScrollerTweet addSubview:tweetView[i]];
        
        for (int j=0; j<3; j++) {
            
            
            Publish[j] = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
            Publish[j].userInteractionEnabled=YES;
            Publish[1].backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"ic.png"]];
            Publish[0].backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"fb_ic12.png"]];
            Publish[2].backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"emailtweet.png"]];
            [tweetView[i] addSubview:Publish[j]];
        }
        Publish[0].frame = CGRectMake(0, 0, 40, 40);
        Publish[1].frame = CGRectMake(45, 0, 40, 40);
        
        Publish[2].frame = CGRectMake(85, 0, 40 , 40);
        
        Publish[0].tag= i;
        Publish[1].tag=i;
        Publish[2].tag=i;
        
        
        [Publish[0] addTarget:self action:@selector(fbshare:) forControlEvents:UIControlEventTouchUpInside];
        [Publish[1] addTarget:self action:@selector(twitter:) forControlEvents:UIControlEventTouchUpInside];
        [Publish[2] addTarget:self action:@selector(mailCompose:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        if (i%2) {
            ImagePatchTweet[i].frame = CGRectMake(1, m+10, 302, 194);
            ImagePatchTweet[i].image= [UIImage imageNamed:@"twitter_feed_leftbox.png"];
            socializeBgtweet[i].frame = CGRectMake(2,190-44, 231, 44);
            tweetView[i].frame =CGRectMake(108, m+200, 125, 40);
            Th_name_Lbl[i].frame = CGRectMake(8, 5, 220, 140);
            
            
            
            Publish[0].frame = CGRectMake(0, 0, 40, 40);
            Publish[1].frame = CGRectMake(45, 0, 40, 40);
            
            Publish[2].frame = CGRectMake(85, 0, 40, 40);
            
        }
        m+=254;
    }
    
    VideoScrollerTweet.contentSize = CGSizeMake(304,(254*TotalNumOfTweets+20));
    
    [activityIndicator stopAnimating];
    
    
}
-(void)DisplayFeeds
{
	
	[self getdata];
    NSLog(@"Total number of Rows in FB ===== %d",TotalNumOfRows);
	infoButton.alpha=1.0;
	
	VideoScroller			= [[UIScrollView alloc] initWithFrame:CGRectMake(8,100,304,316)];
	VideoScroller.userInteractionEnabled	=YES;
	VideoScroller.showsHorizontalScrollIndicator = YES;
	VideoScroller.pagingEnabled = NO;
	[self.view addSubview:VideoScroller];
	
       
	int m=0;
	
    
	for (int i =0; i<TotalNumOfRows; i++)
    {
        
        
        
		NSLog(@"sharetext%@[%d]",shareText[i],i);
		ImagePatch[i] = [[UIImageView alloc] initWithFrame:CGRectMake(0, m+2, 304,315)];
		ImagePatch[i].userInteractionEnabled=YES;
		ImagePatch[i].image = [UIImage imageNamed:@"fbfeed_blue_bg.png"];
		[VideoScroller addSubview:ImagePatch[i]];
		ImagePatch[i].tag= i;
        
        movieLabel[i]		=	[[UILabel alloc] initWithFrame:CGRectMake(65, 7,291,17)];
		movieLabel[i].text           =  data6[i];
		movieLabel[i].font = [UIFont fontWithName:@"Helvetica Neue, Bold" size: 16.0 ];
		movieLabel[i].backgroundColor	=	[UIColor clearColor];
		movieLabel[i].textColor        = [UIColor whiteColor];
		movieLabel[i].numberOfLines = 1;
		
		[ImagePatch[i] addSubview: movieLabel[i]];
        
        dateLabel[i]		=	[[UILabel alloc] initWithFrame:CGRectMake(65, 27,291,17)];
		dateLabel[i].text   =  data5[i];
		dateLabel[i].font = [UIFont fontWithName:@"Helvetica Neue, Bold" size: 14.0 ];
		dateLabel[i].backgroundColor	=	[UIColor clearColor];
		dateLabel[i].textColor        = [self colorWithHexString:@"001644"];
        dateLabel[i].numberOfLines = 1;
		
		[ImagePatch[i] addSubview: dateLabel[i]];
        
        
          
        
        if (webwall[i] == nil)
        {
            webwall[i] = [[AsyncImageView alloc] initWithFrame:CGRectMake(6, 52, 295,145)];
            
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
        [ImagePatch[i] addSubview:webwall[i]];
        
        UITapGestureRecognizer *webViewTapped6 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(OpenFeed:)];
        webViewTapped6.numberOfTapsRequired = 1;
        
        webViewTapped6.view.tag=i;
        webViewTapped6.delegate = self;
        
        
        // [webwall[i] addSubview:webViewTapped6];
        [webwall[i] addGestureRecognizer:webViewTapped6];
        
        
       socializeBg[i] = [[UIView alloc]initWithFrame:CGRectMake(1, 300-44,302,44)];
        socializeBg[i].backgroundColor = [UIColor clearColor];
        [ImagePatch[i] addSubview:socializeBg[i]];
        
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
        
       
        
		
		Th_name_Lbl[i]		=	[[UILabel alloc] initWithFrame:CGRectMake(1, 202,302,50)];
		Th_name_Lbl[i].text           =  data1[i];
		Th_name_Lbl[i].font = [UIFont fontWithName:@"Helvetica Neue, Bold" size: 11.0 ];
		Th_name_Lbl[i].backgroundColor	=	[UIColor whiteColor];
		Th_name_Lbl[i].textColor        = [self colorWithHexString:@"564a50"];
		Th_name_Lbl[i].lineBreakMode = UILineBreakModeWordWrap;
		Th_name_Lbl[i].numberOfLines = 2;
		
		[ImagePatch[i] addSubview: Th_name_Lbl[i]];
        
        m+=325;
		
	}
	
	VideoScroller.contentSize = CGSizeMake(304,325*TotalNumOfRows+20);
	
	[activityIndicator stopAnimating];
}


- (void)OpenFeed:(UITapGestureRecognizer*)sender
{
    UITapGestureRecognizer *gesture = (UITapGestureRecognizer *) sender;
    int index = gesture.view.tag;
    _closeButton.alpha = 1.0;
    VideoScroller.alpha=0.0;
    VideoScrollerTweet.alpha = 0.0;
    twitterButton.alpha = 0.0;
    faceBookButton.alpha = 0.0;
    _fbTweetBgImage.alpha = 0.0;
    _singleFeedScroll.alpha=1.0;
    _singleScrollImage.alpha = 1.0;
    
    if (_bigImageView == nil)
    {
        _bigImageView = [[AsyncImageView alloc] initWithFrame:CGRectMake(5, 52, 291,206)];
        
        _bigImageView.contentMode = UIViewContentModeScaleToFill;
    }
    
    
    
    NSString * newString = [data[index] stringByReplacingOccurrencesOfString:@"_s" withString:@"_n"];
    
    NSLog(@"xx=%@xx",newString);
    
    
    
    _bigImageView.contentMode = UIViewContentModeScaleToFill;
    _bigImageView.userInteractionEnabled=YES;
    
    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:_bigImageView];
    
    _bigImageView.tag=index;
    NSURL *url1 = [NSURL URLWithString:newString];
    NSLog(@"nsurl = %@",url1);
    ((AsyncImageView *)_bigImageView).imageURL =url1;
    [_singleFeedScroll addSubview:_bigImageView];
    
    _movieNameLabel.text = data6[index];
    _dateBigLabel.text = data5[index];
    
    
    
    maximumLabelSize = CGSizeMake(300, 5000);
    CGSize expectedLabelSize = [data1[index] sizeWithFont:_descLabel.font constrainedToSize:maximumLabelSize lineBreakMode:_descLabel.lineBreakMode];
    
    CGRect newFrame = _descLabel.frame;
    newFrame.size.height = expectedLabelSize.height;
    
    NSLog(@"height-=%f",expectedLabelSize.height);
    
    _descLabel.text  =  data1[index];
    [_descLabel sizeToFit];
    
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
        [faceBookBtn setImage:[UIImage imageNamed:@"facebook_icon.png"] forState:UIControlStateNormal];
        [faceBookBtn sizeToFit];
        faceBookBtn.tag=index;
        [faceBookBtn addTarget:self action:@selector(fbshare:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        UIButton *twitterBtn = [[UIButton alloc] initWithFrame:CGRectZero];
        [twitterBtn setImage:[UIImage imageNamed:@"twitter_icon.png"] forState:UIControlStateNormal];
        [twitterBtn sizeToFit];
        twitterBtn.tag=index;
        [twitterBtn addTarget:self action:@selector(twitter:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        UIButton *emailBtn = [[UIButton alloc] initWithFrame:CGRectZero];
        [emailBtn setImage:[UIImage imageNamed:@"email_icon.png"] forState:UIControlStateNormal];
        [emailBtn sizeToFit];
        emailBtn.tag=index;
        [emailBtn addTarget:self action:@selector(mailCompose:) forControlEvents:UIControlEventTouchUpInside];
        
        
        actionBarDetail.betweenButtonsPadding=5.0;
        actionBarDetail.itemsRight = [NSArray arrayWithObjects:faceBookBtn, twitterBtn,emailBtn, nil];
        [_socialFeedsBgView addSubview:actionBarDetail];
    }
    
    _socialFeedsBgView.frame = CGRectMake(0, 317+_descLabel.frame.size.height+5, 302, 39);
    _singleFeedScroll.contentSize=CGSizeMake(302, _descLabel.frame.size.height+370);
    
}

- (IBAction)close:(UIButton *)sender
{
    _closeButton.alpha = 0.0;
    _singleScrollImage.alpha = 0.0;
    _singleFeedScroll.alpha = 0.0;
    twitterButton.alpha = 1.0;
    faceBookButton.alpha = 1.0;
    _fbTweetBgImage.alpha = 1.0;
    VideoScroller.alpha = 1.0;
    ((AsyncImageView *)_bigImageView).image = nil;
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
-(void)fetchAllData
{
    twitterButton.userInteractionEnabled=NO;

    check_on=1;

    if (check1==0) {
        
        check1=1;

    VideoScroller.alpha = 1.0;
    VideoScrollerTweet.alpha = 0.0;
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        GlobalClass *obj=[GlobalClass getInstance];
        NSString* post ;
        
        NSLog(@"NEWSDATA=%@",obj.fbtoken);
        
        
        for (NSDictionary *actoAgent in obj.fbtoken)
        {
            
            FBID = [actoAgent objectForKey:@"facebook_id"];
            ACCESSTOKEN = [actoAgent objectForKey:@"access_token"];
       
//             post = [NSString stringWithFormat:@"https://graph.facebook.com/550567515000902/feed?access_token=CAAJ25V5uwFYBAPmCof3pcfiZCjLuXhJuylb3cC8RZBZAmxczPG12yPszarmRVFL9jwfuRQuORoz7LLD2iBOIjODrrpis2ZBUYBNbVt5cx9galnPCOU5KuiQZBpB6hBTyyaoI9ljZA6JzfhZAetVRyg4&limit=100"];
            
            post = [NSString stringWithFormat:@"https://graph.facebook.com/%@/feed?access_token=%@",FBID,ACCESSTOKEN];
            NSLog(@"URL=%@",post);
            
            
        }
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:post] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:300.0];
        
        
        
        [request setHTTPMethod:@"GET"];
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
            
            
            
            NSDictionary *getdata1 = [json objectForKey:@"data"];
            
            
            GlobalClass *obj=[GlobalClass getInstance];
            obj.FBSTATUS = getdata1;
            
        }
        dispatch_async(dispatch_get_main_queue()	, ^{

            [self DisplayFeeds];
            twitterButton.userInteractionEnabled=YES;

            VideoScroller.alpha = 1.0;
            VideoScrollerTweet.alpha = 0.0;
        });
        
        
    });
        
    }
    
    
    else{
        
    }
	
}

-(void)Fetchtwt
{
    
    faceBookButton.userInteractionEnabled=NO;

    check_on=0;

    if (check==0) {
        check=1;
    VideoScroller.alpha = 0.0;
    
    VideoScrollerTweet.alpha = 1.0;
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        GlobalClass *obj=[GlobalClass getInstance];
        
        NSString* urlString = [NSString stringWithFormat:@"http://apps.medialabs24x7.com/besharam/rel_twitter_tweets.php?deviceno=%@",obj.dev];
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
        
        NSArray *responseDict = [stringResponse JSONValue];
        
        
        int i = 0;
        for (NSString *FetchTweets in responseDict){
            
            
            tweets[i]= [NSString stringWithFormat:@"%@",FetchTweets];
            
            NSLog(@"FbFeeds[i]=%@",tweets[i]);
            shareText[i] = [NSString stringWithFormat:@"%@",tweets[i]];
            sharetweet[i] = [NSString stringWithFormat:@"%@",tweets[i]];

            
            i++;
        }
        divider=i;
        NSLog(@"divider=%d",divider);
        
        TotalNumOfTweets=i;
        
        
        dispatch_async(dispatch_get_main_queue()	, ^{
            check=1;

            [self DisplayFeedsTweets];
            faceBookButton.userInteractionEnabled=YES;

            VideoScroller.alpha = 0.0;
            
            VideoScrollerTweet.alpha = 1.0;
        });
        
    });
        
    }
    
    
    else
    {
        
    }
}



- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    for (int j=0; j<TotalNumOfTweets; j++)
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
        NSString *getid = [from objectForKey:@"fb_id"];
        NSLog(@"idiss=%@",getid);

        
//        if ([getid isEqualToString:FBID]) {
        
            
            NSString    *msg= [actoAgent objectForKey:@"message"];
            NSString    *pic= [actoAgent objectForKey:@"picture"];
            
            if (msg!=nil && pic!=nil) {
                data1[i] = [actoAgent objectForKey:@"message"];
                data6[i]= [from objectForKey:@"name"];

                NSString *timeZone =[actoAgent objectForKey:@"fb_id"];
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
                    
                    
                    shareText1[i] = data1[i];
                    sharetweet1[i] = data1[i];
                    i++;
                    
                }
                
                else
                {
                    NSLog(@"not done");
                }
                
            }
        
            
//        }
        
        
        TotalNumOfRows = i;  
        
        
    }
    
    
}
-(void)twitter:(UIButton *)sender{
    NSUInteger check = [[NSUserDefaults standardUserDefaults] integerForKey:@"twtSwitch"];
    if (check==1 || check==2)
    {
        NSUserDefaults *setUserDefaults=[NSUserDefaults standardUserDefaults];
        [setUserDefaults setInteger:1 forKey:@"twtSwitch"];
        
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
        
        
        if (check_on==1) {
            //NSString	*str= [NSString stringWithFormat:@"\"%@\"%@ ",sharetweet[gesture.view.tag],twtsharetext];
            if ([sharetweet1[[sender tag]] length ]>47) {
                strr= [sharetweet1[[sender tag]] substringToIndex:47];
                
            }
            else
            {
                strr= sharetweet1[[sender tag]];
            }
            // [self fbios6:strr];
            
            
            
            //  NSString	*str= [NSString stringWithFormat:@"\"%@\"%@",strr,twtsharetext];
            
            
        }
        
        else{
            //NSString	*str= [NSString stringWithFormat:@"\"%@\"%@ ",sharetweet[gesture.view.tag],twtsharetext];
            if ([sharetweet[[sender tag]] length ]>47) {
                strr= [sharetweet[[sender tag]] substringToIndex:47];
                
            }
            else
            {
                strr= sharetweet[[sender tag]];
            }
            // [self fbios6:strr];
            
        }
        
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
    
    else
    {
        UIAlertView *twtAlert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please go to the profile section and turn on Facebook / Twitter settings." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        twtAlert.tag=0;
        [twtAlert show];
        
    }
	}

-(IBAction)fbshare:(UIButton *)sender
{
    
    NSUInteger check = [[NSUserDefaults standardUserDefaults] integerForKey:@"fbSwitch"];
    if (check==1 || check==2)
    {
        NSUserDefaults *setUserDefaults=[NSUserDefaults standardUserDefaults];
        [setUserDefaults setInteger:1 forKey:@"fbSwitch"];
        
        NSString *ver = [[UIDevice currentDevice] systemVersion];
        float ver_float = [ver floatValue];
        if (ver_float < 6.0)
        {
            
        }
        else{
            NSString*  strr;
            if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
                if (check_on==1) {
                    strr= [shareText1[[sender tag]] substringToIndex:47];
                    
                }
                
                else
                    strr= [shareText[[sender tag]] substringToIndex:47];
                
                
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
    
    else
    {
        UIAlertView *twtAlert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please go to the profile section and turn on Facebook / Twitter settings." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        twtAlert.tag=0;
        [twtAlert show];
        
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
            if (check_on==1) {
                [self displayComposerSheet:shareText1[[sender tag]]];
                
            }
            else
                [self displayComposerSheet:shareText[[sender tag]]];
		}
		
		else
		{
            if (check_on==1) {
                [self launchMailAppOnDevice:shareText1[[sender tag]]];
                
            }
            else
                [self launchMailAppOnDevice:shareText[[sender tag]]];
            
		}
	}
	
	else
	{
        if (check_on==1) {
            [self launchMailAppOnDevice:shareText1[[sender tag]]];
            
        }
        else
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

- (IBAction)faceBookFeed:(id)sender {
    
    check_on=1;
    
    [faceBookButton setBackgroundImage:[UIImage imageNamed:@"fbfeed_btn_black.png"] forState:UIControlStateNormal];
    [twitterButton setBackgroundImage:[UIImage imageNamed:@"twitter_btn.png"] forState:UIControlStateNormal];
    
    if(TotalNumOfRows==0)
    {
        [activityIndicator startAnimating];
        
        [self performSelector:@selector(fetchAllData) withObject:nil afterDelay:0.0];
        
    }
    else
    {
        
    }
    VideoScrollerTweet.alpha = 0.0;
    
    VideoScroller.alpha = 1.0;
    
}

- (IBAction)twitterFeed:(id)sender {
    check_on=0;

    [faceBookButton setBackgroundImage:[UIImage imageNamed:@"fb_btn.png"] forState:UIControlStateNormal];
    [twitterButton setBackgroundImage:[UIImage imageNamed:@"twitter_btn_h.png"] forState:UIControlStateNormal];
    
    if(TotalNumOfTweets==0)
    {
        [activityIndicator startAnimating];
        
        [self performSelector:@selector(Fetchtwt) withObject:nil afterDelay:0.0];
    }
    else
    {
        
    }
    
    VideoScroller.alpha = 0.0;
    
    VideoScrollerTweet.alpha = 1.0;
    
}
@end
