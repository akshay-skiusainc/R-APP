//
//  AAWebViewController.m
//  Citrus
//
//  Created by Ankur Arya on 13/07/13.
//  Copyright (c) 2013 Arya Corp. All rights reserved.
//

#import "AAWebViewController.h"

@interface AAWebViewController ()

@end

@implementation AAWebViewController
@synthesize m_total,order_total;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
    [super viewDidLoad];
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
    obj.TransStatus=@"0";
//    NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"app_bg_image"];
//    UIImage* app_bg_image = [UIImage imageWithData:imageData];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:app_bg_image];

    _Cancelview.backgroundColor = [self colorWithHexString:@"560048"];
    _Cancelview.alpha=0.0;
    //NSString *returnUlr = @"https://120.88.39.191/6060/";
    [self.webView setDelegate:self];
    
//    firstName=George&lastName=Clooney&email=daredevil.suyash@gmail.com&addressStreet1=Sesame street&addressState=Pune&addressState=Maharashtra&addressCountry=India&addressZip=411045&phoneNumber=9900414420&currency=INR&merchantTxnId=11206098796676277722&orderAmount=1.0&returnUrl=http://120.88.39.191:6060/&secSignature=b53f23d81fc79c7b0397a3fd21e1fe7cd5b6f8d8&cardHolderName=Gaurav Gupta&cardNumber=2347 2345 9876 2345&expiryMonth=Jan 2016&cardType=Visa&cvvNumber=123&expiryYear=May 2021 
    
    
    NSURL *url = [NSURL URLWithString: @"https://www.citruspay.com/medialabs24x7"];
 //   NSString *body = [NSString stringWithFormat:@"firstName=%@&lastName=%@&email=%@&addressStreet1=%@&addressState=%@&addressState=%@&addressCountry=%@&addressZip=%@&phoneNumber=&currency=INR&merchantTxnId=%@&orderAmount=%@&returnUrl=%@&secSignature=%@&cardHolderName=Gaurav Gupta&cardNumber=2347 2345 9876 2345&expiryMonth=Jan 2016&cardType=Visa&cvvNumber=123&expiryYear=May 2021",[self.detailsDict objectForKey:@"fname"],[self.detailsDict objectForKey:@"lname"],[self.detailsDict objectForKey:@"email"],[self.detailsDict objectForKey:@"address"],[self.detailsDict objectForKey:@"state"],[self.detailsDict objectForKey:@"state"],[self.detailsDict objectForKey:@"country"],[self.detailsDict objectForKey:@"zipcode"],[self.detailsDict objectForKey:@"tid"],[self.detailsDict objectForKey:@"amt"],[self.detailsDict objectForKey:@"returnUrl"],[self.detailsDict objectForKey:@"hmac"]];
    
    
    
    
    NSString *body = [NSString stringWithFormat:@"firstName=%@&lastName=%@&email=%@&addressStreet1=%@&addressStreet2=%@&addressState=%@&addressState=%@&addressCountry=%@&addressZip=%@&phoneNumber=%@&addressCity=%@&currency=INR&merchantTxnId=%@&orderAmount=%@&returnUrl=%@&secSignature=%@",[self.detailsDict objectForKey:@"fname"],[self.detailsDict objectForKey:@"lname"],[self.detailsDict objectForKey:@"email"],[self.detailsDict objectForKey:@"address"],[self.detailsDict objectForKey:@"address2"],[self.detailsDict objectForKey:@"state"],[self.detailsDict objectForKey:@"state"],[self.detailsDict objectForKey:@"country"],[self.detailsDict objectForKey:@"zipcode"],[self.detailsDict objectForKey:@"contactno"],[self.detailsDict objectForKey:@"city"],[self.detailsDict objectForKey:@"tid"],[self.detailsDict objectForKey:@"amt"],[self.detailsDict objectForKey:@"returnUrl"],[self.detailsDict objectForKey:@"hmac"]];

    
    
    NSLog(@"WEB REQUEST = %@",body);
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url];
    [request setHTTPMethod: @"POST"];
    [request setHTTPBody: [body dataUsingEncoding: NSUTF8StringEncoding]];
    [self.webView loadRequest: request];
    
    
