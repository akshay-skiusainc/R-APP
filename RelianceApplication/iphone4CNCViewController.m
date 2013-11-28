//
//  iphone4CNCViewController.m
//  RelianceApplication
//
//  Created by Ashwini Pawar on 14/08/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import "iphone4CNCViewController.h"
#import "iphone4DetailCNC.h"
#import "iphone4MainWallpapers.h"
#import "iphone4Merchandise.h"
#import "iphone4Settings.h"
#import "GroupViewController.h"

@interface iphone4CNCViewController ()

@end

@implementation iphone4CNCViewController
@synthesize productionHouseButtonRef,Scroller1 = _Scroller1,bigView,footerView;
@synthesize check,scroll,pagingbackground,fromDetailsVC;
UILabel * label ;
CGSize maximumLabelSize;
 iphone4MainWallpapers *wallpapers;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(id)initwithStr:(NSString *)_fromDeatilVC
{
    if(self)
    {
        fromDetailsVC = _fromDeatilVC;
    }
    return  self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.navigationItem.title=@"Cast And Crew";
    GlobalClass *obj1=[GlobalClass getInstance];
    
	[self DisplayCast];
    
    int m=0;
    
    for (int i=0; i<TotalData+1; i++) {
        
//        pagingbackground = [[UIImageView alloc]initWithFrame:CGRectMake(289, 150, 24, 99)];
//        pagingbackground.image = [UIImage imageNamed:@"iph5cnc_dot_bg.png"];
//        //pagingbackground.alpha = 0.7;
//        [self.view addSubview:pagingbackground];
        
        PAGINGEFFECT[i]  = [[UIImageView alloc] initWithFrame:CGRectMake(296, m+120, 12,13)];
        PAGINGEFFECT[i].userInteractionEnabled=YES;
        PAGINGEFFECT[i].image= [UIImage imageNamed:@"iph5cnc_black_dot.png"];
        //       // ImagePatch[i].backgroundColor= [UIColor blueColor];
        [self.view addSubview:PAGINGEFFECT[i]];
        //    [ImagePatch[i] release];
        PAGINGEFFECT[i].tag= i;
        
        m+=22;
    }
    
    PAGINGEFFECT[0].image= [UIImage imageNamed:@"iph5cnc_red_dot.png"];
    
    
    
	[self getdata];
    
    [_Scroller1 setContentSize:CGSizeMake(320, 375*TotalData+375)];
    bigView.frame = CGRectMake(0, 0, 320, 375*TotalData);
    
    //    if ([obj1.coming isEqualToString:@"1"])
    //    {
    //
    //        if ([self.navigationController.navigationBar respondsToSelector:@selector( setBackgroundImage:forBarMetrics:)])
    //        {
    //			[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"header_bar.png"] forBarMetrics:UIBarMetricsDefault];
    //
    //	    }
    //    }
    //	else {
    //        if ([self.navigationController.navigationBar respondsToSelector:@selector( setBackgroundImage:forBarMetrics:)]){
    
    //        }
    
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
    
    NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"app_bg_image"];
    UIImage* app_bg_image = [UIImage imageWithData:imageData];
    self.view.backgroundColor = [UIColor colorWithPatternImage:app_bg_image];

    
    footerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"footer_bg.png"]];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"home_header_bg.jpg"] forBarMetrics:UIBarMetricsDefault];
    // }
	//obj1.coming=@"2";
    
    
    
    scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(7, 10, 306,375)];
    scroll.userInteractionEnabled	=YES;
    scroll.alpha =0.0;
    scroll.delegate=self;
    scroll.pagingEnabled = NO;
    scroll.showsVerticalScrollIndicator = YES;
    scroll.scrollEnabled = YES;
    [scroll setContentSize:CGSizeMake(287,223)];
    
    scrollBgImage = [[UIImageView alloc]initWithFrame:CGRectMake(7, 10, 306,375)];
    scrollBgImage.backgroundColor = [UIColor blackColor];
    scrollBgImage.alpha = 0.0;
    [self.view addSubview:scrollBgImage];
    
    Description = [[UILabel alloc] initWithFrame:CGRectMake(7,20,295,372)];
    maximumLabelSize = CGSizeMake(306, 5000);
	Description.backgroundColor = [UIColor clearColor];
	
	Description.textAlignment = NSTextAlignmentLeft;
	Description.numberOfLines =0;
	Description.lineBreakMode= NSLineBreakByWordWrapping;
	Description.font = [UIFont fontWithName:@"Helvitica Neue " size:14.0 ];
    [Description sizeToFit];
    NSLog(@"Check = %d",check);
    
    
    if([fromDetailsVC isEqual: @"ToCastnCrew"])
    {
        for (int i=0; i<TotalData; i++)
        {
            PAGINGEFFECT[i].alpha = 0.0;
        }
        
        
    }
    if(check == 1)
    {
        _Scroller1.scrollEnabled = NO;
    }
    else if(check == 2)
    {
        [bigView setCenter:CGPointMake(160, 375)];
        _Scroller1.scrollEnabled = NO;
        
        
    }
    else if(check == 3)
    {
        [bigView setCenter:CGPointMake(160,0)];
        
        _Scroller1.scrollEnabled = NO;
    }
    else if(check == 4)
    {
        [bigView setCenter:CGPointMake(160,-401)];
        _Scroller1.scrollEnabled = NO;
    }
    
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(scrollTracker) userInfo:nil repeats:YES];
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


