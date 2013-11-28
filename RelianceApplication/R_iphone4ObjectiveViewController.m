//
//  R_iphone4ObjectiveViewController.m
//  RelianceApplication
//
//  Created by Anish on 10/17/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import "R_iphone4ObjectiveViewController.h"

@interface R_iphone4ObjectiveViewController ()

@end

@implementation R_iphone4ObjectiveViewController

@synthesize Questionlabel,ans1label,ans2label,ans3label,ans4label,Questionis,ANS1,ANS2,ANS3,ANS4;
@synthesize ANS1BUTTON,ANS2BUTTON,ANS3BUTTON,ANS4BUTTON,QID,CorrectAns,selectedans,contestImage;
@synthesize data,importedUrl,objActIndicator,footerView;


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
    self.trackedViewName=@"Objective Contest Screen";
    
    // Do any additional setup after loading the view from its nib.
    UIImage* app_bg_image = [UIImage imageNamed:@"rel_i4home_bg.jpg"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:app_bg_image];;
    [objActIndicator startAnimating];
    footerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"footer_bg.png"]];
    [self performSelector:@selector(openContest) withObject:nil afterDelay:0.0];
    
    
    
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

-(void)openContest
{
    ans1label.text=ANS1;
    ans2label.text=ANS2;
    ans3label.text=ANS3;
    ans4label.text=ANS4;
    Questionlabel.text=Questionis;
    
    NSLog(@"%@ \n %@ \n %@ \n %@ \n %@",ANS1,ANS2,ANS3,ANS4,Questionis);
    
    
    contestImage.userInteractionEnabled = YES;
    
    
    if (contestImage    == nil)
    {
        contestImage = [[AsyncImageView alloc] initWithFrame:CGRectMake(5, 0, 310, 128)];
        
        contestImage.contentMode = UIViewContentModeScaleToFill;
    }
    
    
    
    contestImage.userInteractionEnabled=YES;
    //cancel any previously loading images for this view
    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:contestImage];
    
    //set image URL. AsyncImageView class will then dynamically load the image
    NSURL *url1 = [NSURL URLWithString:importedUrl];
    
    ((AsyncImageView *)contestImage).imageURL =url1;
    
    
    [objActIndicator stopAnimating];
    objActIndicator.alpha = 0.0;
}
-(IBAction)toRelApp:(UIButton *)sender
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Under construction" message:@"Check Back Soon" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    
}

//- (IBAction)merchandise:(id)sender
//{
//    iphone4Merchandise *merchandise = [[iphone4Merchandise alloc]initWithNibName:@"iphone4Merchandise" bundle:nil];
//    [self.navigationController pushViewController:merchandise animated:YES];
//}
//- (IBAction)chat:(id)sender
//{
//    GroupViewController *group = [[GroupViewController alloc]initWithNibName:@"GroupViewController" bundle:nil];
//    [self.navigationController pushViewController:group animated:YES];
//    
//    
//}
//
//- (IBAction)myProfile:(id)sender
//{
//    iphone4Settings *setting = [[iphone4Settings alloc]initWithNibName:@"iphone4Settings" bundle:nil];
//    [self.navigationController pushViewController:setting animated:YES];
//    
//}

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
    _footerMainView.frame = CGRectMake(0, 398, _footerMainView.frame.size.width, _footerMainView.frame.size.height);
    
}
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)ANSSELECTED:(UIButton*)sender
{
    if ([sender tag]==0) {
        
        [ANS1BUTTON setBackgroundImage:[UIImage imageNamed:@"checkbox.png"] forState:UIControlStateNormal];
        [ANS2BUTTON setBackgroundImage:[UIImage imageNamed:@"checkbox2.png"] forState:UIControlStateNormal];
        [ANS3BUTTON setBackgroundImage:[UIImage imageNamed:@"checkbox2.png"] forState:UIControlStateNormal];
        [ANS4BUTTON setBackgroundImage:[UIImage imageNamed:@"checkbox2.png"] forState:UIControlStateNormal];
        
        selectedans= ans1label.text;
        
    }
    
    if ([sender tag]==1) {
        
        [ANS2BUTTON setBackgroundImage:[UIImage imageNamed:@"checkbox.png"] forState:UIControlStateNormal];
        selectedans= ans2label.text;
        
        [ANS1BUTTON setBackgroundImage:[UIImage imageNamed:@"checkbox2.png"] forState:UIControlStateNormal];
        [ANS3BUTTON setBackgroundImage:[UIImage imageNamed:@"checkbox2.png"] forState:UIControlStateNormal];
        [ANS4BUTTON setBackgroundImage:[UIImage imageNamed:@"checkbox2.png"] forState:UIControlStateNormal];
        
        
    }
    
    if ([sender tag]==2) {
        
        [ANS3BUTTON setBackgroundImage:[UIImage imageNamed:@"checkbox.png"] forState:UIControlStateNormal];
        
        [ANS2BUTTON setBackgroundImage:[UIImage imageNamed:@"checkbox2.png"] forState:UIControlStateNormal];
        [ANS1BUTTON setBackgroundImage:[UIImage imageNamed:@"checkbox2.png"] forState:UIControlStateNormal];
        [ANS4BUTTON setBackgroundImage:[UIImage imageNamed:@"checkbox2.png"] forState:UIControlStateNormal];
        
        selectedans= ans3label.text;
        
        
    }
    
    
    else     if ([sender tag]==3) {
        
        [ANS4BUTTON setBackgroundImage:[UIImage imageNamed:@"checkbox.png"] forState:UIControlStateNormal];
        selectedans= ans4label.text;
        
        [ANS2BUTTON setBackgroundImage:[UIImage imageNamed:@"checkbox2.png"] forState:UIControlStateNormal];
        [ANS3BUTTON setBackgroundImage:[UIImage imageNamed:@"checkbox2.png"] forState:UIControlStateNormal];
        [ANS1BUTTON setBackgroundImage:[UIImage imageNamed:@"checkbox2.png"] forState:UIControlStateNormal];
        
        
    }
    
    
}


