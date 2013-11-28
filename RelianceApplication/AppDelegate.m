//
//  AppDelegate.m
//  RelianceApplication
//
//  Created by Akshay on 8/6/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import "AppDelegate.h"

#import "DDMenuController.h"
#import "FeedController.h"
#import "LeftController.h"
#import "RightController.h"
#import "HomeController.h"
#import "LeftViewController.h"
#import "iphone4RightViewController.h"
#import "iphone4HomeViewController.h"
#import "iphone4LeftViewController.h"
#import "RightViewController.h"
#import <Socialize/Socialize.h>



#import "R_Home.h"
#import "R_Home_5.h"
static NSString *const kTrackingId = @"UA-42554692-1";

@implementation AppDelegate
@synthesize window = _window;
@synthesize menuController = _menuController;
@synthesize hexBottom,hexTop,customAlert;
//@synthesize xmppRosterStorage;
@synthesize xmppStream;
@synthesize xmppRoster,xmppReconnect;

//- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
//{
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    // Override point for customization after application launch.
//    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
//    self.window.rootViewController = self.viewController;
//    [self.window makeKeyAndVisible];
//    return YES;
//}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [self setupStream];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    [GAI sharedInstance].trackUncaughtExceptions = YES;
	// Optional: set Google Analytics dispatch interval to e.g. 20 seconds.
	[GAI sharedInstance].dispatchInterval = 20;
	// Optional: set debug to YES for extra debugging information.
	[GAI sharedInstance].debug = YES;
	// Create tracker instance.
	id<GAITracker> tracker = [[GAI sharedInstance] trackerWithTrackingId:kTrackingId];
    
    int cacheSizeMemory = 4*1024*1024; // 4MB
    int cacheSizeDisk = 32*1024*1024;  // 32MB
    
    
    NSURLCache *sharedCache = [[NSURLCache alloc] initWithMemoryCapacity:cacheSizeMemory diskCapacity:cacheSizeDisk diskPath:@"nsurlcache"];
    [NSURLCache setSharedURLCache:sharedCache];
    
    CGSize result = [[UIScreen mainScreen] bounds].size;
    
    // Disabling alerts for socialize
    [Socialize storeUIErrorAlertsDisabled:YES];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(errorNotification:) name:SocializeUIControllerDidFailWithErrorNotification object:nil];
    
    
    //Socialize Settings
    [Socialize storeOGLikeEnabled:YES];
    // set the socialize api key and secret, register your app here: http://www.getsocialize.com/apps/
//    [Socialize storeConsumerKey:@"b3b1bbf0-5488-4eb4-925b-8ea9032c331c"];
//    [Socialize storeConsumerSecret:@"fddbe959-3513-4d33-9a4b-186e40216bb1"];
 
//    [Socialize storeConsumerKey:@"ee57bf99-1232-4026-af75-14bbfede6524"];
//    [Socialize storeConsumerSecret:@"c2266397-eadc-4302-85d7-11aca5e902aa"];

    
    [Socialize storeConsumerKey:@"b3b1bbf0-5488-4eb4-925b-8ea9032c331c"];
    [Socialize storeConsumerSecret:@"fddbe959-3513-4d33-9a4b-186e40216bb1"];
    //    //Tweeter
    // [SZTwitterUtils setConsumerKey:@"Ga5BSx0TjJ6qPlG5wvTxg" consumerSecret:@"lxCQzcUHf65J4iNbTeGzgenaFcdD00vC3oDwM6H8uM"];
    //
    ////    //FaceBook
    //  [SZFacebookUtils setAppId:@"1411280179083627"];
    
   
    
