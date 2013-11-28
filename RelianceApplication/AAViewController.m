//
//  AAViewController.m
//  Citrus
//
//  Created by Ankur Arya on 13/07/13.
//  Copyright (c) 2013 Arya Corp. All rights reserved.
//

#import "AAViewController.h"

@interface AAViewController ()

@end

@implementation AAViewController
@synthesize getamount,bgView,bgImageView,m_total,order_total;
@synthesize dropDownTbl,stateNameArray;
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.amount.text=getamount;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
	// Do any additional setup after loading the view, typically from a nib.
    _detailsDict = [[NSMutableDictionary alloc]init];
    long long int low = 100000000000000000;
    long long int high = 999999999999999999;
    txnId = arc4random() % (high-low+1) + low;
    
    NSLog(@"Txn Id = %lli",txnId);
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
    
	bgImageView.backgroundColor = [self colorWithHexString:@"560048"];
    bgImageView.alpha = 0.4;
    _Scroller.contentSize = CGSizeMake(320, 1150);
   // _Scroller.frame= CGRectMake(_Scroller.frame.origin.x, 39, _Scroller.frame.size.width, _Scroller.frame.size.height);

    
//    UIImage *relAppImage = [UIImage imageNamed:@"home_right_rel_icon.png"];
//    UIButton *buttonChat = [UIButton buttonWithType:UIButtonTypeCustom];
//    [buttonChat setImage:relAppImage forState:UIControlStateNormal];
//    buttonChat.frame = CGRectMake(0, 0, relAppImage.size.width, relAppImage.size.height);
//     [buttonChat addTarget:self action:@selector(toRelApp:) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *customBarItem1 = [[UIBarButtonItem alloc] initWithCustomView:buttonChat];
//    self.navigationItem.RightBarButtonItem = customBarItem1;
    
    stateNameArray=[[NSMutableArray alloc]init];
    [stateNameArray addObject:@"Andra Pradesh"];
    
    [stateNameArray addObject:@"Arunachal Pradesh"];

    [stateNameArray addObject:@"Assam"];

    [stateNameArray addObject:@"Bihar"];

    [stateNameArray addObject:@"Chhattisgarh"];

    [stateNameArray addObject:@"Goa"];

    [stateNameArray addObject:@"Gujarat"];

    [stateNameArray addObject:@"Haryana"];

    [stateNameArray addObject:@"Himachal Pradesh"];

    [stateNameArray addObject:@"Jammu and Kashmir"];

    [stateNameArray addObject:@"Jharkhand"];

    [stateNameArray addObject:@"Karnataka"];

    [stateNameArray addObject:@"Kerala"];

    [stateNameArray addObject:@"Madya Pradesh"];

    [stateNameArray addObject:@"Maharashtra"];

    [stateNameArray addObject:@"Manipur"];

    [stateNameArray addObject:@"Meghalaya"];

    [stateNameArray addObject:@"Mizoram"];

    [stateNameArray addObject:@"Nagaland"];

    [stateNameArray addObject:@"Orissa"];

    [stateNameArray addObject:@"Punjab"];

    [stateNameArray addObject:@"Rajasthan"];

    [stateNameArray addObject:@"Sikkim"];

    [stateNameArray addObject:@"Tamil Nadu"];

    [stateNameArray addObject:@"Tripura"];

    [stateNameArray addObject:@"Uttaranchal"];

    [stateNameArray addObject:@"Uttar Pradesh"];

    [stateNameArray addObject:@"West Bengal"];


    dropDownTbl.hidden=YES;
    

        UIImage *buttonImage = [UIImage imageNamed:@"back-btn.png"];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:buttonImage forState:UIControlStateNormal];
        button.frame = CGRectMake(0, 0, buttonImage.size.width, buttonImage.size.height);
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        self.navigationItem.leftBarButtonItem = customBarItem;
        
//   _shippinglabel.alpha=0.0;
    

//    dropDownTbl = [[UITableView alloc] initWithFrame:CGRectMake(101, 45, 100, 416)];
//    dropDownTbl.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
//    dropDownTbl.delegate = self;
//    dropDownTbl.dataSource = self;
//    
//    [self.view addSubview:secondTableView];
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [stateNameArray count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _state.text=[NSString stringWithFormat:@"%@",[stateNameArray objectAtIndex:indexPath.row]];
    dropDownTbl.hidden=YES;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Transaction";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        // cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
        cell=[[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier]autorelease];
        
    }
  
    cell.textLabel.text=[stateNameArray objectAtIndex:indexPath.row];
    return cell;
}

