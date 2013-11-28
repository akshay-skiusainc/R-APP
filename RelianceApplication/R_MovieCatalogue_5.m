//
//  R_MovieCatalogue_5.m
//  RelianceApplication
//
//  Created by Ashwini Pawar on 30/10/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import "R_MovieCatalogue_5.h"
#import "R_OpenMovie_5.h"

@interface R_MovieCatalogue_5 ()

@end

@implementation R_MovieCatalogue_5

@synthesize movieNameArray,Movie_Scroller,movieNameArray1;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)back {
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    movieNameArray=[[NSMutableArray alloc]init];
    movieNameArray1=[[NSMutableArray alloc]init];
    
    [self DisplayTypeScroller];
    [self performSelector:@selector(DisplayMovie:) withObject:nil afterDelay:0.0];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"rel_i4home_bg.jpg"]];
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(scrollTracker) userInfo:nil repeats:YES];
    
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
    
      // Do any additional setup after loading the view from its nib.
}


-(void)overlayclicked
{
    if (Overlaybtn!=nil) {
        [Overlaybtn removeFromSuperview];
        Overlaybtn=nil;
    }
    [self.navigationController setNavigationBarHidden:NO animated:YES];

    GlobalClass *obj=[GlobalClass getInstance];
obj.CHECK_CATALOG=@"0";
}

-(void)getdata
{
    
    
    GlobalClass *obj=[GlobalClass getInstance];
    NSLog(@"moviedata=%@",obj.moviedata);
    int j = 0;
    for (NSDictionary *actoAgent in obj.movieCategory)
	{
        data11[j]= [actoAgent objectForKey:@"movie_cat_id"];
        NSLog(@"data11=%@",data11[j]);
        
        data13[j]= [actoAgent objectForKey:@"movie_cat_name"];
        NSLog(@"movie_cat_name=%@",data13[j]);
        
        if (![movieNameArray containsObject:data13[j]])
        {
            [movieNameArray addObject:data13[j]];
            
        }
        
        j++;
    }
    TotalCategory = j;
    
    int i=0;
	for (NSDictionary *actoAgent in obj.moviedata)
	{
        
        data1[i]= [actoAgent objectForKey:@"m_id"];
        NSLog(@"m_id=%@",data1[i]);
        
        data2[i]= [actoAgent objectForKey:@"m_name"];
        
        data9[i] =  [data2[i] substringToIndex:1];
        
        NSLog(@"m_name=%@",data9[i]);
        
        
        
        data3[i]= [actoAgent objectForKey:@"m_short_name"];
        NSLog(@"m_short_name=%@",data3[i]);
        
        
        data4[i]= [actoAgent objectForKey:@"m_img"];
        
        
        
        data5[i]= [actoAgent objectForKey:@"m_img_thumb"];
        
        
        data6[i]= [actoAgent objectForKey:@"m_desc"];
        
        
        data7[i]= [actoAgent objectForKey:@"m_date"];
        
        data7[i]= [data7[i] substringToIndex:4];
        NSLog(@"date=%@",data7[i]);
        
        data14[i]= [actoAgent objectForKey:@"m_type"];
        NSLog(@"data14=%@",data14[i]);
        
        data8[i]= [actoAgent objectForKey:@"movie_cat_name"];
        
        data12[i] = [data8[i] uppercaseString];
        NSLog(@"data12[i]=%@",data12[i]);
        
        
        data10[i]= [actoAgent objectForKey:@"m_caption"];
        
        
        
        
        
        if (![movieNameArray1 containsObject:data12[i]])
        {
            [movieNameArray1 addObject:data12[i]];
            
        }
        
        
        i++;
    }
	TotalData=i;
    
    
    NSLog(@"movieNameArray=%@",movieNameArray);
}

-(void)DisplayTypeScroller
{
    [self getdata];
    
    int m=0;
    for (int i=0; i<[movieNameArray count]; i++)
    {
        
        btn[i]				= [UIButton buttonWithType:UIButtonTypeCustom];
        btn[i].frame		= CGRectMake(m,0, 99, 50);
        btn[i].alpha=1.0;
        [btn[i] setBackgroundImage:[UIImage imageNamed:@"blue_btn.jpg"] forState:UIControlStateNormal];
        
        [btn[i] setBackgroundImage:[UIImage imageNamed:@"black_btn.jpg"] forState:UIControlStateHighlighted];
        btn[i].tag=i;
        NSLog(@"movie array %@",[movieNameArray objectAtIndex:i]);
        btn[i].titleLabel.numberOfLines = 2;
        btn[i].titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [btn[i] setTitle:[movieNameArray objectAtIndex:i] forState:UIControlStateNormal];
        [ btn[i] addTarget:self action:@selector(DisplayMovie:) forControlEvents:UIControlEventTouchUpInside];
        [_type_scroller addSubview: btn[i]];
        m+=100;
        
    }
    _type_scroller.contentSize = CGSizeMake(100*[movieNameArray count], 50);
}