//    [Socialize setEntityLoaderBlock:^(UINavigationController *navigationController, id<SocializeEntity>entity) {
//        
//        SampleEntityLoader *entityLoader = [[SampleEntityLoader alloc] initWithEntity:entity];
//        
//        if (navigationController == nil) { 
//            UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:entityLoader];
//            [self.window.rootViewController presentModalViewController:navigationController animated:YES];
//        } else {
//            [navigationController pushViewController:entityLoader animated:YES];
//        }
//    }];
//    
        
    
    
    GlobalClass *obj=[GlobalClass getInstance];
    obj.CHECK_LOADING=@"1";
    obj.CHECK_CATALOG=@"1";
    obj.MOVIE_DATA=@"0";
    obj.REL_DATA=@"0";
    obj.Leftcheck=@"1";
    if (result.height == 568)
    {
        NSLog(@"result.height = %f",result.height);
        R_Home_5 *mainController = [[R_Home_5 alloc] init];
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:mainController];
        
        DDMenuController *rootController = [[DDMenuController alloc] initWithRootViewController:navController];
        _menuController = rootController;
        
        LeftViewController *leftController = [[LeftViewController alloc] init];
        rootController.leftViewController = leftController;
        
        RightViewController   *rightController = [[RightViewController alloc] init];
        rootController.rightViewController = rightController;
        
        self.window.rootViewController = rootController;
        
        
        //  [[UIApplication sharedApplication] setStatusBarHidden:YES];
        
        
        //NSLog(@"result.height = %f",result.height);
        //iphone4HomeViewController *mainController = [[iphone4HomeViewController alloc] init];
        //UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:mainController];
        
        //DDMenuController *rootController = [[DDMenuController alloc] initWithRootViewController:navController];
        //_menuController = rootController;
        
        //iphone4LeftViewController *leftController = [[iphone4LeftViewController alloc] init];
        //rootController.leftViewController = leftController;
        
        // RightController *rightController = [[RightController alloc] init];
        // rootController.rightViewController = rightController;
        
        // self.window.rootViewController = rootController;
        
        
    }
    else if(result.height == 480)
    {
        NSLog(@"result.height = %f",result.height);
        R_Home *mainController = [[R_Home alloc] init];
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:mainController];
        
        DDMenuController *rootController = [[DDMenuController alloc] initWithRootViewController:navController];
        _menuController = rootController;
        
        iphone4LeftViewController *leftController = [[iphone4LeftViewController alloc] init];
        rootController.leftViewController = leftController;
        
        iphone4RightViewController *rightController = [[iphone4RightViewController
                                                        alloc] init];
        rootController.rightViewController = rightController;
        
        self.window.rootViewController = rootController;
    }
    
    UIImage *image = [UIImage imageNamed:@"home_header_bg.jpg"];
    [[UINavigationBar appearance] setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque
                                                animated:NO];
    
    //    UIImage *backButtonImage = [[UIImage imageNamed:@"back-btn"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 13, 0, 6)];
    //    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    
    
    
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
     ( UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge)];
    return YES;
}

// Method for Socialize
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [Socialize handleOpenURL:url];
}