-(IBAction)toRelApp:(UIButton *)sender
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Under construction" message:@"Check Back Soon" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    
}

-(void)DisplayCast
{
    [self getdata];
    NSLog(@"TotalData = %d",TotalData);
    int m= 0;
    for(int i=0;i<TotalData;i++)
    {
        NSLog(@"TotalData = %d",TotalData);
               
        webImageView[i] = [[UIWebView alloc] initWithFrame:CGRectMake(7, m+0, 306,341)];
		webImageView[i].userInteractionEnabled=YES;
		webImageView[i].delegate =self;
		webImageView[i].tag=i;
		NSURL *url = [NSURL URLWithString:data[i]];
		//            //URL Requst Object
		NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
		//            //Load the request in the UIWebView.
		[webImageView[i] loadRequest:requestObj];
		webImageView[i].scrollView.bounces = NO;
		webImageView[i].scrollView.scrollEnabled = NO;
        webImageView[i].scalesPageToFit = YES;
        webImageView[i].backgroundColor = [UIColor clearColor];
        webImageView[i].opaque = NO;
      
		[bigActivityIndicator[i] stopAnimating];
        
		[bigView addSubview:webImageView[i]];
        
        BlackImage[i] = [[UIImageView alloc]initWithFrame:CGRectMake(0, 341-30, 306, 30)];
        BlackImage[i].backgroundColor = [UIColor blackColor];
        BlackImage[i].alpha = 0.7;
        [webImageView[i] addSubview:BlackImage[i]];
        
        castNameLabel[i] = [[UILabel alloc] initWithFrame:CGRectMake(5, 3 ,300, 25)];
		castNameLabel[i].backgroundColor =[UIColor clearColor];
		castNameLabel[i].textColor= [UIColor whiteColor];
        castNameLabel[i].numberOfLines = 2;
        castNameLabel[i].text=webtitle[i];
		castNameLabel[i].font = [UIFont fontWithName:@"Helvetica Neue" size: 18.0];
		[BlackImage[i] addSubview:castNameLabel[i]];

        
        charSketchButton[i] = [UIButton buttonWithType:UIButtonTypeCustom];
        charSketchButton[i].frame = CGRectMake(7, 341+m, 196, 31);
        [charSketchButton[i] setBackgroundImage:[UIImage imageNamed:@"iph5cnc_character_scetch_btn.jpg"] forState:UIControlStateNormal];
        charSketchButton[i].userInteractionEnabled=YES;
        charSketchButton[i].tag=i;
        [charSketchButton[i] addTarget:self action:@selector(ranbirCharacterButton:) forControlEvents:UIControlEventTouchUpInside];
        [bigView addSubview:charSketchButton[i]];
        
        
        dwnloadWallButton[i] = [UIButton buttonWithType:UIButtonTypeCustom];
        dwnloadWallButton[i].frame = CGRectMake(203, 341+m, 110, 31);
        [dwnloadWallButton[i] setBackgroundImage:[UIImage imageNamed:@"iph5cnc_more_photos_btn.jpg"] forState:UIControlStateNormal];
        dwnloadWallButton[i].userInteractionEnabled=YES;
        dwnloadWallButton[i].tag=i;
        [dwnloadWallButton[i] addTarget:self action:@selector(Downloads:) forControlEvents:UIControlEventTouchUpInside];
        [bigView addSubview:dwnloadWallButton[i]];
        
        blackDwnView[i] = [[UIImageView alloc]initWithFrame:CGRectMake(7, m+372, 306, 3)];
        blackDwnView[i].image = [UIImage imageNamed:@"iph5cnc_btn_btttom_border.jpg"];
        [bigView addSubview:blackDwnView[i]];
        
            
               m=m+375;
    }
    bigView.frame = CGRectMake(0, 0, 320, 375*(TotalData));

        
    productionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    productionButton.frame = CGRectMake(7, m, 306, 375);
    [productionButton setBackgroundImage:[UIImage imageNamed:@"color_pacth_400x400.png"] forState:UIControlStateNormal];

    
    UIActivityIndicatorView* productionActivityIndicator = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    [productionActivityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
    productionActivityIndicator.center = CGPointMake(productionButton.frame.size.width/2,productionButton.frame.size.height/2);
    [productionButton addSubview:productionActivityIndicator];
    [productionActivityIndicator startAnimating];

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), ^(void) {
        NSURL *url = [NSURL URLWithString:prodImageStr];
        NSLog(@"URL...!!!! %@",url);
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        UIImage *image1 = [UIImage imageWithData:imageData];
        [productionButton setBackgroundImage:image1 forState:UIControlStateNormal];
        [productionActivityIndicator stopAnimating];
    });

    productionButton.userInteractionEnabled=YES;
    [productionButton addTarget:self action:@selector(buttonProductionDetails:) forControlEvents:UIControlEventTouchUpInside];
    [_Scroller1 addSubview:productionButton];

    
           
    
}

