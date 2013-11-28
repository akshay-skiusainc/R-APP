//
//  IAPHelper.m
//  In App Rage
//
//  Created by Ray Wenderlich on 9/5/12.
//  Copyright (c) 2012 Razeware LLC. All rights reserved.
//

// 1
#import "IAPHelper.h"
#import <StoreKit/StoreKit.h>

NSString *const IAPHelperProductPurchasedNotification = @"IAPHelperProductPurchasedNotification";

// 2
@interface IAPHelper () <SKProductsRequestDelegate, SKPaymentTransactionObserver>
@end

// 3
@implementation IAPHelper {
    SKProductsRequest * _productsRequest;
    RequestProductsCompletionHandler _completionHandler;
    
    NSSet * _productIdentifiers;
    NSMutableSet * _purchasedProductIdentifiers;
}

- (id)initWithProductIdentifiers:(NSSet *)productIdentifiers {
    
    if ((self = [super init])) {
        
        // Store product identifiers
        _productIdentifiers = productIdentifiers;
        
        // Check for previously purchased products
        _purchasedProductIdentifiers = [NSMutableSet set];
        for (NSString * productIdentifier in _productIdentifiers) {
            BOOL productPurchased = [[NSUserDefaults standardUserDefaults] boolForKey:productIdentifier];
            if (productPurchased) {
                [_purchasedProductIdentifiers addObject:productIdentifier];
                NSLog(@"Previously purchased: %@", productIdentifier);
            } else {
                NSLog(@"Not purchased: %@", productIdentifier);
            }
        }
        
        // Add self as transaction observer
        [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
        
    }
    return self;
    
}

- (void)requestProductsWithCompletionHandler:(RequestProductsCompletionHandler)completionHandler {
    
    
    // 1
    _completionHandler = [completionHandler copy];
    
    // 2
    _productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:_productIdentifiers];
    _productsRequest.delegate = self;
    [_productsRequest start];
    
}

- (BOOL)productPurchased:(NSString *)productIdentifier {
   NSLog(@"boos=%@",productIdentifier);
    return [_purchasedProductIdentifiers containsObject:productIdentifier];
}

- (void)buyProduct:(SKProduct *)product {
    
    NSLog(@"Buying %@...", product.productIdentifier);
   // [self performSelector:@selector(fetchAllData) withObject:nil afterDelay:0.0];

    SKPayment * payment = [SKPayment paymentWithProduct:product];
    [[SKPaymentQueue defaultQueue] addPayment:payment];
    
}

#pragma mark - SKProductsRequestDelegate

- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response {
    
    NSLog(@"Loaded list of products...");
    _productsRequest = nil;
    
    NSArray * skProducts = response.products;
    for (SKProduct * skProduct in skProducts) {
        NSLog(@"Found product: %@ %@ %0.2f",
              skProduct.productIdentifier,
              skProduct.localizedTitle,
              skProduct.price.floatValue);
    }
    
    _completionHandler(YES, skProducts);
    _completionHandler = nil;
    
}

- (void)request:(SKRequest *)request didFailWithError:(NSError *)error {
    
    NSLog(@"Failed to load list of products.");
    _productsRequest = nil;
    
    _completionHandler(NO, nil);
    _completionHandler = nil;
    
}

#pragma mark SKPaymentTransactionOBserver

- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions
{
    for (SKPaymentTransaction * transaction in transactions) {
        switch (transaction.transactionState)
        {
            case SKPaymentTransactionStatePurchased:
                [self completeTransaction:transaction];
                break;
            case SKPaymentTransactionStateFailed:
                [self failedTransaction:transaction];
                break;
            case SKPaymentTransactionStateRestored:
                [self restoreTransaction:transaction];
            default:
                break;
        }
    };
}
-(void)fetchAllData
{
    //	dispatch_async(dispatch_get_global_queue(0, 0), ^{
    
    GlobalClass *obj=[GlobalClass getInstance];
    
    NSString* post = [NSString stringWithFormat:@"http://apps.medialabs24x7.com/besharam/ios_purchase.php?deviceno=%@",obj.dev];
    
    NSLog(@"post=%@",post);
    
    
    
    
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:post] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:2.0];
    
    
    
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Current-Type"];
    NSError *errorReturned = nil;
    NSURLResponse *theResponse =[[NSURLResponse alloc]init];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&theResponse error:&errorReturned];
    
    
    if (errorReturned) {
        NSLog(@"errorReturned=%@",errorReturned);
        
        
        //			UIAlertView* alertBox = [[ UIAlertView alloc]initWithTitle:@"Network Error" message:@"Network Not Connected" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil ];
        //			alertBox.tag=3;
        //			alertBox.delegate=self;
        //			[alertBox show];
        
        
        
    }
    else
    {
        
        
        
        
        NSError* error;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data //1
                                                             options:kNilOptions
                                                               error:&error];
        NSLog(@"json=%@",json);
        
      //  [self getAllData];
        
        
    }
}

