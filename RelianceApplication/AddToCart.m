//
//  AddToCart.m
//  RelianceApplication
//
//  Created by Akshay Jain on 9/4/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import "AddToCart.h"

@interface AddToCart ()

@end

@implementation AddToCart
@synthesize VideoScroller;
@synthesize heightPicker,heightArray;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:NO];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    [_timer invalidate];
    _timer =nil;
}
- (void)viewDidLoad
{
    [super viewDidLoad];

    m_total = [[NSMutableArray alloc] init];
    
    GlobalClass *obj = [GlobalClass getInstance];
    if([obj.Leftcheck isEqualToString:@"1"])
    {
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"home_bg.jpg"]];
        
    }
    else
    {
        
        NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"app_bg_image"];
        UIImage* app_bg_image = [UIImage imageWithData:imageData];
        self.view.backgroundColor = [UIColor colorWithPatternImage:app_bg_image];
    }
    
   _BCKIMAGE.backgroundColor=  [self colorWithHexString:@"560048"];
    _BCKIMAGE.alpha=0.6;
    
    
    _Pricebg.backgroundColor=  [self colorWithHexString:@"560048"];
    _Pricebg.alpha=0.6;
    
    // Do any additional setup after loading the view from its nib.
//    UIImage *relAppImage = [UIImage imageNamed:@"home_right_rel_icon.png"];
//    UIButton *buttonChat = [UIButton buttonWithType:UIButtonTypeCustom];
//    [buttonChat setImage:relAppImage forState:UIControlStateNormal];
//    buttonChat.frame = CGRectMake(0, 0, relAppImage.size.width, relAppImage.size.height);
//     [buttonChat addTarget:self action:@selector(toRelApp:) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *customBarItem1 = [[UIBarButtonItem alloc] initWithCustomView:buttonChat];
//    self.navigationItem.RightBarButtonItem = customBarItem1;
    
    
    UIImage *buttonImage = [UIImage imageNamed:@"back-btn.png"];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:buttonImage forState:UIControlStateNormal];
        button.frame = CGRectMake(0, 0, buttonImage.size.width, buttonImage.size.height);
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        self.navigationItem.leftBarButtonItem = customBarItem;
    
    
    
    
    heightArray=[[NSMutableArray alloc]init];
    int j=0;
    for (int i=1; i<4; i++) {
        j=j+1;
        [heightArray addObject:[NSString stringWithFormat:@"%d",j]];
    }
    
    
    if ( heightPicker == nil ) {
        heightPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(10, 200, 300, 100)];
        // heightPicker.center = CGPointMake(320/2, 460/2);
        heightPicker.delegate = self;
        heightPicker.dataSource = self;
        heightPicker.showsSelectionIndicator = YES;
        [self.view addSubview:heightPicker];
        
    }
    heightPicker.alpha=0.0;


    
    [self getdata];
    
    
//    GlobalClass *obj=[GlobalClass getInstance];

    NSLog(@"QtyOfProducts1=%@",obj.QtyOfProducts);
    NSLog(@"Mid_added1=%@",obj.Mid_added);
    _buybutton.enabled=NO;

    activityIndicator = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
	activityIndicator.center=CGPointMake(320/2, 460/2);
	// activityIndicator.transform = CGAffineTransformMakeScale(2.0, 2.0);
	[activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
	[self.view addSubview:activityIndicator];
	[activityIndicator startAnimating];


}