// Method for Socialize
- (void)errorNotification:(NSNotification*)notification {
    NSError *error = [[notification userInfo] objectForKey:SocializeUIControllerErrorUserInfoKey];
    NSLog(@"Error: %@", [error localizedDescription]);
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
       application.applicationIconBadgeNumber = 0;
    
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
	NSLog(@"My token is: %@", deviceToken);
	
	
	NSString *deviceToken1 = [[deviceToken description] stringByReplacingOccurrencesOfString: @"<" withString: @""];
	deviceToken1 = [deviceToken1 stringByReplacingOccurrencesOfString: @">" withString: @""] ;
	deviceToken1 = [deviceToken1 stringByReplacingOccurrencesOfString: @" " withString: @""];
	
	
	NSLog(@"My token is 1 : %@", deviceToken1);
	
	
	GlobalClass *obj1=[GlobalClass getInstance];
	obj1.dev=deviceToken1;
    
    //	DatabaseClass *test= [[DatabaseClass alloc] init];
    //
    //	NSString *ImagesTABLE = [NSString stringWithFormat: @"CREATE TABLE IF NOT EXISTS TEST (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT,  PHONE TEXT, EMAIL BLOB, IMAGE BLOB)"];
    //	[test saveData:ImagesTABLE];
    //
    //	NSString *insertSQL = [NSString stringWithFormat: @"INSERT INTO TEST (ID, NAME ,  PHONE , EMAIL , IMAGE ) VALUES (\"%@\",\"%@\",\"%@\",\"%@\",\"%@\")",@"1", @"Akshay", @"das", deviceToken1 ,nil];
    //	[test saveData:insertSQL];
	
    dispatch_async(dispatch_get_main_queue(), ^{
        
        
        
        NSString* post = [NSString stringWithFormat:@"device_token=%@",deviceToken];
        NSLog(@"POST=%@",post);
        
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        
        [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://apps.medialabs24x7.com/besharam/push_to_iphone/iphone_push_to_many.php"]]];
        [request setHTTPMethod:@"POST"];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Current-Type"];
        [request setHTTPBody:postData];
        
        NSURLResponse *response;
        NSData *urlData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
        NSString *stringResponse = [[NSString alloc] initWithData:urlData encoding:NSASCIIStringEncoding];
        
        NSLog(@"response1=%@",stringResponse);
        
            });
	
}

- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error
{
	NSLog(@"Failed to get token, error: %@", error);
}

//////social Integration

- (void)restoreLastSessionIfExists {
	SocialAccountType lastActiveSocialAccountType = [[NSUserDefaults standardUserDefaults] integerForKey:kSocialAccountTypeKey];
	if(lastActiveSocialAccountType == SocialAccountTypeTwitter) {
		[self getTwitterAccountOnCompletion:^(ACAccount *twitterAccount){
			//If we successfully retrieved a Twitter account
			if(twitterAccount) {
				//Make sure anything UI related happens on the main queue
				dispatch_async(dispatch_get_main_queue(), ^{
					iphone4LoginViewController *homeViewController = [[iphone4LoginViewController alloc] initWithSocialAccountType:SocialAccountTypeTwitter];
					
					[self.navController pushViewController:homeViewController animated:YES];
				});
			}
		}];
	}
}
- (void)getTwitterAccountOnCompletion:(void (^)(ACAccount *))completionHandler {
	ACAccountStore *store = [[ACAccountStore alloc] init];
	ACAccountType *twitterType = [store accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
	[store requestAccessToAccountsWithType:twitterType withCompletionHandler:^(BOOL granted, NSError *error) {
		if(granted) {
			// Remember that twitterType was instantiated above
			NSArray *twitterAccounts = [store accountsWithAccountType:twitterType];
			
			// If there are no accounts, we need to pop up an alert
			if(twitterAccounts == nil || [twitterAccounts count] == 0) {
				UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Twitter Accounts"
                                                                message:@"There are no Twitter accounts configured. You can add or create a Twitter account in Settings."
                                                               delegate:nil
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil];
				[alert show];
			} else {
				//Get the first account in the array
				ACAccount *twitterAccount = [twitterAccounts objectAtIndex:0];
				//Save the used SocialAccountType so it can be retrieved the next time the app is started.
				[[NSUserDefaults standardUserDefaults] setInteger:SocialAccountTypeTwitter forKey:kSocialAccountTypeKey];
				[[NSUserDefaults standardUserDefaults] synchronize];
				//Call the completion handler so the calling object can retrieve the twitter account.
				completionHandler(twitterAccount);
			}
		}
	}];
}

//////////////////////xmpp////////////////////////////////////
- (void)setupStream {
	
    //    xmppReconnect = [[XMPPReconnect alloc] init];
    //
    //	xmppStream = [[XMPPStream alloc] init];
    //	[xmppStream addDelegate:self delegateQueue:dispatch_get_main_queue()];
    //  	[xmppRoster            activate:xmppStream];
    //
    //	// Add ourself as a delegate to anything we may be interested in
    //
    //	[xmppStream addDelegate:self delegateQueue:dispatch_get_main_queue()];
    //	[xmppRoster addDelegate:self delegateQueue:dispatch_get_main_queue()];
    //
    //	[xmppStream setHostName:@"74.208.47.152"];
    //	[xmppStream setHostPort:5222];
    //
    //  [xmppStream setHostName:@"talk.google.com"];
    //  [xmppStream setHostPort:5222];
    
    
    xmppRosterStorage = [[XMPPRosterCoreDataStorage alloc] init];
    //	xmppRosterStorage = [[XMPPRosterCoreDataStorage alloc] initWithInMemoryStore];
	
	xmppRoster = [[XMPPRoster alloc] initWithRosterStorage:xmppRosterStorage];
	
	xmppRoster.autoFetchRoster = YES;
	xmppRoster.autoAcceptKnownPresenceSubscriptionRequests = YES;
    [xmppStream addDelegate:self delegateQueue:dispatch_get_main_queue()];
	[xmppRoster addDelegate:self delegateQueue:dispatch_get_main_queue()];

    xmppStream = [[XMPPStream alloc] init];
    
	[xmppStream addDelegate:self delegateQueue:dispatch_get_main_queue()];
	[xmppStream setHostName:@"74.208.47.152"];
	[xmppStream setHostPort:5222];
    
    
    xmppReconnect = [[XMPPReconnect alloc] init];
	
	// Setup roster
	//
	// The XMPPRoster handles the xmpp protocol stuff related to the roster.
	// The storage for the roster is abstracted.
	// So you can use any storage mechanism you want.
	// You can store it all in memory, or use core data and store it on disk, or use core data with an in-memory store,
	// or setup your own using raw SQLite, or create your own storage mechanism.
	// You can do it however you like! It's your application.
	// But you do need to provide the roster with some storage facility.
	
	    


    //  NSString *nameFor = name;
    
    
    
    
	// You may need to alter these settings depending on the server you're connecting to
    
	
}

- (void)xmppStream:(XMPPStream *)sender didNotAuthenticate:
(NSXMLElement *)error;
{
    NSLog(@"Did not authenticate");
    
    [xmppStream authenticateWithPassword:[[NSUserDefaults
                                           standardUserDefaults] stringForKey:@"userPassword"] error:nil];
    
    
}


- (void)xmppStream:(XMPPStream *)sender didNotRegister:(NSXMLElement
                                                        *)error{
    NSLog(@"Sorry the registration is failed");
    GlobalClass *obj=[GlobalClass getInstance];
    obj.loggin=@"2";
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:[NSString stringWithFormat:@"user already registered"]
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
    [alertView show];
    
//    NSString    *strr= [NSString stringWithFormat:@"%@@u16930719.onlinehome-server.com",_popupTextField.text];
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"userID"];
    NSString *jabberID = [[NSUserDefaults standardUserDefaults] stringForKey:@"userID"];
    NSLog(@"JID=%@",jabberID);
    [[NSUserDefaults standardUserDefaults] setObject:@"akshay123" forKey:@"userPassword"];
    

    
    //    [xmppStream registerWithPassword:[[NSUserDefaults
    //                                       standardUserDefaults] stringForKey:@"userPassword"] error:nil];
    
    //    NSError * err = nil;
    
    //    if(![[self xmppStream] registerWithPassword:password error:&err])
    //    {
    //        NSLog(@"Error registering: %@", err);
    //    }
    
    
}