- (IBAction)buttonProductionDetails:(id)sender {
    NSLog(@"Ashwini");
    iphone4DetailCNC *detailCastVC = [[iphone4DetailCNC alloc]initWithNibName:@"iphone4DetailCNC" bundle:nil];
    [self.navigationController pushViewController:detailCastVC animated:YES];
}


-(void)viewWillAppear:(BOOL)animated{
    
    
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(20,10,300,20)];
    
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:@"Helvetica Neue Bold" size: 20.0];
    [label setFont:[UIFont boldSystemFontOfSize:20]];
    Description.text = @" ";
    label.text = @" ";

    
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

-(void)scrollTracker
{
    
    
    for (int i=0; i<TotalData+1; i++) {
        if (_Scroller1.contentOffset.y == 375*i) {
            for (int i=0; i<TotalData+1; i++) {
                PAGINGEFFECT[i].image= [UIImage imageNamed:@"iph5cnc_black_dot.png"];
                
            }
            PAGINGEFFECT[i].image= [UIImage imageNamed:@"iph5cnc_red_dot.png"];
            
        }
        
        
    }
    
//    //    CGFloat offSet= _Scroller1.contentOffset.y;
//    //
//    //   NSLog(@"Offset : %f", offSet);
//    
//    if (_Scroller1.contentOffset.y == 375) {
//        
//        for (int i=0; i<TotalData; i++) {
//            PAGINGEFFECT[i].image= [UIImage imageNamed:@"iph5cnc_black_dot.png"];
//            
//        }
//        PAGINGEFFECT[1].image= [UIImage imageNamed:@"iph5cnc_red_dot.png"];
//        
//    }
//    
//    
//    else     if (_Scroller1.contentOffset.y == 375*2) {
//        for (int i=0; i<TotalData; i++) {
//            PAGINGEFFECT[i].image= [UIImage imageNamed:@"iph5cnc_black_dot.png"];
//            
//        }
//        
//        PAGINGEFFECT[2].image= [UIImage imageNamed:@"iph5cnc_red_dot.png"];
//        
//    }
//    
//    else     if (_Scroller1.contentOffset.y == 375*3) {
//        for (int i=0; i<TotalData; i++) {
//            PAGINGEFFECT[i].image= [UIImage imageNamed:@"iph5cnc_black_dot.png"];
//            
//        }
//        
//        PAGINGEFFECT[3].image= [UIImage imageNamed:@"iph5cnc_red_dot.png"];
//        
//    }
//    
//    else     if (_Scroller1.contentOffset.y == 375*4) {
//        for (int i=0; i<TotalData; i++) {
//            PAGINGEFFECT[i].image= [UIImage imageNamed:@"iph5cnc_black_dot.png"];
//            
//        }
//        
//        PAGINGEFFECT[4].image= [UIImage imageNamed:@"iph5cnc_red_dot.png"];
//        
//    }
//    
//    else     if (_Scroller1.contentOffset.y == 375*5) {
//        for (int i=0; i<TotalData; i++) {
//            PAGINGEFFECT[i].image= [UIImage imageNamed:@"iph5cnc_black_dot.png"];
//            
//        }
//        
//        PAGINGEFFECT[5].image= [UIImage imageNamed:@"iph5cnc_red_dot.png"];
//        
//    }
//    
//    else     if (_Scroller1.contentOffset.y == 0) {
//        for (int i=0; i<TotalData+1; i++) {
//            PAGINGEFFECT[i].image= [UIImage imageNamed:@"iph5cnc_black_dot.png"];
//            
//        }
//        
//        PAGINGEFFECT[0].image= [UIImage imageNamed:@"iph5cnc_red_dot.png"];
//        
//    }
//    
//    
//    
//    
//    
    
}
-(void)getdata
{
	GlobalClass *obj=[GlobalClass getInstance];
	NSLog(@"ddata=%@",obj.CNC);
	
	int i=0;
	for (NSDictionary *actoAgent in obj.CNC)
	{
        data[i]= [actoAgent objectForKey:@"big_image"];
		NSLog(@"big_image=%@",data[i]);
        
		webtitle[i]= [actoAgent objectForKey:@"actor_name"];
		NSLog(@"actor_name=%@",webtitle[i]);
		
		webdesc[i]= [actoAgent objectForKey:@"description"];
		NSLog(@"description=%@",webdesc[i]);
        
//        realName[i] = [webdesc[i] sub]
		i++;
        
        
	}
    TotalData = i;
    for(NSDictionary *producationImage in obj.productionImage)
    {
    
        prodImageStr= [producationImage objectForKey:@"production_img"];
		NSLog(@"production_img=%@",prodImageStr);
        
    }
    
    
}