//    NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"app_bg_image"];
//    UIImage* app_bg_image = [UIImage imageWithData:imageData];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:app_bg_image];
//    
	
	
    
    
    UIImage *relAppImage = [UIImage imageNamed:@"home_right_rel_icon.png"];
    UIButton *buttonChat = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonChat setImage:relAppImage forState:UIControlStateNormal];
    buttonChat.frame = CGRectMake(0, 0, relAppImage.size.width, relAppImage.size.height);
    // [buttonChat addTarget:self action:@selector(toRelApp:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *customBarItem1 = [[UIBarButtonItem alloc] initWithCustomView:buttonChat];
    self.navigationItem.RightBarButtonItem = customBarItem1;
    
    
    
    UIImage *buttonImage = [UIImage imageNamed:@"back-btn.png"];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:buttonImage forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, buttonImage.size.width, buttonImage.size.height);
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = customBarItem;
    
    
    
    
}

-(void)back {
    
    [self.navigationController popViewControllerAnimated:YES];
}


-(IBAction)toRelApp:(id)sender
{
    
}


-(void)webViewDidStartLoad:(UIWebView *)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;

}

- (BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType {
    NSURL *URL = [request URL];
    NSLog(@"closekar=%@",[URL scheme] );

    if ([[URL scheme] isEqualToString:@"closeWebView"]) {
        // parse the rest of the URL object and execute functions
        NSLog(@"closekar re");
        webView.alpha=0.0;


        NSString *decodedString = [URL.absoluteString stringByDecodingURLFormat];
        NSString *jsonStr= [decodedString substringFromIndex:21];
        NSLog(@"String = %@",jsonStr);
        NSData *jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
        NSError *e;
        dict = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&e];
        NSLog(@"Dict = %@",dict);
        _Cancelview.alpha=0.0;

        self.txnNumber.text = [dict objectForKey:@"transactionId"];
        //self.txnStatus.text = [dict objectForKey:@"TxStatus"];
        self.ODRAMT.text = [dict objectForKey:@"amount"];
        GlobalClass *obj= [GlobalClass getInstance];
        
  //commenting
        
 //       obj.TransStatus=@"1";
      //  [self fetchAllData];
        [self performSelector:@selector(fetchAllData) withObject:nil afterDelay:0.0];
        
        return NO;
    }
    return YES;
}





