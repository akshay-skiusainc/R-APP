//
//  R_iphone4ContestViewController.m
//  RelianceApplication
//
//  Created by Anish on 10/17/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import "R_iphone4ContestViewController.h"
#import "GlobalClass.h"
#import "R_iphone4ObjectiveViewController.h"
#import "R_iphone4SubjectiveViewController.h"
#import "BackgroundLayer.h"

#import "GroupViewController.h"
@interface R_iphone4ContestViewController ()

@end

@implementation R_iphone4ContestViewController

@synthesize contestScroll,poasterImage;
@synthesize data12,data13,data16,data17,footerView,activityIndicator;

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
    self.trackedViewName=@"Contest Screen";
    
    
    // Do any additional setup after loading the view from its nib.
    // [self DisplayContests];
    UIImage* app_bg_image = [UIImage imageNamed:@"rel_i4home_bg.jpg"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:app_bg_image];
    //     dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), ^(void) {
    
    //    UIImage *relAppImage = [UIImage imageNamed:@"home_right_rel_icon.png"];
    //    UIButton *buttonChat = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [buttonChat setImage:relAppImage forState:UIControlStateNormal];
    //    buttonChat.frame = CGRectMake(0, 0, relAppImage.size.width, relAppImage.size.height);
    //    [buttonChat addTarget:self action:@selector(toRelApp:) forControlEvents:UIControlEventTouchUpInside];
    //    UIBarButtonItem *customBarItem1 = [[UIBarButtonItem alloc] initWithCustomView:buttonChat];
    //    self.navigationItem.RightBarButtonItem = customBarItem1;
    footerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"footer_bg.png"]];
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
    
    [self.view addSubview:activityIndicator];
    [activityIndicator startAnimating];
    
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
//    
//}

- (IBAction)chat:(id)sender
{
    GroupViewController *group = [[GroupViewController alloc]initWithNibName:@"GroupViewController" bundle:nil];
    [self.navigationController pushViewController:group animated:YES];
    
}
//- (IBAction)myProfile:(id)sender
//{
//    iphone4Settings *setting = [[iphone4Settings alloc]initWithNibName:@"iphone4Settings" bundle:nil];
//    [self.navigationController pushViewController:setting animated:YES];
//    
//}


-(void)back {
    
    [self.navigationController popViewControllerAnimated:YES];
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


-(void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:YES];
    //self.navigationItem.title=@"Contests";
    //[self performSelector:@selector(fetchAllData) withObject:nil afterDelay:0.0];
    //    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), ^(void) {
    //
    //        [self fetchAllData];
    //
    //        });
    
    //    appD=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    //   if( appD.contestTag==1)
    //   {
    //       [self viewDidLoad];
    //   }
    TotalData = 0;
    [activityIndicator startAnimating];
    activityIndicator.alpha = 1.0;
    [self performSelector:@selector(fetchAllData) withObject:nil afterDelay:0.0];
    
    
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
    
    
    if (contestScroll!=nil) {
		[contestScroll removeFromSuperview];
		contestScroll=nil;
	}
    
    _footerMainView.frame = CGRectMake(0, 398, _footerMainView.frame.size.width, _footerMainView.frame.size.height);
    
}
-(IBAction)BackBtnPressed:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

