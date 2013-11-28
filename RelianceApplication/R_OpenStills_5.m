//
//  R_OpenStills_5.m
//  RelianceApplication
//
//  Created by Ashwini Pawar on 26/10/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import "R_OpenStills_5.h"

@interface R_OpenStills_5 ()

@end

@implementation R_OpenStills_5

@synthesize stillIndex,imageScroller,imgIndex,dwnloadProgress,logoTimer,movieName;

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

    
    NSLog(@"stillIndex = %d",stillIndex);
    dwnloadProgress.alpha = 0.0;
    [_activictyIndicator startAnimating];
    [self openBigImage];
}
-(IBAction)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)closeButton:(id)sender {
    
    NSLog(@"DAS");
    for(int a=0;a<TotalData;a++)
        
    {
        actionBar[a] = nil;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)getdata

{
    
    GlobalClass *obj=[GlobalClass getInstance];
    
    NSLog(@"images=%@",obj.Dwall);
    
    
    
    int i=0;
    
    for (NSDictionary *actoAgent in obj.Dwall)
        
    {
        
        data1[i]= [actoAgent objectForKey:@"wall_big_img"];
        NSLog(@"wall_big_img=%@",data1[i]);
        
        data2[i]= [actoAgent objectForKey:@"wall_small_img"];
        NSLog(@"wall_big_img=%@",data2[i]);
        
        
        //  NSString *timeZone =[actoAgent objectForKey:@"wall_id"];
        //  NSArray *newArray=[timeZone componentsSeparatedByString:@"_"];
        fbFeedId[i] = [actoAgent objectForKey:@"wall_id"];
        NSLog(@"data4  id ==== =====   %@",fbFeedId[i]);
        
        
        data3[i]= [actoAgent objectForKey:@"wall_tiny"];
        NSLog(@"wall_tiny=%@",data3[i]);
        
        
        
        data4[i]= [actoAgent objectForKey:@"status"];
        
        NSLog(@"status=%@",data4[i]);
        
        data11[i]= [actoAgent objectForKey:@"premium"];
        NSLog(@"premium=%@",data11[i]);
        
        data9[i]= [actoAgent objectForKey:@"movie_name"];
		NSLog(@"movie_name=%@",data9[i]);

        data18[i]= [actoAgent objectForKey:@"wall_name"];
		NSLog(@"movie_name=%@",data18[i]);
        i++;
        
        
        
    }
    
    TotalData=i;
    
    
    
}


-(void)openBigImage

{
    
    [self getdata];
    
    strr= [NSString stringWithFormat:@"%@",data1[imgIndex]];
    
    shareText= strr;
    
    
    imageScroller.tag = 2;
    
    int m = 0;
    
    for(int a=0;a<TotalData;a++)
        
    {
//        m = 320*a;
        if([data9[a]isEqualToString:movieName])
        {
        
     
        
        shareText=[NSString stringWithFormat:@"%@",data3[imgIndex]];
        
        
        
        if (view2[a] == nil)
            
        {
            
            view2[a] = [[AsyncImageView alloc] initWithFrame:CGRectMake(m, 0, 320.0f, 504.0f)];
            
            
            
            view2[a].contentMode = UIViewContentModeScaleToFill;
            
        }
        
        view2[a].backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];
        
        
        
        
        //cancel any previously loading images for this view
        
        [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:view2[a]];
        
        
        
        //set image URL. AsyncImageView class will then dynamically load the image
        
        NSURL *url1 = [NSURL URLWithString:data1[a]];
        
        
        
        ((AsyncImageView *)view2[a]).imageURL =url1;
        
        [imageScroller addSubview:view2[a]];
        
        
        UIView *wallpaperView = [[UIView alloc] initWithFrame:CGRectMake(m+0, 0, 320.0f, 504.0f)];
        
        wallpaperView.backgroundColor=[UIColor clearColor];
        
        wallpaperView.tag=a;
        
        [imageScroller addSubview:wallpaperView];
        
             
        socializeBg[a] = [[UIView alloc]initWithFrame:CGRectMake(0, 504-44, 320, 44)];
        socializeBg[a].backgroundColor = [UIColor clearColor];
        [wallpaperView addSubview:socializeBg[a]];
        
        
        
        
        // SZActionBar *actionBar=[[SZActionBar alloc]initWithFrame:CGRectZero entity:self.entity viewController:self];
        
        if (actionBar[a] == nil)
        {
            
            NSString *entity_Key= [NSString stringWithFormat:@"%@",fbFeedId[a]];
            NSString *entity_name= [NSString stringWithFormat:@"%@",data18[a]];
            self.entity = [SZEntity entityWithKey:entity_Key name:entity_name];
            actionBar[a] = [SZActionBar defaultActionBarWithFrame:CGRectZero entity:self.entity viewController:self];
            
            
            actionBar[a].itemsLeft = [NSArray arrayWithObjects:[SZActionButton viewsButton], [actionBar[a].itemsRight objectAtIndex:0], [actionBar[a].itemsRight objectAtIndex:1], nil];
            // actionBar[i].itemsLeft = [NSArray arrayWithObjects:nil];
            actionBar[a].tag=a;
            
            faceBookBtn = [[UIButton alloc] initWithFrame:CGRectZero];
            [faceBookBtn setImage:[UIImage imageNamed:@"facebook_icon.png"] forState:UIControlStateNormal];
            [faceBookBtn sizeToFit];
            [faceBookBtn addTarget:self action:@selector(fbShare:) forControlEvents:UIControlEventTouchUpInside];
            faceBookBtn.tag=a;
            
            
            twitterBtn = [[UIButton alloc] initWithFrame:CGRectZero];
            [twitterBtn setImage:[UIImage imageNamed:@"twitter_icon.png"] forState:UIControlStateNormal];
            [twitterBtn sizeToFit];
            [twitterBtn addTarget:self action:@selector(tweetShare:) forControlEvents:UIControlEventTouchUpInside];
            twitterBtn.tag=a;
            
            
            emailBtn = [[UIButton alloc] initWithFrame:CGRectZero];
            [emailBtn setImage:[UIImage imageNamed:@"email_icon.png"] forState:UIControlStateNormal];
            [emailBtn sizeToFit];
            [emailBtn addTarget:self action:@selector(mailCompose:) forControlEvents:UIControlEventTouchUpInside];
            emailBtn.tag=a;
            
           
           // actionBar[a].backgroundImageView.backgroundColor = [self colorWithHexString:@"e42477"];
            actionBar[a].backgroundImageView.alpha = 0.4;
            actionBar[a].betweenButtonsPadding=3.0;
            actionBar[a].itemsRight = [NSArray arrayWithObjects:faceBookBtn, twitterBtn,emailBtn, nil];
            
            
            
            [socializeBg[a] addSubview:actionBar[a]];
        }
            
            downloadHD[a] = [UIButton buttonWithType:UIButtonTypeCustom];
            
            downloadHD[a].frame = CGRectMake(145, 504-32, 49, 21);
            
            [downloadHD[a] setBackgroundImage:[UIImage imageNamed:@"wall_dawon_icon"] forState:UIControlStateNormal];
            
            // downloadButton[a].userInteractionEnabled=YES;
            
            downloadHD[a].tag=a;
            
            [downloadHD[a] addTarget:self action:@selector(downloadHDButton:) forControlEvents:UIControlEventTouchUpInside];
            
            [wallpaperView addSubview:downloadHD[a]];
            
        m=m+320;
        
      }
        
        else if([movieName isEqualToString:@"All"])
        {
            
        
            
            shareText=[NSString stringWithFormat:@"%@",data3[imgIndex]];
            
            
            
            if (view2[a] == nil)
                
            {
                
                view2[a] = [[AsyncImageView alloc] initWithFrame:CGRectMake(m, 0, 320.0f, 504.0f)];
                
                
                
                view2[a].contentMode = UIViewContentModeScaleToFill;
                
            }
            
            view2[a].backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];
            
            
            
            
            //cancel any previously loading images for this view
            
            [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:view2[a]];
            
            
            
            //set image URL. AsyncImageView class will then dynamically load the image
            
            NSURL *url1 = [NSURL URLWithString:data1[a]];
            
            
            
            ((AsyncImageView *)view2[a]).imageURL =url1;
            
            [imageScroller addSubview:view2[a]];
            
            
            UIView *wallpaperView = [[UIView alloc] initWithFrame:CGRectMake(m+0, 0, 320.0f, 504.0f)];
            
            wallpaperView.backgroundColor=[UIColor clearColor];
            
            wallpaperView.tag=a;
            
            [imageScroller addSubview:wallpaperView];
            
            
            socializeBg[a] = [[UIView alloc]initWithFrame:CGRectMake(0, 504-44, 320, 44)];
            socializeBg[a].backgroundColor = [UIColor clearColor];
            [wallpaperView addSubview:socializeBg[a]];
            
            
            
            
            // SZActionBar *actionBar=[[SZActionBar alloc]initWithFrame:CGRectZero entity:self.entity viewController:self];
            
            if (actionBar[a] == nil)
            {
                
                NSString *entity_Key= [NSString stringWithFormat:@"%@",fbFeedId[a]];
                NSString *entity_name= [NSString stringWithFormat:@"%@",data18[a]];
                self.entity = [SZEntity entityWithKey:entity_Key name:entity_name];
                actionBar[a] = [SZActionBar defaultActionBarWithFrame:CGRectZero entity:self.entity viewController:self];
                
                
                actionBar[a].itemsLeft = [NSArray arrayWithObjects:[SZActionButton viewsButton], [actionBar[a].itemsRight objectAtIndex:0], [actionBar[a].itemsRight objectAtIndex:1], nil];
                // actionBar[i].itemsLeft = [NSArray arrayWithObjects:nil];
                actionBar[a].tag=a;
                
                faceBookBtn = [[UIButton alloc] initWithFrame:CGRectZero];
                [faceBookBtn setImage:[UIImage imageNamed:@"facebook_icon.png"] forState:UIControlStateNormal];
                [faceBookBtn sizeToFit];
                [faceBookBtn addTarget:self action:@selector(fbShare:) forControlEvents:UIControlEventTouchUpInside];
                faceBookBtn.tag=a;
                
                
                twitterBtn = [[UIButton alloc] initWithFrame:CGRectZero];
                [twitterBtn setImage:[UIImage imageNamed:@"twitter_icon.png"] forState:UIControlStateNormal];
                [twitterBtn sizeToFit];
                [twitterBtn addTarget:self action:@selector(tweetShare:) forControlEvents:UIControlEventTouchUpInside];
                twitterBtn.tag=a;
                
                
                emailBtn = [[UIButton alloc] initWithFrame:CGRectZero];
                [emailBtn setImage:[UIImage imageNamed:@"email_icon.png"] forState:UIControlStateNormal];
                [emailBtn sizeToFit];
                [emailBtn addTarget:self action:@selector(mailCompose:) forControlEvents:UIControlEventTouchUpInside];
                emailBtn.tag=a;
                
                
                actionBar[a].backgroundImageView.alpha = 0.4;
                actionBar[a].betweenButtonsPadding=3.0;
                actionBar[a].itemsRight = [NSArray arrayWithObjects:faceBookBtn, twitterBtn,emailBtn, nil];
                
                
                
                [socializeBg[a] addSubview:actionBar[a]];
            }
            
            downloadHD[a] = [UIButton buttonWithType:UIButtonTypeCustom];
            
            downloadHD[a].frame = CGRectMake(145, 504-32, 49, 21);
            
            [downloadHD[a] setBackgroundImage:[UIImage imageNamed:@"wall_dawon_icon"] forState:UIControlStateNormal];
            
            // downloadButton[a].userInteractionEnabled=YES;
            
            downloadHD[a].tag=a;
            
            [downloadHD[a] addTarget:self action:@selector(downloadHDButton:) forControlEvents:UIControlEventTouchUpInside];
            
            [wallpaperView addSubview:downloadHD[a]];
            
            m=m+320;
            
        }

        
    }
    
    imageScroller.contentSize = CGSizeMake(m, 504);

    [self.imageScroller setContentOffset:CGPointMake(320*stillIndex, 0.0) animated:YES];
    
    
    
    [self.view addSubview:_closeButtonView];
    
    
    
    
    
    [_activictyIndicator stopAnimating];
    
    
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