-(void)back {
    
    if(scroll.alpha == 0.0)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        scrollBgImage.alpha = 0.0;
              scroll.alpha = 0.0;
        self.view.alpha = 1.0;
        scroll.bounds = CGRectMake(0, 0, 320, 416);
        for (int i=0; i<TotalData; i++)
        {
            if([fromDetailsVC isEqual: @"ToCastnCrew"])
            {
                PAGINGEFFECT[i].alpha = 0.0;
                
            }
            else
            {
                dwnloadWallButton[i].alpha = 1.0;
                PAGINGEFFECT[i].alpha = 1.0;
                charSketchButton[i].alpha = 1.0;
                dwnloadWallButton[i].alpha = 1.0;
                pagingbackground.alpha = 1.0;
                blackDwnView[i].alpha = 1.0;
            }
            
        }
        
    }
    
}
- (IBAction)Downloads:(id)sender
{
//    int i = [sender tag];
//    if(wallpapers == nil)
//    {
//        
//    wallpapers = [[iphone4MainWallpapers alloc]initWithNibName:@"iphone4MainWallpapers" bundle:nil];
//        
//    }
//    if(i == 0){
//    [self.navigationController pushViewController:wallpapers animated:YES];
//    }
//    
//    if(i == 1){
//        [self.navigationController pushViewController:wallpapers animated:YES];
//    }
//    
//    if(i == 2){
//        [self.navigationController pushViewController:wallpapers animated:YES];
//    }
       wallpapers = [[iphone4MainWallpapers alloc]initWithNibName:@"iphone4MainWallpapers" bundle:nil];
    [self.navigationController pushViewController:wallpapers animated:YES];
  
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
    _footerMainView.frame = CGRectMake(0, 398, _footerMainView.frame.size.width, _footerMainView.frame.size.height);

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)ranbirCharacterButton:(UIButton*)sender {
    
    scrollBgImage.alpha =0.5;
    scroll.alpha = 1.0;
    scroll.backgroundColor = [UIColor clearColor];
    scroll.frame = CGRectMake(7, 10, 306,375);
    scroll.contentSize = CGSizeMake(306, 1000);
    scroll.scrollEnabled = YES;
    Description.textColor = [UIColor whiteColor];
    
    label.textColor = [UIColor whiteColor];
    Description.text = @" ";
    label.text = @" ";

    for (int i=0; i<TotalData; i++)
    {
        blackDwnView[i].alpha = 0.0;
       // PAGINGEFFECT[i].alpha = 0.0;
       // charSketchButton[i].alpha = 0.0;
       // dwnloadWallButton[i].alpha = 0.0;
       // pagingbackground.alpha = 0.0;
       
   
    if([sender tag ]==i)
    {
        
        
        NSLog(@"sender tag = %d",[sender tag]);
               
        Description.text = @" ";
        label.text = @" ";

        label.text = webtitle[i];
        [label sizeToFit];
        [scroll addSubview:label];
        
        CGSize expectedLabelSize = [webdesc[i] sizeWithFont:Description.font constrainedToSize:maximumLabelSize lineBreakMode:Description.lineBreakMode];
        
        CGRect newFrame = Description.frame;
        newFrame.size.height = expectedLabelSize.height;
        Description.frame = CGRectMake(10, 55, 295, expectedLabelSize.height);
        scroll.contentSize=CGSizeMake(306, expectedLabelSize.height+100);
        NSLog(@"height-=%f",expectedLabelSize.height);
        Description.text=webdesc[i];
        //        [self.view addSubview:scroll];
         [Description sizeToFit];
        Description.alpha = 1.0;
        [scroll addSubview:Description];
       
    }
    }
//    else if([sender tag]==1)
//    {
//        NSLog(@"sender tag = %d",[sender tag]);
//        // charSketchButton[1].alpha = 0.0;
//        Description.text = @" ";
//        label.text = @" ";
//        label.text = webtitle[1];
//        [label sizeToFit];
//        [scroll addSubview:label];
//        
//        
//        
//        CGSize expectedLabelSize = [webdesc[2] sizeWithFont:Description.font constrainedToSize:maximumLabelSize lineBreakMode:Description.lineBreakMode];
//        
//        CGRect newFrame = Description.frame;
//        newFrame.size.height = expectedLabelSize.height;
//        Description.frame = CGRectMake(10, 55, 300, expectedLabelSize.height);
//        scroll.contentSize=CGSizeMake(306, expectedLabelSize.height+100);
//        NSLog(@"height-=%f",expectedLabelSize.height);
//        Description.text=webdesc[1];
//        
//        // scroll.backgroundColor = [self colorWithHexString:@"f53232"];
//        //        [self.view addSubview:scroll];
//        [scroll addSubview:Description];
//    }
//    if([sender tag ]==2)
//    {
//        
//        NSLog(@"sender tag = %d",[sender tag]);
//        // charSketchButton[2].alpha = 0.0;
//              
//        
//        Description.text = @" ";
//        label.text = @" ";
//        label.text = webtitle[2];
//        [label sizeToFit];
//        [scroll addSubview:label];
//        
//        CGSize expectedLabelSize = [webdesc[1] sizeWithFont:Description.font constrainedToSize:maximumLabelSize lineBreakMode:Description.lineBreakMode];
//        
//        CGRect newFrame = Description.frame;
//        newFrame.size.height = expectedLabelSize.height;
//        Description.frame = CGRectMake(10, 55, 306, expectedLabelSize.height);
//        scroll.contentSize=CGSizeMake(306, expectedLabelSize.height+100);
//        NSLog(@"height-=%f",expectedLabelSize.height);
//        Description.text=webdesc[2];
//        
//        //        [self.view addSubview:scroll];
//        [scroll addSubview:Description];
//    }
//    if([sender tag ]==3)
//    {
//        
//        NSLog(@"sender tag = %d",[sender tag]);
//        // charSketchButton[3].alpha = 0.0;
//             
//        Description.text = @" ";
//        label.text = @" ";
//
//        label.text = webtitle[3];
//        [label sizeToFit];
//        [scroll addSubview:label];
//        
//        CGSize expectedLabelSize = [webdesc[0] sizeWithFont:Description.font constrainedToSize:maximumLabelSize lineBreakMode:Description.lineBreakMode];
//        
//        CGRect newFrame = Description.frame;
//        newFrame.size.height = expectedLabelSize.height;
//        Description.frame = CGRectMake(10,55, 300, expectedLabelSize.height);
//        scroll.contentSize=CGSizeMake(306, expectedLabelSize.height+100);
//        NSLog(@"height-=%f",expectedLabelSize.height);
//        Description.text=webdesc[3];
//        // scroll.backgroundColor = [self colorWithHexString:@"2843a1"];
//        //        [self.view addSubview:scroll];
//        [scroll addSubview:Description];
//    }
//    }
    [self.view addSubview:scroll];
    [self.view addSubview:_footerMainView];
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    
    Description.text = @" ";
    label.text = @" ";
    scroll.alpha = 0.0;
    scrollBgImage.alpha = 0.0;
    //    [label removeFromSuperview];
    //
    //    label =nil;
    
    
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

- (void)webViewDidStartLoad:(UIWebView *)webView
{
	NSLog(@"yes");
	for (int i =0; i<TotalData; i++) {
		
		
		if (webView.tag==i) {
			
			
			ActIndImage1[i] = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,306,341)];
			//  ActIndImage1[i].center = CGPointMake(320/2, 460/2);
			ActIndImage1[i].image = [UIImage imageNamed:@"color_pacth_400x400.png"];
			ActIndImage1[i].alpha=0.7;
			[webImageView[i] addSubview:ActIndImage1[i]];
			
			activityIndicator1[i] = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
			activityIndicator1[i].center=CGPointMake(306/2, 341/2);
			//activityIndicator1[i].transform = CGAffineTransformMakeScale(1.0, 1.0);
			[activityIndicator1[i] setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
			[ActIndImage1[i] addSubview:activityIndicator1[i]];
			
			
			[activityIndicator1[i] startAnimating];
			
		}
		
		
		
		else {
			
		}
	}
	
	//[self performSelector:@selector(unloadAct) withObject:nil afterDelay:0.2];
	
	
}
-(void)unloadAct:(int)i
{
	
	NSLog(@"unloadAct=%d",i);
	[activityIndicator1[i] stopAnimating];
	if (activityIndicator1[i]!=nil) {
		[activityIndicator1[i] removeFromSuperview];
		activityIndicator1[i] = nil;
	}
	if (ActIndImage1[i]!=nil) {
		[ActIndImage1[i] removeFromSuperview];
		ActIndImage1[i] = nil;
	}
	
}
- (void)webViewDidFinishLoad:(UIWebView *)webView

{
	
	for (int i =0; i<TotalData; i++) {
		
		if (webView.tag == i) {
			[self unloadAct:i];
			
		}
	}
	
	
	
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
	for (int i =0; i<TotalData; i++) {
		if (webView.tag == i) {
			[self unloadAct:i];
			
		}
	}
}


@end