-(void)fetchAllData
{
    
    NSLog(@"IN CONTEST FETCHALL");
    GlobalClass *obj=[GlobalClass getInstance];
    
	NSString* post = [NSString stringWithFormat:@"http://apps.medialabs24x7.com/besharam/fetch_rel_contest_ios.php?deviceno=%@",obj.dev];
	
    //   NSString* post = [NSString stringWithFormat:@"http://apps.medialabs24x7.com/besharam/fetch_data_contest_ios.php?deviceno=qw1%@",obj.dev];
    
	dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:post] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
        
        
        //  NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://110.175.19.95/SCMIpadDemoWebApp/CustomerList.aspx?username=02&BeginRowNo=0&LastRowNo=10"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:5.0];
        
        [request setHTTPMethod:@"GET"];
        //[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Current-Type"];
        
        NSError *errorReturned = nil;
        
        
        
        if (errorReturned) {
            NSLog(@"errorReturned=%@",errorReturned);
            
            
            UIAlertView* alertBox = [[ UIAlertView alloc]initWithTitle:@"Network Error" message:@"Network Not Connected" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Retry", nil ];
            //alertBox.tag=3;
            alertBox.delegate=self;
            [alertBox show];
        }
        else
        {
            
            
            NSLog(@"POSTING=%@",post);
            
            //	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), ^(void) {
            
            
            
            
            NSError *errorReturned = nil;
            NSURLResponse *theResponse =[[NSURLResponse alloc]init];
            NSData *dataResponce = [NSURLConnection sendSynchronousRequest:request returningResponse:&theResponse error:&errorReturned];
            
            
            if(!errorReturned)
            {
                NSError* error;
                
                
                NSDictionary* json = [NSJSONSerialization JSONObjectWithData:dataResponce
                                                                     options:kNilOptions
                                                                       error:&error];
                
                NSLog(@"Contest json=%@",json);
                
                
                NSDictionary* contestData = [json objectForKey:@"contest_data"];
                NSDictionary* contestHeader = [json objectForKey:@"contest_header"];
                NSDictionary* contest_bg = [json objectForKey:@"contest_bg"];
                NSDictionary* contest_btn = [json objectForKey:@"contest_button"];
                
                GlobalClass *obj=[GlobalClass getInstance];
                obj.contestData = contestData;
                obj.contestHeader = contestHeader;
                obj.contest_bg = contest_bg;
                obj.contest_btn = contest_btn;
            }
            else
            {
                UIAlertView *alert2 = [[UIAlertView alloc]initWithTitle:@"Network Fail" message:@"Network is unable to display data.Please check network settings." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert2 show];
            }
            
        }
        
        
        [self getdata];
    });
    
}