//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
//
//{
//    
//    NSLog(@"scrollViewWillBeginDragging called");
//    
//    
//    dropDownTbl.hidden=YES;
//}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:NO];
    GlobalClass *obj= [GlobalClass getInstance];

    if ([obj.TransStatus isEqualToString:@"1"]) {
        obj.TransStatus=@"0";
        [obj.Mid_added removeAllObjects];
        [obj.QtyOfProducts removeAllObjects];
        obj.Mid_added =nil;
        obj.QtyOfProducts =nil;
        
        
//        GlobalClass *obj=[GlobalClass getInstance];
//        obj.Mid_added= [[NSMutableArray alloc] initWithCapacity:1000];
//        obj.QtyOfProducts= [[NSMutableArray alloc] initWithCapacity:1000];

        [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:0] animated:YES];
        

        
    }
    [_firstName resignFirstResponder];
    
    _Scroller.frame= CGRectMake(_Scroller.frame.origin.x, 40, _Scroller.frame.size.width, _Scroller.frame.size.height);

    _Scroller.contentSize = CGSizeMake(320, 1150);
    //[_firstName becomeFirstResponder];


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


-(void)back {
    [self performSelector:@selector(keyboardWillHide:) withObject:nil afterDelay:0.0];
    //[self.TextFieldObj resignFirstResponder];
    [_zipcode resignFirstResponder];
    [_state resignFirstResponder];
    [self.navigationController popViewControllerAnimated:YES];
}


-(IBAction)toRelApp:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Under construction" message:@"Check Back Soon" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)validateEmailWithString:(NSString*)email
{
	NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
	NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
	if( [emailTest evaluateWithObject:email] == YES){
		stricterFilter = TRUE;
		NSLog(@"Match!");
	} else {
		stricterFilter = FALSE;
		NSLog(@"No match!");
		  
	}
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
  //  dropDownTbl.hidden = YES;
}
- (BOOL)validateZipcodeWithString:(NSString*)email
{
	NSString *emailRegex = @"^(\\d{5}(-\\d{4})?|[a-z]\\d[a-z][- ]*\\d[a-z]\\d)$";
	NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
	if( [emailTest evaluateWithObject:email] == YES){
		stricterFilter = TRUE;
		NSLog(@"Match!");
	} else {
		stricterFilter = FALSE;
		NSLog(@"No match!");
		
	}
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    dropDownTbl.hidden = YES;

    [self performSelector:@selector(keyboardWillHide:) withObject:nil afterDelay:0.0];
   // [self.TextFieldObj resignFirstResponder];
    
    
}