-(void)fetchAllData
{
    	GlobalClass *obj=[GlobalClass getInstance];
    
//    if([[dict objectForKey:@"TxStatus"] isEqualToString:@"CANCELED"])
//    {
//        
//    }
//    else
//    {
    
    
//    NSString    *str;
//    for (int i=0; i<[obj.Mid_added count]; i++)
//    {
//        str = [NSString stringWithFormat:@"%@",[obj.Mid_added objectAtIndex:i]];
//        
//        [str appendString:str];
//
//        
//    }
    
    
    
//    NSString *strr= [NSString stringWithFormat:@"%@",obj.Mid_added];
//    
//    strr = [strr stringByReplacingOccurrencesOfString:@"("
//                                           withString:@""];
//    
//    strr = [strr stringByReplacingOccurrencesOfString:@")"
//                                           withString:@""];
//    
//    
//    
//
//    
//    NSString *strr1= [NSString stringWithFormat:@"%@",obj.QtyOfProducts];
//    
//    strr1 = [strr1 stringByReplacingOccurrencesOfString:@"("
//                                           withString:@""];
//    
//    strr1 = [strr1 stringByReplacingOccurrencesOfString:@")"
//                                           withString:@""];
//    
//    
//    
//    
//    NSString *strr2= [NSString stringWithFormat:@"%@",m_total];
//    
//    strr2 = [strr2 stringByReplacingOccurrencesOfString:@"("
//                                             withString:@""];
//    
//    strr2 = [strr2 stringByReplacingOccurrencesOfString:@")"
//                                             withString:@""];
//    
//    strr2 = [strr2 stringByReplacingOccurrencesOfString:@"\""
//                                             withString:@""];
//

    NSLog(@"obj.QtyOfProducts=%@",obj.QtyOfProducts);

  //  [obj.QtyOfProducts removeLastObject];
    NSString    *strr,*strr1,*strr2;
    NSLog(@"post=%@",m_total);
    NSMutableString * quantityArrayString=[[NSMutableString alloc]init];;
    NSString * appendingStr;
    
    for (int i=0; i<[obj.Mid_added count]; i++) {
        
        if (i== (obj.Mid_added.count-1)) {
            appendingStr=[NSString stringWithFormat:@"%@",[obj.Mid_added objectAtIndex:i]];
            // [quantityArrayString appendString:[appendingStr substringToIndex:(appendingStr.length-1)]];
            [quantityArrayString appendString:appendingStr];
            
        }
        else
        {
            appendingStr=[NSString stringWithFormat:@"%@,",[obj.Mid_added objectAtIndex:i]];
            // [quantityArrayString appendString:[appendingStr substringToIndex:(appendingStr.length-1)]];
            [quantityArrayString appendString:appendingStr];
        }
    }
    NSLog(@"quantityArrayString => %@",quantityArrayString);
    
    strr=quantityArrayString;
    
    
    NSMutableString * quantityArrayString1=[[NSMutableString alloc]init];;
    NSString * appendingStr1;
    
    for (int i=0; i<[obj.QtyOfProducts count]; i++) {
        
        if (i== (obj.QtyOfProducts.count-1)) {
            appendingStr1=[NSString stringWithFormat:@"%@",[obj.QtyOfProducts objectAtIndex:i]];
            // [quantityArrayString appendString:[appendingStr substringToIndex:(appendingStr.length-1)]];
            [quantityArrayString1 appendString:appendingStr1];
            
        }
        else
        {
            appendingStr1=[NSString stringWithFormat:@"%@,",[obj.QtyOfProducts objectAtIndex:i]];
            // [quantityArrayString appendString:[appendingStr substringToIndex:(appendingStr.length-1)]];
            [quantityArrayString1 appendString:appendingStr1];
        }
    }
    NSLog(@"obj=%@",obj.QtyOfProducts);
    NSLog(@"quantityArrayString1 => %@",quantityArrayString1);

    strr1=quantityArrayString1;
    
    
    NSMutableString * quantityArrayString2=[[NSMutableString alloc]init];;
    NSString * appendingStr2;
    
    for (int i=0; i<[m_total count]; i++) {
        
        if (i== (m_total.count-1)) {
            appendingStr2=[NSString stringWithFormat:@"%@",[m_total objectAtIndex:i]];
            // [quantityArrayString appendString:[appendingStr substringToIndex:(appendingStr.length-1)]];
            [quantityArrayString2 appendString:appendingStr2];
            
        }
        else
        {
            appendingStr2=[NSString stringWithFormat:@"%@,",[m_total objectAtIndex:i]];
            // [quantityArrayString appendString:[appendingStr substringToIndex:(appendingStr.length-1)]];
            [quantityArrayString2 appendString:appendingStr2];
        }
    }
    NSLog(@"quantityArrayString2 => %@",quantityArrayString2);
    
    strr2=quantityArrayString2;

    
    
    
    
    
	NSString* post = [NSString stringWithFormat:@"TxGateway=%@&TxId=%@&TxMsg=%@&TxRefNo=%@&TxStatus=%@&addressCity=%@&addressCountry=%@&addressState=%@&addressStreet1=%@&addressZip=%@&amount=%@&authIdCode=%@&currency=%@&email=%@&firstName=%@&isCOD=%@&issuerRefNo=%@&lastName=%@&mobileNo=%@&paymentMode=%@&pgRespCode=%@&pgTxnNo=%@&signature=%@&transactionId=%@&deviceno=%@&m_id=%@&m_quantity=%@&m_total=%@&total_amount=%@",[dict objectForKey:@"TxGateway"],[dict objectForKey:@"TxId"],[dict objectForKey:@"TxMsg"],[dict objectForKey:@"TxRefNo"],[dict objectForKey:@"TxStatus"],[dict objectForKey:@"addressCity"],[dict objectForKey:@"addressCountry"],[dict objectForKey:@"addressState"],[dict objectForKey:@"addressStreet1"],[dict objectForKey:@"addressZip"],[dict objectForKey:@"amount"],[dict objectForKey:@"authIdCode"],[dict objectForKey:@"currency"],[dict objectForKey:@"email"],[dict objectForKey:@"firstName"],[dict objectForKey:@"isCOD"],[dict objectForKey:@"issuerRefNo"],[dict objectForKey:@"lastName"],[dict objectForKey:@"mobileNo"],[dict objectForKey:@"paymentMode"],[dict objectForKey:@"pgRespCode"],[dict objectForKey:@"pgTxnNo"],[dict objectForKey:@"signature"],[dict objectForKey:@"transactionId"],obj.dev,strr,strr1,strr2,order_total];
    NSLog(@"post=%@",post);
	
	
    
    
	
	//	dispatch_async(dispatch_get_main_queue()	, ^{
	
	
	
	NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
	NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
	
	[request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://apps.medialabs24x7.com/besharam/secure/test/save_merch_purchase_details_ios.php"]]];
	[request setHTTPMethod:@"POST"];
	[request setValue:postLength forHTTPHeaderField:@"Content-Length"];
	[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Current-Type"];
	[request setHTTPBody:postData];
	
	NSURLResponse *response;
	NSData *urlData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
	NSString *stringResponse = [[NSString alloc] initWithData:urlData encoding:NSASCIIStringEncoding];
	NSLog(@"response1=%@",stringResponse);
	
	
	NSError* error;
	NSArray* responseDict = [NSJSONSerialization JSONObjectWithData:urlData //1
                                                                 options:kNilOptions
                                                                   error:&error];
	
	NSLog(@"respnse=%@",responseDict);
    
    
    
    NSDictionary* merchandise = [responseDict objectAtIndex:0];
    NSLog(@"respnse=%@",merchandise);
    
    if ([[merchandise objectForKey:@"response"] isEqualToString:@"fail"]) {
        
        _OAMT.alpha=0.0;
        self.ODRAMT.alpha =0.0;
        _TXTVIEW.text=@"For more details please contact:                     admin@skiusainc.com";
        _txnStatus.text=@"Sorry, Your Transaction has Failed";


    }
    
    else
    {
        
        obj.TransStatus=@"1";

        
        _txnStatus.text =@"Your Transaction is Successful";

        
           }
    //2
    //
    //    NSLog(@"payment=%@",merchandise);
    //
//    self.txnNumber.text = [dict objectForKey:@"transactionId"];
//    self.txnStatus.text = [merchandise objectForKey:@"response"];
//    self.ODRAMT.text = [dict objectForKey:@"amount"];    
       _Cancelview.alpha=1.0;

    
	//shoeb9773147431
}


//4587770590132669
-(IBAction)Okay
{
    //  [self.parentViewController.parentViewController dismissModalViewControllerAnimated:YES];
    
     [self dismissViewControllerAnimated:YES completion:nil];
    //    [self.navigationController popViewControllerAnimated:YES];
    
}
- (NSString *)stringByDecodingURLFormat
{
    NSString *result = [(NSString *)self stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    result = [result stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return result;
}
-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}
-(BOOL)shouldAutorotate
{
    return YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