- (void)teardownStream
{
    NSLog(@"deactivaing xmpp connections");
//	[xmppStream removeDelegate:self];
//	[xmppRoster removeDelegate:self];
//	
//	[xmppReconnect         deactivate];
//	[xmppRoster            deactivate];
	
	[self disconnect];
	
//	xmppStream = nil;
//	xmppReconnect = nil;
//    xmppRoster = nil;
//	xmppRosterStorage = nil;
}

//-(void)mucSetupStream
//{
//    xmppStream = [[XMPPStream alloc] init];
//
//    xmppStream.hostName = XMPP_HOSTNAME_2;
//    xmppStream.myJID = [XMPPJID jidWithString:XMPP_JID];
//
//    [xmppStream addDelegate:self delegateQueue:dispatch_get_main_queue()];
//
//    // Configure xmppRoom
//
//    XMPPJID *roomJID = [XMPPJID jidWithString:ROOM_JID];
//    xmppRoomStorage=[XMPPRoomCoreDataStorage sharedInstance];
//    xmppRoom = [[XMPPRoom alloc] initWithRoomStorage:self jid:roomJID dispatchQueue:dispatch_get_current_queue()];
//
//    [xmppRoom activate:xmppStream];
//    [xmppRoom addDelegate:self delegateQueue:dispatch_get_main_queue()];
//
//    // Start connection process
//
//    NSError *err = nil;
//    if (![xmppStream connect:&err])
//    {
//        DDLogError(@"YapTesting: Cannot connect: %@", err);
//    }
//
//    [xmppRoom fetchConfigurationForm];
//    [xmppRoom configureRoomUsingOptions:nil];
//
//
//
//}


