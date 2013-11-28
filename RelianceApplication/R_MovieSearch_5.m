//
//  R_MovieSearch_5.m
//  RelianceApplication
//
//  Created by Ashwini Pawar on 30/10/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import "R_MovieSearch_5.h"

@interface R_MovieSearch_5 ()

@end

@implementation R_MovieSearch_5
@synthesize movieNameArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    _dropdownTable.hidden=YES;
    
    
    
}
-(void)back {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [category_array count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[GalleryScroll subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [GalleryScroll removeFromSuperview];
    GalleryScroll=nil;
    
    [_dropdownTable scrollToRowAtIndexPath: // use the method
     [NSIndexPath indexPathForRow:1     // get 2nd row (nth row...)
                        inSection:0]    // in 1st section (...)
     // set position: you can use bottom, middle or top.
                          atScrollPosition:UITableViewScrollPositionBottom
                                  animated:YES]; // YES or NO.

    
    if (gettag==0) {
        _cat_textfield.text=[NSString stringWithFormat:@"%@",[category_array objectAtIndex:indexPath.row]];
        
    }
    
    else if (gettag==1) {
        _Decade_textfield.text=[NSString stringWithFormat:@"%@",[category_array objectAtIndex:indexPath.row]];
        
    }
    else if (gettag==2) {
        _alphabetical_textfield.text=[NSString stringWithFormat:@"%@",[category_array objectAtIndex:indexPath.row]];
        
    }
    
    [self getdata];
    GalleryScroll			= [[UIScrollView alloc] initWithFrame:CGRectMake(0, 122, 320,504-122)];
	GalleryScroll.userInteractionEnabled	=YES;
    GalleryScroll.showsHorizontalScrollIndicator = YES;
    GalleryScroll.pagingEnabled = YES;
	[self.view addSubview:GalleryScroll];
      
	int nX = 0;
	int nY = 0;
    int j=0;
    
	for (int i =0; i<TotalData; i++)
    {
        if ([_alphabetical_textfield.text isEqualToString:@"ALL"]) {
            
            NSLog(@"A-ZA-Z");
            data9[i]=@"ALL";
        }
        
        
        if ( [_alphabetical_textfield.text isEqualToString:@"A-Z"]) {
            data9[i]=@"A-Z";
        }
        if ([_cat_textfield.text isEqualToString:@"Genre"]) {
            data8[i]=@"Genre";
        }
        
        if ([_cat_textfield.text isEqualToString:@"ALL"]) {
            data8[i]=@"ALL";
            
        }
        if ([_Decade_textfield.text isEqualToString:@"YEAR"]) {
            data7[i]=@"YEAR";
        }
        
        if ([_Decade_textfield.text isEqualToString:@"ALL"]) {
            data7[i]=@"ALL";
            
        }
        
        if ([data8[i] isEqualToString:_cat_textfield.text] && [data9[i] isEqualToString:_alphabetical_textfield.text] && [data7[i] isEqualToString:_Decade_textfield.text]) {
            
            
            nX=110*(j%3);
            nY=170 * (j/3);
            
            
            if (frame[j] == nil)
            {
                frame[j] = [[AsyncImageView alloc] initWithFrame:CGRectMake(nX, nY, 100, 120)];
                
                frame[j].contentMode = UIViewContentModeScaleToFill;
            }
            
            frame[j].backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];
            
            frame[j].contentMode = UIViewContentModeScaleToFill;
            frame[j].userInteractionEnabled=YES;
            
            [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:frame[j]];
            
            frame[j].tag=i;
            NSURL *url1 = [NSURL URLWithString:data5[i]];
            NSLog(@"nsurl = %@",url1);
            ((AsyncImageView *)frame[j]).imageURL =url1;
            [GalleryScroll addSubview:frame[j]];
            
            
            UITapGestureRecognizer *webViewTapped = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openMovieDetails:)];
            webViewTapped.numberOfTapsRequired = 1;
            webViewTapped.delegate = self;
            [frame[j] addGestureRecognizer:webViewTapped];
            
            
            MovieLabel[j] = [[UILabel alloc] initWithFrame:CGRectMake(nX, 120+nY, 100, 40)];
            MovieLabel[j].backgroundColor =[UIColor clearColor];
            MovieLabel[j].textColor= [UIColor blackColor];
            MovieLabel[j].text=data2[i];
            MovieLabel[j].numberOfLines = 2;
            MovieLabel[j].lineBreakMode = NSLineBreakByWordWrapping;
            MovieLabel[j].font = [UIFont boldSystemFontOfSize:14.0f];
            [GalleryScroll addSubview:MovieLabel[j]];
            
            
            
            grayImage[j] = [[UIImageView alloc]initWithFrame:CGRectMake(8, 155+nY, 297, 16)];
            grayImage[j].image = [UIImage imageNamed:@"divder.png"];
            [GalleryScroll addSubview:grayImage[j]];
            
            
            j++;
        }//if
        
        
    }//for
    if(j<=0)
    {
        UIAlertView *noMovieAlert = [[UIAlertView alloc]initWithTitle:nil message:@"Oops! No movies matching your search" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        noMovieAlert.tag = 4;
        [noMovieAlert show];
    }
    
    
    _dropdownTable.hidden=YES;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Transaction";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        // cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    
    cell.backgroundColor  =[self colorWithHexString:@"13202d"];
    
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    cell.textLabel.text=[category_array objectAtIndex:indexPath.row];
    //    cell.layer.cornerRadius = 15;
    
    return cell;
}


