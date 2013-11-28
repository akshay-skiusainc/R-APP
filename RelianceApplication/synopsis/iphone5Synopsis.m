//
//  iphone5Synopsis.m
//  RelianceApplication
//
//  Created by Ashwini Pawar on 22/08/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import "iphone5Synopsis.h"
#import "iphone5Settings.h"
#import "iphone5GroupViewController.h"
#import "Merchandise.h"
@interface iphone5Synopsis ()

@end

@implementation iphone5Synopsis

@synthesize firstImageView,firstLabel,secondImageView,secondLabel,arr,Scroll;
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
       
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    arr = [[NSMutableArray alloc]init];
    //    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"home_main_bg.jpg"]];
    
    NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"app_bg_image"];
    UIImage* app_bg_image = [UIImage imageWithData:imageData];
    self.view.backgroundColor = [UIColor colorWithPatternImage:app_bg_image];
    
    _footerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"footer_bg.png"]];
    
//    UIImage *relAppImage = [UIImage imageNamed:@"home_right_rel_icon.png"];
//    UIButton *buttonChat = [UIButton buttonWithType:UIButtonTypeCustom];
//    [buttonChat setImage:relAppImage forState:UIControlStateNormal];
//    buttonChat.frame = CGRectMake(0, 0, relAppImage.size.width, relAppImage.size.height);
//    [buttonChat addTarget:self action:@selector(toRelApp:) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *customBarItem1 = [[UIBarButtonItem alloc] initWithCustomView:buttonChat];
//    self.navigationItem.RightBarButtonItem = customBarItem1;
    
    [self Displayimage];
    
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


- (IBAction)merchandise:(id)sender
{
      Merchandise *merchandise = [[Merchandise alloc]initWithNibName:@"Merchandise" bundle:nil];
      [self.navigationController pushViewController:merchandise animated:YES];
  
    
}

- (IBAction)chat:(id)sender
{
    //    GroupViewController *group = [[GroupViewController alloc]initWithNibName:@"GroupViewController" bundle:nil];
    //    [self.navigationController pushViewController:group animated:YES];
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Under construction" message:@"Check Back Soon" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    
}

- (IBAction)myProfile:(id)sender
{
    iphone5Settings *setting = [[iphone5Settings alloc]initWithNibName:@"iphone5Settings" bundle:nil];
    [self.navigationController pushViewController:setting animated:YES];
    
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
    
}


-(void)getdata
{
	GlobalClass *obj=[GlobalClass getInstance];
	NSLog(@"ddata=%@",obj.directorsNote);
	
	int i=0;
	for (NSDictionary *actoAgent in obj.directorsNote)
	{
        
        data1[i]= [actoAgent objectForKey:@"image"];
		NSLog(@"image=%@",data1[i]);
		
        
        data2[i]= [actoAgent objectForKey:@"description"];
		NSLog(@"description=%@",data2[i]);
        i++;
	}
	TotalData=i;
    
    //
    //        NSString *ichar  = [NSString stringWithFormat:@"%@", [data2[i] substringToIndex:542]];
    //        NSLog(@"STR = %@",ichar);
    //         firstLabel.text = ichar;
    
    // NSString *ichar1 = [NSString stringWithFormat:@"%@" ,[data2[i] substringFromIndex:542]];
    // NSLog(@"STR1 = %@",ichar1);
    
    maximumLabelSize = CGSizeMake(306, 5000);
    CGSize expectedLabelSize = [data2[0] sizeWithFont:firstLabel.font constrainedToSize:maximumLabelSize lineBreakMode:firstLabel.lineBreakMode];
    
    CGRect newFrame = firstLabel.frame;
    newFrame.size.height = expectedLabelSize.height;
    firstLabel.frame = CGRectMake(7, 163, 306, expectedLabelSize.height);
    firstLabel.userInteractionEnabled = YES;
    NSLog(@"height-=%f",expectedLabelSize.height);
    // Scroll.contentSize=CGSizeMake(320, expectedLabelSize.height+220);
    firstLabel.text = data2[0];
    
    
    maximumLabelSize = CGSizeMake(306, 5000);
    CGSize expectedLabelSize1 = [data2[1] sizeWithFont:secondLabel.font constrainedToSize:maximumLabelSize lineBreakMode:secondLabel.lineBreakMode];
    
    CGRect newFrame1 = secondLabel.frame;
    newFrame1.size.height = expectedLabelSize1.height;
    secondLabel.frame = CGRectMake(7, expectedLabelSize.height+320, 306, expectedLabelSize1.height);
    secondLabel.userInteractionEnabled = YES;
    NSLog(@"height-=%f",expectedLabelSize1.height);
    
    secondLabel.text = data2[1];
    Scroll.contentSize=CGSizeMake(320, (expectedLabelSize1.height)+(expectedLabelSize1.height)+220);
    
    activityIndicator = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    [activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
    activityIndicator.center = CGPointMake(firstImageView.frame.size.width/2,firstImageView.frame.size.height/2);
    [firstImageView addSubview:activityIndicator];
    [activityIndicator startAnimating];
    
    activityIndicator1 = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    [activityIndicator1 setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
    activityIndicator1.center = CGPointMake(secondImageView.frame.size.width/2,secondImageView.frame.size.height/2);
    [secondImageView addSubview:activityIndicator1];
    [activityIndicator1 startAnimating];
    
    if (firstImageView == nil)
    {
        firstImageView = [[AsyncImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 150)];
        
        //firstImageView.contentMode = UIViewContentModeScaleToFill;
    }
    
    firstImageView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];
    
    firstImageView.contentMode = UIViewContentModeScaleToFill;
    
    firstImageView.userInteractionEnabled=YES;
    
    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:firstImageView];
    
    
    NSURL *url1 = [NSURL URLWithString:data1[0]];
    NSLog(@"nsurl = %@",url1);
    ((AsyncImageView *)firstImageView).imageURL =url1;
    [Scroll addSubview:firstImageView];
    
    
    
    
    if (secondImageView == nil)
    {
        secondImageView = [[AsyncImageView alloc] initWithFrame:CGRectMake(0, 167+expectedLabelSize.height, 320, 150)];
        
        secondImageView.contentMode = UIViewContentModeScaleToFill;
    }
    
    secondImageView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];
    
    secondImageView.contentMode = UIViewContentModeScaleToFill;
    secondImageView.userInteractionEnabled=YES;
    
    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:secondImageView];
    NSURL *url2 = [NSURL URLWithString:data1[1]];
    NSLog(@"nsurl = %@",url1);
    ((AsyncImageView *)secondImageView).imageURL =url2;
    [Scroll addSubview:secondImageView];
    
    
    [activityIndicator stopAnimating];
    [activityIndicator1 stopAnimating];
    
    NSLog(@"%@",arr);
    
    
    NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"app_bg_image"];
    UIImage* app_bg_image = [UIImage imageWithData:imageData];
    self.view.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [UIColor colorWithPatternImage:app_bg_image];
    
	
}
-(void)Displayimage
{
    
    [self getdata];
    
    // secondImageView.image = [arr objectAtIndex:2];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