-(void)getdata
{
    
    
    dispatch_async(dispatch_get_main_queue()	, ^{
        GlobalClass *obj=[GlobalClass getInstance];
        //NSLog(@"ddata=%@",obj.contestData);
        int i=1;
        
        
        for (NSDictionary *actoAgent in obj.contestData)
        {
            data1[0]= [actoAgent objectForKey:@"title"];
            if ([data1[0] isEqualToString:@"FAIL"])
            {
                UIAlertView* alertBox = [[ UIAlertView alloc]initWithTitle:@"Alert" message:@"You have played all contest, Check back soon for new contests" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil ];
                alertBox.tag=3;
                alertBox.delegate=self;
                [alertBox show];
                
            }
            
            
            else{
                
                
                data11[i]= [actoAgent objectForKey:@"con_id"];
                
                
                data3[i]= [actoAgent objectForKey:@"con_type"];
                
                
                data4[i]= [NSString stringWithFormat:@"%@",[actoAgent objectForKey:@"con_title"]];
                
                
                
                data2[i]= [actoAgent objectForKey:@"con_img"];
                
                
                data18[i]= [actoAgent objectForKey:@"con_desc"];
                
                
                data1[i]= [actoAgent objectForKey:@"con_img"];
                
                
                data5[i]= [actoAgent objectForKey:@"con_question"];
                
                
                data6[i]= [actoAgent objectForKey:@"con_answer1"];
                
                
                data7[i]= [actoAgent objectForKey:@"con_answer2"];
                
                
                data8[i]= [actoAgent objectForKey:@"con_answer3"];
                
                
                
                data9[i]= [actoAgent objectForKey:@"con_answer4"];
                
                
                data10[i]= [actoAgent objectForKey:@"con_correctans"];
                
                //            NSLog(@"id=%@",data11[i]);
                //            NSLog(@"types=%@",data3[i]);
                //            NSLog(@"title=%@",data4[i]);
                //            NSLog(@"image=%@",data2[i]);
                //            NSLog(@"description=%@",data18[i]);
                //            NSLog(@"thumb_image=%@",data1[i]);
                //            NSLog(@"question=%@",data5[i]);
                //            NSLog(@"answer1=%@",data6[i]);
                //            NSLog(@"answer2=%@",data7[i]);
                //            NSLog(@"answer3=%@",data8[i]);
                //            NSLog(@"answer4=%@",data9[i]);
                //            NSLog(@"correctans=%@",data10[i]);
                //
                i++;
            }
            TotalData=i;
            
        }
        
        
        
        for (NSDictionary *actoAgent1 in obj.contestHeader)
        {
            data1[0]= [actoAgent1 objectForKey:@"contest_img_id"];
            if ([data1[0] isEqualToString:@"FAIL"])
            {
                UIAlertView* alertBox = [[ UIAlertView alloc]initWithTitle:@"Alert" message:@"You have played all contest, Check back soon for new contests" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil ];
                alertBox.tag=3;
                alertBox.delegate=self;
                [alertBox show];
                
            }
            
            
            else{
                
                
                data12= [actoAgent1 objectForKey:@"contest_img_id"];
                data13= [actoAgent1 objectForKey:@"header_img_link"];
                
                //            NSLog(@"contest_img_id=%@",data12);
                //            NSLog(@"header_img_link=%@",data13);
                
            }
            
        }
        
        
        int j=1;
        for (NSDictionary *actoAgent2 in obj.contest_bg)
        {
            data1[0]= [actoAgent2 objectForKey:@"contest_img_id"];
            if ([data1[0] isEqualToString:@"FAIL"])
            {
                UIAlertView* alertBox = [[ UIAlertView alloc]initWithTitle:@"Alert" message:@"You have played all contest, Check back soon for new contests" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil ];
                alertBox.tag=3;
                alertBox.delegate=self;
                [alertBox show];
                
            }
            
            
            else{
                
                
                data14[j]= [actoAgent2 objectForKey:@"contest_img_id"];
                
                data15[j]= [actoAgent2 objectForKey:@"bg_img_link"];
                
                //            NSLog(@"contest_img_id=%@",data14[i]);
                //            NSLog(@"bg_img_link=%@",data15[i]);
                
                
            }
            j++;
        }
        
        for (NSDictionary *actoAgent3 in obj.contest_btn)
        {
            data1[0]= [actoAgent3 objectForKey:@"contest_img_id"];
            if ([data1[0] isEqualToString:@"FAIL"])
            {
                UIAlertView* alertBox = [[ UIAlertView alloc]initWithTitle:@"Alert" message:@"You have played all contest, Check back soon for new contests" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil ];
                alertBox.tag=3;
                alertBox.delegate=self;
                [alertBox show];
                
            }
            
            
            else{
                
                
                data16= [actoAgent3 objectForKey:@"contest_img_id"];
                
                data17= [actoAgent3 objectForKey:@"btn_color"];
                //            NSLog(@"contest_img_id=%@",data16);
                //            NSLog(@"btn_image_link=%@",data17);
                
                
            }
            
        }
        
        [self DisplayContests];
    });
    
}