- (void)goOnline {
    NSLog(@"online");
    GlobalClass *obj=[GlobalClass getInstance];
    obj.loggin=@"0";
    
	XMPPPresence *presence = [XMPPPresence presence];
    NSLog(@"presence=%@",presence);
	[[self xmppStream] sendElement:presence];
    //    NSString *jabberID = [[NSUserDefaults standardUserDefaults] stringForKey:@"userID"];
    //    //  NSString *ROOMID = [XMPPJID jidWithString:@"villan@conference.medialabs24x7.com"];
    //
    //    XMPPRoomCoreDataStorage *rosterstorage = [[XMPPRoomCoreDataStorage alloc] init];
    //    XMPPRoom* xmppRoom = [[XMPPRoom alloc] initWithRoomStorage:rosterstorage jid:[XMPPJID jidWithString:@"singer@conference.medialabs24x7.com"] dispatchQueue:dispatch_get_main_queue()];
    //    [xmppRoom activate:xmppStream];
    //    [xmppRoom joinRoomUsingNickname:@"dsaas" history:nil];
    //
    //    [xmppRoom fetchConfigurationForm];
    //    [xmppRoom configureRoomUsingOptions:nil];
    //    [xmppRoom addDelegate:self  delegateQueue:dispatch_get_main_queue()];
    //    XMPPJID *xmppJID=[XMPPJID jidWithString:jabberID];
    //    [xmppRoom inviteUser:xmppJID withMessage:@"Join Group1."];
    //[xmppRoom sendMessage:@"Hi by akshay"];
    
    
    //
    //    XMPPRoom* xmppRoom1 = [[XMPPRoom alloc] initWithRoomStorage:rosterstorage jid:[XMPPJID jidWithString:@"Director_Cut1@conference.medialabs24x7.com"] dispatchQueue:dispatch_get_main_queue()];
    //    [xmppRoom1 activate:[self xmppStream]];
    //    [xmppRoom1 joinRoomUsingNickname:jabberID history:nil];
    //    [xmppRoom1 fetchConfigurationForm];
    //    [xmppRoom1 configureRoomUsingOptions:nil];
    //    [xmppRoom1 addDelegate:self  delegateQueue:dispatch_get_main_queue()];
    //    XMPPJID *xmppJID1=[XMPPJID jidWithString:jabberID];
    //    [xmppRoom1 inviteUser:xmppJID1 withMessage:@"Join Group2."];
    
    
}


-(void)group1
{
           NSString *GROUPNAME = [[NSUserDefaults standardUserDefaults] stringForKey:@"GROUPNAME"];
            NSLog(@"GROUPNAME=%@",GROUPNAME);

    NSString *jabberID = [[NSUserDefaults standardUserDefaults] stringForKey:@"userID"];
    //  NSString *ROOMID = [XMPPJID jidWithString:@"villan@conference.medialabs24x7.com"];
    
 //   XMPPRoomCoreDataStorage *rosterstorage = [[XMPPRoomCoreDataStorage alloc] init];
    XMPPRoom* xmppRoom = [[XMPPRoom alloc] initWithRoomStorage:xmppRosterStorage jid:[XMPPJID jidWithString:GROUPNAME] dispatchQueue:dispatch_get_main_queue()];
    
         
        [xmppRoom activate:xmppStream];
        [xmppRoom joinRoomUsingNickname:jabberID history:nil];
        
        [xmppRoom fetchConfigurationForm];
        [xmppRoom configureRoomUsingOptions:nil];
        [xmppRoom addDelegate:self  delegateQueue:dispatch_get_main_queue()];
    //    XMPPJID *xmppJID=[XMPPJID jidWithString:jabberID];
        //[xmppRoom inviteUser:xmppJID withMessage:@"Join Group1."];
    
}


-(void)group2
{
    NSString *jabberID = [[NSUserDefaults standardUserDefaults] stringForKey:@"userID"];
    //  NSString *ROOMID = [XMPPJID jidWithString:@"villan@conference.medialabs24x7.com"];
    
    XMPPRoomCoreDataStorage *rosterstorage = [[XMPPRoomCoreDataStorage alloc] init];
    XMPPRoom* xmppRoom = [[XMPPRoom alloc] initWithRoomStorage:rosterstorage jid:[XMPPJID jidWithString:@"movieconversation@conference.u16930719.onlinehome-server.com"] dispatchQueue:dispatch_get_main_queue()];
    [xmppRoom leaveRoom];
    [xmppRoom deactivate];
    [xmppRoom removeDelegate:self delegateQueue:dispatch_get_main_queue()];
    if ([xmppRoom isJoined]) {
        NSLog(@"alreadyjoined");
        
    }
    else{
        
        [xmppRoom activate:xmppStream];
        [xmppRoom joinRoomUsingNickname:jabberID history:nil];
        
        [xmppRoom fetchConfigurationForm];
        [xmppRoom configureRoomUsingOptions:nil];
        [xmppRoom addDelegate:self  delegateQueue:dispatch_get_main_queue()];
        XMPPJID *xmppJID=[XMPPJID jidWithString:jabberID];
        [xmppRoom inviteUser:xmppJID withMessage:@"Join Group2."];
    }
    
}