-(void)getAllData
{
    
    
	
    GlobalClass *obj=[GlobalClass getInstance];
    
        obj.iapreceived=@"1";

	NSString* post = [NSString stringWithFormat:@"http://apps.medialabs24x7.com/besharam/fetch_data_all_downloads_ios.php?deviceno=%@",obj.dev];
	
	
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:post] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
	
	
	//  NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://110.175.19.95/SCMIpadDemoWebApp/CustomerList.aspx?username=02&BeginRowNo=0&LastRowNo=10"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:5.0];
	
	[request setHTTPMethod:@"GET"];
	//[request setValue:@"application/x-www-form-urlencodeQBCd" forHTTPHeaderField:@"Current-Type"];
	NSError *errorReturned = nil;
	
	
	
	
	
	if (errorReturned) {
		NSLog(@"errorReturned=%@",errorReturned);
		
		
		UIAlertView* alertBox = [[ UIAlertView alloc]initWithTitle:@"Network Error" message:@"Network Not Connected" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Retry", nil ];
		//alertBox.tag=3;
		alertBox.delegate=self;
		[alertBox show];
		
		
		// Handle error.
	}
	else
	{
		
		
		NSLog(@"POSTING=%@",post);
		
		
		
		NSError *errorReturned = nil;
		NSURLResponse *theResponse =[[NSURLResponse alloc]init];
		NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&theResponse error:&errorReturned];
		
        
        if (!errorReturned) {
            NSLog(@"errorReturned=%@",errorReturned);
            
            
            
            
            
            
            NSError* error;
            NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data //1
                                                                 options:kNilOptions
                                                                   error:&error];
            // Handle error.
            
            
            NSLog(@"json=%@",json);
            
            
            NSDictionary* interviewdata = [json objectForKey:@"bs_video"]; //2
            
            NSDictionary* onsetdata = [json objectForKey:@"bs_photo"]; //2
            
            NSDictionary* videodata = [json objectForKey:@"video_links"]; //2
            
            
            NSDictionary* wallpaperdata = [json objectForKey:@"small_wallpaper"]; //2
            NSDictionary* book = [json objectForKey:@"bookmyshow"]; //2
            NSDictionary* feedback1 = [json objectForKey:@"feedback"]; //2
            NSDictionary* music = [json objectForKey:@"music"]; //2
            NSDictionary* notifications = [json objectForKey:@"notifications"]; //2
            NSDictionary* cnc = [json objectForKey:@"castncrew"];
            NSDictionary* dirnote = [json objectForKey:@"directors_note"];
            NSDictionary    *category = [json objectForKey:@"cat_items"];
            NSDictionary    *BS_COVER = [json objectForKey:@"bs_cover"];
            NSDictionary    *banner = [json objectForKey:@"banner"];
            NSDictionary *appData = [json objectForKey:@"app_data"];
            NSDictionary *sharetext = [json objectForKey:@"share_txt"];
            NSDictionary *productionForCNC = [json objectForKey:@"production"];
            
            //2
            //2
            //NSDictionary* Contests = [json objectForKey:@"contest"]; //2
            
            
            
            
            GlobalClass *obj=[GlobalClass getInstance];
            obj.groups = [json objectForKey:@"groups"];
            obj.fbtoken = [json objectForKey:@"facebook"];
            obj.str = interviewdata;
            obj.onset = onsetdata;
            obj.videolinks = videodata;
            obj.Dwall = wallpaperdata;
            obj.Bookmyshow = book;
            obj.Feedback=feedback1;
            obj.music=music;
            obj.CNC=cnc;
            obj.directorsNote=dirnote;
            obj.category=category;
            obj.BTS=BS_COVER;
            obj.Banner=banner;
            obj.appData=appData;
            obj.productionImage = productionForCNC;
            
            
            
            obj.Notifications=notifications;
            //  obj.Contests=Contests;
            
            for (NSDictionary *actoAgent in dirnote)
            {
                obj.dirnote= [actoAgent objectForKey:@"image"];
                
            }
            for (NSDictionary *actoAgent in sharetext)
            {
                obj.videosharetext= [actoAgent objectForKey:@"videos"];
                NSLog(@"sharetext=%@",obj.videosharetext);
                
            }
            
            for (NSDictionary *actoAgent in sharetext)
            {
                obj.wallpapers= [actoAgent objectForKey:@"wallpapers"];
                NSLog(@"sharetext=%@",obj.wallpapers);
                
            }
            for (NSDictionary *actoAgent in sharetext)
            {
                obj.behindscene_video= [actoAgent objectForKey:@"behindscene_video"];
                NSLog(@"behindscene_video=%@",obj.behindscene_video);
                
            }
            
            for (NSDictionary *actoAgent in sharetext)
            {
                obj.behindscene_images= [actoAgent objectForKey:@"behindscene_images"];
                NSLog(@"behindscene_images=%@",obj.behindscene_images);
                
            }
            
            for (NSDictionary *actoAgent in sharetext)
            {
                obj.newsshare= [actoAgent objectForKey:@"news"];
                NSLog(@"newsshare=%@",obj.newsshare);
                
            }
            
            
            
            for (NSDictionary *actoAgent in sharetext)
            {
                obj.twitter= [actoAgent objectForKey:@"twitter"];
                NSLog(@"twitter=%@",obj.twitter);
                
            }
            
            for (NSDictionary *actoAgent in sharetext)
            {
                obj.facebook= [actoAgent objectForKey:@"facebook"];
                NSLog(@"facebook=%@",obj.facebook);
                
            }
            
            for (NSDictionary *actoAgent in sharetext)
            {
                obj.mug= [actoAgent objectForKey:@"mug"];
                NSLog(@"mug=%@",obj.mug);
                
            }
            
            
            for (NSDictionary *actoAgent in sharetext)
            {
                obj.Tshirt= [actoAgent objectForKey:@"Tshirt"];
                NSLog(@"Tshirt=%@",obj.Tshirt);
                
            }
            
            for (NSDictionary *actoAgent in sharetext)
            {
                obj.movie_poster= [actoAgent objectForKey:@"movie_poster"];
                NSLog(@"movie_poster=%@",obj.movie_poster);
                
            }
            
            
            
            
            for (NSDictionary *actoAgent1 in obj.appData)
            {
                NSString *appBG= [actoAgent1 objectForKey:@"app_bgmain_ios"];
                NSLog(@"App Bg is = %@",appBG);
                NSString *appID= [actoAgent1 objectForKey:@"app_id"];
                NSString *appMovieName = [actoAgent1 objectForKey:@"app_movie_name"];
                
                NSString *appBG1= [actoAgent1 objectForKey:@"app_bgnav_ios"];
                
                
                if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"app_bgmain_ios"]isEqualToString:appBG ]) {
                    
                    NSLog(@"Same Background Image **  \n%@ \n%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"app_bgmain_ios"],appBG);
                }
                else{
                    
                    
                    NSURL *url = [NSURL URLWithString:appBG];
                    NSData *imageData = [NSData dataWithContentsOfURL:url];
                    UIImage *image = [UIImage imageWithData:imageData];
                    
                    NSURL *url1 = [NSURL URLWithString:appBG1];
                    NSData *imageData1 = [NSData dataWithContentsOfURL:url1];
                    UIImage *image1 = [UIImage imageWithData:imageData1];
                    
                    
                    NSUserDefaults *setUserDefaults=[NSUserDefaults standardUserDefaults];
                    [setUserDefaults setObject:UIImageJPEGRepresentation(image,1.0) forKey:@"app_bg_image"];
                    [setUserDefaults setObject:appBG forKey:@"app_bgmain_ios"];
                    [setUserDefaults setObject:appID forKey:@"app_id"];
                    [setUserDefaults setObject:appMovieName forKey:@"app_movie_name"];
                    [setUserDefaults setObject:UIImageJPEGRepresentation(image1,1.0) forKey:@"app_bgnav_ios"];
                }
                
            }
            
                    
            
            GlobalClass *OBJ=[GlobalClass getInstance];
            OBJ.fetchall=@"1";
            
      
            
        }
        
        
        
        //[self getdata];
        
         }
    
    
}