-(void)DisplayContests
{
    NSLog(@"INCONTEST DISPLAY");
    
    
	//[self getdata];
	
    // ******************************************************* Display Contents *******************************************************
    
    //    NSURL *url = [NSURL URLWithString:data13];
    //    NSData *imageData = [NSData dataWithContentsOfURL:url];
    //    UIImage *image = [UIImage imageWithData:imageData];
    //    poasterImage.image=image;
    contestScroll			= [[UIScrollView alloc] initWithFrame:CGRectMake(4,53,310,363)];
    contestScroll.userInteractionEnabled	=YES;
    contestScroll.showsHorizontalScrollIndicator = YES;
    contestScroll.scrollEnabled=YES;
    contestScroll.pagingEnabled = NO;
     if (TotalData>1)
     {
         if (poasterImage    == nil)
         {
             poasterImage = [[AsyncImageView alloc] initWithFrame:CGRectMake(0, 0, 310, 156)];
             
             poasterImage.contentMode = UIViewContentModeScaleToFill;
         }
         
         poasterImage.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];
         
         poasterImage.userInteractionEnabled=YES;
         [contestScroll addSubview:poasterImage];
         
         //cancel any previously loading images for this view
         [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:poasterImage];
         
         //set image URL. AsyncImageView class will then dynamically load the image
         NSURL *url1 = [NSURL URLWithString:data13];
         
         ((AsyncImageView *)poasterImage).imageURL =url1;
         
         
         poasterImage.backgroundColor = [UIColor clearColor];
  
     }
    else
    {
        
            poasterImage = [[AsyncImageView alloc] initWithFrame:CGRectMake(5, 53, 310, 156)];
            
            poasterImage.contentMode = UIViewContentModeScaleToFill;
        
        
        poasterImage.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];
        
        poasterImage.userInteractionEnabled=YES;
        [self.view addSubview:poasterImage];
        
        //cancel any previously loading images for this view
        [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:poasterImage];
        
        //set image URL. AsyncImageView class will then dynamically load the image
        NSURL *url1 = [NSURL URLWithString:data13];
        
        ((AsyncImageView *)poasterImage).imageURL =url1;
        
        
        poasterImage.backgroundColor = [UIColor clearColor];

    }
    
   
    NSArray *colorArray=[[NSString stringWithFormat:@"%@",data17] componentsSeparatedByString:@"," ];
    appD=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    appD.hexTop=[colorArray objectAtIndex:0];
    appD.hexBottom=[colorArray objectAtIndex:1];
    int m=164;
    
    if (TotalData>1) {
        
        
        for (int i =1; i<TotalData; i++)
        {
            NSLog(@"value of i=%d",i);
            NSLog(@"about to print data *********************************");
            if (cellImage[i]    == nil)
            {
                //            cellImage[i] = [[AsyncImageView alloc] initWithFrame:CGRectMake(110, 255, 100.0f, 119.0f)];
                cellImage[i] = [[AsyncImageView alloc] initWithFrame:CGRectMake(0, m, 310, 133 )];
                cellImage[i].contentMode = UIViewContentModeScaleToFill;
            }
             cellImage[i].backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];
            
            
            cellImage[i].userInteractionEnabled=YES;
            //cancel any previously loading images for this view
            [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:cellImage[i]];
            
            //set image URL. AsyncImageView class will then dynamically load the image
            NSURL *url1 = [NSURL URLWithString:data1[i]];
            
            ((AsyncImageView *)cellImage[i]).imageURL =url1;
            // _view1 = view;
            
            [self.contestScroll addSubview:cellImage[i]];
            
			
            //			ActIndImage1[i] = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,310,153)];
            //			//  ActIndImage1[i].center = CGPointMake(320/2, 460/2);
            //			ActIndImage1[i].image = [UIImage imageNamed:@"video_loading_bg.jpg"];
            //			ActIndImage1[i].opaque=0.5;
            //			[cellImage[i] addSubview:ActIndImage1[i]];
			
            //			activityIndicator1[i] = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
            //			activityIndicator1[i].center=CGPointMake(310/2, 175/2);
            //			//activityIndicator1[i].transform = CGAffineTransformMakeScale(1.0, 1.0);
            //			[activityIndicator1[i] setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
            //			[cellImage[i] addSubview:activityIndicator1[i]];
            //
            //
            //			[activityIndicator1[i] startAnimating];
            
            
            cellBtn[i] = [UIButton buttonWithType:UIButtonTypeCustom];
            cellBtn[i].frame = CGRectMake(150, 95+m, 115, 30);
            cellBtn[i].userInteractionEnabled=YES;
            CAGradientLayer *bgLayer = [BackgroundLayer blueGradient];
            bgLayer.frame = cellBtn[i].bounds;
            [cellBtn[i].layer insertSublayer:bgLayer atIndex:0];
            [cellBtn[i] addTarget:self action:@selector(openContest:)forControlEvents:UIControlEventTouchUpInside];
            cellBtn[i].tag=i;
            [cellBtn[i] setTitle:@"Enter" forState:UIControlStateNormal];
            cellBtn[i].layer.cornerRadius = 5.0;
            cellBtn[i].backgroundColor=[UIColor clearColor];
            [contestScroll addSubview:cellBtn[i]];
            
            m+=135;
            
            
            
            
            NSLog(@"unloadAct=%d",i);
            [activityIndicator1[i] stopAnimating];
            if (activityIndicator1[i]!=nil) {
                [activityIndicator1[i] removeFromSuperview];
                activityIndicator1[i] = nil;
            }
            
        }
        
        contestScroll.contentSize = CGSizeMake(310, m+10);
        [self.view addSubview:contestScroll];
    }
    else
    {
        UIAlertView* alertBox = [[ UIAlertView alloc]initWithTitle:@"Message" message:@"You have played all contest, Check back soon for new contests." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK",nil ];
		alertBox.tag=18;
		alertBox.delegate=self;
		[alertBox show];
    }
    
    
    
    //         dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), ^(void) {
    
    //        [cellImage[i] addSubview:activityIndicator];
    //        cellImage[i]=[[UIImageView alloc]init];
    //        NSURL *url = [NSURL URLWithString:data1[i]];
    //        NSData *imageData1 = [NSData dataWithContentsOfURL:url];
    ////        NSLog(@"Cellimage data lenght %d",imageData1.length);
    //        UIImage* image1 = [UIImage imageWithData:imageData1];
    //
    //        cellImage[i].frame = CGRectMake(0, m, 310, 175);
    //        cellImage[i].userInteractionEnabled=YES;
    //        cellImage[i].tag=i;
    //        cellImage[i].image=image1;
    //        cellImage[i].backgroundColor=[UIColor clearColor];
    //        [self.contestView addSubview:cellImage[i]];
    
    
    
    //   /////////////////////////////////VIEW2////////////////////////
    
    
    
    
    //        UITapGestureRecognizer *webViewTapped1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(merchandaise:)];
    //        webViewTapped1.numberOfTapsRequired = 1;
    //        webViewTapped1.delegate = self;
    //        [cat2 addGestureRecognizer:webViewTapped1];
    //
    //
    //
    //
    //
    //
    //
    //        cellImage[i]= [[UIWebView alloc] initWithFrame:CGRectMake(0, m, 310, 133 )];
    //		cellImage[i].userInteractionEnabled=NO;
    //		cellImage[i].delegate =self;
    //
    //        cellImage[i].opaque=NO;
    //        cellImage[i].backgroundColor = [UIColor clearColor];
    //		cellImage[i].tag=i;
    //		NSURL *url = [NSURL URLWithString:data1[i]];
    //
    //		//            //URL Requst Object
    //		NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    //		//            //Load the request in the UIWebView.
    //		[cellImage[i] loadRequest:requestObj];
    //		cellImage[i].scrollView.bounces = NO;
    //        cellImage[i].scalesPageToFit = YES;
    //
    //		//  ImagePatch[i].backgroundColor= [UIColor blueColor];
    //		[self.contestView addSubview:cellImage[i]];
    
    
    
    
    //             NSURL *url3 = [NSURL URLWithString:data17];
    //             NSData *imageData3 = [NSData dataWithContentsOfURL:url3];
    //             //        NSLog(@"CellBtn image data lenght %d",imageData3.length);
    //             UIImage* image3 = [UIImage imageWithData:imageData3];
    //              [cellBtn[i] setBackgroundImage:image3 forState:UIControlStateNormal];
    //           //  [cellBtn[i] setImage:image3 forState:UIControlStateNormal];
    
    
    //             cellBtn[i].frame = CGRectMake(130, 75+m, 115, 30);
    [activityIndicator stopAnimating];
    activityIndicator.alpha = 0.0;
    [self.view addSubview:_footerMainView];
    
}