-(void)Posting:(NSString *)post
{
    //post = [NSString stringWithFormat:@"phone=%@&email=%@",@"null",@"null"];
	
	NSLog(@"post=%@",post);
	NSURL *url=[[NSURL alloc]initWithString:post];
	NSURLRequest *request=[[NSURLRequest alloc]initWithURL:url];
	[NSURLConnection connectionWithRequest:request delegate:self];
    
	
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
-(IBAction)Submit:(UIButton*)sender
{
    objActIndicator.hidden=NO;
    [objActIndicator startAnimating];
	NSLog(@"selected ans =%@",selectedans);
	if (selectedans.length>0) {
        
        //    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        //    post = postingString;
        
        GlobalClass *obj=[GlobalClass getInstance];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSLog(@"You have selected %@",selectedans);
        NSString* filteredString = [selectedans stringByReplacingOccurrencesOfString:@" " withString:@"_"];
        
        NSString	*postingString = [NSString stringWithFormat:@"http://apps.medialabs24x7.com/besharam/rel_update_contest_answer.php?deviceno=%@&ques_id=%@&answer=%@",obj.dev,QID,filteredString];
        NSString*    post = postingString;
        
        NSLog(@"POST=   \n\n%@\n\n",post);
        
        
        //	dispatch_async(dispatch_get_main_queue()	, ^{
        
        
        
        
        //                NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        //
        //                NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        
        
        [request setURL:[NSURL URLWithString:post]];
        
        [request setHTTPMethod:@"POST"];
        
        //  [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Current-Type"];
        
        // [request setHTTPBody:postData];
        
        
        NSURLResponse *response;
        
        NSData *urlData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
        
        NSString *stringResponse = [[NSString alloc] initWithData:urlData encoding:NSASCIIStringEncoding];
        
        NSLog(@"response1++++++++++++++++++++++++++++++++++   =%@",stringResponse);
        
        
        
        NSError* error;
        
        NSDictionary* responseDict = [NSJSONSerialization JSONObjectWithData:urlData //1
                                      
                                                                     options:kNilOptions
                                      
                                                                       error:&error];
        
        NSLog(@"responseDict++++++++++++++++++++++++++++++++++   =%@",responseDict);
        
        for (NSDictionary *actoAgent in responseDict)
        {
            NSString *strCheck= [actoAgent objectForKey:@"response"];
            NSLog(@"strCheck++++++++++++++++++++++++++++++++++   =%@ %d",strCheck,strCheck.length);
            if (strCheck.length ==7) {
                
                UIAlertView* logoutalertbox = [[UIAlertView alloc]initWithTitle:@"Success" message:@"Your answer has been submitted" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil ];
                logoutalertbox.delegate=self;
                logoutalertbox.tag=5;
                [logoutalertbox show];
            }
            else
            {
                UIAlertView* logoutalertbox1 = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Answer not submitted" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil ];
                logoutalertbox1.delegate=self;
                logoutalertbox1.tag=6;
                [logoutalertbox1 show];
                
            }
            
            
        }
        // });
        
        
	}
	
	else{
        
       	
		UIAlertView* logoutalertbox = [[ UIAlertView alloc]initWithTitle:@"Error" message:@"Please provide Input" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil ];
		logoutalertbox.delegate=self;
		[logoutalertbox show];
        
        
	}
    objActIndicator.hidden=YES;
    [objActIndicator stopAnimating];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag==5) {
        if (buttonIndex==0) {
            [self.navigationController popViewControllerAnimated:NO];
        }
    }
}


/*(
 - (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
 {
 self.data = [NSMutableData data];
 }
 
 
 - (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)aData
 {
 [self.data appendData:aData];
 }
 
 - (void)connectionDidFinishLoading:(NSURLConnection *)connection
 {
 [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
 
 NSString *strCheck=[[NSString alloc]initWithData:self.data encoding:NSUTF8StringEncoding];
 if ([strCheck isEqualToString:@"SUCCESS"]) {
 
 UIAlertView* logoutalertbox = [[UIAlertView alloc]initWithTitle:@"Success" message:@"Your answer has been submitted" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil ];
 logoutalertbox.delegate=self;
 logoutalertbox.tag=5;
 [logoutalertbox show];
 }
 else
 {
 UIAlertView* logoutalertbox1 = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Answer not submitted" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil ];
 logoutalertbox1.delegate=self;
 logoutalertbox1.tag=6;
 [logoutalertbox1 show];
 
 }
 
 [objActIndicator stopAnimating];
 [self dismissModalViewControllerAnimated:YES];
 }
 - (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
 {
 NSLog(@"Error is %@",[error description]);
 }
 */
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidUnload
{
    [self setQuestionlabel:nil];
    [self setAns1label:nil];
    [self setAns2label:nil];
    [self setAns3label:nil];
    [self setAns4label:nil];
    [self setANS1BUTTON:nil];
    [self setANS2BUTTON:nil];
    [self setANS3BUTTON:nil];
    [self setANS4BUTTON:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait ;
}
-(BOOL)shouldAutorotate
{
    return YES;
}

@end
