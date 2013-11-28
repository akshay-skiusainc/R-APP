//
//  R_iphone4ContactUsViewController.m
//  RelianceApplication
//
//  Created by Anish on 10/17/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import "R_iphone4ContactUsViewController.h"
#import "R_iphone4Settings.h"


@interface R_iphone4ContactUsViewController ()

@end

@implementation R_iphone4ContactUsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)BackBtnPressed:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    GlobalClass *obj1=[GlobalClass getInstance];
    
    UIImage* app_bg_image = [UIImage imageNamed:@"rel_i4home_bg.jpg"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:app_bg_image];
    
    
    _footerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"footer_bg.png"]];
    
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
    
}

-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
//-(void)toChat
//{
//    GroupViewController *loginViewController = [[GroupViewController alloc] initWithNibName:@"GroupViewController" bundle:nil];
//    [self.navigationController pushViewController:loginViewController animated:NO];
//    
//}




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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)mailUsButton:(id)sender {
}

- (IBAction)skiusaSiteButton:(id)sender {
    
    NSString *str = [NSString stringWithFormat:@"http://www.skiusainc.com/contactus.php#report-an-app-problem"];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
	
    ////	NSString *urlString = [NSString stringWithFormat:@"http://goo.gl/fzRXe"];
    //	NSString *escaped = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:escaped]];
    //	NSURL * url = [NSURL URLWithString: urlString];
    //
    //	NSLog(@"url=%@",url);
    //	NSLog(@"url=%@",url);
    //
    //
    //
    //	@try
    //	{
    //		NSURL * url = [NSURL URLWithString: urlString];
    //		// use the URL
    //	}
    //	@catch (NSException * e)
    //	{
    //		NSLog( @"URL creation error? %@ - %@", [e name], [e reason] );
    //		@throw;  // throw the exception again, to hopefully get your attention
    //	}
    //
}
-(void)viewWillDisappear:(BOOL)animated{
	[super viewWillDisappear:YES];
	[self.navigationController setNavigationBarHidden:NO animated:NO];
    _footerMainView.frame = CGRectMake(0, 398, _footerMainView.frame.size.width, _footerMainView.frame.size.height);
	
}

-(IBAction)mailCompose:(id)sender
{
	
	//gesture.view.tag);
	
	
	NSString	*shareText= [NSString stringWithFormat:@""];
    
	
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


#pragma mark Compose Mail

// Displays an email composition interface inside the application. Populates all the Mail fields.
-(IBAction)displayComposerSheet:(NSString*)String
{
	MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
	picker.mailComposeDelegate = self;
    [picker setSubject:@"Reliance Entertainment Application related feedback"];
    
    // Set up recipients
    NSArray *toRecipients = [NSArray arrayWithObject:@"info@relianceada.com"];
    NSArray *ccRecipients = [NSArray arrayWithObjects:@"", nil];
    //NSArray *bccRecipients = [NSArray arrayWithObject:@"fourth@example.com"];
    NSString	*str= [NSString stringWithFormat:@"To the Reliance Entertainment App Team,"];
    [picker setToRecipients:toRecipients];
    [picker setCcRecipients:ccRecipients];
    NSString *emailBody = str;
    [picker setMessageBody:emailBody isHTML:NO];
    
    
	
	//	[picker setBccRecipients:bccRecipients];
	
	
	
   	
	// Fill out the email body text
	
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
	NSString *recipients = @"mailto:info@relianceada.com?cc=&subject=Reliance Entertainment Application related feedback";
	//NSString *body = @"&body=All Dabangg 2 Movie details are Available on Dabangg2 App!";
	
	NSString *email = [NSString stringWithFormat:@"%@%@", recipients, string];
	email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
}
//- (IBAction)merchandise:(id)sender
//{
//    iphone4Merchandise *merchandise = [[iphone4Merchandise alloc]initWithNibName:@"iphone4Merchandise" bundle:nil];
//    [self.navigationController pushViewController:merchandise animated:YES];
//    
//    
//}

- (IBAction)chat:(id)sender
{
    //    GroupViewController *group = [[GroupViewController alloc]initWithNibName:@"GroupViewController" bundle:nil];
    //    [self.navigationController pushViewController:group animated:YES];
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Under construction" message:@"Check Back Soon" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    
}- (IBAction)toRelApp:(id)sender {
    
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
