//
//  R_iphone4help2ViewController.m
//  RelianceApplication
//
//  Created by Anish on 10/17/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import "R_iphone4help2ViewController.h"
#import "R_iPhone4Settings.h"

@interface R_iphone4help2ViewController ()

@end

@implementation R_iphone4help2ViewController

@synthesize faq1 ,customImageView;
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
	
    arr = [[NSMutableArray alloc]init];
    UIImage *ansImage = [UIImage imageNamed:@"ma_faq_ans-icn.png"];
    
    [arr addObject:ansImage];
    UIImage* app_bg_image = [UIImage imageNamed:@"rel_i4home_bg.jpg"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:app_bg_image];
	
	content = [[NSMutableArray alloc]init];
    
    _footerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"footer_bg.png"]];
    
	
    //	self.navigationItem.title= @"Answer";
    //	if ([self.navigationController.navigationBar respondsToSelector:@selector( setBackgroundImage:forBarMetrics:)]){
    //		[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bar_clean.png"] forBarMetrics:UIBarMetricsDefault];
    //
    //		UIImage *buttonImage = [UIImage imageNamed:@"c&c_top_back_btn.png"];
    //		UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    //		[button setImage:buttonImage forState:UIControlStateNormal];
    //		button.frame = CGRectMake(0, 0, buttonImage.size.width, buttonImage.size.height);
    //		[button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    //		UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    //		//self.navigationItem.leftBarButtonItem = customBarItem;
    //
    //	}
    //
	
	NSString *str= [NSString stringWithFormat:@"%@ \n",faq1];
    _showans.textColor = [UIColor blackColor];
	_showans.text=str;
	[self loadtable];
    
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
    [_footerMainView removeFromSuperview];
}


-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillDisappear:(BOOL)animated{
	[super viewWillDisappear:YES];
    //	[self.navigationController setNavigationBarHidden:NO animated:NO];
    _footerMainView.frame = CGRectMake(0, 398, _footerMainView.frame.size.width, _footerMainView.frame.size.height);
}

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

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    
    //    if ([self.navigationController.navigationBar respondsToSelector:@selector( setBackgroundImage:forBarMetrics:)]){
    //        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bar_clean.png"] forBarMetrics:UIBarMetricsDefault];
    //    }
}


-(void)loadtable
{
	
	NSString *str= [NSString stringWithFormat:@"%@ \n  ",faq1 ];
    
	
    _quotes = [[NSMutableArray alloc] init];
    
    
    
    [_quotes addObject:str];
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 70, 300, 504-20) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.layer.cornerRadius=15;
    
    
    [self.view addSubview: _tableView];
    
}



- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
	return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	NSString* reuseIdentifier = @"Cell";
	UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
	
	if (nil == cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
		
		cell.textLabel.numberOfLines = 0;
	}
	
    CGSize size = [[_quotes objectAtIndex:indexPath.row]
                   sizeWithFont:[UIFont systemFontOfSize:14]
                   constrainedToSize:CGSizeMake(300, CGFLOAT_MAX)];
    
    CGRect tableFrame = CGRectMake(10, 70, 300, size.height+70);
    _tableView.frame = tableFrame;
    _tableView.scrollEnabled = NO;
    
    //  cell.layer.cornerRadius = 15;
	CGRect imageFrame = CGRectMake(2, 7, 24, 24);
    
    self.customImageView = [[UIImageView alloc]initWithFrame:imageFrame];
    self.customImageView.image = [arr objectAtIndex:indexPath.row];
    [cell.contentView addSubview:self.customImageView];
    
   	
	
    
    UILabel * contentLable = [[UILabel alloc]initWithFrame:CGRectMake(30, 5, 250, size.height)];
    contentLable.text = [_quotes objectAtIndex:indexPath.row];
    contentLable.numberOfLines = 100;
    contentLable.font = [UIFont systemFontOfSize:14];
    contentLable.backgroundColor=[UIColor clearColor];
	CGSize maximumLabelSize = CGSizeMake(250, 5000);
	
	CGSize expectedLabelSize = [[_quotes objectAtIndex:indexPath.row] sizeWithFont:contentLable.font constrainedToSize:maximumLabelSize lineBreakMode:contentLable.lineBreakMode];
	contentLable.frame = CGRectMake(30, 5, 250, expectedLabelSize.height);
	
    cell.backgroundColor=[UIColor clearColor];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    [cell.contentView addSubview:contentLable];
    UIView *myView = [[UIView alloc] init];
    myView.backgroundColor=[UIColor whiteColor];
    myView.alpha=0.5;
	
    //	if(indexPath.row % 2)
    //	{
    //		myView.backgroundColor = [self colorWithHexString:@"ffffff"];
    //	}
    //	else
    //	{
    //		myView.backgroundColor = [self colorWithHexString:@"ffffff"];
    //	}
	//myView.alpha = 0.5;
	cell.backgroundView = myView;
	
	
    //	cell.backgroundView =  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"info_full_comm_sml_box.png"] ];
    
	//cell.imageView.image = [UIImage imageNamed:@"ma_faq_quest-btn.png"];
	//	cell.selectedBackgroundView =  [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:@"info_full_comm_sml_box.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0]];
    
	return cell;
}


#pragma mark - UITableViewDelegate methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	CGSize size = [[_quotes objectAtIndex:indexPath.row]
                   sizeWithFont:[UIFont systemFontOfSize:14]
                   constrainedToSize:CGSizeMake(300, CGFLOAT_MAX)];
	return size.height + 70;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)dismiss:(id)sender
{
	[self dismissModalViewControllerAnimated:YES];
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



- (void)viewDidUnload {
	[self setShowans:nil];
	[super viewDidUnload];
}

//- (IBAction)merchandise:(id)sender
//{
//    iphone4Merchandise *merchandise = [[iphone4Merchandise alloc]initWithNibName:@"iphone4Merchandise" bundle:nil];
//    [self.navigationController pushViewController:merchandise animated:YES];
//    
//    
//}
//- (IBAction)chat:(id)sender
//{
//    GroupViewController *group = [[GroupViewController alloc]initWithNibName:@"GroupViewController" bundle:nil];
//    [self.navigationController pushViewController:group animated:YES];
//    
//    
//}

- (IBAction)toRelApp:(id)sender {
    
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