- (IBAction)next:(id)sender {
    
  //  if ([self.firstName.text length]>0 && [self.lastName.text length]>0 && [self.email.text length]>0 && [self.address.text length]>0 && [self.state.text length]>0 && [self.country.text length]>0 && [self.zipcode.text length]>0 && [self.city.text length]>0 && [self.contactno.text length]>0) {
    [self performSelector:@selector(keyboardWillHide:) withObject:nil afterDelay:0.0];
    //[self.TextFieldObj resignFirstResponder];
    [_zipcode resignFirstResponder];

    
        if ([self.firstName.text length]>0){
            [_firstName.layer setBorderColor:[UIColor clearColor].CGColor];

              if ([self.lastName.text length]>0){
                  
                  [_lastName.layer setBorderColor:[UIColor clearColor].CGColor];

        
        [self validateEmailWithString:self.email.text ];
        if (stricterFilter) {

            [_email.layer setBorderColor:[UIColor clearColor].CGColor];

            
             NSString    *str = [NSString stringWithFormat:@"%@",_contactno.text];
            
            str = [_contactno.text stringByReplacingOccurrencesOfString:@"+91"
                                                  withString:@""];

           
            if ([str length]>=10) {
                [_contactno.layer setBorderColor:[UIColor clearColor].CGColor];
//                NSString    *str = [NSString stringWithFormat:@"+91 %@",_contactno.text];
//                _contactno.text =str;
              //  [self validateZipcodeWithString:self.zipcode.text ];
             //   if (stricterFilter) {
                
                if ([self.address.text length]>0 || [self.state.text length]>0) {
                    [_address.layer setBorderColor:[UIColor clearColor].CGColor];
                    [_Street2.layer setBorderColor:[UIColor clearColor].CGColor];

                    if ([self.city.text length]>0) {

                        [_city.layer setBorderColor:[UIColor clearColor].CGColor];
                        
                        if ([self.state.text length]>0) {
                            
                            [_state.layer setBorderColor:[UIColor clearColor].CGColor];

                        
                        
                        if ([self.country.text length]>0) {
                            
                            [_country.layer setBorderColor:[UIColor clearColor].CGColor];
                            


                
                if ([self.zipcode.text length]==6) {

                    [_zipcode.layer setBorderColor:[UIColor clearColor].CGColor];


              
    NSString    *sendaddress=[NSString stringWithFormat:@"%@, %@",self.address.text,self.Street2.text];
    
    [self.detailsDict setObject:self.firstName.text forKey:@"fname"];
    [self.detailsDict setObject:self.lastName.text forKey:@"lname"];
    [self.detailsDict setObject:self.email.text forKey:@"email"];
    [self.detailsDict setObject:self.amount.text forKey:@"amt"];
    [self.detailsDict setObject:[NSString stringWithFormat:@"29%lli",txnId] forKey:@"tid"];
    [self.detailsDict setObject:self.hmacUrl.text forKey:@"hmacUrl"];
    [self.detailsDict setObject:self.returnUrl.text forKey:@"returnUrl"];
    
    [self.detailsDict setObject:sendaddress forKey:@"address"];
   // [self.detailsDict setObject:self.Street2.text forKey:@"address2"];

    [self.detailsDict setObject:self.state.text forKey:@"state"];
    [self.detailsDict setObject:self.country.text forKey:@"country"];
    [self.detailsDict setObject:self.zipcode.text forKey:@"zipcode"];
    [self.detailsDict setObject:self.quantity.text forKey:@"quantity"];
    [self.detailsDict setObject:self.city.text forKey:@"city"];
    [self.detailsDict setObject:self.contactno.text forKey:@"contactno"];




    
            
            
    

    [self fetchAllData];
                    
                    
                    
                }
                    
                else
                {
                    [_zipcode.layer setBorderColor:[UIColor redColor].CGColor];
                    [_zipcode.layer setBorderWidth:2];
                    [_zipcode.layer setCornerRadius:10];
                    
                    [_zipcode becomeFirstResponder];
                    
                    
                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Please Check" message:@"Please Enter a 6 digit valid zipcode" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                    [alert show];
                    

                                     
                }
                        }
                        
                        else
                        {
                            
                            
                            [_country.layer setBorderColor:[UIColor redColor].CGColor];
                            [_country.layer setBorderWidth:2];
                            [_country.layer setCornerRadius:10];
                            
                            [_country becomeFirstResponder];
                            
                            
                            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Please Check" message:@"Please Enter Country" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                            [alert show];
                            
                            
                        }
                            
                            
                        }
                        
                        else
                        {
                            
                            
                            [_state.layer setBorderColor:[UIColor redColor].CGColor];
                            [_state.layer setBorderWidth:2];
                            [_state.layer setCornerRadius:10];
                            
                            [_state becomeFirstResponder];
                            
                            
                            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Please Check" message:@"Please Enter State" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                            [alert show];
                            
                            
                        }
                        

                        

                
                    }
                    
                    else
                    {
                        
                        
                        [_city.layer setBorderColor:[UIColor redColor].CGColor];
                        [_city.layer setBorderWidth:2];
                        [_city.layer setCornerRadius:10];
                        
                        [_city becomeFirstResponder];
                        
                        
                        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Please Check" message:@"Please Enter City" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                        [alert show];
                        
                        
                    }

                }
                
                else
                {
                    
                                     
                    [_address.layer setBorderColor:[UIColor redColor].CGColor];
                    [_address.layer setBorderWidth:2];
                    [_address.layer setCornerRadius:10];
                    
                    [_address becomeFirstResponder];
                    
                    
                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Please Check" message:@"Please Enter Address" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                    [alert show];

                    
                }

            }
            
            
            
            else
            {
                
                [_contactno.layer setBorderColor:[UIColor redColor].CGColor];
                [_contactno.layer setBorderWidth:2];
                [_contactno.layer setCornerRadius:10];
                [_contactno becomeFirstResponder];

                
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Please Check" message:@"Please Enter a valid 10 digit Contact Number" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                [alert show];

            }
    }
        else
        {
            
            [_email.layer setBorderColor:[UIColor redColor].CGColor];
            [_email.layer setBorderWidth:2];
            [_email.layer setCornerRadius:10];
            [_email becomeFirstResponder];


            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Please Check" message:@"Please Enter a Valid Email address" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
            
        }
        

    }
    
    
       
    
        else
        {
            
            [_lastName.layer setBorderColor:[UIColor redColor].CGColor];
            [_lastName.layer setBorderWidth:2];
            [_lastName.layer setCornerRadius:10];
            [_lastName becomeFirstResponder];
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Please Check" message:@"Please Enter Last Name " delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
        }

 }

    else
    {
        
        [_firstName.layer setBorderColor:[UIColor redColor].CGColor];
        [_firstName.layer setBorderWidth:2];
        [_firstName.layer setCornerRadius:10];
        [_firstName becomeFirstResponder];

        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Please Check" message:@"Please Enter First Name " delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
}

-(void)fetchAllData
{
    //	GlobalClass *obj1=[GlobalClass getInstance];
    
	NSString* post = [NSString stringWithFormat:@"merchantTxnId=%@&orderAmount=%@&returnUrl=%@",[self.detailsDict objectForKey:@"tid"],[self.detailsDict objectForKey:@"amt"],[self.detailsDict objectForKey:@"returnUrl"]];
    NSLog(@"post=%@",post);
	
	
    
    
	
	//	dispatch_async(dispatch_get_main_queue()	, ^{
	
	
	
	NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
	NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
	
	[request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://apps.medialabs24x7.com/besharam/secure/test/iosSSL.php"]]];
	[request setHTTPMethod:@"POST"];
	[request setValue:postLength forHTTPHeaderField:@"Content-Length"];
	[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Current-Type"];
	[request setHTTPBody:postData];
	
	NSURLResponse *response;
	NSData *urlData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
	NSString *stringResponse = [[NSString alloc] initWithData:urlData encoding:NSASCIIStringEncoding];
	NSLog(@"response1=%@",stringResponse);
	
	
	NSError* error;
	NSDictionary* responseDict = [NSJSONSerialization JSONObjectWithData:urlData //1
                                                                 options:kNilOptions
                                                                   error:&error];
	
	NSLog(@"respnse=%@",responseDict);
    
    
    /*
     NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:post] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:100.0];
     
     
     //  NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://110.175.19.95/SCMIpadDemoWebApp/CustomerList.aspx?username=02&BeginRowNo=0&LastRowNo=10"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:5.0];
     
     [request setHTTPMethod:@"GET"];
     //[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Current-Type"];
     
     NSError *errorReturned = nil;
     NSURLResponse *theResponse =[[NSURLResponse alloc]init];
     NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&theResponse error:&errorReturned];
     
     
     
     if (errorReturned) {
     NSLog(@"errorReturned=%@",errorReturned);
     
     
     //		UIAlertView* alertBox = [[ UIAlertView alloc]initWithTitle:@"Network Error" message:@"Network Not Connected" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Retry", nil ];
     //		//alertBox.tag=3;
     //		alertBox.delegate=self;
     //		[alertBox show];
     
     
     // Handle error.
     }
     else
     {
     
     
     NSLog(@"POSTING=%@",post);
     
     
     
     //		NSError *errorReturned = nil;
     //		NSURLResponse *theResponse =[[NSURLResponse alloc]init];
     //		NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&theResponse error:&errorReturned];
     
     
     NSError* error;
     NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data //1
     options:kNilOptions
     error:&error];
     
     */
    NSDictionary* merchandise = [responseDict objectForKey:@"payment"]; //2
    
    NSLog(@"payment=%@",merchandise);
    
    
    //		NSLog(@"json=%@",json);
    //
    //
    //		NSDictionary* Contests = json; //2
    
    
    int i=0;
    
    //		for (NSDictionary *actoAgent in merchandise)
    //        {
    //            //        data1[0]= [actoAgent objectForKey:@"response"];
    //            //        if ([data1[0] isEqualToString:@"FAIL"])
    //            //        {
    //            //            UIAlertView* alertBox = [[ UIAlertView alloc]initWithTitle:@"Alert" message:@"You have played all Contest" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil ];
    //            //            alertBox.tag=3;
    //            //            alertBox.delegate=self;
    //            //            [alertBox show];
    //            //
    //            //        }
    //            //
    //            //
    //            //        else{
    //
    
    data1[i]= [merchandise objectForKey:@"sec_signature"];
    NSLog(@"sec_signature=%@",data1[i]);
    
    data2[i]= [merchandise objectForKey:@"action"];
    NSLog(@"action=%@",data2[i]);
    
    
    //            data3[i]= [actoAgent objectForKey:@"return_url"];
    //            NSLog(@"return_url=%@",data3[i]);
    
    
    
    
    
    
    //
    //	}
	
	
    [self.detailsDict setObject:data1[0] forKey:@"hmac"];
    AAWebViewController *webView = [[AAWebViewController alloc]init];
    webView.detailsDict = self.detailsDict;
    webView.m_total =m_total;
    webView.order_total = order_total;
    [self presentViewController:webView animated:YES completion:nil];
    
	//shoeb9773147431
}


#pragma mark -
#pragma mark Responding to keyboard events
-(void)keyboardWillShow:(NSNotification *)notification {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
	{
		CGSize result = [[UIScreen mainScreen] bounds].size;
        NSLog(@"height-%f",result.height);
		if (result.height == 568)
        {
            _Scroller.contentSize = CGSizeMake(320, 1150);

            NSDictionary *userInfo = [notification userInfo];
            
            // Get the origin of the keyboard when it's displayed.
            NSValue* aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
            
            // Get the top of the keyboard as the y coordinate of its origin in self's view's coordinate system. The bottom of the text view's frame should align with the top of the keyboard's final position.
            CGRect keyboardRect = [aValue CGRectValue];
            NSLog(@"cgrect=%f",keyboardRect.size.height);
            _shippinglabel.alpha=0.0;
            // Get the duration of the animation.
            NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
            NSTimeInterval animationDuration;
            [animationDurationValue getValue:&animationDuration];
            
            // Animate the resize of the text view's frame in sync with the keyboard's appearance.
            _Scroller.frame= CGRectMake(_Scroller.frame.origin.x, -10, _Scroller.frame.size.width, _Scroller.frame.size.height);
            
            
        }
        
        
        else{
            /*
             Reduce the size of the text view so that it's not obscured by the keyboard.
             Animate the resize so that it's in sync with the appearance of the keyboard.
             */
            _Scroller.contentSize = CGSizeMake(320, 1150);

            NSDictionary *userInfo = [notification userInfo];
            
            // Get the origin of the keyboard when it's displayed.
            NSValue* aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
            
            // Get the top of the keyboard as the y coordinate of its origin in self's view's coordinate system. The bottom of the text view's frame should align with the top of the keyboard's final position.
            CGRect keyboardRect = [aValue CGRectValue];
            
            // Get the duration of the animation.
            NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
            NSTimeInterval animationDuration;
            [animationDurationValue getValue:&animationDuration];
            
            // Animate the resize of the text view's frame in sync with the keyboard's appearance.
            _shippinglabel.alpha=0.0;

            
            _Scroller.frame= CGRectMake(_Scroller.frame.origin.x, -10, _Scroller.frame.size.width, _Scroller.frame.size.height);
            
            //   self.view.frame= CGRectMake(0, 0, 320, 460-300);
            
            
        }
        
        
    }
}


- (void)keyboardWillHide:(NSNotification *)notification {
    
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
	{
		CGSize result = [[UIScreen mainScreen] bounds].size;
        NSLog(@"height-%f",result.height);
		if (result.height == 568)
        {
            _Scroller.contentSize = CGSizeMake(320, 1150);

            NSDictionary* userInfo = [notification userInfo];
            
            /*
             Restore the size of the text view (fill self's view).
             Animate the resize so that it's in sync with the disappearance of the keyboard.
             */
            NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
            NSTimeInterval animationDuration;
            [animationDurationValue getValue:&animationDuration];
            
            _shippinglabel.alpha=1.0;

            
            _Scroller.frame= CGRectMake(_Scroller.frame.origin.x, 39, _Scroller.frame.size.width, _Scroller.frame.size.height);
            
        }
        
        
        else{
            NSDictionary* userInfo = [notification userInfo];
            _shippinglabel.alpha=1.0;
            _Scroller.contentSize = CGSizeMake(320, 1150);

            /*
             Restore the size of the text view (fill self's view).
             Animate the resize so that it's in sync with the disappearance of the keyboard.
             */
            NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
            NSTimeInterval animationDuration;
            [animationDurationValue getValue:&animationDuration];
            
            
            
            _Scroller.frame= CGRectMake(_Scroller.frame.origin.x, 39, _Scroller.frame.size.width, _Scroller.frame.size.height);
                       
            // self.view.frame= CGRectMake(0, 0, 320, 460);
            
            
        }
        
        
    }
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
       [textField resignFirstResponder];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {

    if(textField == _state)
    {
        [self.view endEditing:YES]; // added this in for case when keyboard was already on screen

        dropDownTbl.hidden = NO;
        [_state resignFirstResponder];
        [_city resignFirstResponder];
        [_Street2 resignFirstResponder];

        return NO;
        
        
    }
    else
    {
        dropDownTbl.hidden = YES;
        return YES;
    }
    
}

@end