-(void)scrollTracker
{
    
    
    for (int i=0; i<TotalData; i++) {
        if (Movie_Scroller.contentOffset.y == 411*i) {
            for (int i=0; i<TotalData; i++) {
                PAGINGEFFECT[i].image= [UIImage imageNamed:@"iph5cnc_black_dot.png"];
                
            }
            PAGINGEFFECT[i].image= [UIImage imageNamed:@"iph5cnc_red_dot.png"];
            
        }
        
        
    }
}

-(void)DisplayMovie: (UIButton *)sender
{
    
    for (int i =0; i<td; i++)
    {
        
        [PAGINGEFFECT[i] removeFromSuperview];
        PAGINGEFFECT[i]=nil;
    }
    
    [[Movie_Scroller subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    for (int i =0; i<[movieNameArray count]; i++)
    {
        
        [btn[i] setBackgroundImage:[UIImage imageNamed:@"blue_btn.jpg"] forState:UIControlStateNormal];
        
        [btn[sender.tag] setBackgroundImage:[UIImage imageNamed:@"black_btn.jpg"] forState:UIControlStateNormal];
    }
    
    Movie_Scroller			= [[UIScrollView alloc] initWithFrame:CGRectMake(0, 93, 320,504-93)];
	Movie_Scroller.userInteractionEnabled	=YES;
    Movie_Scroller.showsHorizontalScrollIndicator = YES;
	[self.view addSubview:Movie_Scroller];
    
    
	int nX = 0;
	int nY = 0;
    int b= 0;
    
    
    int pagingCount = 0;
    int m = 0;
    int n = 0;
    
	for (int i =0; i<TotalData; i++)
    {
        nX=110*(b%3);
		nY=170 * (b/3);
        
        
        
        if ([data14[i] isEqualToString:data11[sender.tag]])
        {
            if([data11[sender.tag] isEqualToString:@"1"] | [data11[sender.tag]isEqualToString:@"2"])
            {
                PAGINGEFFECT[pagingCount].alpha = 1.0;
                PAGINGEFFECT[pagingCount]  = [[UIImageView alloc] initWithFrame:CGRectMake(296, n+120, 12,13)];
                PAGINGEFFECT[pagingCount].userInteractionEnabled=YES;
                PAGINGEFFECT[pagingCount].image= [UIImage imageNamed:@"iph5cnc_black_dot.png"];
                [self.view addSubview:PAGINGEFFECT[pagingCount]];
                PAGINGEFFECT[pagingCount].tag= pagingCount;
                PAGINGEFFECT[0].image= [UIImage imageNamed:@"iph5cnc_red_dot.png"];
                
                n+=22;
                
                
                if (movieImage[i] == nil)
                {
                    movieImage[i] = [[AsyncImageView alloc] initWithFrame:CGRectMake(10,m, 300, 379)];
                    
                    movieImage[i].contentMode = UIViewContentModeScaleToFill;
                }
                
                movieImage[i].backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];
                movieImage[i].userInteractionEnabled=YES;
                movieImage[i].tag = i;
                [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:movieImage[i]];
                movieImage[i].tag=i;
                NSURL *url1 = [NSURL URLWithString:data5[i]];
                NSLog(@"nsurl = %@",url1);
                ((AsyncImageView *)movieImage[i]).imageURL =url1;
                [Movie_Scroller addSubview:movieImage[i]];
                
                UITapGestureRecognizer *webViewTapped = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openMovieDetails:)];
                webViewTapped.numberOfTapsRequired = 1;
                webViewTapped.delegate = self;
                [movieImage[i] addGestureRecognizer:webViewTapped];
                
                UIButton * mvDetailButton = [UIButton buttonWithType:UIButtonTypeCustom];
                mvDetailButton.frame = CGRectMake(320-117-10, 379-40, 117, 39);
                mvDetailButton.userInteractionEnabled=NO;
                //[mvDetailButton addTarget:self action:@selector(openContest:)forControlEvents:UIControlEventTouchUpInside];
                mvDetailButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"more_btn.png"]];
                [movieImage[i] addSubview:mvDetailButton];
                
                moviName[i] = [[UITextView alloc] initWithFrame:CGRectMake(2, 379+m, 311, 32)];
                moviName[i].backgroundColor =[UIColor clearColor];
                moviName[i].textColor= [UIColor blackColor];
                moviName[i].editable = NO;
                moviName[i].text=data10[i];
                moviName[i].font = [UIFont boldSystemFontOfSize:10.0f];
                [Movie_Scroller addSubview:moviName[i]];
                
                
                m=m+411;
                pagingCount++;
                
                [self.view addSubview:PAGINGEFFECT[pagingCount]];
                
                
            }
            else
            {
                if (movieImage[i] == nil)
                {
                    movieImage[i] = [[AsyncImageView alloc] initWithFrame:CGRectMake(nX, nY, 100, 120)];
                    
                    movieImage[i].contentMode = UIViewContentModeScaleToFill;
                }
                
                movieImage[i].backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];
                
                movieImage[i].contentMode = UIViewContentModeScaleToFill;
                movieImage[i].userInteractionEnabled=YES;
                
                [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:movieImage[i]];
                
                movieImage[i].tag=i;
                NSURL *url1 = [NSURL URLWithString:data5[i]];
                NSLog(@"nsurl = %@",url1);
                ((AsyncImageView *)movieImage[i]).imageURL =url1;
                [Movie_Scroller addSubview:movieImage[i]];
                
                UITapGestureRecognizer *webViewTapped = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openMovieDetails:)];
                webViewTapped.numberOfTapsRequired = 1;
                webViewTapped.delegate = self;
                [movieImage[i] addGestureRecognizer:webViewTapped];
                
                MovieLabel[i] = [[UILabel alloc] initWithFrame:CGRectMake(nX, 120+nY, 100, 40)];
                MovieLabel[i].backgroundColor =[UIColor clearColor];
                MovieLabel[i].textColor= [UIColor blackColor];
                MovieLabel[i].text=data2[i];
                MovieLabel[i].numberOfLines = 2;
                MovieLabel[i].lineBreakMode = NSLineBreakByWordWrapping;
                MovieLabel[i].font = [UIFont boldSystemFontOfSize:14.0f];
                [Movie_Scroller addSubview:MovieLabel[i]];
                
                
                
                grayImage[i] = [[UIImageView alloc]initWithFrame:CGRectMake(8, 155+nY, 297, 16)];
                grayImage[i].image = [UIImage imageNamed:@"divder.png"];
                [Movie_Scroller addSubview:grayImage[i]];
                b++;
                
            }
            
        }
        
    }
    if([data11[sender.tag] isEqualToString:@"1"] | [data11[sender.tag]isEqualToString:@"2"])
    {
        Movie_Scroller.contentSize = CGSizeMake(320,m);
        Movie_Scroller.pagingEnabled = YES;
    }
    else
    {
        
        Movie_Scroller.contentSize = CGSizeMake(320,((b*170)/3)+100);
        
        Movie_Scroller.pagingEnabled = NO;
    }
    
    td=TotalData;
    
    GlobalClass *obj=[GlobalClass getInstance];
    if([obj.CHECK_CATALOG isEqualToString:@"1"])
    {
        
        [self.navigationController setNavigationBarHidden:YES animated:YES];

        Overlaybtn = [UIButton buttonWithType:UIButtonTypeCustom];
        Overlaybtn.frame=CGRectMake(0, 0,  320, 548);
        
        [Overlaybtn setBackgroundImage:[UIImage imageNamed:@"catelog_overlay_iphon5.jpg"] forState:UIControlStateNormal];
        //[Coverflow[i] setBackgroundImage:CoverImage[i] forState:UIControlStateHighlighted];
        
        [Overlaybtn addTarget:self action:@selector(overlayclicked) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:  Overlaybtn];
        
    }

}

-(void)openMovieDetails:(UITapGestureRecognizer *)sender
{
    UITapGestureRecognizer *gesture = (UITapGestureRecognizer *) sender;
    
    R_OpenMovie_5 *openDetails = [[R_OpenMovie_5 alloc]initWithNibName:@"R_OpenMovie_5" bundle:nil];
    openDetails.getiID = data1[gesture.view.tag];
    NSLog(@"data8[gesture.view.tag] = %@",data1[gesture.view.tag]);
    [self.navigationController pushViewController:openDetails animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

@end