-(void)getdata
{
    
    
    GlobalClass *obj=[GlobalClass getInstance];
    NSLog(@"moviedata=%@",obj.moviedata);
    
    
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
        
        
        data8[i]= [actoAgent objectForKey:@"movie_cat_name"];
        
        
        
        if (![movieNameArray containsObject:data8[i]])
        {
            
            [movieNameArray addObject:data8[i]];
        }
        
        
        i++;
        
        
    }
	TotalData=i;
    
}


-(void)openMovieDetails:(UITapGestureRecognizer *)sender
{
    UITapGestureRecognizer *gesture = (UITapGestureRecognizer *) sender;
    NSLog(@"openMovieDetailsforID=%@",data1[gesture.view.tag]);
    R_OpenMovie_5 *pg = [[R_OpenMovie_5 alloc]initWithNibName:@"R_OpenMovie_5" bundle:nil];
    pg.getiID= data1[gesture.view.tag];
    [self.navigationController pushViewController:pg animated:YES];
    
    
}
-(void)displaymovies
{
    GalleryScroll			= [[UIScrollView alloc] initWithFrame:CGRectMake(0, 122, 320,504-122)];
	GalleryScroll.userInteractionEnabled	=YES;
    GalleryScroll.showsHorizontalScrollIndicator = YES;
    GalleryScroll.pagingEnabled = NO;
	[self.view addSubview:GalleryScroll];

	int nX = 0;
	int nY = 0;
    
	for (int i =0; i<TotalData; i++)
    {
        
        
		nX=110*(i%3);
		nY=170 * (i/3);
         
        if (frame[i] == nil)
        {
            frame[i] = [[AsyncImageView alloc] initWithFrame:CGRectMake(nX, nY, 100, 120)];
            
            frame[i].contentMode = UIViewContentModeScaleToFill;
        }
        
        frame[i].backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];
        
        frame[i].contentMode = UIViewContentModeScaleToFill;
        frame[i].userInteractionEnabled=YES;
        
        [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:frame[i]];
        
        frame[i].tag=i;
        NSURL *url1 = [NSURL URLWithString:data5[i]];
        NSLog(@"nsurl = %@",url1);
        ((AsyncImageView *)frame[i]).imageURL =url1;
        [GalleryScroll addSubview:frame[i]];
        
        UITapGestureRecognizer *webViewTapped = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openMovieDetails:)];
        webViewTapped.numberOfTapsRequired = 1;
        webViewTapped.delegate = self;
        [frame[i] addGestureRecognizer:webViewTapped];
        
        MovieLabel[i] = [[UILabel alloc] initWithFrame:CGRectMake(nX, 120+nY, 100, 40)];
        MovieLabel[i].backgroundColor =[UIColor clearColor];
        MovieLabel[i].textColor= [UIColor blackColor];
        MovieLabel[i].text=data2[i];
        MovieLabel[i].numberOfLines = 2;
        MovieLabel[i].lineBreakMode = NSLineBreakByWordWrapping;
        MovieLabel[i].font = [UIFont boldSystemFontOfSize:14.0f];
        [GalleryScroll addSubview:MovieLabel[i]];
        
        
        
        grayImage[i] = [[UIImageView alloc]initWithFrame:CGRectMake(8, 155+nY, 297, 16)];
        grayImage[i].image = [UIImage imageNamed:@"divder.png"];
        [GalleryScroll addSubview:grayImage[i]];
        
        
    }
    GalleryScroll.contentSize = CGSizeMake(300,((200*TotalData/3))+70);

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

