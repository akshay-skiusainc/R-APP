//
//  R_Awards_4.m
//  RelianceApplication
//
//  Created by Ashwini Pawar on 01/11/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import "R_Awards_4.h"
#import "R_AwardInner_4.h"

@interface R_Awards_4 ()

@end

@implementation R_Awards_4

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
    CGSize result = [[UIScreen mainScreen] bounds].size;
    if (result.height == 568)
    {
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"home_bg.jpg"]];
    }
    if(result.height == 480)
    {
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"rel_i4home_bg.jpg"]];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        dispatch_async(dispatch_get_main_queue()	, ^{
            [self DisplayAwards];

        });
    });

    
 
    if([_TAG isEqual:@"REL_LEFT"])
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

-(void)getdata
{
    GlobalClass *obj=[GlobalClass getInstance];
	NSLog(@"ddata=%@",obj.awardCat);
  	int i=0;
	for (NSDictionary *actoAgent in obj.awardCat)
	{
		data1[i]= [actoAgent objectForKey:@"m_award_id"];
		NSLog(@"m_award_id=%@",data1[i]);
		
		data2[i]= [actoAgent objectForKey:@"m_award_name"];
		NSLog(@"m_award_name=%@",data2[i]);
        
        data3[i]= [actoAgent objectForKey:@"m_award_img"];
		NSLog(@"m_award_img=%@",data3[i]);
        i++;
    }
    TotalData = i;
}

-(void)DisplayAwards
{
    [self getdata];
    CGSize result = [[UIScreen mainScreen] bounds].size;
    if (result.height == 568)
    {
        scroller = [[UIScrollView alloc] initWithFrame:CGRectMake(0,44,320,504-45)];
        scroller.userInteractionEnabled	=YES;
        scroller.backgroundColor = [UIColor clearColor];
        scroller.showsVerticalScrollIndicator = YES;
        scroller.delegate = self;
        scroller.pagingEnabled = NO;
        [self.view addSubview:scroller];
    }
    if(result.height == 480)
    {
        scroller = [[UIScrollView alloc] initWithFrame:CGRectMake(0,44,320,416-45)];
        scroller.userInteractionEnabled	=YES;
        scroller.backgroundColor = [UIColor clearColor];
        scroller.showsVerticalScrollIndicator = YES;
        scroller.delegate = self;
        scroller.pagingEnabled = NO;
        [self.view addSubview:scroller];
    }
	
	int m=0;
	NSLog(@"hi");
	for (int i =0; i<TotalData; i++) {
        if (awardImages[i] == nil)
            
        {
            
            awardImages[i] = [[AsyncImageView alloc] initWithFrame:CGRectMake(0, m+2, 320.0f, 147.0f)];
            
            
            
            awardImages[i].contentMode = UIViewContentModeScaleToFill;
            
        }
        
        awardImages[i].backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];
        awardImages[i].userInteractionEnabled = YES;
        
        
        
        //cancel any previously loading images for this view
        
        [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:awardImages[i]];
        
        
        
        //set image URL. AsyncImageView class will then dynamically load the image
        
        NSURL *url1 = [NSURL URLWithString:data3[i]];
        
        
        
        ((AsyncImageView *)awardImages[i]).imageURL =url1;
        
        [scroller addSubview:awardImages[i]];
        
        
        UITapGestureRecognizer *webViewTapped = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageTouched:)];
        
        webViewTapped.numberOfTapsRequired = 1;
        awardImages[i].tag = i;
        webViewTapped.delegate = self;
        
        [awardImages[i] addGestureRecognizer:webViewTapped];
        
        awardImages[i].backgroundColor=[UIColor clearColor];

        m=m+150;

    }
    scroller.contentSize = CGSizeMake(320, TotalData*150);
}

- (void)imageTouched:(UITapGestureRecognizer *)sender
{
    UITapGestureRecognizer *gesture = (UITapGestureRecognizer *) sender;
    NSLog(@"gesture.view = %d",gesture.view.tag);
    
    R_AwardInner_4 *awards = [[R_AwardInner_4 alloc]initWithNibName:@"R_AwardInner_4" bundle:nil];
    awards.movieId = data1[gesture.view.tag];
    awards.awardImage = data3[gesture.view.tag];
    [self.navigationController pushViewController:awards animated:YES];

}
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
