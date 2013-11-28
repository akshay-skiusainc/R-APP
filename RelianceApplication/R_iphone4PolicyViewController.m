//
//  R_iphone4PolicyViewController.m
//  RelianceApplication
//
//  Created by Anish on 10/17/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import "R_iphone4PolicyViewController.h"

@interface R_iphone4PolicyViewController ()

@end

@implementation R_iphone4PolicyViewController
@synthesize Scroller,policyLabel,footerView,TAGIS,loginScreen;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithStr:(NSString *)_loginScreen
{
    if(self)
    {
        loginScreen = _loginScreen;
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage* app_bg_image = [UIImage imageNamed:@"rel_i4home_bg.jpg"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:app_bg_image];
    
    UIImage *image = [UIImage imageNamed:@"home_header_bg1.jpg"];
    [[UINavigationBar appearance] setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];

    
      if ([TAGIS isEqualToString:@"1"]) {
        _footerMainView.alpha = 0.0;
        
        
    }
	//if ([self.navigationController.navigationBar reslindsToSelector:@selector( setBackgroundImage:forBarMetrics:)]){
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"home_header_bg.jpg"] forBarMetrics:UIBarMetricsDefault];
	//}
    
    
    [Scroller setContentSize:CGSizeMake(320, 504*5)];
    
    //Scroller.alpha = 0.7;
    /*
     NSString * data2 = [NSString stringWithFormat:@"The following content tells users about how the Application (App) collects information from mobile applications and disseminates it. All information is kept confidential and not divulged to anyone else for commercial use.\n\nCollection and Use of Information\n\nPersonally identifiable information includes anything that is submitted by user via forms such as surveys, names, email addresses, phone numbers etc.\n\nFollowing is the manner in which information shall be used:\n\t\t• For answering user queries / requests sent to us.\n\t\t• To notify user about policy changes, new terms and conditions, administrative information etc.\n\t\t• Sending marketing information that might be useful to user.\n\t\t• To determine user location and allow access to various location-based services.\n\t\t• For carrying out audits, check, business analysis, creation of new products, increasing customer experience etc.\n\t\t• For ensuring that any legal laws requiring disclosure are adhered to.\n\nOther indirect information collected:\n\t\t• As part of data sets that give us idea about the trends in site/application use and improve customer experience.\n\t\t• Any demographic/ other data submitted on site.\n\t\t• Browser related information.\n\t\t• Information gathered through cookies or other such technologies.\n\nInformation collection methods\n\t•	Browser: Information transmitted through a browser such as operating system version, type of device being used, Internet browser type etc.\n\t\t• Using cookies: Cookies are provided to improve user experience. They help in collecting information on the visitor’s activities on the site. Information such as time spent on site, kind of browser used to access site, language selected etc. For our users that register with our sites for participating or using the products available on the site. We may also use cookies to save basic account related information. Users have the right to disable cookies but it may sometimes hamper smooth functioning of the site / application.\n\t\t. Use of other technologies like pixel tags, clear GIFs: This could be used to keep track of the marketing campaigns and their effectiveness.\n\n\t\t• IP Address: We might track IP addresses and host names to couple collected information with the corresponding Internet entity. This information is also collated to determine if same host are sending multiple requests and prepare reports on how top-level domains are performing. For improvement of App’s onpage content, information might be collected on pages accessed by users or any specific feedback offered by users of the App. This information is not provided to anyone for any commercial use.\n\t\t• Advertisements: Cookies / other technologies provided with advertising banners on sites/applications may collect information such as total visitors looking at pages on sites, visitor mannerisms when they move through the site, replies to Site based promotions / advertisements etc. We may hire services of advertising providers to help us determine improvements in advertise used. This may include providing controlled access to non-personal behavioral information.\n\nOpt-out information\nEvery user that receives information in their email from us, has an option to stop receiving it. Users can send email to opt-out@xyz.com to stop receiving future communications.\n\nSpecific to Applications:\n\t\t• Uninstall: The App can be easily uninstalled by using regular uninstallation practices.\n\t\t• Control on Application: The user will be able to modify preference and can choose to shut down or remove application whenever required.\n\t\t• Complaint: User can report any infringement they believe that has occurred due to use of application at: privacy@xyz.com. We will review every complaint and clarify / rectify it to ensure that user privacy is protected.\n\nExternal site links\nThere is a possibility of other sites being linked through our sites/applications. We are not responsible for privacy or security on these sites. Users should accordingly check the policies on these sites before accessing / using them.\n\nInformation Accuracy\nIt is essential for users to provide accurate information so that they can use the site / applications effectively. If for some reason the information provided is obsolete, not accurate or incomplete and users wants to change / update it, users can go to their “My Account” page and make the necessary changes. Users can also go to the contact us page and contact us.\n\nChildren Privacy protection\nChildren aged 18 or lower should only use the site / application under direct supervision of the guardian.\n\nPrivacy Policy updates\nThe Privacy policy can be updated at any stage, without prior intimation. Users are requested to review the policy regularly as any use of the site / application, means that their user accepts the Privacy policy when accessed.\n\n\nTerms of Use\n\nPlease read the following terms and conditions carefully. These terms govern your use of this application (App). Using the App accepts your compliance with these terms and conditions.\n\nUsers should not use the App if they disagree with the terms and conditions set here. We reserve the right to modify these terms and conditions whenever required and your continuing to use the App concedes that you have accepted the modified condition irrespective of you receiving any intimation about any changes done.\n\nFailure to comply with the terms and conditions gives us the right to suspend or terminate application access to you, without providing any notice along with our other remedies. We also reserve the rights to make required changes to the content, feel, look or any other feature of the App without an obligation of notifying you. We hold the right to cease any or entire use of the App at any time without notice to you.\n\nYou shall bear all the applicable rates and subsequent charges for using your mobile service provider’s messaging or any other service required for the functioning of the App.\n\nYou agree that the cell phone number provided by you for registering the App is registered in your name and that you will not use mobile number or cell phone of any other person or entity to register or carry out any other activity required in relation to this App.\n\nYou shall have all appropriate access to the mobile subscription provider’s services required for proper functioning of the App. It is your responsibility to ensure that the system requirements for running the App are met appropriately even if they are not listed in the system specification.\n\nYou assure that you will not carry out formatting, branding or any modification to the App including but not limited to attaching promotions or advertisements to it. All Yeh Jawaani Hai Deewani related content in this App remains the sole property of Dharma Productions Pvt. Ltd. and SKI USA INC has been given due permission to use it on the App.\n\nAny reproduction or use of this material without explicit permission from Dharma Productions Pvt. Ltd. is strictly prohibited. SKI USA INC has provided the functionality and technical expertise in developing the App and its use is protected by respective intellectual property laws. We grant you a limited, non-exclusive, non-transferable, revocable license to download and use the Content on a designated compatible mobile device, solely for your own personal, non-commercial use.\n\nYou shall not reproduce, modify, perform, transfer, distribute, sell, create, derivative works of or otherwise use or make available the Content or the Program except as expressly provided for in this Agreement.\n\nYou may not: (i) copy the Application; or (ii) modify, adapt, translate, reverse engineer, make alterations, decompile, disassemble or make derivative works based on the Application, except as otherwise permitted by law.\n\nWe provide the Program 'as is' and shall not be held liable for your use of the information, content, or material contained therein. We will not be liable for any loss of any kind arising from the use of this App.\n\nTO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE LAW, WE ARE LICENSING THE APPLICATION “AS IS,” “AS AVAILABLE,” AND “WITH ALL FAULTS.” WE MAKE NO REPRESENTATIONS OR WARRANTIES ABOUT THE SUITABILITY, RELIABILITY, TIMELINESS, AND ACCURACY, FOR ANY PURPOSE, OF THE APPLICATION, THE OPERATION OF THE APPLICATION ALONE OR IN CONJUNCTION WITH ANY DEVICE, OR THE CONTENT CONTAINED HEREIN.\n\nWE DISCLAIM ALL WARRANTIES, EITHER EXPRESS OR IMPLIED, REGARDING THE APPLICATION AND ITS OPERATION AND EXPRESSLY DISCLAIM THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT.\n\nTO THE EXTENT NOT PROHIBITED BY LAW, IN NO EVENT SHALL WE BE LIABLE FOR ANY CONSEQUENTIAL, INDIRECT, INCIDENTAL, PUNITIVE, SPECIAL OR OTHER RELATED OR SIMILAR DAMAGES WHATSOEVER, INCLUDING WITHOUT LIMITATION, DAMAGES FOR LOSS OF BUSINESS PROFITS, BUSINESS INTERRUPTION, LOSS OF BUSINESS INFORMATION, AND THE LIKE CONNECTED WITH THE USE OF OR INABILITY TO USE THE APPLICATION, AND FOR ANY CAUSE OF ACTION, INCLUDING CONTRACT, TORT (INCLUDING NEGLIGENCE) OR OTHERWISE, EVEN IF WE HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.\n\nANY DAMAGES ARISING UNDER THIS AGREEMENT OR THE USE OF THE APPLICATION THAT WE ARE REQUIRED TO PAY FOR ANY PURPOSE WHATSOEVER, INCLUDING WITHOUT LIMITATION, CONTRACT, TORT (INCLUDING NEGLIGENCE) OR OTHERWISE, SHALL BE LIMITED TO INDIAN RUPEES HUNDRED (INR 100.00).\n\nNo action, regardless of form, whether in court or through arbitration, arising out of any transaction under this Agreement, may be brought by You more than one year after You have knowledge of the occurrence which gives rise to the cause of such action.\n\nYou agree to indemnify and hold harmless Dharma Productions Pvt. Ltd., SKI USA INC and its affiliates, officers, directors, employees, consultants, agents and anyone providing information or software used in the Application from any and all claims arising from, related to, or incidental to Your use of the Application.\n\nAny legal issues in this context will be subject to the exclusive jurisdiction of the courts of Mumbai, India.\n\nContest – Terms and Conditions\n\n\t\t• Users of the App willing to enter the contests, will have to provide their contact details like email address and mobile number to become eligible for the contest.\n\t\t• One entry per contest is allowed for every device on which the mobile application has been uploaded.\n\t\t• Contestants should be at least 18 years or should be an adult as deemed by the governing local authority to enter the contest.\n\t\t• Judges’ decisions are final and binding. Contest holders reserve the right to stop or cancel the contest at any time without giving any notice.\n\t\t• Contest holders reserve the right to disqualify any entries for any reason, at their sole and absolute discretion.\n\t\t• Odds of winning depend upon number of entries received.\n\t\t• Winning constitutes permission (except where prohibited by law) to use Winner’s name, images, hometown, likeness, prize won, and photograph (all at app developer’s discretion) for future advertising, publicity in any and all media now or hereafter devised throughout the world in perpetuity, without additional compensation, notification or permission.\n\t\t• App developer reserves the right to disqualify any Entry for any reason, in its sole and absolute discretion.\n\t\t• In case of prizes liable for taxation; all costs, taxes and financial obligation and their reporting to respective authority shall be responsibility of the winner.\n\t\t• Wherever the contest entry requires an original work, the contestant shall ensure that all their submissions, entries, answers etc. are their personal intellectual property free from any copyright infringement. Any infringements can result in cancellation of contestant’s eligibility.\n\t\t• The app developer is not responsible for intimating to the winner in any manner apart from the details provided by the winner. In case, a winner/s is/are not reachable, the next winner/s shall be drawn from the pool of entries.\n\t\t• Prizes shall be sent from normal modes of deliveries. The App developer shall not be responsible for any damage to prizes during the transportation nor shall be liable to provide replacement of the prize.\n\t\t• Contestant agrees that any and all disputes and causes of action arising out of or connected with Contests, or any prizes awarded, shall be resolved individually, without resort to any form of class action lawsuit.\n\t\t• Contestant hereby waives all rights to claim, punitive, incidental or consequential damages, or any other damages, including attorneys’ fees, other than contestant’s actual out-of-pocket expenses (i.e., costs associated with entering this Contest), and contestant (or, if an eligible minor, his/her parent or legal guardian) further waives all rights to have damages multiplied or increased.\n\t\t• Any legal issues in this context will be subject to the exclusive jurisdiction of the courts of Mumbai, India."];
     CGSize maximumLabelSize = CGSizeMake(315, 7200);
     
     CGSize expectedLabelSize = [data2 sizeWithFont:policyLabel.font constrainedToSize:maximumLabelSize lineBreakMode:policyLabel.lineBreakMode];
     
     CGRect newFrame = policyLabel.frame;
     newFrame.size.height = expectedLabelSize.height;
     policyLabel.frame = CGRectMake(2, 78, 315, expectedLabelSize.height);
     Scroller.contentSize=CGSizeMake(320, expectedLabelSize.height+200);
     NSLog(@"height-=%f",expectedLabelSize.height);
     Scroller.userInteractionEnabled	=YES;
     Scroller.showsVerticalScrollIndicator = YES;
     Scroller.scrollEnabled = YES;
     
     policyLabel.text=data2;
     */
	
	activityIndicator = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
	activityIndicator.center=CGPointMake(320/2, 548/2);
	// activityIndicator.transform = CGAffineTransformMakeScale(2.0, 2.0);
	[activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
	[self.view addSubview:activityIndicator];
	[activityIndicator startAnimating];
	
	
	
	[self performSelector:@selector(fetchAllData) withObject:nil afterDelay:0.0];
    
    
    
    footerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"footer_bg.png"]];
    
    
    
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
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
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