-(void)getdata
{
	GlobalClass *obj=[GlobalClass getInstance];
	NSLog(@"ddata=%@",obj.Merchandise);
    NSLog(@"Mid_added=%d",obj.Mid_added.count);

	int i=0;
    
    for (i=0; i<[obj.Mid_added count]; i++ ) {
        
     
            
            

	for (NSDictionary *actoAgent in obj.Merchandise)
	{
        data1[0]= [actoAgent objectForKey:@"m_id"];
        NSLog(@"m_id=%@",data1[i]);
        
        
        if ([obj.Mid_added objectAtIndex:i] == data1[0]) {
              
   


             
        data2[i]= [actoAgent objectForKey:@"m_prod_id"];
        NSLog(@"m_prod_id=%@",data2[i]);
        
        
        data3[i]= [actoAgent objectForKey:@"m_price"];
        NSLog(@"m_price=%@",data3[i]);
        
        
        data4[i]= [actoAgent objectForKey:@"m_desc"];
        NSLog(@"m_desc=%@",data4[i]);
        
        data5[i]= [actoAgent objectForKey:@"m_price_bg_color"];
        NSLog(@"m_price_bg_color=%@",data5[i]);
        
        
        data6[i]= [actoAgent objectForKey:@"m_shipping_price"];
        NSLog(@"m_shipping_price=%@",data6[i]);
        
        
        
        data7[i]= [actoAgent objectForKey:@"m_img_front"];
        NSLog(@"m_img_front=%@",data7[i]);
        
        data8[i]= [actoAgent objectForKey:@"m_img_side"];
        NSLog(@"m_img_side=%@",data8[i]);
        
        
        data9[i]= [actoAgent objectForKey:@"m_title"];
        NSLog(@"m_title=%@",data9[i]);
        
        data10[i]= [actoAgent objectForKey:@"m_bg_color"];
        NSLog(@"m_bg_color=%@",data10[i]);

            }
    }

    }
    TotalData=i;

 
    
    NSLog(@"totda=%d",TotalData);
    
    
//    obj.QtyOfProducts= [[NSMutableArray alloc] initWithCapacity:1000];
    
    if(obj.QtyOfProducts.count>0)
    {
       
        NSLog(@"Have Value");
            [obj.QtyOfProducts addObject:@"1"];
            
               
    }
    
    else
    {
//        for (int i =0; i<TotalData; i++) {
        
//            if (![obj.QtyOfProducts objectAtIndex:i]) {
                [obj.QtyOfProducts addObject:@"1"];

//            }
//
//            else
//            {
//                
//            }
//        }

        NSLog(@"myarray is nil");
        
    }
    
    [self DisplayData];
    
  
	//}
	
}

-(void)DisplayData
{
    int m=0;
    GlobalClass *obj=[GlobalClass getInstance];

//    VideoScroller			= [[UIScrollView alloc] initWithFrame:CGRectMake(11,82,301,259)];
//	VideoScroller.userInteractionEnabled	=YES;
//	VideoScroller.showsHorizontalScrollIndicator = YES;
//	VideoScroller.pagingEnabled = NO;
//	[self.view addSubview:VideoScroller];

	for (int i =0; i<TotalData; i++) {
               
        if (Imageview[i]    == nil)
        {
            Imageview[i] = [[AsyncImageView alloc] initWithFrame:CGRectMake(0, 0+m, 100.0f, 100.0f)];
            
            Imageview[i].contentMode = UIViewContentModeScaleAspectFit;
        }
        
        
        
        Imageview[i].contentMode = UIViewContentModeScaleAspectFit;
        Imageview[i].userInteractionEnabled=YES;
        Imageview[i].tag=i;
        //cancel any previously loading images for this view
        [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:Imageview[i]];
        
        //set image URL. AsyncImageView class will then dynamically load the image
        NSURL *url1 = [NSURL URLWithString:data7[i]];
        
        ((AsyncImageView *)Imageview[i]).imageURL =url1;
        // _view1 = view;
        
        [VideoScroller addSubview:Imageview[i]];
        
        
        
             NSLog(@"qty=%@",obj.QtyOfProducts);
        Qtybtn[i]					= [UIButton buttonWithType:UIButtonTypeCustom];
        Qtybtn[i].frame				= CGRectMake(132,m+20,54,31);
        [Qtybtn[i] setBackgroundImage:[UIImage imageNamed:@"drop_ic.png"] forState:UIControlStateNormal];
      //  [ Qtybtn[i] setTitle:@"1" forState:UIControlStateNormal];
        [Qtybtn[i] setTitle:[obj.QtyOfProducts objectAtIndex:i] forState:UIControlStateNormal];

        [Qtybtn[i] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        Qtybtn[i].titleLabel.font = [UIFont systemFontOfSize:10];
        [Qtybtn[i] addTarget:self action:@selector(qtybtnclicked:) forControlEvents:UIControlEventTouchUpInside];
        //   [Qtybtn[i] setBackgroundImage:shre1 forState:UIControlStateHighlighted];
        Qtybtn[i].userInteractionEnabled = YES;
        [VideoScroller addSubview:Qtybtn[i]];
        Qtybtn[i].tag = i;
      
        
        
        Removebtn[i]					= [UIButton buttonWithType:UIButtonTypeCustom];
        Removebtn[i].frame				= CGRectMake(132-10,m+20+36,69,23);
        [Removebtn[i] setBackgroundImage:[UIImage imageNamed:@"cart_remove_btn.png"] forState:UIControlStateNormal];
        //  [ Qtybtn[i] setTitle:@"1" forState:UIControlStateNormal];
      //  [ Removebtn[i] setTitle:[obj.QtyOfProducts objectAtIndex:i] forState:UIControlStateNormal];
        
        [Removebtn[i] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        Removebtn[i].titleLabel.font = [UIFont systemFontOfSize:10];
        [Removebtn[i] addTarget:self action:@selector(removeProduct:) forControlEvents:UIControlEventTouchUpInside];
        //   [Qtybtn[i] setBackgroundImage:shre1 forState:UIControlStateHighlighted];
        Removebtn[i].userInteractionEnabled = YES;
        [VideoScroller addSubview:Removebtn[i]];
        Removebtn[i].tag = i;

        

      float  Price1 = [data3[i] floatValue];
        float prc= [[obj.QtyOfProducts objectAtIndex:i] floatValue];
        float totalprice = Price1*prc;

        Price[i] = [[UILabel alloc] initWithFrame:CGRectMake(206, m+25, 105, 28)];
		Price[i].backgroundColor =[UIColor clearColor];
		Price[i].textColor= [UIColor whiteColor];
        Price[i].textAlignment = NSTextAlignmentCenter;
        Price[i].text=[NSString stringWithFormat:@"%.2f",totalprice];
        Price[i].font = [UIFont fontWithName:@"Helvetica Neue" size: 18.0];
        Price[i].font = [UIFont boldSystemFontOfSize:18.0f];
        
		[VideoScroller addSubview:Price[i]];

        
        
        ImagePatch2[i]                    = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100+m, 320,2)];
		ImagePatch2[i].userInteractionEnabled=YES;
        ImagePatch2[i].image =[UIImage imageNamed:@"divder.jpg"];
		[VideoScroller addSubview:ImagePatch2[i]];
		ImagePatch2[i].tag= i;

        
        m+=110;
        
    }
    
    _subtotal.text=data3[0];
    _ORDERTOTAL.text=data3[0];
    _ShippingCharges.text=data6[0];


    VideoScroller.contentSize = CGSizeMake(301,110*TotalData);
    
    [self performSelector:@selector(timercalled) withObject:nil afterDelay:0.1];
   

}

