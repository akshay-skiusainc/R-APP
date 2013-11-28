//
//  AAConfirmDetailsViewController.m
//  Citrus
//
//  Created by Ankur Arya on 13/07/13.
//  Copyright (c) 2013 Arya Corp. All rights reserved.
//

#import "AAConfirmDetailsViewController.h"

@interface AAConfirmDetailsViewController ()

@end

@implementation AAConfirmDetailsViewController

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
    // Do any additional setup after loading the view from its nib.
    NSLog(@"Details = %@",self.detailsDict);
    
    self.firstNameLbl.text = [self.detailsDict objectForKey:@"fname"];
    self.lastNameLbl.text = [self.detailsDict objectForKey:@"lname"];
    self.emailLbl.text = [self.detailsDict objectForKey:@"email"];
    self.amountLbl.text = [self.detailsDict objectForKey:@"amt"];
    self.tIDLbl.text = [self.detailsDict objectForKey:@"tid"];
    self.hmacUrl.text = [self.detailsDict objectForKey:@"hmacUrl"];
    self.returnUrl.text = [self.detailsDict objectForKey:@"returnUrl"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)payNow:(id)sender {
    
    //HTTP POST Trip Web Service
 /*   NSString *urlString = @"http://120.88.39.191/democode/api/getHmac.php";
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"POST"];
    
    NSString *boundary = @"---------------------------14737809831466499882746641449";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
    [request addValue:contentType forHTTPHeaderField:@"Content-Type"];
    
    NSMutableData *body = [NSMutableData data];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    
    
    // Text parameter1
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"vanityUrl\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"mycitrus" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    // Text parameter1
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"currency\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"INR" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    // Text parameter1
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"orderAmount\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[self.amountLbl.text dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    // Text parameter1
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"merchantTxnId\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[self.tIDLbl.text dataUsingEncoding:NSUTF8StringEncoding]];
    //[body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    
    
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [request setHTTPBody:body];
    // dispatch_queue_t hiq = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, NULL);
    // dispatch_queue_t main = dispatch_get_main_queue();
    
    // dispatch_async(hiq, ^(){
    
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    
    // dispatch_async(main, ^(){
    
    
    NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    NSLog(@"Return = %@",returnString);
    
    if (![returnString isEqualToString:@""]) {
    
    [self.detailsDict setObject:returnString forKey:@"hmac"];
    AAWebViewController *webView = [[AAWebViewController alloc]init];
    webView.detailsDict = self.detailsDict;
        [self presentViewController:webView animated:YES completion:nil];
    
  //  }http://apps.medialabs24x7.com/besharam/secure/test/iosSSL.php?merchantTxnId=789037843&orderAmount=676&returnUrl=hsi.php
  
  
  */
    [self fetchAllData];
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
    [self presentViewController:webView animated:YES completion:nil];

	//shoeb9773147431
}
@end
