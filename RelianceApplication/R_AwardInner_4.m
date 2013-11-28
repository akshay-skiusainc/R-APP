//
//  R_AwardInner_4.m
//  RelianceApplication
//
//  Created by Ashwini Pawar on 07/11/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import "R_AwardInner_4.h"

@interface R_AwardInner_4 ()

@end

@implementation R_AwardInner_4
@synthesize movieSearch,movieNameArray,movieTable,movieId,awardImage,specificAward,detailScroller;

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

        detailScroller.frame = CGRectMake(0, 228, 320, 504-230);
    }
    if(result.height == 480)
    {
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"rel_i4home_bg.jpg"]];

        detailScroller.frame = CGRectMake(0, 228, 320, 188);

    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"AwardId = %@",movieId);
    movieTable.hidden = YES;
    [movieTable setSeparatorColor:[self colorWithHexString:@"1f3a55"]];
    movieTable.backgroundColor  =[self colorWithHexString:@"13202d"];

    movieNameArray = [[NSMutableArray alloc]init];
    [movieNameArray insertObject:@"All" atIndex:0];

    detailScroller.alpha = 0.0;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        dispatch_async(dispatch_get_main_queue()	, ^{
            [self DisplayAwards];
            
        });
    });
    
    
    
        UIImage *buttonImage = [UIImage imageNamed:@"back-btn.png"];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:buttonImage forState:UIControlStateNormal];
        button.frame = CGRectMake(0, 0, buttonImage.size.width, buttonImage.size.height);
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        self.navigationItem.leftBarButtonItem = customBarItem;
 
    
    if (specificAward == nil)
        
    {
        
        specificAward = [[AsyncImageView alloc] initWithFrame:CGRectMake(0, 47, 320.0f, 138.0f)];
        
        
        
        specificAward.contentMode = UIViewContentModeScaleToFill;
        
    }
    
    specificAward.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];
    specificAward.userInteractionEnabled = YES;
    
    
    
    //cancel any previously loading images for this view
    
    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:specificAward];
    
    
    
    //set image URL. AsyncImageView class will then dynamically load the image
    
    NSURL *url1 = [NSURL URLWithString:awardImage];
    
    
    
    ((AsyncImageView *)specificAward).imageURL =url1;
    specificAward.backgroundColor = [UIColor clearColor];
    [self.view addSubview:specificAward];
}

-(void)getdata
{
    GlobalClass *obj=[GlobalClass getInstance];
	NSLog(@"ddata=%@",obj.awardCat);
  	int i=0;
    int j = 0;
	for (NSDictionary *actoAgent in obj.awardMovie)
	{
		data2[i]= [actoAgent objectForKey:@"award_id"];
		NSLog(@"award_id=%@",data2[i]);
        
        data3[i]= [actoAgent objectForKey:@"a_movie_name"];
		NSLog(@"a_movie_name=%@",data3[i]);
        
        data4[i]= [actoAgent objectForKey:@"a_movie_img"];
		NSLog(@"a_movie_img=%@",data4[i]);

        data5[i]= [actoAgent objectForKey:@"award_date"];
		NSLog(@"award_date=%@",data5[i]);
        
        data6[i] = [data5[i] substringToIndex:4];
        NSLog(@"award_dateYear=%@",data6[i]);

        if (![movieNameArray containsObject:data6[i]])
        {
            [movieNameArray addObject:data6[i]];
        }
        obj.detailAwards= [actoAgent objectForKey:@"movie_info"];
		NSLog(@"movie_info=%@",obj.detailAwards);
        
        for (NSDictionary *actoAgent1 in obj.detailAwards)
        {
            data7[j]= [actoAgent1 objectForKey:@"award_movie_id"];
            NSLog(@"award_movie_id=%@",data7[j]);
            
            data8[j]= [actoAgent1 objectForKey:@"award_category"];
            NSLog(@"award_category=%@",data8[j]);

            data9[j]= [actoAgent1 objectForKey:@"award_winner"];
            NSLog(@"award_winner=%@",data9[j]);
            j++;
        }
        totalAwardWinner = j;
        
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
        scroller = [[UIScrollView alloc] initWithFrame:CGRectMake(0,228,320,504-230)];
        scroller.userInteractionEnabled	=YES;
        scroller.backgroundColor = [UIColor clearColor];
        scroller.showsVerticalScrollIndicator = YES;
        scroller.delegate = self;
        scroller.pagingEnabled = NO;
        [self.view addSubview:scroller];
        
        movieTable.frame = CGRectMake(144, 220, 160, 130);
    }
    if(result.height == 480)
    {
        scroller = [[UIScrollView alloc] initWithFrame:CGRectMake(0,228,320,416-228)];
        scroller.userInteractionEnabled	=YES;
        scroller.backgroundColor = [UIColor clearColor];
        scroller.showsVerticalScrollIndicator = YES;
        scroller.delegate = self;
        scroller.pagingEnabled = NO;
        [self.view addSubview:scroller];
	}
	int m=0;
	NSLog(@"hi");
	for (int i =0; i<TotalData; i++)
    {
        
        if ([movieSearch.text isEqualToString:@"All"])
        {
            data6[i]=@"All";
        }

        if([data6[i] isEqualToString:movieSearch.text] && [data2[i] isEqualToString:movieId])
        {
            if (awardImages[i] == nil)
                
            {
                
                awardImages[i] = [[AsyncImageView alloc] initWithFrame:CGRectMake(8, m+2, 304.0f, 101.0f)];
                
                
                
                awardImages[i].contentMode = UIViewContentModeScaleToFill;
                
            }
            
            awardImages[i].backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];
            awardImages[i].userInteractionEnabled = YES;
            
            
            
            //cancel any previously loading images for this view
            
            [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:awardImages[i]];
            
            
            
            //set image URL. AsyncImageView class will then dynamically load the image
            
            NSURL *url1 = [NSURL URLWithString:data4[i]];
            
            
            
            ((AsyncImageView *)awardImages[i]).imageURL =url1;
            
            [scroller addSubview:awardImages[i]];
            
            
            UITapGestureRecognizer *webViewTapped = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageTouched:)];
            
            webViewTapped.numberOfTapsRequired = 1;
            awardImages[i].tag = i;
            webViewTapped.delegate = self;
            
            [awardImages[i] addGestureRecognizer:webViewTapped];
            
            m=m+103;
            
        }
        
        
    }
    scroller.contentSize = CGSizeMake(320, m);
    [self.view addSubview: movieTable];
    if (m==0)
    {
        UIAlertView *noMovieAlert = [[UIAlertView alloc]initWithTitle:nil message:@"Oops! No movies matching your search" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        noMovieAlert.tag = 5;
        [noMovieAlert show];
    }
}