-(void)group3
{
    NSString *jabberID = [[NSUserDefaults standardUserDefaults] stringForKey:@"userID"];
    //  NSString *ROOMID = [XMPPJID jidWithString:@"villan@conference.medialabs24x7.com"];
    
    XMPPRoomCoreDataStorage *rosterstorage = [[XMPPRoomCoreDataStorage alloc] init];
    XMPPRoom* xmppRoom = [[XMPPRoom alloc] initWithRoomStorage:rosterstorage jid:[XMPPJID jidWithString:@"movieconversation@conference.u16930719.onlinehome-server.com"] dispatchQueue:dispatch_get_main_queue()];
    if ([xmppRoom isJoined]) {
        NSLog(@"alreadyjoined");
        
    }
    else{
        
        [xmppRoom activate:xmppStream];
        [xmppRoom joinRoomUsingNickname:jabberID history:nil];
        
        [xmppRoom fetchConfigurationForm];
        [xmppRoom configureRoomUsingOptions:nil];
        [xmppRoom addDelegate:self  delegateQueue:dispatch_get_main_queue()];
        XMPPJID *xmppJID=[XMPPJID jidWithString:jabberID];
        [xmppRoom inviteUser:xmppJID withMessage:@"Join Group3."];
    }
}


-(void)group4
{
    NSString *jabberID = [[NSUserDefaults standardUserDefaults] stringForKey:@"userID"];
    //  NSString *ROOMID = [XMPPJID jidWithString:@"villan@conference.medialabs24x7.com"];
    
    XMPPRoomCoreDataStorage *rosterstorage = [[XMPPRoomCoreDataStorage alloc] init];
    XMPPRoom* xmppRoom = [[XMPPRoom alloc] initWithRoomStorage:rosterstorage jid:[XMPPJID jidWithString:@"movieconversation@conference.u16930719.onlinehome-server.com"] dispatchQueue:dispatch_get_main_queue()];
    if ([xmppRoom isJoined]) {
        NSLog(@"alreadyjoined");
        
    }
    else{
        [xmppRoom activate:xmppStream];
        [xmppRoom joinRoomUsingNickname:jabberID history:nil];
        
        [xmppRoom fetchConfigurationForm];
        [xmppRoom configureRoomUsingOptions:nil];
        [xmppRoom addDelegate:self  delegateQueue:dispatch_get_main_queue()];
        XMPPJID *xmppJID=[XMPPJID jidWithString:jabberID];
        [xmppRoom inviteUser:xmppJID withMessage:@"Join Group4."];
    }
    
}

-(void)leavegroup1
{
    // XMPPRoomCoreDataStorage *rosterstorage = [[XMPPRoomCoreDataStorage alloc] init];
    XMPPRoom* xmppRoom = [[XMPPRoom alloc] init];
    [xmppRoom leaveRoom];
    [xmppRoom deactivate];
    [xmppRoom removeDelegate:self];
    
}

-(void)leavegroup2
{
    NSLog(@"ytest");
    XMPPRoomCoreDataStorage *rosterstorage = [[XMPPRoomCoreDataStorage alloc] init];
    XMPPRoom* xmppRoom = [[XMPPRoom alloc] initWithRoomStorage:rosterstorage jid:[XMPPJID jidWithString:@"movieconversation@conference.u16930719.onlinehome-server.com"] dispatchQueue:dispatch_get_main_queue()];
    [xmppRoom leaveRoom];
    [xmppRoom deactivate];
    [xmppRoom removeDelegate:self delegateQueue:dispatch_get_main_queue()];
    
}

-(void)leavegroup3
{
    XMPPRoomCoreDataStorage *rosterstorage = [[XMPPRoomCoreDataStorage alloc] init];
    XMPPRoom* xmppRoom = [[XMPPRoom alloc] initWithRoomStorage:rosterstorage jid:[XMPPJID jidWithString:@"movieconversation@conference.u16930719.onlinehome-server.com"] dispatchQueue:dispatch_get_main_queue()];
    [xmppRoom leaveRoom];
    [xmppRoom deactivate];
    [xmppRoom removeDelegate:self delegateQueue:dispatch_get_main_queue()];
    
}

-(void)leavegroup4
{
    XMPPRoomCoreDataStorage *rosterstorage = [[XMPPRoomCoreDataStorage alloc] init];
    XMPPRoom* xmppRoom = [[XMPPRoom alloc] initWithRoomStorage:rosterstorage jid:[XMPPJID jidWithString:@"movieconversation@conference.u16930719.onlinehome-server.com"] dispatchQueue:dispatch_get_main_queue()];
    [xmppRoom leaveRoom];
    [xmppRoom deactivate];
    [xmppRoom removeDelegate:self delegateQueue:dispatch_get_main_queue()];
    
}
- (void)goOffline {
	XMPPPresence *presence = [XMPPPresence presenceWithType:@"unavailable"];
	[[self xmppStream] sendElement:presence];
}