- (IBAction)downloadHDButton:(UIButton *)sender {
    imgIndex= sender.tag;
    
    dwnloadProgress.alpha = 1.0;
    
    dwnloadProgress.progress = 0.2;
    
    [view2[imgIndex] addSubview:dwnloadProgress];
    
    _activictyIndicator.alpha=1.0;
    
    [self.view addSubview:_activictyIndicator];
    
    [_activictyIndicator startAnimating];
    
    
    
    logoTimer = [NSTimer scheduledTimerWithTimeInterval:0.06 target:self selector:@selector(downloadProgress:) userInfo:nil repeats:YES];
    
    [self performSelector:@selector(downloadingHDImage) withObject:nil afterDelay:0.0];
    
}
-(void)downloadingHDImage

{
    
    
    
    dispatch_async(dispatch_get_main_queue()	, ^{
        
        NSData *imgData=[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",data1[imgIndex]]]];
        
        UIImage *image = [[UIImage alloc] initWithData:imgData];
        
        UIImageWriteToSavedPhotosAlbum(image, self, nil, nil);
        
        //int i= (imgData.length / )
        
        
        
        [self performSelector:@selector(Finishloader) withObject:nil afterDelay:2.0];
        
        
        
    });
    
    
    
}
-(void)downloadProgress:(int)progress

{
    
    
    
    
    
    dwnloadProgress.progress = dwnloadProgress.progress + 0.1;
    
    
    
    
    
    
    
}
-(void)Finishloader

{
    downloadHD[imgIndex].enabled = YES;
    [_activictyIndicator stopAnimating];
    
    
    UIAlertView*	alertBox = [[ UIAlertView alloc]initWithTitle:@"Success" message:@"Photo is Downloaded in Your Photo Library" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil ];
    
    [alertBox show];
    
    
    
    dwnloadProgress.alpha = 0.0;
    
    dwnloadProgress.progress = 0.4;
    
    _activictyIndicator.alpha=0.0;
    
    
    
}


-(void)getsharetext

{
    
    
    
    GlobalClass *obj=[GlobalClass getInstance];
    
    NSLog(@"images=%@",obj.wallpapers);
    
    
    
    fbsharetext = [obj.wallpapers objectForKey:@"fb_share"];
    
    NSLog(@"fb_share=%@",fbsharetext);
    
    
    
    twtsharetext = [obj.wallpapers objectForKey:@"twitter_share"];
    
    NSLog(@"twitter_share=%@",twtsharetext);
    
    
    
    
    
    mailsharesub = [obj.wallpapers objectForKey:@"email_subject"];
    
    NSLog(@"email_subject=%@",mailsharesub);
    
    
    
    
    
    mailsharetext = [obj.wallpapers objectForKey:@"email_share"];
    
    NSLog(@"email_share=%@",mailsharetext);
    
    
    
}

#pragma mark Compose Mail

-(IBAction)mailCompose:(UIButton *)sender

{
    
    imgIndex=sender.tag;
    
    
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
    
    
    
    MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
    
    picker.mailComposeDelegate = self;
    
    
    
    [picker setSubject:mailsharesub];
    
    
    
    
    
    UIGraphicsBeginImageContext(view2[imgIndex].frame.size);
    
    [view2[imgIndex].layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *image= UIGraphicsGetImageFromCurrentImageContext();
    
    NSData *imageData = UIImageJPEGRepresentation(image,1);
    
    [picker addAttachmentData:imageData mimeType:@"image/jpg" fileName:data1[imgIndex]];
    
    
    
    
    
    // Set up recipients
    
    NSArray *toRecipients = [NSArray arrayWithObject:@""];
    
    NSArray *ccRecipients = [NSArray arrayWithObjects:@"", nil];
    
    //NSArray *bccRecipients = [NSArray arrayWithObject:@"fourth@example.com"];
    
    NSString	*str= [NSString stringWithFormat:@"%@  \n\n You can also download HD image from %@",mailsharetext,data2[imgIndex]];
    
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
    if (check==1 || check==2)
    {
        NSUserDefaults *setUserDefaults=[NSUserDefaults standardUserDefaults];
        [setUserDefaults setInteger:1 forKey:@"twtSwitch"];
        
        imgIndex=sender.tag;
        
        strr= [NSString stringWithFormat:@"%@",data3[imgIndex]];
        
        shareText= strr;
        
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
        
        //	 NSLog(@"Unable to add the image!");
        
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
    
    else
    {
        UIAlertView *twtAlert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please go to the profile section and turn on Facebook / Twitter settings." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        twtAlert.tag=0;
        [twtAlert show];
        
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
    
    // NSString * str = [NSString stringWithFormat:@"%@",twtsharetext,shareText];
    
    [tweetSheet setInitialText:twtsharetext];
    
    
    //  Adds an image to the Tweet
    
    //  For demo purposes, assume we have an image named 'larry.png'
    
    //  that we wish to attach
    
    //	if (![tweetSheet addImage:[UIImage imageNamed:@"114x114.png"]]) {
    
    //	 NSLog(@"Unable to add the image!");
    
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
    if (check==1 || check==2)
    {
        NSUserDefaults *setUserDefaults=[NSUserDefaults standardUserDefaults];
        [setUserDefaults setInteger:1 forKey:@"fbSwitch"];
        
        
        int a =sender.tag;
        
        //	NSString *str=[NSString stringWithFormat:@"Downloaded this amazing wallpaper: %@ from official YJHD App. Get free copy of the App @<tiny url>",titleMusic.text];
        
        //	post = [[FBFeedPost alloc] initWithLinkPath:@"http://ow.ly/g4bRR" caption:str];
        
        strr= [NSString stringWithFormat:@"%@",data3[a]];
        
        shareText= strr;
        
        
        
        NSString *ver = [[UIDevice currentDevice] systemVersion];
        
        float ver_float = [ver floatValue];
        
        if (ver_float < 6.0)
            
        {
            
            //        sharepost = [[FBFeedPost alloc] initWithLinkPath:shareText caption:fbsharetext];
            //
            //        [self sharefeedonfb1:sharepost];
            
            
            
        }
        
        else{
            
            
            
            
            
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
    
    else
    {
        UIAlertView *twtAlert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please go to the profile section and turn on Facebook / Twitter settings." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        twtAlert.tag=0;
        [twtAlert show];
        
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
        
        
        
        //        NSString	 *STR= [NSString stringWithFormat:@"%@ - Use official Reliance Entertainment App to see all Besharam Wallpapers",data1[sendtitle]];
        
        
        
        //   [fbController addImage:[UIImage imageNamed:@"114x114.png"]];
        
        [fbController setInitialText:fbsharetext];
        
        [fbController addURL:[NSURL URLWithString:stringis]];
        
        [fbController setCompletionHandler:completionHandler];
        
        [self presentViewController:fbController animated:YES completion:nil];
        
    }
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