//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//    if (alertView.tag==18) {
//
//        if (buttonIndex == 0)
//        {
//        //    [self.navigationController popViewControllerAnimated:NO];
//        }
//    }
//}


-(void)openContest:(UIButton*)sender
{
    
    int i = [sender tag];
    NSString *strCheck= [NSString stringWithFormat:@"%@",data3[i]];
    NSLog(@"sender tag ===================   %d",i);
    //    NSString *strCheck=@"1";
    if ([strCheck isEqualToString:@"1"]) {
        
        R_iphone4SubjectiveViewController *subVC=[[R_iphone4SubjectiveViewController alloc]initWithNibName:@"R_iphone4SubjectiveViewController" bundle:nil];
        
        subVC.QID=[NSString stringWithFormat:@"%@",data11[i]];
        subVC.importedUrl=[NSString stringWithFormat:@"%@",data2[i]];
        subVC.Questionis=[NSString stringWithFormat:@"%@",data5[i]];
        [self.navigationController pushViewController:subVC animated:YES];
        //        [self presentModalViewController:subVC animated:YES];
    }
    if ([strCheck isEqualToString:@"0"])
    {
        R_iphone4ObjectiveViewController *objVC=[[R_iphone4ObjectiveViewController alloc]initWithNibName:@"R_iphone4ObjectiveViewController" bundle:nil];
        
        objVC.QID=[NSString stringWithFormat:@"%@",data11[i]];
        objVC.ANS1=[NSString stringWithFormat:@"%@",data6[i]];
        objVC.ANS2=[NSString stringWithFormat:@"%@",data7[i]];
        objVC.ANS3=[NSString stringWithFormat:@"%@",data8[i]];
        objVC.ANS4=[NSString stringWithFormat:@"%@",data9[i]];
        //        NSLog(@"4th ans is  ************      %@",data9[i]);
        objVC.CorrectAns=[NSString stringWithFormat:@"%@",data10[i]];
        objVC.importedUrl=[NSString stringWithFormat:@"%@",data2[i]];
        objVC.Questionis=[NSString stringWithFormat:@"%@",data5[i]];
        [self.navigationController pushViewController:objVC animated:YES];
        
        //[self presentModalViewController:objVC animated:YES];
        
        
    }
    
}


