//
//  iphone4BehindtheScene.m
//  RelianceApplication
//
//  Created by Ashwini Pawar on 16/08/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import "iphone4BehindtheScene.h"
#import "iphone4BPhotos.h"
#import "iphone4Bvideos.h"
#import "iphone4Merchandise.h"
#import "iphone4Settings.h"
#import "GroupViewController.h"

@interface iphone4BehindtheScene ()

@end

@implementation iphone4BehindtheScene
@synthesize footerView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)getdata
{
	GlobalClass *obj=[GlobalClass getInstance];
	NSLog(@"ddata=%@",obj.BTS);
  	int i=0;
	for (NSDictionary *actoAgent in obj.BTS)
	{
		data1[i]= [actoAgent objectForKey:@"bs_cover_img_link"];
		NSLog(@"bs_cover_img_link=%@",data1[i]);
		
		data2[i]= [actoAgent objectForKey:@"bs_cover_id"];
		NSLog(@"bs_cover_id=%@",data2[i]);
		
		
        //		data3[i]= [actoAgent objectForKey:@"status"];
        //		NSLog(@"status=%@",data3[i]);
        //
        //
        //		data4[i]= [actoAgent objectForKey:@"video_title"];
        //		NSLog(@"video_title=%@",data4[i]);
        //
        //		data5[i]= [actoAgent objectForKey:@"time"];
        //		NSLog(@"time=%@",data5[i]);
        //
        //
        //		data6[i]= [actoAgent objectForKey:@"singer"];
        //		NSLog(@"singer=%@",data6[i]);
        //
        //
        //
        //		data7[i]= [actoAgent objectForKey:@"lyrics"];
        //		NSLog(@"lyrics=%@",data7[i]);
        //
        //		data8[i]= [actoAgent objectForKey:@"link_id"];
        //		NSLog(@"link_id=%@",data8[i]);
        //
        //
        //
        //        //		data8[i]= [actoAgent objectForKey:@"video_title"];
        //        //		NSLog(@"video_title=%@",data8[i]);
        //        //
        //
        //		//		data4[i]= [actoAgent objectForKey:@"image"];
        //		//		NSLog(@"str=%@",data4[i]);
        //
        //
		i++;
	}
	TotalData=i;
	
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    footerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"footer_bg.png"]];
    NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"app_bg_image"];
    UIImage* app_bg_image = [UIImage imageWithData:imageData];
    self.view.backgroundColor = [UIColor colorWithPatternImage:app_bg_image];
    
    [self getdata];
    //   /////////////////////////////////VIEW1////////////////////////
    if (_view1    == nil)
    {
        _view1 = [[AsyncImageView alloc] initWithFrame:CGRectMake(5, 7, 309.0f, 195.0f)];
        
        _view1.contentMode = UIViewContentModeScaleToFill;
    }
    
    _view1.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];
    
    _view1.contentMode = UIViewContentModeScaleToFill;
    _view1.userInteractionEnabled=YES;
    //cancel any previously loading images for this view
    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:_view1];
    
    //set image URL. AsyncImageView class will then dynamically load the image
    NSURL *url1 = [NSURL URLWithString:data1[0]];
    
    ((AsyncImageView *)_view1).imageURL =url1;
    // _view1 = view;
    
    [self.view addSubview:_view1];
    
    
    UITapGestureRecognizer *webViewTapped = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openvideos:)];
    webViewTapped.numberOfTapsRequired = 1;
    webViewTapped.delegate = self;
    [_view1 addGestureRecognizer:webViewTapped];
    
    
    
    //   /////////////////////////////////VIEW2////////////////////////
    
    
    if (_view2    == nil)
    {
        _view2 = [[AsyncImageView alloc] initWithFrame:CGRectMake(5, 207, 152.0f, 211.0f)];
        
        _view2.contentMode = UIViewContentModeScaleToFill;
    }
    
    _view2.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];
    
    _view2.contentMode = UIViewContentModeScaleToFill;
    _view2.userInteractionEnabled=YES;
    //cancel any previously loading images for this view
    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:_view2];
    
    //set image URL. AsyncImageView class will then dynamically load the image
    url1 = [NSURL URLWithString:data1[1]];
    
    ((AsyncImageView *)_view2).imageURL =url1;
    // _view1 = view;
    
    [self.view addSubview:_view2];
    
    
    UITapGestureRecognizer *webViewTapped1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(opensynopsis:)];
    webViewTapped1.numberOfTapsRequired = 1;
    webViewTapped1.delegate = self;
    [_view2 addGestureRecognizer:webViewTapped1];
    
    
    //   /////////////////////////////////VIEW3////////////////////////
    
    
    if (_view3    == nil)
    {
        _view3 = [[AsyncImageView alloc] initWithFrame:CGRectMake(162, 207, 152.0f, 211.0f)];
        
        _view3.contentMode = UIViewContentModeScaleToFill;
    }
    
    _view3.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];
    
    _view3.contentMode = UIViewContentModeScaleToFill;
    _view3.userInteractionEnabled=YES;
    //cancel any previously loading images for this view
    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:_view3];
    
    //set image URL. AsyncImageView class will then dynamically load the image
    url1 = [NSURL URLWithString:data1[2]];
    
    ((AsyncImageView *)_view3).imageURL =url1;
    // _view1 = view;
    
    [self.view addSubview:_view3];
    
    
    UITapGestureRecognizer *webViewTapped2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Bphotos:)];
    webViewTapped2.numberOfTapsRequired = 1;
    webViewTapped2.delegate = self;
    [_view3 addGestureRecognizer:webViewTapped2];
    
     [self.view addSubview:_footerMainView];
//    UIImage *relAppImage = [UIImage imageNamed:@"home_right_rel_icon.png"];
//    UIButton *buttonChat = [UIButton buttonWithType:UIButtonTypeCustom];
//    [buttonChat setImage:relAppImage forState:UIControlStateNormal];
//    buttonChat.frame = CGRectMake(0, 0, relAppImage.size.width, relAppImage.size.height);
//    [buttonChat addTarget:self action:@selector(toRelApp:) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *customBarItem1 = [[UIBarButtonItem alloc] initWithCustomView:buttonChat];
//    self.navigationItem.RightBarButtonItem = customBarItem1;
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


-(void)back {
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)toRelApp:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Under construction" message:@"Check Back Soon" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
	return YES;
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
      _footerMainView.frame = CGRectMake(0, 398, _footerMainView.frame.size.width, _footerMainView.frame.size.height);
   
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


-(IBAction)openvideos:(id)sender
{
    iphone4Bvideos *loginViewController = [[iphone4Bvideos alloc] initWithNibName:@"iphone4Bvideos" bundle:nil];
    [self.navigationController pushViewController:loginViewController animated:NO];
}

-(IBAction)opensynopsis:(id)sender
{
    SynopsisViewController *loginViewController = [[SynopsisViewController alloc] initWithNibName:@"SynopsisViewController" bundle:nil];
    [self.navigationController pushViewController:loginViewController animated:NO];
}

-(IBAction)Bphotos:(id)sender
{
    iphone4BPhotos *loginViewController = [[iphone4BPhotos alloc] initWithNibName:@"iphone4BPhotos" bundle:nil];
    [self.navigationController pushViewController:loginViewController animated:NO];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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






@end