-(void)timercalled
{
    if (_timer == nil)
    {
        //
        _timer =  [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(calculatetotalamount) userInfo:nil repeats:YES];
        //
        //
        //
        //   [self performSelector:@selector(getstate) withObject:nil afterDelay:0.0];
    }

}

-(void)calculatetotalamount
{
    _buybutton.enabled=YES;
    [activityIndicator stopAnimating];
    NSLog(@"timmer called");
    float Price1;
    float total;
    float shipping;
    float totalshipping;
    float qty;
    
    GlobalClass *obj=[GlobalClass getInstance];
    
    _labelsubtotal.text  =[NSString stringWithFormat:@"SUBTOTAL (Item %d):",[obj.Mid_added count]];
    
    for (int i =0; i<TotalData; i++) {
         Price1 = [Price[i].text floatValue];
        shipping = [data6[i] floatValue];
        qty = [[obj.QtyOfProducts objectAtIndex:i] floatValue];

        

        totalshipping =(shipping*qty)+totalshipping;
        
        total =(Price1*1)+total;
        

        
    }
    _subtotal.text=[NSString stringWithFormat:@"%.2f",total];
    _ORDERTOTAL.text=[NSString stringWithFormat:@"%.2f",total+totalshipping];
    _ShippingCharges.text=[NSString stringWithFormat:@"%.2f",totalshipping];
    NSLog(@"oordertotalbecomes=%@",_ORDERTOTAL.text);



    
}

-(void)removeProduct:(UIButton*)sender
{
    heightPicker.alpha=0.0;
    GlobalClass *obj=[GlobalClass getInstance];
    [obj.Mid_added removeObjectAtIndex:[sender tag]];
    [obj.QtyOfProducts removeObjectAtIndex:[sender tag]];
    
    [[VideoScroller subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];

//    [VideoScroller removeFromSuperview];
//    VideoScroller=nil;
    
    [self getdata];

}
-(void)qtybtnclicked:(UIButton*)sender
{
    [self.view addSubview:heightPicker];
    tagreceived = [sender tag];
    
//    if(![_popover isPopoverVisible])
//        
//    {
//        
//        UIViewController *viewController = [[UIViewController alloc]init];
//        UIView *vtemp = [[UIView alloc]initWithFrame:CGRectMake(80,20, 230, 160)];
//        vtemp.backgroundColor = [UIColor whiteColor];
//        
//        [vtemp addSubview:self.heightPicker];
//        
//        viewController.view = vtemp;
//        
//        viewController.contentSizeForViewInPopover = CGSizeMake(230, 160);
//        _popover = [[UIPopoverController alloc]initWithContentViewController:viewController];
//        _popover.popoverContentSize = CGSizeMake(150,170);
//        
//        [_popover presentPopoverFromRect:Qtybtn[sender.tag].bounds inView:Qtybtn[sender.tag] permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
//        
//    }

    
    if (heightPicker.alpha==0.0) {
        heightPicker.alpha=1.0;
    }
    else
    {
        heightPicker.alpha=0.0;

    }
}

- (UIPickerView *)heightPicker {
    if ( heightPicker == nil ) {
        heightPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(-10, -10, 300, 216)];
        heightPicker.delegate = self;
        heightPicker.dataSource = self;
        heightPicker.showsSelectionIndicator = YES;
        [self.view addSubview:heightPicker];

    }
    
    return heightPicker;
}



- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component

{
    
  
    
    if(pickerView == heightPicker)
        
    {
        //[Qtybtn[tagreceived] setTitle:[heightArray objectAtIndex:row] forState:UIControlStateNormal];

        return [heightArray objectAtIndex:row];
        
        
        
    }
    
    return nil;
    
}





- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
       
    if(pickerView == heightPicker)
        
    {
        
        return 1;
        
    }
    
    
    return 0;
    
}





-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component

{
    

    
    
    
    if(pickerView == heightPicker)
        
    {
        
        return 280;
        
    }
    
    return 0;
    
}





- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
      
    if(pickerView == heightPicker)
        
    {
        
        return [heightArray count];
        
    }
    
    return 0;
    
}



- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component

{
    
    
    GlobalClass *obj=[GlobalClass getInstance];
     
    if(thePickerView == heightPicker)
        
    {
        float Price1 = [data3[tagreceived] floatValue];
        
        float multipyer = [[heightArray objectAtIndex:row] floatValue];

        Price1 =Price1*multipyer;
        
        Price[tagreceived].text=[NSString stringWithFormat:@"%.2f",Price1];


        [Qtybtn[tagreceived] setTitle:[heightArray objectAtIndex:row] forState:UIControlStateNormal];
        [obj.QtyOfProducts replaceObjectAtIndex:tagreceived withObject:[heightArray objectAtIndex:row]];
        
        NSLog(@"qty=%@",obj.QtyOfProducts);
        
        
        //float Price1;
        float total;
        float shipping;
        float totalshipping;
        float qty;
        
        GlobalClass *obj=[GlobalClass getInstance];
        
        for (int i =0; i<TotalData; i++) {
            Price1 = [Price[i].text floatValue];
            shipping = [data6[i] floatValue];
            qty = [[obj.QtyOfProducts objectAtIndex:i] floatValue];
            
            
            
            totalshipping =(shipping*qty)+totalshipping;
            
            total =(Price1*1)+total;
            
            
            
        }
        
        _subtotal.text=[NSString stringWithFormat:@"%.2f",total];
        _ORDERTOTAL.text=[NSString stringWithFormat:@"%.2f",total+totalshipping];
        _ShippingCharges.text=[NSString stringWithFormat:@"%.2f",totalshipping];



    }
    
    
    heightPicker.alpha=0.0;
}


-(IBAction)back {
    [_timer invalidate];
    _timer=nil;

    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)openPaymentGetway
{
//    NSLog(@"tag=%d",gesture.view.tag);
//    GlobalClass *obj= [GlobalClass getInstance];
//    [obj.Mid_added addObject:data1[gesture.view.tag]];
//    NSLog(@"Mid_addedtag=%@",obj.Mid_added);
    
    GlobalClass *obj=[GlobalClass getInstance];
    if(obj.Mid_added.count>0)
    {
        [_timer invalidate];
        _timer=nil;
        [_timer invalidate];
        _timer=nil;


        for (int i =0; i<TotalData; i++) {

            [m_total addObject:Price[i].text];
        }
        
//
//        NSString *strr= [NSString stringWithFormat:@"%@",obj.Mid_added];
//        
//        strr = [strr stringByReplacingOccurrencesOfString:@"("
//                                              withString:@""];
//        
//        strr = [strr stringByReplacingOccurrencesOfString:@")"
//                                               withString:@""];
//        
//       
//
//        NSLog(@"Have Value1=%@",strr);
        float Price1 = [_ORDERTOTAL.text floatValue];
        AAViewController *pg = [[AAViewController alloc]initWithNibName:@"AAViewController" bundle:nil];
        pg.getamount= [NSString stringWithFormat:@"%.2f",Price1];
        pg.m_total=m_total;
        pg.order_total=_ORDERTOTAL.text;
        [self.navigationController pushViewController:pg animated:YES];

        
        
    }
    
    else
    {
        
        UIAlertView* logoutalertbox = [[ UIAlertView alloc]initWithTitle:@"Please Check" message:@"No Product Added to Cart, Please add the products to proceed" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil ];
        logoutalertbox.delegate=self;
        [logoutalertbox show];


    }
    
      
    
    
}

-(IBAction)toRelApp:(UIButton *)sender
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Under construction" message:@"Check Back Soon" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
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

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    heightPicker.alpha=0.0;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
