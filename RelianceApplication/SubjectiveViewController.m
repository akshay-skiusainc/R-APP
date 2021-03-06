//
//  SubjectiveViewController.m
//  Relapp
//
//  Created by Anish on 8/6/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import "SubjectiveViewController.h"
#import "iphone5Settings.h"
#import "Merchandise.h"
#import "iphone5GroupViewController.h"

@interface SubjectiveViewController ()

@end

@implementation SubjectiveViewController
@synthesize Questionlabel,Questionis,QID,importedUrl,contestImage,data,selectedans,ansTextView,Scroller;
@synthesize placeHolderTitle,objActIndicator;

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
    // Do any additional setup after loading the view from its nib.
    self.trackedViewName=@"Subjective Contest Screen";

    
    NSData* imageData1 = [[NSUserDefaults standardUserDefaults] objectForKey:@"app_bg_image"];
    UIImage* app_bg_image = [UIImage imageWithData:imageData1];
    self.view.backgroundColor = [UIColor colorWithPatternImage:app_bg_image];
    _footerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"footer_bg.png"]];
    
      [self performSelector:@selector(openContest) withObject:nil afterDelay:0.0];
    
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

    
}

-(void)openContest
{
    //    NSURL *url = [NSURL URLWithString:importedUrl];
    //    NSData *imageData1 = [NSData dataWithContentsOfURL:url];
    //    UIImage *image = [UIImage imageWithData:imageData1];
    //    contestImage.image=image;
    
    if (contestImage    == nil)
    {
        contestImage = [[AsyncImageView alloc] initWithFrame:CGRectMake(8, 0, 305, 173)];
        
        contestImage.contentMode = UIViewContentModeScaleToFill;
    }
    
    
    
    contestImage.userInteractionEnabled=YES;
    //cancel any previously loading images for this view
    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:contestImage];
    
    //set image URL. AsyncImageView class will then dynamically load the image
    NSURL *url1 = [NSURL URLWithString:importedUrl];
    
    ((AsyncImageView *)contestImage).imageURL =url1;
    
    Questionlabel.text=Questionis;
    
    placeHolderTitle = [[UILabel alloc] initWithFrame:CGRectMake(9.0, 0.0, ansTextView.frame.size.width - 20.0, 34.0)];
    [placeHolderTitle setText:@"Enter answer here..."];
    // placeholderLabel is instance variable retained by view controller
    [placeHolderTitle setBackgroundColor:[UIColor clearColor]];
    [placeHolderTitle setTextColor:[UIColor blackColor]];
    [placeHolderTitle setFont:[UIFont boldSystemFontOfSize:15]];
    [ansTextView addSubview:placeHolderTitle];
}


-(void)Posting:(NSString *)post
{
    //post = [NSString stringWithFormat:@"phone=%@&email=%@",@"null",@"null"];
	
	NSLog(@"post=%@",post);
	NSURL *url=[[NSURL alloc]initWithString:post];
	NSURLRequest *request=[[NSURLRequest alloc]initWithURL:url]; 
	[NSURLConnection connectionWithRequest:request delegate:self];
    
	
}
-(void)back {
    
    [self.navigationController popViewControllerAnimated:YES];
}


-(IBAction)Submit:(id)sender
{
    
    objActIndicator.hidden=NO;
    [objActIndicator startAnimating];

    selectedans=[NSString stringWithFormat:@"%@",ansTextView.text];
    
	NSLog(@"selected ans =%@",selectedans);
	if (selectedans.length>0) {
        
        //    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        //    post = postingString;
        
         GlobalClass *obj=[GlobalClass getInstance];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSLog(@"You have selected %@",selectedans);
        NSString* filteredString = [selectedans stringByReplacingOccurrencesOfString:@" " withString:@"_"];
        
        NSString	*postingString = [NSString stringWithFormat:@"http://apps.medialabs24x7.com/besharam/update_contest_answer.php?deviceno=%@&ques_id=%@&answer=%@",obj.dev,QID,filteredString];
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
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    
    [UIView beginAnimations:@"Animate Text Field Up" context:nil];
    [UIView setAnimationDuration:.3];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    self.view.frame = CGRectMake(self.view.frame.origin.x,
                                 -200,
                                 self.view.frame.size.width,
                                 self.view.frame.size.height);
    
    [UIView commitAnimations];
    
    //	Scroller.frame=CGRectMake(0, 200, 320, 416);
    //	Scroller.contentSize =CGSizeMake(320, 550);
    
    Scroller.scrollEnabled=NO;
    

}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesBegan");
    UITouch *touch = (UITouch *)[touches anyObject];
    start = [touch locationInView:self.view].y;
    
    NSLog(@"start = %f",start);
    if(start < 480 && _footerMainView.center.y > 480)//touch was not in upper area of view AND pulldownView not visible
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
- (void)textViewDidEndEditing:(UITextView *)textView
{
    if(![textView hasText])
    {
        [textView addSubview:placeHolderTitle];
    }

    //	[self loadCountryCodes];
    [UIView beginAnimations:@"Animate Text Field Up" context:nil];
    [UIView setAnimationDuration:.3];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    self.view.frame = CGRectMake(self.view.frame.origin.x,
                                 0,
                                 self.view.frame.size.width,
                                 self.view.frame.size.height);
    
    [UIView commitAnimations];
    
    [ansTextView resignFirstResponder];
    
    //	Scroller.frame=CGRectMake(0, 0, 320, 416);
    //	Scroller.contentSize =CGSizeMake(320, 550);
	Scroller.scrollEnabled=YES;
    
    

}


-(void)textViewDidChange:(UITextView *)textView
{
    if(![textView hasText])
    {
        [textView addSubview:placeHolderTitle];
    }
    else if([[textView subviews]containsObject:placeHolderTitle])
    {
        [placeHolderTitle removeFromSuperview];
    }
}

- (BOOL)textFieldShouldReturn:(UITextView *)textView
{
    //	[self loadCountryCodes];
    [UIView beginAnimations:@"Animate Text Field Up" context:nil];
    [UIView setAnimationDuration:.3];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    self.view.frame = CGRectMake(self.view.frame.origin.x,
                                 0,
                                 self.view.frame.size.width,
                                 self.view.frame.size.height);
    
    [UIView commitAnimations];
    
    [textView resignFirstResponder];
    
    //	Scroller.frame=CGRectMake(0, 0, 320, 416);
    //	Scroller.contentSize =CGSizeMake(320, 550);
	Scroller.scrollEnabled=YES;
    return YES;

}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait ;
}
-(BOOL)shouldAutorotate
{
    return YES;
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


- (IBAction)toRelApp:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Under construction" message:@"Check Back Soon" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    
}
//Ashwini
- (IBAction)myProfile:(id)sender {
    iphone5Settings *setting = [[iphone5Settings alloc]initWithNibName:@"iphone5Settings" bundle:nil];
    [self.navigationController pushViewController:setting animated:YES];
    
}




@end