- (void)completeTransaction:(SKPaymentTransaction *)transaction {
    NSLog(@"completeTransaction...");
    
    [self provideContentForProductIdentifier:transaction.payment.productIdentifier];
    [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
//    [self performSelector:@selector(fetchAllData) withObject:nil afterDelay:0.0];

}

- (void)restoreTransaction:(SKPaymentTransaction *)transaction {
    NSLog(@"restoreTransaction...");
    
    [self provideContentForProductIdentifier:transaction.originalTransaction.payment.productIdentifier];
    [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
//    [self performSelector:@selector(fetchAllData) withObject:nil afterDelay:0.0];

}

- (void)failedTransaction:(SKPaymentTransaction *)transaction {
    
    NSLog(@"failedTransaction...");
    if (transaction.error.code != SKErrorPaymentCancelled)
    {
        NSLog(@"Transaction error: %@", transaction.error.localizedDescription);
    }
    
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];
}

- (void)provideContentForProductIdentifier:(NSString *)productIdentifier {
    
    [_purchasedProductIdentifiers addObject:productIdentifier];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:productIdentifier];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[NSNotificationCenter defaultCenter] postNotificationName:IAPHelperProductPurchasedNotification object:productIdentifier userInfo:nil];
    
}

- (void)restoreCompletedTransactions {
    [[SKPaymentQueue defaultQueue] restoreCompletedTransactions];
}

@end