- (void)viewDidLoad
{
    
    //    category_array = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
    
    [super viewDidLoad];
    //    _dropdownTable.backgroundColor  =[self colorWithHexString:@"13202d"];
    _dropdownTable.backgroundColor  =[UIColor clearColor];
    
    [_dropdownTable setSeparatorColor:[self colorWithHexString:@"1f3a55"]];
    
    _dropdownTable.backgroundColor  =[self colorWithHexString:@"13202d"];

    
    //    _dropdownTable.layer.cornerRadius = 10;
    
    
    _dropdownTable.hidden=YES;
    // _dropdownTable.alpha = 0.8;
    //    category_array = [[NSMutableArray alloc] initWithCapacity:100];
    //    [category_array addObject:@"ALL"];
    //    [category_array addObject:@"Now-Playing"];
    //    [category_array addObject:@"Coming-Soon"];
    
    movieNameArray = [[NSMutableArray alloc] initWithCapacity:100];
    category_array = [[NSMutableArray alloc] initWithCapacity:100];
    [category_array addObjectsFromArray:movieNameArray];
    [category_array insertObject:@"ALL" atIndex:0];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"rel_i4home_bg.jpg"]];
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
    
    /*
     Decade_array = [[NSMutableArray alloc] initWithCapacity:100];
     
     
     [Decade_array addObject:@"2013"];
     [Decade_array addObject:@"2012"];
     [Decade_array addObject:@"2011"];
     [Decade_array addObject:@"2010"];
     [Decade_array addObject:@"2009"];
     [Decade_array addObject:@"2008"];
     [Decade_array addObject:@"2007"];
     [Decade_array addObject:@"2006"];
     [Decade_array addObject:@"2005"];
     [Decade_array addObject:@"2004"];
     [Decade_array addObject:@"2003"];
     [Decade_array addObject:@"2002"];
     [Decade_array addObject:@"2001"];
     [Decade_array addObject:@"2000"];
     [Decade_array addObject:@"1990"];
     
     
     
     
     
     
     
     
     alphabetical_array = [[NSMutableArray alloc] initWithCapacity:100];
     [alphabetical_array addObject:@"all"];
     [alphabetical_array addObject:@"a"];
     [alphabetical_array addObject:@"b"];
     */
    
    
    
    //    [_dropdownTable reloadData];
    [self getdata];
    
    [self displaymovies];
    // Do any additional setup after loading the view from its nib.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [self.view addSubview:_dropdownTable];
   
    if(textField.tag == 0)
    {
        [self.view endEditing:YES]; // added this in for case when keyboard was already on screen
        
        gettag=0;
        
        category_array = [[NSMutableArray alloc] initWithCapacity:100];
        [category_array removeAllObjects];
        [category_array addObjectsFromArray:movieNameArray];
        [category_array insertObject:@"Genre" atIndex:0];
        [category_array insertObject:@"ALL" atIndex:1];
        
        
        //        [category_array addObject:@"ALL"];
        //
        //        [category_array addObject:@"Now-Playing"];
        //        [category_array addObject:@"Coming-Soon"];
        [_dropdownTable reloadData];
        if (_dropdownTable.hidden) {
            _dropdownTable.hidden = NO;
            
        }
        else
            _dropdownTable.hidden = YES;
        
        [_cat_textfield resignFirstResponder];
        [_Decade_textfield resignFirstResponder];
        [_alphabetical_textfield resignFirstResponder];
        
        return NO;
        
        
    }
    
    else if(textField.tag == 1)
    {
        [self.view endEditing:YES]; // added this in for case when keyboard was already on screen
        gettag=1;
        [category_array removeAllObjects];
        [category_array addObject:@"YEAR"];
        [category_array addObject:@"ALL"];
        
        [category_array addObject:@"2013"];
        [category_array addObject:@"2012"];
        [category_array addObject:@"2011"];
        [category_array addObject:@"2010"];
        [category_array addObject:@"2009"];
        [category_array addObject:@"2008"];
        //        [category_array addObject:@"2007"];
        //        [category_array addObject:@"2006"];
        //        [category_array addObject:@"2005"];
        //        [category_array addObject:@"2004"];
        //        [category_array addObject:@"2003"];
        //        [category_array addObject:@"2010"];
        //        [category_array addObject:@"2000"];
        //        [category_array addObject:@"1990"];
        //        [category_array addObject:@"1980"];
        //        [category_array addObject:@"1970"];
        //        [category_array addObject:@"1960"];
        //        [category_array addObject:@"1950"];
        //        [category_array addObject:@"1940"];
        //
        
        
        
        
        
        [_dropdownTable reloadData];
        if (_dropdownTable.hidden) {
            _dropdownTable.hidden = NO;
            
        }
        else
            _dropdownTable.hidden = YES;
        [_cat_textfield resignFirstResponder];
        [_Decade_textfield resignFirstResponder];
        [_alphabetical_textfield resignFirstResponder];
        
        return NO;
        
        
    }
    
    else  if(textField.tag == 2)
    {
        [self.view endEditing:YES]; // added this in for case when keyboard was already on screen
        [category_array removeAllObjects];
        gettag=2;
        [category_array addObject:@"A-Z"];
        
        [category_array addObject:@"ALL"];
        [category_array addObject:@"0-9"];
        
        [category_array addObject:@"A"];
        [category_array addObject:@"B"];
        [category_array addObject:@"C"];
        [category_array addObject:@"D"];
        [category_array addObject:@"E"];
        [category_array addObject:@"F"];
        [category_array addObject:@"G"];
        [category_array addObject:@"H"];
        [category_array addObject:@"I"];
        [category_array addObject:@"J"];
        [category_array addObject:@"K"];
        [category_array addObject:@"L"];
        [category_array addObject:@"M"];
        [category_array addObject:@"N"];
        [category_array addObject:@"O"];
        [category_array addObject:@"P"];
        [category_array addObject:@"Q"];
        [category_array addObject:@"R"];
        [category_array addObject:@"S"];
        [category_array addObject:@"T"];
        [category_array addObject:@"U"];
        [category_array addObject:@"V"];
        [category_array addObject:@"W"];
        [category_array addObject:@"X"];
        [category_array addObject:@"Y"];
        [category_array addObject:@"Z"];
        
        [_dropdownTable reloadData];
        
        
        
        if (_dropdownTable.hidden) {
            _dropdownTable.hidden = NO;
            
        }
        else
            _dropdownTable.hidden = YES;
        [_cat_textfield resignFirstResponder];
        [_Decade_textfield resignFirstResponder];
        [_alphabetical_textfield resignFirstResponder];
        
        return NO;
        
        
    }
    else
    {
        _dropdownTable.hidden = YES;
        return YES;
    }
    
    
    [_dropdownTable scrollToRowAtIndexPath: // use the method
     [NSIndexPath indexPathForRow:1     // get 2nd row (nth row...)
                        inSection:0]    // in 1st section (...)
     // set position: you can use bottom, middle or top.
                          atScrollPosition:UITableViewScrollPositionBottom
                                  animated:YES]; // YES or NO.

}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    _dropdownTable.hidden=YES;
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    _dropdownTable.hidden=YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