- (BOOL)connect {
	
    NSLog(@"HI");
    //    if ([xmppStream isConnected]) {
    //        [self disconnect];
    //    }
	
    
    
    
	NSString *jabberID = [[NSUserDefaults standardUserDefaults] stringForKey:@"userID"];
	
    
    NSString *myPassword = [[NSUserDefaults standardUserDefaults] stringForKey:@"userPassword"];
	NSLog(@"JIDIS=%@",jabberID);
    NSLog(@"PASSWORD=%@",myPassword);
    
    
    [xmppStream setMyJID:[XMPPJID jidWithString:jabberID]];
    password = myPassword;
    
    
    
	if (![xmppStream isDisconnected]) {
		return YES;
	}
	
	
	if (jabberID == nil || myPassword == nil) {
		
		return NO;
	}
    NSError *error = nil;
    
    
    //   [self disconnect];
    
    //    NSString *jidBenutzer = [NSString stringWithFormat:@"u16930719.onlinehome-server.com"];
    //
    //    NSError * err = nil;
    //    NSLog(@"jabberid : %@",jabberID);
    //    XMPPJID *jid = [XMPPJID jidWithString:jabberID];
    //    self.xmppStream.myJID = jid;
    //
    //
    //    [[self xmppStream] registerWithPassword:@"akshay" error:&err];
    //
    //
    //    NSLog(@"Connection: %@",error);
    //
    //    NSLog(@"Register: %@",err);
    
    //[[self xmppStream] registerWithPassword:myPassword error:&error];
    
	
	NSError *error1 = nil;
    //	if (![self.xmppStream connect:&error])
	if (![xmppStream connectWithTimeout:XMPPStreamTimeoutNone error:&error1])
        
	{
		UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
															message:[NSString stringWithFormat:@"Can't connect to server %@", [error1 localizedDescription]]
														   delegate:nil
												  cancelButtonTitle:@"Ok"
												  otherButtonTitles:nil];
		[alertView show];
		
		
		return NO;
	}
    
    NSError *err;
    //
    [self.xmppStream connectWithTimeout:10.00 error:&err];
	
	return YES;
}

- (void)disconnect {
	
	[self goOffline];
	[xmppStream disconnect];
	[_chatDelegate didDisconnect];
}



#pragma mark -
#pragma mark XMPP delegates


- (void)xmppStreamDidConnect:(XMPPStream *)sender {
    NSLog(@"ur ol");
    NSString *user = [[NSUserDefaults standardUserDefaults] stringForKey:@"userfound"];
    NSLog(@"useris=%@",user);
    
    NSLog(@"JID=%@",[[NSUserDefaults standardUserDefaults] stringForKey:@"userID"]);
    
	isOpen = YES;
	NSError *error = nil;
    
    if ([user isEqualToString:@"userfound"]) {
        NSLog(@"LOGIN");
        [[self xmppStream] authenticateWithPassword:password error:&error];
        
    }
    
    else{
        NSLog(@"register");
        [[self xmppStream]  registerWithPassword:password error:&error];

        
	}
    
    
}

-(void)xmppStreamDidRegister:(XMPPStream *)sender {
    NSLog(@"akshay");
    NSError *error = nil;
    NSString *myPassword = [[NSUserDefaults standardUserDefaults] stringForKey:@"userPassword"];
    password=myPassword;
    [[self xmppStream] authenticateWithPassword:password error:&error];
    
	[[NSUserDefaults standardUserDefaults] setObject:@"userfound" forKey:@"userfound"];
	[[NSUserDefaults standardUserDefaults] synchronize];
    
    
}
- (void)xmppStreamDidAuthenticate:(XMPPStream *)sender {
	NSLog(@"authenticated");
	[self goOnline];
	
}


- (BOOL)xmppStream:(XMPPStream *)sender didReceiveIQ:(XMPPIQ *)iq {
	
	return NO;
	
}