-(IBAction)BackBtnPressed:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}
-(void)viewWillDisappear:(BOOL)animated{
	[super viewWillDisappear:YES];
	[self.navigationController setNavigationBarHidden:NO animated:NO];
    _footerMainView.frame = CGRectMake(0, 398, _footerMainView.frame.size.width, _footerMainView.frame.size.height);
	
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
    // [self performSelector:@selector(openFooter1:) withObject:nil afterDelay:0.01 ];
    [_footerMainView removeFromSuperview];
}
-(void)fetchAllData
{
	dispatch_async(dispatch_get_global_queue(0, 0), ^{
		
        GlobalClass *obj=[GlobalClass getInstance];
		NSString* post = [NSString stringWithFormat:@"http://apps.medialabs24x7.com/besharam/fetch_privacy_ios.php?deviceno=%@",obj.dev];
		
		
		
		
		//http://apps.medialabs24x7.com/besharam/fetch_privacy_ios.php?deviceno=123456
		
		
		
		
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
			
			
            //			NSDictionary* interviewdata = [json objectForKey:@"privacypolicy"]; //2
            //
            //			NSLog(@"json=%@",json);
            //
			
			
            
            for (NSDictionary *actoAgent in json)
            {
                description = [actoAgent    objectForKey:@"p_content"];
                
                NSLog(@"description **** =%@",description);
                
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
                policyLabel.frame = CGRectMake(2, 78, 315, expectedLabelSize.height);
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

//- (IBAction)merchandise:(id)sender
//{
//    iphone4Merchandise *merchandise = [[iphone4Merchandise alloc]initWithNibName:@"iphone4Merchandise" bundle:nil];
//    [self.navigationController pushViewController:merchandise animated:YES];
//    
//    
//}
//- (IBAction)chat:(id)sender
//{
//    GroupViewController *group = [[GroupViewController alloc]initWithNibName:@"GroupViewController" bundle:nil];
//    [self.navigationController pushViewController:group animated:YES];
//    
//    
//}

- (IBAction)toRelApp:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Under construction" message:@"Check Back Soon" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    
}
//Ashwini
//- (IBAction)myProfile:(id)sender {
//    iphone4Settings *setting = [[iphone4Settings alloc]initWithNibName:@"iphone4Settings" bundle:nil];
//    [self.navigationController pushViewController:setting animated:YES];
//    
//}


@end