//- (void)webViewDidStartLoad:(UIWebView *)webView
//{
//	NSLog(@"yes");
//	for (int i =1; i<TotalData; i++) {
//
//
//		if (webView.tag==i) {
//
//
//			ActIndImage1[i] = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,310,153)];
//			//  ActIndImage1[i].center = CGPointMake(320/2, 460/2);
//			ActIndImage1[i].image = [UIImage imageNamed:@"video_loading_bg.jpg"];
//			ActIndImage1[i].opaque=0.5;
//			[cellImage[i] addSubview:ActIndImage1[i]];
//
//
//		}
//
//
//
//		else {
//
//		}
//	}
//
//	//[self performSelector:@selector(unloadAct) withObject:nil afterDelay:0.2];
//
//
//}

-(void)unloadAct:(int)i
{
	
	NSLog(@"unloadAct=%d",i);
	[activityIndicator1[i] stopAnimating];
	if (activityIndicator1[i]!=nil) {
		[activityIndicator1[i] removeFromSuperview];
		activityIndicator1[i] = nil;
	}
    
	
    
    
}

//- (void)webViewDidFinishLoad:(UIWebView *)webView
//
//{
//
//	for (int i =1; i<TotalData; i++) {
//
//		if (webView.tag == i) {
//			[self unloadAct:i];
//
//		}
//	}
//
//
//
//}
//
//-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
//{
//	for (int i =1; i<TotalData; i++) {
//		if (webView.tag == i) {
//			[self unloadAct:i];
//
//		}
//	}
//}
//


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


@end