- (void)xmppStream:(XMPPStream *)sender didReceiveMessage:(XMPPMessage *)message {
    NSString *jabberID = [[NSUserDefaults standardUserDefaults] stringForKey:@"userID"];
    
    
    
    
    NSString *msg = [[message elementForName:@"body"] stringValue];
    
    NSString *from = [[message attributeForName:@"from"] stringValue];
    
    NSString *to = [[message attributeForName:@"to"] stringValue];
    
    NSString *stamp = [[message attributeForName:@"stamp"] stringValue];
    
    
    
    
    
    NSLog(@"mmmm=%@",msg);
    
    NSLog(@"stamp=%@",stamp);
    
    
    
    
    
    if ([from componentsSeparatedByString:@"/"].count > 1)
        
    {
        
        NSArray *myArray = [from componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"/"]];
        
        GlobalClass *obj=[GlobalClass getInstance];
        
        obj.called=@"1";
        
        //   GlobalClass     *obj= [GlobalClass getInstance];
        
        
        
        if (obj.chatdata==nil) {
            
            obj.chatdata  = [[NSMutableArray alloc] init];
            
            
            
            
            
        }
        
        
        
        //    NSMutableDictionary *m = [[NSMutableDictionary alloc] init];
        
        //
        
        //    [m setObject:msg forKey:@"msg"];
        
        //    [m setObject:from forKey:@"from"];
        
        //
        
        //    [m setObject:[myArray objectAtIndex:1] forKey:@"sender"];
        
        
        
        
        
        
        
        //    NSRange range = [to rangeOfString:@"/"];
        
        //
        
        //    NSString *senderis = [to substringWithRange:NSMakeRange(0, range.location)];
        
        //    NSLog(@"%@",senderis);
        
        
        
        // NSString *myString = @"ABCDE*FGHI";
        
        //    NSString *senderis = [to substringWithRange: NSMakeRange(0, [to rangeOfString: @"/"].location)];
        
        //    NSLog(@"tofrom=%@",senderis);
        
        
        
        //    getmessage *second = [[getmessage alloc] init];
        
        //    second.msgDelegate=self;
        
        if (msg !=nil ) {
            
            
            
            
            
            
            
            
            
            
            
            
            
            NSLog(@"whatsthat=%@",[myArray objectAtIndex:1]);
            
            
            
            //        if ([[myArray objectAtIndex:1] isEqualToString:jabberID]) {
            
            //            NSLog(@"myself");
            
            //        }
            
            //
            
            //        else{
            
            NSMutableDictionary *m = [[NSMutableDictionary alloc] init];
            
            
            
            [m setObject:msg forKey:@"msg"];
            
            [m setObject:from forKey:@"from"];
            
            if (stamp!=nil) {
                
                [m setObject:stamp forKey:@"stamp"];
                
                
                
            }
            
            
            
            
            
            
            
            [m setObject:[myArray objectAtIndex:1] forKey:@"sender"];
            
            
            
            //   [m setObject:stamp forKey:@"stamp"];
            
            
            
            //        [_messageDelegate newMessageReceived:m];
            
            NSLog(@"dar=%@",m);
            
            
            
            [obj.chatdata addObject:m];
            
            //   [obj.chatdata addObjectsFromArray:array1];
            
            
            
            
            
            //    }
            
            
            
        }
        
        else{
            
            
            
            NSLog(@"null");
            
            
            
        }
        
        
        
        NSLog(@"arrrrrrr=%@", obj.chatdata);
        
        
        
        
        
        // obj.called=@"2";
        
    }
  }

- (void)xmppStream:(XMPPStream *)sender didReceivePresence:(XMPPPresence *)presence {
	NSLog(@"fetching user=%@",presence);
    
	NSString *presenceType = [presence type]; // online/offline
	NSString *myUsername = [[sender myJID] user];
	NSString *presenceFromUser = [[presence from] user];
	
	if (![presenceFromUser isEqualToString:myUsername]) {
		
		if ([presenceType isEqualToString:@"available"]) {
			
			//[_chatDelegate newBuddyOnline:[NSString stringWithFormat:@"%@@%@", presenceFromUser, @"u16930719.onlinehome-server.com"]];
			
		} else if ([presenceType isEqualToString:@"unavailable"]) {
			
		//	[_chatDelegate buddyWentOffline:[NSString stringWithFormat:@"%@@%@", presenceFromUser, @"u16930719.onlinehome-server.com"]];
			
		}
		
	}
	
    
    
}
- (void)xmppStream:(XMPPStream *)sender didSendMessage:(XMPPMessage *)message;
{
    NSLog(@"messagesent=%@",message);
}




@end