- (void)imageTouched:(UITapGestureRecognizer *)sender
{
    detailScroller.alpha = 1.0;
    scroller.alpha = 0.0;
    UITapGestureRecognizer *gesture = (UITapGestureRecognizer *) sender;
    NSLog(@"gesture.view = %d",gesture.view.tag);
    
    ((AsyncImageView *)detailAwardImage).image = nil;

    if(detailAwardImage == nil)
    {
        detailAwardImage = [[AsyncImageView alloc] initWithFrame:CGRectMake(8, 2, 304.0f, 101.0f)];
        
        detailAwardImage.contentMode = UIViewContentModeScaleToFill;
    }
    detailAwardImage.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];
    detailAwardImage.userInteractionEnabled = YES;
    
    
    
    //cancel any previously loading images for this view
    
    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:detailAwardImage];
    
    
    
    //set image URL. AsyncImageView class will then dynamically load the image
    
    NSURL *url1 = [NSURL URLWithString:data4[gesture.view.tag]];
    
    
    
    ((AsyncImageView *)detailAwardImage).imageURL =url1;
    
    [detailScroller addSubview:detailAwardImage];
    
    int m = 0;
    for (int i =0; i<totalAwardWinner; i++)
    { 
        if([data7[i] isEqualToString:data2[gesture.view.tag]])
        {
            UILabel * award_category = [[UILabel alloc] initWithFrame:CGRectMake(8, m+103, 150, 30)];
            award_category.backgroundColor =[UIColor clearColor];
            award_category.textColor= [UIColor blackColor];
            award_category.text=[NSString stringWithFormat:@"%@ :",data8[i]] ;
            award_category.numberOfLines = 2;
            award_category.lineBreakMode = NSLineBreakByWordWrapping;
            award_category.font = [UIFont boldSystemFontOfSize:19.0f];
            [detailScroller addSubview:award_category];
    
            UILabel * award_winner = [[UILabel alloc] initWithFrame:CGRectMake(160, m+103, 150, 30)];
            award_winner.backgroundColor =[UIColor clearColor];
            award_winner.textColor= [UIColor darkGrayColor];
            award_winner.text=data9[i];
            award_winner.numberOfLines = 2;
            award_winner.lineBreakMode = NSLineBreakByWordWrapping;
            award_winner.font = [UIFont systemFontOfSize:17.0f];
            [detailScroller addSubview:award_winner];
            m=m+31;
        }
    }
    detailScroller.contentSize = CGSizeMake(320, 103+m);
}

-(void)back
{
//    if(detailScroller.alpha == 1.0)
//    {
//        detailScroller.alpha = 0.0;
//        scroller.alpha = 1.0;
//    }
//    else
//    {
        [self.navigationController popViewControllerAnimated:YES];
  //  }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [movieNameArray count];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [[scroller subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [scroller removeFromSuperview];
    scroller=nil;
    
      
    [self performSelector:@selector(DisplayAwards) withObject:nil afterDelay:0.0];
    movieSearch.text=[NSString stringWithFormat:@"%@",[movieNameArray objectAtIndex:indexPath.row]];
    
    movieTable.hidden = YES;
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Awards";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    cell.backgroundColor  =[self colorWithHexString:@"13202d"];

    
    cell.textLabel.textColor = [UIColor whiteColor];
     cell.textLabel.font = [UIFont systemFontOfSize:13];
    
    NSLog(@"MovieArray in cellForRow = %@",movieNameArray);
    
    cell.textLabel.text=[movieNameArray objectAtIndex:indexPath.row];
    
    
    return cell;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    if(textField == movieSearch)
    {
        NSLog(@"Ashwini");
        [self.view endEditing:YES]; // added this in for case when keyboard was already on screen
        
        if (movieTable.hidden) {
            movieTable.hidden = NO;
            
        }
        else
            movieTable.hidden = YES;
        detailScroller.alpha = 0.0;
        scroller.alpha = 1.0;
        [movieSearch resignFirstResponder];
        
    }
    return NO;
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    movieTable.hidden=YES;
}

@end
