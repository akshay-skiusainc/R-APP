

#import "ChatViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ChatCustomCell.h"

#define TOOLBARTAG		200
#define TABLEVIEWTAG	300


#define BEGIN_FLAG @"[/"
#define END_FLAG @"]"

@interface ChatViewController (Private)

- (void)bounceOutAnimationStopped;
- (void)bounceInAnimationStopped;

@end

@implementation ChatViewController
@synthesize titleString = _titleString;
@synthesize chatArray = _chatArray;
@synthesize chatTableView = _chatTableView;
@synthesize messageTextField = _messageTextField;
@synthesize phraseViewController = _phraseViewController;
@synthesize messageString = _messageString;
@synthesize phraseString = _phraseString;
@synthesize lastTime = _lastTime;
@synthesize passtag;
@synthesize basetempController;
@synthesize strFromLogin,groupname;

@synthesize xmppStream;
@synthesize xmppRoster,xmppReconnect,xmppRosterStorage,titlegroupname,titleL;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"chatviewcontroller reached");
    [self.chatArray removeAllObjects];
    NSLog(@"groupname=%@",groupname);
    titleL.text= titlegroupname;
    NSString    *STR= [NSString stringWithFormat:@"In %@ Screen",titlegroupname];
    self.trackedViewName=STR;

    activityIndicator = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    activityIndicator.center=CGPointMake(320/2, 430/2);
    activityIndicator.transform = CGAffineTransformMakeScale(2.0, 2.0);
    [activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [self.view addSubview:activityIndicator];
    [activityIndicator startAnimating];
    
    self.view.userInteractionEnabled=NO;
    GlobalClass *obj= [GlobalClass getInstance];
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

    AppDelegate *del = [self appDelegate];
	del._chatDelegate = self;
    
    //    if (! [[self appDelegate] connect]) {
    //        [[self appDelegate] connect];
    //    }
    
    
    if (! [[self appDelegate] connect]) {
        [[self appDelegate] connect];
        
        NSString *login = [[NSUserDefaults standardUserDefaults] objectForKey:@"userID"];
        NSLog(@"show  list%@",login);
        
        if (login) {
            //  self.view.userInteractionEnabled=YES;
            // [activityIndicator stopAnimating];
            
            
            //		if ([[self appDelegate] connect]) {
            //
            //			NSLog(@"show buddy list");
            //        //    [tView reloadData];
            //
            //		}
            
        } else {
            
            //  [self showLogin];
            //  self.view.userInteractionEnabled=YES;
            // [activityIndicator stopAnimating];
            
            
            
        }
        
        
    }
    
    
    
    //    CAGradientLayer *bgLayer1 = [BackgroundLayer blueGradient];
    //    bgLayer1.frame = portrait.bounds;
    //    [portrait.layer insertSublayer:bgLayer1 atIndex:0];
    //
    //    CAGradientLayer *bgLayer2 = [BackgroundLayer blueGradient];
    //    bgLayer2.frame = landScape.bounds;
    //    [landScape.layer insertSublayer:bgLayer2 atIndex:0];
    
    
      
    self.phraseViewController.chatViewController = self;
    //	//UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"+"
    //																  style:UIBarButtonItemStylePlain
    //																 target:self
    //																 action:nil];
	//self.navigationItem.rightBarButtonItem = rightItem;
	//[rightItem release];
    
    
   // self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"my_account_inner_bg.jpg"]];
    
	NSLog(@"passtag=%@",passtag);
    // Keyboard events
    
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardWillShowNotification object:nil];
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardWillHideNotification object:nil];
    UIImage *buttonImage = [UIImage imageNamed:@"c&c_top_back_btn.png"];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setImage:buttonImage forState:UIControlStateNormal];
    
    
    button.frame = CGRectMake(0, 0, buttonImage.size.width, buttonImage.size.height);
    
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    self.navigationItem.leftBarButtonItem = customBarItem;
   // self.navigationItem.title=@"Live Chat";
    
//    if ([passtag isEqualToString:@"4"]) {
//        self.navigationItem.title=@"Movie Conversation";
//    }
//    
//    else  if ([passtag isEqualToString:@"3"]) {
//        self.navigationItem.title=@"Bunny's Room";
//    }
//	
//    
//    else  if ([passtag isEqualToString:@"2"]) {
//        self.navigationItem.title=@"Naina's Room";
//    }
//	
//    
//    else  if ([passtag isEqualToString:@"1"]) {
//        self.navigationItem.title=@"Songs";
//    }
    
    
    
   	NSMutableArray *tempArray = [[NSMutableArray alloc] init];
	self.chatArray = tempArray;
	[tempArray release];
	
    NSMutableString *tempStr = [[NSMutableString alloc] initWithFormat:@""];
    self.messageString = tempStr;
    [tempStr release];
    
	NSDate   *tempDate = [[NSDate alloc] init];
	self.lastTime = tempDate;
	[tempDate release];
    
    
    //监听键盘高度的变换
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    // 键盘高度变化通知，ios5.0新增的
#ifdef __IPHONE_5_0
    float version = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (version >= 5.0) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillChangeFrameNotification object:nil];
    }
#endif
    
    
//    
//    if ([passtag isEqualToString:@"4"]) {
//        self.navigationItem.title=@"Movie Conversation";
//    }
//    
//    else  if ([passtag isEqualToString:@"3"]) {
//        self.navigationItem.title=@"Bunny's Room";
//    }
//	
//    
//    else  if ([passtag isEqualToString:@"2"]) {
//        self.navigationItem.title=@"Naina's Room";
//    }
//	
//    
//    else  if ([passtag isEqualToString:@"1"]) {
//        self.navigationItem.title=@"Songs";
//    }
//    
    
    /* dispatch_async(dispatch_get_global_queue(0, 0), ^{
     
     
     
     
     NSString *insertSQL = [NSString stringWithFormat:@"select count(*) FROM CHAT"];
     //	STARTROW=MAXID;
     
     
     [self getMaxID:insertSQL];
     if ([MAXID isEqualToString:@"0"]) {
     MAXID =[NSString stringWithFormat:@"0"];
     }
     
     
     else{
     NSString *insertSQL = [NSString stringWithFormat:@"select  MAX(ID) FROM CHAT"];
     //	STARTROW=MAXID;
     
     
     [self getMaxID:insertSQL];
     }
     
     
     GlobalClass *obj1=[GlobalClass getInstance];
     
     //post = [NSString stringWithFormat:@"http://apps.micrositeads.com/yjhd/chat/msg_group_reterive.php?groupid=%@&lastmsgid=%d",passtag,NumOfRows];
     //	post = [[NSString stringWithFormat:@"http://apps.micrositeads.com/yjhd/chat/msg_reterive.php?lastmsgid=%@&deviceno=%@&group_id=%@",MAXID,obj1.dev,passtag] retain];
     NSLog(@"post=%@",post);
     //http://apps.micrositeads.com/yjhd/chat/msg_reterive.php?lastmsgid=
     
     
     
     post = [[NSString stringWithFormat:@"lastmsgid=%@&deviceno=%@&group_id=%@",MAXID,obj1.dev,passtag] retain];
     
     [self loadChat];
     
     });
     */
    
    
    if (_timer == nil)
	{
        _timer =  [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(getchatdata) userInfo:nil repeats:YES];
        
        
        
        //[self performSelector:@selector(fetchAllData2) withObject:nil afterDelay:0.0];
	}
    
    
    //  [self performSelector:@selector(getchatdata) withObject:nil afterDelay:2.0];
    
    
    if (_timer2 == nil)
    {
        _timer2 =  [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(getstate) userInfo:nil repeats:YES];
        //
        //
        //
        //   [self performSelector:@selector(getstate) withObject:nil afterDelay:0.0];
    }
	
//    UIImage *relAppImage = [UIImage imageNamed:@"home_right_rel_icon.png"];
//    UIButton *buttonChat = [UIButton buttonWithType:UIButtonTypeCustom];
//    [buttonChat setImage:relAppImage forState:UIControlStateNormal];
//    buttonChat.frame = CGRectMake(0, 0, relAppImage.size.width, relAppImage.size.height);
//    [buttonChat addTarget:self action:@selector(toRelApp:) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *customBarItem1 = [[UIBarButtonItem alloc] initWithCustomView:buttonChat];
//    self.navigationItem.RightBarButtonItem = customBarItem1;
    

      buttonImage = [UIImage imageNamed:@"back-btn.png"];
        button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:buttonImage forState:UIControlStateNormal];
        button.frame = CGRectMake(0, 0, buttonImage.size.width, buttonImage.size.height);
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        customBarItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        self.navigationItem.leftBarButtonItem = customBarItem;
        

    [[NSUserDefaults standardUserDefaults] setObject:groupname forKey:@"GROUPNAME"];
    NSString *GROUPNAME = [[NSUserDefaults standardUserDefaults] stringForKey:@"GROUPNAME"];
    NSLog(@"GROUPNAME=%@",GROUPNAME);
    
    // Do any additional setup after loading the view from its nib.
}
-(IBAction)toRelApp:(UIButton *)sender
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Under construction" message:@"Check Back Soon" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    
}
-(void)back
{
    GlobalClass *obj=[GlobalClass getInstance];
obj.loggin=@"1";
    [self StopTimer];
    [[self appDelegate] teardownStream];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)group1
{
    
    NSString *jabberID = [[NSUserDefaults standardUserDefaults] stringForKey:@"userID"];
    //  NSString *ROOMID = [XMPPJID jidWithString:@"villan@conference.medialabs24x7.com"];
    
    XMPPRoomCoreDataStorage *rosterstorage = [[XMPPRoomCoreDataStorage alloc] init];
    XMPPRoom* xmppRoom = [[XMPPRoom alloc] initWithRoomStorage:rosterstorage jid:[XMPPJID jidWithString:groupname] dispatchQueue:dispatch_get_main_queue()];
    rosterstorage=nil;
    
    [xmppRoom leaveRoom];
    [xmppRoom deactivate];
    [xmppRoom removeDelegate:self];
    
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
        [xmppRoom inviteUser:xmppJID withMessage:@"Join Group1."];
    }
    
}

-(void)getstate
{
    NSLog(@"statereceiving");
    GlobalClass *obj=[GlobalClass getInstance];
    if ([obj.loggin isEqualToString:@"0"]) {
        self.view.userInteractionEnabled=YES;
        [_timer2 invalidate];
        _timer2=nil;
        [activityIndicator stopAnimating];
        
        
        if ([passtag isEqualToString:@"4"]) {
          //  self.navigationItem.title=@"Movie Conversation";
            [[self appDelegate] group1];
            
        }
        
        else  if ([passtag isEqualToString:@"3"]) {
           // self.navigationItem.title=@"Bunny's Room";
           // [[self appDelegate] group2];
            [[self appDelegate] group1];

            
        }
        
        
        else  if ([passtag isEqualToString:@"2"]) {
          //  self.navigationItem.title=@"Naina's Room";
            [[self appDelegate] group1];
            
        }
        
        
        else  if ([passtag isEqualToString:@"1"]) {
         //   self.navigationItem.title=@"Songs";
             [[self appDelegate] group1];
            
        }
        
        
        
    }
    
    else  if ([obj.loggin isEqualToString:@"2"]) {
        self.view.userInteractionEnabled=YES;
        [_timer2 invalidate];
        _timer2=nil;
        [activityIndicator stopAnimating];
        [self back];
        
    }
}



-(void)getchatdata
{
    GlobalClass *obj=[GlobalClass getInstance];

    if ([obj.loggin isEqualToString:@"0"]) {

    NSString *jabberID = [[NSUserDefaults standardUserDefaults] stringForKey:@"userID"];
    NSLog(@"jabberid=%@",jabberID);
    NSLog(@"getchatdata");
    GlobalClass *obj=[GlobalClass getInstance];
    
    if ([obj.called isEqualToString:@"1"]) {
        
        
        
        for (int i = 0; i<[obj.chatdata count]; i++) {
            
            
            NSDictionary* s=[obj.chatdata objectAtIndex:i];
            NSString *sender = [s objectForKey:@"sender"];
            NSString *message2 = [s objectForKey:@"msg"];
            NSString* message1;
            NSString* time;

            if ([message2 componentsSeparatedByString:@"~~"].count > 1)
                
            {

            NSArray* myArray = [message2  componentsSeparatedByString:@"~~"];
            
             message1 = [myArray objectAtIndex:0];
             time = [myArray objectAtIndex:1];
            
            }
            
            else{
             message1 = [s objectForKey:@"msg"];

            }
            
//            NSString *time = [s objectForKey:@"stamp"];
            NSLog(@"timetime=%@",time);
            
            NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init];
            [dateFormatter1 setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
//            dateFormatter1.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
//            [dateFormatter1 setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:3600*5.30]]; // GMT+5.30


            NSString *dateStr = time;
            NSDate *date = [dateFormatter1 dateFromString:dateStr];
            NSLog(@"Date : %@", date);
            
            
            if (date==nil) {
                date=[NSDate dateWithTimeIntervalSinceNow:0];
            }
            
            [self.chatArray addObject:date];
            
            NSArray *senderis = [sender componentsSeparatedByString:@"@"];
            
            // NSLog(@"tofrom1=%@",[senderis objectAtIndex:0]);
            
            if ([sender isEqualToString:jabberID]) {
                NSLog(@"myself");
                
                
                UIView *chatView = [self bubbleView:[NSString stringWithFormat:@"%@:%@", NSLocalizedString([senderis objectAtIndex:0],nil), message1]
                                               from:YES];
                [self.chatArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:message1, @"text", [senderis objectAtIndex:0], @"speaker", chatView, @"view", sender,@"messageid", nil]];
                
            }
            
            else{
                
                UIView *chatView = [self bubbleView:[NSString stringWithFormat:@"%@:%@", NSLocalizedString([senderis objectAtIndex:0],nil), message1]
                                               from:NO];
                [self.chatArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:message1, @"text", [senderis objectAtIndex:0], @"speaker", chatView, @"view", sender,@"messageid", nil]];
                
                
                
            }
            
            
            
            
            
            [self.chatTableView reloadData];
            [self.chatTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[self.chatArray count]-1 inSection:0]
                                      atScrollPosition: UITableViewScrollPositionBottom
                                              animated:YES];
            
            obj.called=@"2";
            
            
        }
        
        [obj.chatdata removeAllObjects];
    }
    
    
    else{
        
    }
        
    }
    
    
}
#pragma mark -
#pragma mark Chat delegates


- (void)newMessageReceived1:(NSDictionary *)messageContent {
	
    //	NSString *m = [messageContent objectForKey:@"msg"];
    //	NSLog(@"aaaaaaa=%@",m);
    //	[messageContent setObject:[m substituteEmoticons] forKey:@"msg"];
    //    [messageContent setObject:[m substituteEmoticons] forKey:@"from"];
    //
    //
    //
    //	[messageContent setObject:[NSString getCurrentTime] forKey:@"time"];
    //	[messages addObject:messageContent];
    //
    //    for (int i =0; i<[messages count]; i++) {
    //
    //
    //        NSDictionary *s = (NSDictionary *) [messages objectAtIndex:i];
    //        NSString *sender = [s objectForKey:@"sender"];
    //        NSString *message = [s objectForKey:@"msg"];
    //        NSString *time = [s objectForKey:@"time"];
    //
    //        UIView *chatView = [self bubbleView:[NSString stringWithFormat:@"%@:%@", NSLocalizedString(sender,nil), message]
    //                                       from:YES];
    //        [self.chatArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:message, @"text", sender, @"speaker", chatView, @"view", sender,@"messageid", nil]];
    //
    //        NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init];
    //		[dateFormatter1 setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    //
    //		NSString *dateStr = time;
    //		NSDate *date = [dateFormatter1 dateFromString:dateStr];
    //		NSLog(@"Date : %@", date);
    //
    //
    //		if (date==nil) {
    //			date=[NSDate dateWithTimeIntervalSinceNow:0];
    //		}
    //
    //        [self.chatArray addObject:date];
    //
    //        [self.chatTableView reloadData];
    //        [self.chatTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[self.chatArray count]-1 inSection:0]
    //                                  atScrollPosition: UITableViewScrollPositionBottom
    //                                          animated:YES];
    //
    //    }
    //
    //
    //    //	NSIndexPath *topIndexPath = [NSIndexPath indexPathForRow:messages.count-1
    //    //												   inSection:0];
    //    //
    //    //	[self.chatTableView scrollToRowAtIndexPath:topIndexPath
    //    //					  atScrollPosition:UITableViewScrollPositionMiddle
    //    //							  animated:YES];
}


- (AppDelegate *)appDelegate {
	return (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
}

- (XMPPStream *)xmppStream {
	return [[self appDelegate] xmppStream];
}

- (XMPPRoster *)xmppRoster {
	return [[self appDelegate] xmppRoster];
}

-(void)LOADdata
{
    //	NSString *insertSQL = [NSString stringWithFormat:@"select  USERNAME, MESSSAGE, DATE, TIME,ID,USERID FROM CHAT"];
    //
    //	[self getChat:insertSQL];
    //
	
    
	
    NSString *insertSQL = [NSString stringWithFormat:@"select count(*) FROM CHAT"];
	//	STARTROW=MAXID;
	
	
	[self getMaxID:insertSQL];
	if ([MAXID isEqualToString:@"0"]) {
		MAXID =[NSString stringWithFormat:@"0"];
	}
	
	
    else{
        NSString *insertSQL = [NSString stringWithFormat:@"select  MAX(ID) FROM CHAT"];
        //	STARTROW=MAXID;
        
        
        [self getMaxID:insertSQL];
    }
	
    
    GlobalClass *obj1=[GlobalClass getInstance];

	//post = [NSString stringWithFormat:@"http://apps.micrositeads.com/yjhd/chat/msg_group_reterive.php?groupid=%@&lastmsgid=%d",passtag,NumOfRows];
//	post = [[NSString stringWithFormat:@"http://apps.micrositeads.com/yjhd/chat/msg_reterive.php?lastmsgid=%@&deviceno=%@&group_id=%@",MAXID,obj1.dev,passtag] retain];
	NSLog(@"post=%@",post);
	//http://apps.micrositeads.com/yjhd/chat/msg_reterive.php?lastmsgid=
    
    
	
    post = [[NSString stringWithFormat:@"lastmsgid=%@&deviceno=%@&group_id=%@",MAXID,obj1.dev,passtag] retain];

	
	//	[self loadChat];
	
	activityIndicator = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
	activityIndicator.center=CGPointMake(320/2, 460/2);
	// activityIndicator.transform = CGAffineTransformMakeScale(2.0, 2.0);
	[activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
	[self.view addSubview:activityIndicator];
	[activityIndicator startAnimating];
	
	
	
	[self performSelector:@selector(fetchAllData) withObject:nil afterDelay:0.0];
    
	
}


-(void)fetchAllData
{
	dispatch_async(dispatch_get_global_queue(0, 0), ^{
		
		//	NSString* post = [NSString stringWithFormat:@"http://apps.micrositeads.com/yjhd/fetch_data_all_news.php"];
		
		
		
	/*	NSLog(@"post=%@",post);
		
		
		NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:post] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:1.0];
		
		
		
		[request setHTTPMethod:@"GET"];
		[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Current-Type"];
		NSError *errorReturned = nil;
		NSURLResponse *theResponse =[[NSURLResponse alloc]init];
		NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&theResponse error:&errorReturned];
		
		
		if (errorReturned) {
			NSLog(@"errorReturned=%@",errorReturned);
			
			
			//			UIAlertView* alertBox = [[ UIAlertView alloc]initWithTitle:@"Network Error" message:@"Network Not Connected" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Retry", nil ];
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
			
			
			//		NSURLResponse *response;
			//		NSData *urlData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
			//		NSString *stringResponse = [[NSString alloc] initWithData:urlData encoding:NSASCIIStringEncoding];
			//		NSLog(@"response1=%@",stringResponse);
			//
			//		//
			//		////
			//		NSArray *responseDict = [stringResponse JSONValue];
			
			//	for (NSDictionary *actoAgent in responseDict){
			
			
			// NSLog(@"json: %@", json); //3
			
			
			
			
			//for (NSDictionary *actoAgent in responseDict){
			
			
			NSDictionary* responsecheck = [[json objectForKey:@"chat"] objectAtIndex:0]; //2
			
			NSLog(@"responsecheck=%@",responsecheck);
			
			
			NSString	*response=[responsecheck objectForKey:@"response"];
			NSLog(@"response=%@", response);
			
			
			if ([response isEqualToString:@"PASS"]) {
				
				getthedata = [[[json objectForKey:@"chat"] objectAtIndex:1] retain]; //2
				
				NSLog(@"json=%@",getthedata);
				
				//	NSDictionary* fetched = [json objectForKey:@"interview"]; //2
            }
			
			else
			{
				
			}
		}
		*/
		
		
		
		
		dispatch_async(dispatch_get_main_queue()	, ^{
			
       /*     NSString *q1 = [NSString stringWithFormat:@"select BLOCKEDUSERID From BLOCKUSER"];
            [self displayBlockeduser:q1];
            
			int i=0;
			for (NSDictionary *actoAgent in getthedata)
			{
				
				
				data1[i] =[[actoAgent objectForKey:@"message"] retain];
				NSLog(@"message=%@", data1[i]);
				
				data2[i] =[[actoAgent objectForKey:@"msg_date"] retain];
				NSLog(@"msg_date=%@", data2[i]);
				
				
				data3[i] =[[actoAgent objectForKey:@"id"] retain];
				NSLog(@"id=%@", data3[i]);
				
				data4[i] =[[actoAgent objectForKey:@"user_name"] retain];
				NSLog(@"user_name=%@", data4[i]);
				
				
				data5[i] =[[actoAgent objectForKey:@"groupid"] retain];
				NSLog(@"groupid=%@", data5[i]);
				
				data6[i] =[[actoAgent objectForKey:@"msg_time"] retain];
				NSLog(@"msg_time=%@", data6[i]);
				
				data7[i] =[[actoAgent objectForKey:@"userid"] retain];
				NSLog(@"userid=%@", data7[i]);
				
				
				if (totalblockedusers>0) {
                
				
                for (int k=0; k<totalblockedusers; k++) {
                    
                    NSLog(@"1Z");
                    if ([data7[i] isEqualToString:Blockedusers[k]]) {
                        
                    }
                    
                    else
                    {
                        NSLog(@"2Z");

                        NSString *insertSQL9 = [NSString stringWithFormat: @"INSERT INTO CHAT (ID , GROUPID , USERNAME ,  MESSSAGE , DATE ,  TIME, USERID ) VALUES (\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\")", data3[i], data5[i], data4[i],data1[i], data2[i] ,data6[i],data7[i]];
                        NSLog(@"ins%@",insertSQL9);
                        [self saveData:insertSQL9];
                    }
                }
				}
                
                
                else{
                    NSLog(@"3Z");

                    NSString *insertSQL9 = [NSString stringWithFormat: @"INSERT INTO CHAT (ID , GROUPID , USERNAME ,  MESSSAGE , DATE ,  TIME, USERID ) VALUES (\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\")", data3[i], data5[i], data4[i],data1[i], data2[i] ,data6[i],data7[i]];
                    NSLog(@"ins%@",insertSQL9);
                    [self saveData:insertSQL9];

                    
                }
				
				MAXID=[[NSString stringWithFormat:@"%d",i] retain];
				i++;
			}
			totalrows=i;
			
			
            */
			
			[self loadChat];
			//[bubbleTable reloadData];
		});
		
	});
}




-(void)loadChat
{
	//[activityIndicator	 stopAnimating];
    //	heyBubble[0] = [NSBubbleData dataWithText:@"Hey, halloween is soon" date:[NSDate dateWithTimeIntervalSinceNow:-300] type:BubbleTypeSomeoneElse];
    //	heyBubble[0].avatar = [UIImage imageNamed:@"avatar1.png"];
    //
    //	//    NSBubbleData *photoBubble = [NSBubbleData dataWithImage:[UIImage imageNamed:@"halloween.jpg"] date:[NSDate dateWithTimeIntervalSinceNow:-290] type:BubbleTypeSomeoneElse];
    //	//    photoBubble.avatar = [UIImage imageNamed:@"avatar1.png"];
    //
    //	heyBubble[1] = [NSBubbleData dataWithText:@"Wow.. Really cool picture out there. iPhone 5 has really nice camera, yeah?" date:[NSDate dateWithTimeIntervalSinceNow:-5] type:BubbleTypeMine];
    //	heyBubble[1].avatar = nil;
    //
	//   bubbleData = [[NSMutableArray alloc] initWithObjects:heyBubble[0], heyBubble[1], nil];
    //	bubbleData = [[NSMutableArray alloc] init];
	
	
    //	NSString *insertSQL = [NSString stringWithFormat:@"select  USERNAME, MESSSAGE, DATE, TIME,ID FROM CHAT ORDER BY ID DESC WHERE GROUPID=%@",passtag];
	
	NSString *insertSQL = [NSString stringWithFormat:@"SELECT USERNAME,MESSSAGE,DATE,TIME,ID,USERID FROM CHAT where GROUPID=%@ ORDER BY ID ASC",passtag];
    
    //	NSString *q = [NSString stringWithFormat:@"select NAME From USER WHERE ID=1"];
    //	[self displayAll:q];
    
	
	
	[self getChat:insertSQL];
	
	
	
	getrows=NumOfRows;
	for (int i=0; i<NumOfRows; i++) {
        //		NSString	*str= [NSString stringWithFormat:@"%@",data1[i]];
		
		NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init];
		[dateFormatter1 setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
		
		NSString *dateStr = DATE[i];
		NSDate *date = [dateFormatter1 dateFromString:dateStr];
		NSLog(@"Date : %@", date);
		
		
		if (date==nil) {
			date=[NSDate dateWithTimeIntervalSinceNow:0];
		}
        
        [self.chatArray addObject:date];

		NSString	*messagedata= [NSString stringWithFormat:@"%@",MESSAGE[i]];
        NSString    *usernameis= [NSString stringWithFormat:@"%@",USERNAME[i]];
        NSString    *useridis= [NSString stringWithFormat:@"%@",USERID[i]];
        NSString    *MESSIDIS= [NSString stringWithFormat:@"%@",MESSAGEID[i]];


		
		if ([USERID[i] isEqualToString:MobileNo]) {
            
            myusername= [[NSString stringWithFormat:@"%@",USERNAME[i]] retain];
            UIView *chatView = [self bubbleView:[NSString stringWithFormat:@"%@:%@", NSLocalizedString(usernameis,nil), messagedata]
                                           from:YES];
            [self.chatArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:messagedata, @"text", useridis, @"speaker", chatView, @"view", MESSIDIS,@"messageid", nil]];

            
            
            
            
            [self.chatTableView reloadData];
            [self.chatTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[self.chatArray count]-1 inSection:0]
                                      atScrollPosition: UITableViewScrollPositionBottom 
                                              animated:YES];

            
			            
		}
		
		else{
            UIView *chatView = [self bubbleView:[NSString stringWithFormat:@"%@:%@", NSLocalizedString(usernameis,nil), messagedata]
                                           from:NO];
            [self.chatArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:messagedata, @"text", useridis, @"speaker", chatView, @"view", MESSIDIS,@"messageid", nil]];
            
            
            
            
            [self.chatTableView reloadData];
            [self.chatTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[self.chatArray count]-1 inSection:0]
                                      atScrollPosition: UITableViewScrollPositionBottom
                                              animated:YES];
		}
		//[bubbleData addObject:heyBubble[i]];
		//[bubbleTable reloadData];
        
	}
	//	[bubbleData addObject:heyBubble[0]];
	//	[bubbleData addObject:heyBubble[1]];
	
	
		
 	
	//	[self loadChat];
	
	if (_timer == nil)
	{
        _timer =  [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(BEGINGASYNCPROCESS) userInfo:nil repeats:YES];
        
        
        
        //[self performSelector:@selector(fetchAllData2) withObject:nil afterDelay:0.0];
	}
}


-(void)BEGINGASYNCPROCESS
{
    NSString *insertSQL1 = [NSString stringWithFormat:@"select count(*) FROM CHAT"];
	//	STARTROW=MAXID;
	
	[self getMaxID:insertSQL1];
	if ([MAXID isEqualToString:@"0"]) {
		MAXID =[NSString stringWithFormat:@"0"];
	}
	
	
	else{
		//	STARTROW=MAXID;
		
		NSString *insertSQL2 = [NSString stringWithFormat:@"select  MAX(ID) FROM CHAT"];
        
		[self getMaxID:insertSQL2];
	}
    
	
    //	NSString *insertSQL1 = [NSString stringWithFormat:@"select  MAX(ID) FROM CHAT"];
    //
    //
    //	[self getMaxID:insertSQL1];
    
    
	
    //	NSString *insertSQL1 = [NSString stringWithFormat:@"select  MAX(ID) FROM CHAT"];
    //
    //
    //	[self getMaxID:insertSQL1];
    
    int a = [MAXID integerValue];
   // a=a+1;
    NSLog(@"a=%d",a);

    
    GlobalClass *obj1=[GlobalClass getInstance];
    
	//post = [[NSString stringWithFormat:@"http://apps.micrositeads.com/yjhd/chat/msg_reterive.php?lastmsgid=%@&deviceno=%@&group_id=%@",MAXID,obj1.dev,passtag] retain];
	
    
    post = [[NSString stringWithFormat:@"lastmsgid=%d&deviceno=%@&group_id=%@",a,obj1.dev,passtag] retain];
    
    [self performSelector:@selector(fetchAllData2) withObject:nil afterDelay:0.0];
    
	//http://apps.micrositeads.com/yjhd/chat/msg_reterive.php?lastmsgid=
	
    
    
	

}

-(void)fetchAllData2
{
	dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        //	NSString* post = [NSString stringWithFormat:@"http://apps.micrositeads.com/yjhd/fetch_data_all_news.php"];
        
        
        
        NSLog(@"POST=%@",post);
        
        //	dispatch_async(dispatch_get_main_queue()	, ^{
        
        
        
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        
        [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://apps.micrositeads.com/yjhd/chat/msg_reterive.php"]]];
        [request setHTTPMethod:@"POST"];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Current-Type"];
        [request setHTTPBody:postData];
        
//        NSURLResponse *response;
//        NSData *urlData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
//        NSString *stringResponse = [[NSString alloc] initWithData:urlData encoding:NSASCIIStringEncoding];
//        NSLog(@"response1=%@",stringResponse);
//        
//        
//        NSError* error;
//        NSDictionary* responseDict = [NSJSONSerialization JSONObjectWithData:urlData //1
//                                                                     options:kNilOptions
//                                                                       error:&error];
//        
//        NSLog(@"respnse=%@",responseDict);
        

        NSError *errorReturned = nil;
        NSURLResponse *theResponse =[[NSURLResponse alloc]init];
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&theResponse error:&errorReturned];
        
        
        if (errorReturned) {
            NSLog(@"errorReturned=%@",errorReturned);
            
            
            //			UIAlertView* alertBox = [[ UIAlertView alloc]initWithTitle:@"Network Error" message:@"Network Not Connected" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Retry", nil ];
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
            
            
            //		NSURLResponse *response;
            //		NSData *urlData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
            //		NSString *stringResponse = [[NSString alloc] initWithData:urlData encoding:NSASCIIStringEncoding];
            //		NSLog(@"response1=%@",stringResponse);
            //
            //		//
            //		////
            //		NSArray *responseDict = [stringResponse JSONValue];
            
            //	for (NSDictionary *actoAgent in responseDict){
            
            
            // NSLog(@"json: %@", json); //3
            
            
            
            
            //for (NSDictionary *actoAgent in responseDict){
            
            
            NSDictionary* responsecheck = [[json objectForKey:@"chat"] objectAtIndex:0]; //2
            
            NSLog(@"responsecheck=%@",responsecheck);
            
            
            NSString	*response=[responsecheck objectForKey:@"response"];
            NSLog(@"response=%@", response);
            
            
            if ([response isEqualToString:@"PASS"]) {
                
                getthedata = [[[json objectForKey:@"chat"] objectAtIndex:1] retain]; //2
                
                NSLog(@"json=%@",getthedata);
                
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    
                    
                    [self BuildDisplay];
                    
                });
                
                
                //	NSDictionary* fetched = [json objectForKey:@"interview"]; //2
            }
            else
            {
                
            }
        }
        
	});
    
	
	//	dispatch_async(dispatch_get_main_queue()	, ^{
	
	//[bubbleTable reloadData];
	
    
}


-(void)BuildDisplay
{
    
    NSString *q1 = [NSString stringWithFormat:@"select BLOCKEDUSERID From BLOCKUSER"];
    [self displayBlockeduser:q1];
	int i=0;
	for (NSDictionary *actoAgent in getthedata)
	{
		
		
		
        data1[i] =[[actoAgent objectForKey:@"message"] retain];
        NSLog(@"message=%@", data1[i]);
        
        data2[i] =[[actoAgent objectForKey:@"msg_date"] retain];
        NSLog(@"msg_date=%@", data2[i]);
        
        
        data3[i] =[[actoAgent objectForKey:@"id"] retain];
        NSLog(@"id=%@", data3[i]);
        
        data4[i] =[[actoAgent objectForKey:@"user_name"] retain];
        NSLog(@"user_name=%@", data4[i]);
        
        
        data5[i] =[[actoAgent objectForKey:@"groupid"] retain];
        NSLog(@"groupid=%@", data5[i]);
        
        data6[i] =[[actoAgent objectForKey:@"msg_time"] retain];
        NSLog(@"msg_time=%@", data6[i]);
        
        data7[i] =[[actoAgent objectForKey:@"userid"] retain];
        NSLog(@"userid=%@", data7[i]);
        
        
      
        
        if (totalblockedusers>0) {
            
            
            for (int k=0; k<totalblockedusers; k++) {
                
                if ([data7[i] isEqualToString:Blockedusers[k]]) {
                    NSLog(@"1Z");
                    NSLog(@"Blockedusersis=%@",Blockedusers[k] );

                    NSLog(@"USERBLOCKEDis=%@",data7[i] );
                }
                
                else
                {
                    NSLog(@"2Z");
                    
                    NSString *insertSQL9 = [NSString stringWithFormat: @"INSERT INTO CHAT (ID , GROUPID , USERNAME ,  MESSSAGE , DATE ,  TIME, USERID ) VALUES (\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\")", data3[i], data5[i], data4[i],data1[i], data2[i] ,data6[i],data7[i]];
                    NSLog(@"ins%@",insertSQL9);
                    [self saveData:insertSQL9];
                }
            }
        }
        
        
        else{
            NSLog(@"3Z");
            
            NSString *insertSQL9 = [NSString stringWithFormat: @"INSERT INTO CHAT (ID , GROUPID , USERNAME ,  MESSSAGE , DATE ,  TIME, USERID ) VALUES (\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\")", data3[i], data5[i], data4[i],data1[i], data2[i] ,data6[i],data7[i]];
            NSLog(@"ins%@",insertSQL9);
            [self saveData:insertSQL9];
            
            
        }
        
        MAXID=[[NSString stringWithFormat:@"%d",i] retain];
        i++;
    }
    totalrows=i;
	
	
	
	NSString *insertSQL = [NSString stringWithFormat:@"SELECT USERNAME,MESSSAGE,DATE,TIME,ID,USERID FROM CHAT where GROUPID=%@ ORDER BY ID ASC",passtag];
	
	//	NSString *q = [NSString stringWithFormat:@"select NAME From USER WHERE ID=1"];
	//	[self displayAll:q];
	
	
	
	[self getChat:insertSQL];
	
	NSLog(@"getrows=%d",getrows);
	NSLog(@"NumOfRows=%d",NumOfRows);
	
	
	
	for (int i=getrows; i<NumOfRows; i++) {
		NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init];
		[dateFormatter1 setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
		
		NSString *dateStr = DATE[i];
		NSDate *date = [dateFormatter1 dateFromString:dateStr];
		NSLog(@"Date : %@", date);
		
		
		if (date==nil) {
			date=[NSDate dateWithTimeIntervalSinceNow:0];
		}
        
        [self.chatArray addObject:date];
        
		NSString	*messagedata= [NSString stringWithFormat:@"%@",MESSAGE[i]];
        NSString    *usernameis= [NSString stringWithFormat:@"%@",USERNAME[i]];
        NSString    *useridis= [NSString stringWithFormat:@"%@",USERID[i]];
        NSString    *MESSIDIS= [NSString stringWithFormat:@"%@",MESSAGEID[i]];
		
		if ([USERID[i] isEqualToString:MobileNo]) {
            
            
            UIView *chatView = [self bubbleView:[NSString stringWithFormat:@"%@:%@", NSLocalizedString(usernameis,nil), messagedata]
                                           from:YES];
            [self.chatArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:messagedata, @"text", useridis, @"speaker", chatView, @"view", MESSIDIS,@"messageid", nil]];
            
            
            
            [self.chatTableView reloadData];
            [self.chatTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[self.chatArray count]-1 inSection:0]
                                      atScrollPosition: UITableViewScrollPositionBottom
                                              animated:YES];
            
            
            
		}
		
		else{
            UIView *chatView = [self bubbleView:[NSString stringWithFormat:@"%@:%@", NSLocalizedString(usernameis,nil), messagedata]
                                           from:NO];
            [self.chatArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:messagedata, @"text", useridis, @"speaker", chatView, @"view", MESSIDIS,@"messageid", nil]];
            
            
            
            
            [self.chatTableView reloadData];
            [self.chatTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[self.chatArray count]-1 inSection:0]
                                      atScrollPosition: UITableViewScrollPositionBottom
                                              animated:YES];
		}
		//[bubbleData addObject:heyBubble[i]];
		//[bubbleTable reloadData];
        
	}
	//	[bubbleData addObject:heyBubble[0]];
	//	[bubbleData addObject:heyBubble[1]];
	//	[bubbleData addObject:heyBubble[0]];
	//	[bubbleData addObject:heyBubble[1]];
	
	
		getrows=NumOfRows;
	
	
    
}


-(void) dismissSelf{
    [self dismissModalViewControllerAnimated:YES];
}
-(void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:YES];
    
    backcheck=@"2";
    

    if ([passtag isEqualToString:@"4"]) {
  //      self.navigationItem.title=@"Movie Conversation";
    }
    
    else  if ([passtag isEqualToString:@"3"]) {
  //      self.navigationItem.title=@"Bunny's Room";
    }
	
    
    else  if ([passtag isEqualToString:@"2"]) {
    //    self.navigationItem.title=@"Naina's Room";
    }
	
    
    else  if ([passtag isEqualToString:@"1"]) {
    //    self.navigationItem.title=@"Songs";
    }
    
	//[self openUDPServer];
	
	[self.messageTextField setText:self.messageString];
	[self.chatTableView reloadData];
}


- (void)StopTimer
{
    //	if (_timer != nil)
    //	{
    [_timer invalidate];
    _timer = nil;
    //	}
}

-(void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:YES];
    
    if ([backcheck isEqualToString:@"1"]) {
        
        
        [self StopTimer];

    }
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
  
}


- (void)dealloc {
	[_lastTime release];
	[_phraseString release];
	[_messageString release];
	[_phraseViewController release];
	[_messageTextField release];
	[_chatArray release];
	[_titleString release];
	[_chatTableView release];
    
    [super dealloc];
}


-(IBAction)sendMessage_Click:(id)sender
{
    //   [self StopTimer];
	messageStr = self.messageTextField.text;
    self.messageString = self.messageTextField.text;
    
    if ([messageStr isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sending failed！" message:@"Please Enter Something" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
        [alert show];
        [alert release];
    }
    //    }else
    //    {
    
    //    }
    
    else {
        //dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        //            dispatch_async(dispatch_get_global_queue(0, 0), ^{
        //              //  [self sendMassage:messageStr];
        //
        //                NSString*   sendstring = [messageStr stringByReplacingOccurrencesOfString:@"&" withString:@"~1*"];
        //
        //
        //                NSString	*str = [NSString stringWithFormat:@"userid=%@&groupid=%@&message=%@",MobileNo,passtag,sendstring];
        //
        //                [self Posting:str];
        //
        //
        //            });
        
//        NSString    *groupname;
//        
//        if ([passtag isEqualToString:@"4"]) {
//            NSLog(@"group1");
//            self.navigationItem.title=@"Movie Conversation";
//            groupname= [[NSString stringWithFormat:@"movieconversation@conference.u16930719.onlinehome-server.com"] retain];
//        }
//        
//        else  if ([passtag isEqualToString:@"3"]) {
//            self.navigationItem.title=@"Bunny's Room";
//            groupname= [[NSString stringWithFormat:@"movieconversation@conference.u16930719.onlinehome-server.com"] retain];
//            
//        }
//        
//        
//        else  if ([passtag isEqualToString:@"2"]) {
//            self.navigationItem.title=@"Naina's Room";
//            groupname= [[NSString stringWithFormat:@"movieconversation@conference.u16930719.onlinehome-server.com"] retain];
//            
//        }
//        
//        
//        else  if ([passtag isEqualToString:@"1"]) {
//            self.navigationItem.title=@"Songs";
//            groupname= [[NSString stringWithFormat:@"movieconversation@conference.u16930719.onlinehome-server.com"] retain];
//            
//        }
        
        
        NSString *messageStr = self.messageTextField.text;
        
        // if([messageStr length] > 0) {
        NSString *myString = [[NSUserDefaults standardUserDefaults] stringForKey:@"userID"];
        
        
        
        NSString * jabberID = [myString stringByReplacingOccurrencesOfString:@"@u16930719.onlinehome-server.com" withString:@""];
        
       // NSLog(@"%@xx",jabberID);
        NSLog(@"chatuser=%@",jabberID);
        
        
        
        NSDate *date = [NSDate date];
        //    NSLog(@"DATEIS=%@",date);
        //
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
        [dateFormat setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
        //        dateFormat.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
//        [dateFormat setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:3600*5.30]]; // GMT+5.30
        
        NSString *dateString = [dateFormat stringFromDate:date];
//        NSString    *str=[NSString stringWithFormat:@"2013-08-04 03:53:31"];
        //

        
        NSString *sendthisText = [NSString stringWithFormat:@"%@~~%@",self.messageTextField.text,dateString];

        NSXMLElement *body = [NSXMLElement elementWithName:@"body"];
//        [body setStringValue:self.messageTextField.text];
        [body setStringValue:sendthisText];

        
        NSXMLElement *message = [NSXMLElement elementWithName:@"message"];
        [message addAttributeWithName:@"type" stringValue:@"groupchat"];
        //    [message addAttributeWithName:@"to" stringValue:chatWithUser];
        [message addAttributeWithName:@"from" stringValue:jabberID];
        
        [message addAttributeWithName:@"to" stringValue:groupname];
        
                    NSLog(@"DATEIS1=%@",dateString);

        
        
        [message addAttributeWithName:@"stamp" stringValue:dateString];

        
//      NSString *stamp = [[message attributeForName:@"stamp"] stringValue];

        
        [message addChild:body];
        
        
        
        [self.xmppStream sendElement:message];
        //   [self.xmppStream sendElement:message];
        
        //    [self sendMassage:messageStr];
        
        //            NSMutableDictionary *m = [[NSMutableDictionary alloc] init];
        //            [m setObject:[messageStr substituteEmoticons] forKey:@"msg"];
        //            [m setObject:@"you" forKey:@"sender"];
        //            [m setObject:[NSString getCurrentTime] forKey:@"time"];
        //
        //
        //            [messages addObject:m];
        //  [self.chatTableView reloadData];
        
        
        //        XMPPRoomCoreDataStorage *rosterstorage = [[XMPPRoomCoreDataStorage alloc] init];
        //
        //        XMPPRoom* xmppRoom = [[XMPPRoom alloc] initWithRoomStorage:rosterstorage jid:[XMPPJID jidWithString:@"Director_Cut@conference.medialabs24x7.com"] dispatchQueue:dispatch_get_main_queue()];
        //        [xmppRoom activate:[self xmppStream]];
        //        [xmppRoom joinRoomUsingNickname:chatWithUser history:nil];
        //
        ////        [xmppRoom fetchConfigurationForm];
        //        [xmppRoom configureRoomUsingOptions:nil];
        //        [xmppRoom addDelegate:self  delegateQueue:dispatch_get_main_queue()];
        //        XMPPJID *xmppJID=[XMPPJID jidWithString:chatWithUser];
        //        [xmppRoom inviteUser:xmppJID withMessage:@"Join Group1."];
        //        [xmppRoom sendMessage:messageStr];
        
        
        // }
        
        //            NSIndexPath *topIndexPath = [NSIndexPath indexPathForRow:messages.count-1
        //                                                           inSection:0];
        //
        //            [self.tView scrollToRowAtIndexPath:topIndexPath
        //                              atScrollPosition:UITableViewScrollPositionMiddle
        //                                      animated:YES];
        //
    }
	self.messageTextField.text = @"";
    self.messageString = self.messageTextField.text;
	[_messageTextField resignFirstResponder];
    
    
}


-(void)Posting:(NSString *)post
{
    //post = [NSString stringWithFormat:@"phone=%@&email=%@",@"null",@"null"];
	
	
	
	//post = [NSString stringWithFormat:@"phone=%@&email=%@",@"1234567890",@"rohan.k@skiusainc.com"];
	NSLog(@"POST=%@",post);
	
	//	dispatch_async(dispatch_get_main_queue()	, ^{
	
	
	
	NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
	NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
	
	[request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://apps.micrositeads.com/yjhd/chat/msg_save.php"]]];
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
    
    
	//
	////
	//NSArray *responseDict = [stringResponse JSONValue];
	
	//	for (NSDictionary *actoAgent in responseDict){
	//
	//		NSString  *response1 =[actoAgent objectForKey:@"response"];
	
	//		responseD = [NSString stringWithFormat:@"%@",response1];
	//
	//		NSLog(@"response=%@",response1);
	
    //	UIAlertView* logoutalertbox = [[ UIAlertView alloc]initWithTitle:@"Success" message:@"Your comment is submited" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil ];
    //	logoutalertbox.delegate=self;
    //	[logoutalertbox show];
	
	check=1;
	    
	
    //	post = [NSString stringWithFormat:@"http://apps.micrositeads.com/yjhd/chat/msg_reterive.php?lastmsgid=%d",NumOfRows];
    //
    //	//http://apps.micrositeads.com/yjhd/chat/msg_reterive.php?lastmsgid=
    //
    //	
    //	
    //	//	[self loadChat];
    //	
    //		
    //	
    //	[self performSelector:@selector(fetchAllData2) withObject:nil afterDelay:0.0];
    
//    GlobalClass *obj1=[GlobalClass getInstance];
//    
//    NSString *insertSQL2 = [NSString stringWithFormat:@"select  MAX(ID) FROM CHAT"];
//    
//    [self getMaxID:insertSQL2];
//    
//	post = [[NSString stringWithFormat:@"lastmsgid=%@&deviceno=%@&group_id=%@",MAXID,obj1.dev,passtag] retain];
//	
	//http://apps.micrositeads.com/yjhd/chat/msg_reterive.php?lastmsgid=
	
	
	//[self performSelector:@selector(BEGINGASYNCPROCESS) withObject:nil afterDelay:0.0];
	//	[self loadChat];
	
//	if (_timer == nil)
//	{
//      //  _timer =  [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(BEGINGASYNCPROCESS) userInfo:nil repeats:YES];
//        
//        
//        
//        //[self performSelector:@selector(fetchAllData2) withObject:nil afterDelay:0.0];
//	}
//
//    [self.chatArray removeLastObject];

}



-(void)sendMassage:(NSString *)message
{   
    
	  
    
	NSDate *nowTime = [NSDate date];
	
	NSMutableString *sendString=[NSMutableString stringWithCapacity:100];
	[sendString appendString:message];
	//开始发送

   	
	if ([self.chatArray lastObject] == nil) {
		self.lastTime = nowTime;
		[self.chatArray addObject:nowTime];
	}
	// 发送后生成泡泡显示出来
	NSTimeInterval timeInterval = [nowTime timeIntervalSinceDate:self.lastTime];
	if (timeInterval >5) {
		self.lastTime = nowTime;
		[self.chatArray addObject:nowTime];
	}	
  //  UIView *chatView = [self bubbleView:[NSString stringWithFormat:@"%@:%@", NSLocalizedString(@"me",nil), message]
	//							   from:YES];
//	[self.chatArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:message, @"text", @"self", @"speaker", chatView, @"view", nil]];
//    
//
//	[self.chatTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[self.chatArray count]-1 inSection:0] 
//							  atScrollPosition: UITableViewScrollPositionBottom 
//									  animated:YES];
//    
    
    UIView *chatView = [self bubbleView:[NSString stringWithFormat:@"%@:%@", NSLocalizedString(MobileNo,nil), message] from:YES];
    [self.chatArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:message, @"text", myusername, @"speaker", chatView, @"view", @"0",@"messageid", nil]];
    
	[self.chatTableView reloadData];
    [self.chatTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[self.chatArray count]-1 inSection:0]
                              atScrollPosition: UITableViewScrollPositionBottom
                                      animated:YES];

    
}
//选择系统表情
-(IBAction)showPhraseInfo:(id)sender
{
    self.messageString =[NSMutableString stringWithFormat:@"%@",self.messageTextField.text];
	[self.messageTextField resignFirstResponder];
	if (self.phraseViewController == nil) {
		FaceViewController *temp = [[FaceViewController alloc] initWithNibName:@"FaceViewController" bundle:nil];
		self.phraseViewController = temp;
		[temp release];
	}
	[self presentModalViewController:self.phraseViewController animated:YES];
}


/*
 生成泡泡UIView
 */
#pragma mark -
#pragma mark Table view methods
- (UIView *)bubbleView:(NSString *)text from:(BOOL)fromSelf {
	// build single chat bubble cell with given text
    UIView *returnView =  [self assembleMessageAtIndex:text from:fromSelf];
    returnView.backgroundColor = [UIColor clearColor];
    UIView *cellView = [[UIView alloc] initWithFrame:CGRectZero];
    cellView.backgroundColor = [UIColor clearColor];
    
	UIImage *bubble = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:fromSelf?@"bubbleMine":@"bubbleSomeone" ofType:@"png"]];
	UIImageView *bubbleImageView = [[UIImageView alloc] initWithImage:[bubble stretchableImageWithLeftCapWidth:20 topCapHeight:14]];
    
       UIImageView *headImageView = [[UIImageView alloc] init];
    
    if(fromSelf){
        [headImageView setImage:[UIImage imageNamed:@"profile_none.png"]];
        returnView.frame= CGRectMake(9.0f, 15.0f, returnView.frame.size.width, returnView.frame.size.height);
        bubbleImageView.frame = CGRectMake(0.0f, 14.0f, returnView.frame.size.width+27.0f, returnView.frame.size.height+27.0f );
        cellView.frame = CGRectMake(265.0f-bubbleImageView.frame.size.width, 0.0f,bubbleImageView.frame.size.width+54.0f, bubbleImageView.frame.size.height+34.0f);
        headImageView.frame = CGRectMake(bubbleImageView.frame.size.width, cellView.frame.size.height-54.0f, 54.0f, 54.0f);
    }
	else{
        [headImageView setImage:[UIImage imageNamed:@"profile_none.png"]];
        returnView.frame= CGRectMake(65.0f, 15.0f, returnView.frame.size.width+5, returnView.frame.size.height);
       bubbleImageView.frame = CGRectMake(50.0f, 14.0f, returnView.frame.size.width+25.0f, returnView.frame.size.height+24.0f);
		cellView.frame = CGRectMake(0.0f, 0.0f, bubbleImageView.frame.size.width+35.0f,bubbleImageView.frame.size.height+30.0f);
         headImageView.frame = CGRectMake(0.0f, cellView.frame.size.height-47.0f, 50.0f, 50.0f);
    }
    

    
    [cellView addSubview:bubbleImageView];
    [cellView addSubview:headImageView];
    [cellView addSubview:returnView];
    [bubbleImageView release];
    [returnView release];
    [headImageView release];
	return [cellView autorelease];
    
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/



#pragma mark Table View DataSource Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.chatArray count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if ([[self.chatArray objectAtIndex:[indexPath row]] isKindOfClass:[NSDate class]]) {
		return 30;
	}else {
		UIView *chatView = [[self.chatArray objectAtIndex:[indexPath row]] objectForKey:@"view"];
		return chatView.frame.size.height+10;
	}
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
    static NSString *CommentCellIdentifier = @"CommentCell";
	ChatCustomCell *cell = (ChatCustomCell*)[tableView dequeueReusableCellWithIdentifier:CommentCellIdentifier];
	if (cell == nil) {
		cell = [[[NSBundle mainBundle] loadNibNamed:@"ChatCustomCell" owner:self options:nil] lastObject];
	}
	
	if ([[self.chatArray objectAtIndex:[indexPath row]] isKindOfClass:[NSDate class]]) {
		// Set up the cell...
		NSDateFormatter  *formatter = [[NSDateFormatter alloc] init];
		[formatter setDateFormat:@"yy-MM-dd HH:mm"];
		NSMutableString *timeString = [NSMutableString stringWithFormat:@"%@",[formatter stringFromDate:[self.chatArray objectAtIndex:[indexPath row]]]];
		[formatter release];
				
		[cell.dateLabel setText:timeString];
        
        cell.userInteractionEnabled=NO;
		

	}
    
    else {
		// Set up the cell...
		NSDictionary *chatInfo = [self.chatArray objectAtIndex:[indexPath row]];
		UIView *chatView = [chatInfo objectForKey:@"view"];
		[cell.contentView addSubview:chatView];
	}
    return cell;
}
#pragma mark -
#pragma mark Table View Delegate Methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSLog(@"%@",[self.chatArray objectAtIndex:[indexPath row]]);
    
    
    chatInfo = [[self.chatArray objectAtIndex:[indexPath row]] retain];
    NSString *chatView = [chatInfo objectForKey:@"speaker"];
 //   NSLog(@"chat=%@",chatView);
    
    
//    [self alertview];
    
//    for (NSDictionary *actoAgent in [self.chatArray objectAtIndex:[indexPath row]])
//	{
//        
//        NSString    *str=[actoAgent objectForKey:@"text"];
//     //   NSLog(@"text=%@", str);
//    }
    [self.messageTextField resignFirstResponder];
}


-(void)alertview
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:self.messageTitle
                                                    message:self.message
                                                   delegate:(id <UIAlertViewDelegate>)self
                                          cancelButtonTitle:[self.cancelButtonLabel length] ? self.cancelButtonLabel: nil
                                          otherButtonTitles:self.rateButtonLabel, nil];
    alert.tag=1;
    if ([self.remindButtonLabel length])
    {
        [alert addButtonWithTitle:self.remindButtonLabel];
    }
    
    [alert show];

}

- (NSString *)messageTitle
{
    return @"Alert";
}

- (NSString *)message
{
    
    return @"Are you sure you want to Block/Delete";
}

- (NSString *)cancelButtonLabel
{
    
    return @"cancel";
}
- (NSString *)rateButtonLabel
{
    
       
    return @"Block User";


}

- (NSString *)remindButtonLabel
{
    
    return @"Delete Message";
    
    
    NSString *chatView = [chatInfo objectForKey:@"speaker"];
    NSLog(@"chat=%@",chatView);
    
    
}
- (void)resizeAlertView:(UIAlertView *)alertView
{
    if (!self.disableAlertViewResizing)
    {
        NSInteger imageCount = 0;
        CGFloat offset = 0.0f;
        CGFloat messageOffset = 0.0f;
        for (UIView *view in alertView.subviews)
        {
            CGRect frame = view.frame;
            if ([view isKindOfClass:[UILabel class]])
            {
                UILabel *label = (UILabel *)view;
                if ([label.text isEqualToString:alertView.title])
                {
                    [label sizeToFit];
                    offset = label.frame.size.height - fmax(0.0f, 45.f - label.frame.size.height);
                    if (label.frame.size.height > frame.size.height)
                    {
                        offset = messageOffset = label.frame.size.height - frame.size.height;
                        frame.size.height = label.frame.size.height;
                    }
                }
                else if ([label.text isEqualToString:alertView.message])
                {
                    label.lineBreakMode = NSLineBreakByWordWrapping;
                    label.numberOfLines = 0;
                    label.alpha = 1.0f;
                    [label sizeToFit];
                    offset += label.frame.size.height - frame.size.height;
                    frame.origin.y += messageOffset;
                    frame.size.height = label.frame.size.height;
                }
            }
            else if ([view isKindOfClass:[UITextView class]])
            {
                view.alpha = 0.0f;
            }
            else if ([view isKindOfClass:[UIImageView class]])
            {
                if (imageCount++ > 0)
                {
                    view.alpha = 0.0f;
                }
            }
            else if ([view isKindOfClass:[UIControl class]])
            {
                frame.origin.y += offset;
            }
            view.frame = frame;
        }
        CGRect frame = alertView.frame;
        frame.origin.y -= roundf(offset/2.0f);
        frame.size.height += offset;
        alertView.frame = frame;
    }
}


- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    
	if (alertView.tag==3) {
        
    }
    
    else{
    if (buttonIndex == alertView.cancelButtonIndex)
    {
        //ignore this version
     
    }
    else if (([self.cancelButtonLabel length] && buttonIndex == 2) ||
             ([self.cancelButtonLabel length] == 0 && buttonIndex == 1))
    {
        
        NSString *chatView = [chatInfo objectForKey:@"messageid"];
        NSLog(@"chat=%@",chatView);
        
        NSString *insertSQL = [NSString stringWithFormat:@"DELETE from CHAT where ID=%@",chatView];
        [self saveData:insertSQL];
        
        
        [self loadChat];
        [self.chatTableView reloadData];

        

        
    }
    else
    {
        
        GlobalClass *obj1=[GlobalClass getInstance];

        NSString *chatView = [chatInfo objectForKey:@"speaker"];
        NSLog(@"chat=%@",chatView);
        
        if ([chatView isEqualToString:MobileNo]) {
            
            
            UIAlertView* alertBox = [[ UIAlertView alloc]initWithTitle:@"Failed" message:@"You cannot block yourself" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil ];
            alertBox.tag=3;
            alertBox.delegate=self;
            [alertBox show];

            
        }
        
        
        else {

        
        NSString *insertSQL = [NSString stringWithFormat:@"DELETE from CHAT where USERID=%@",chatView];
        [self saveData:insertSQL];
            
            
            NSString *insertSQL9 = [NSString stringWithFormat: @"INSERT INTO BLOCKUSER (BLOCKEDUSERID ) VALUES (\"%@\")", chatView];
            NSLog(@"ins%@",insertSQL9);
            [self saveData:insertSQL9];

        dispatch_async(dispatch_get_main_queue(), ^{
            NSString	*str = [NSString stringWithFormat:@"block_userid=%@&deviceno=%@",chatView,obj1.dev];
            
            [self blockuser:str];
            
            
        });

        [self loadChat];

        [self.chatTableView reloadData];
            
        }

        //mark as rated
      
    }
        
    }
}


-(void)blockuser:(NSString *)post
{
    //post = [NSString stringWithFormat:@"phone=%@&email=%@",@"null",@"null"];
	
	
	
	//post = [NSString stringWithFormat:@"phone=%@&email=%@",@"1234567890",@"rohan.k@skiusainc.com"];
	NSLog(@"POST=%@",post);
	
	//	dispatch_async(dispatch_get_main_queue()	, ^{
	
	
	
	NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
	NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
	
	[request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://apps.micrositeads.com/yjhd/chat/block_user.php"]]];
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
    
    
}
#pragma mark -
#pragma mark TextField Delegate Methods
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
	return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
	if(textField == self.messageTextField)
	{
//		[self moveViewUp];
	}
}

-(void)autoMovekeyBoard: (float) h{
    
    
    UIToolbar *toolbar = (UIToolbar *)[self.view viewWithTag:TOOLBARTAG];
	toolbar.frame = CGRectMake(0.0f, (float)(480.0-h-108.0), 320.0f, 44.0f);
	//UITableView *tableView = (UITableView *)[self.view viewWithTag:TABLEVIEWTAG];
	//tableView.frame = CGRectMake(0.0f, 0.0f, 320.0f,(float)(480.0-h-108.0));
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self performSelector:@selector(keyboardWillHide:) withObject:nil afterDelay:0.0];
    
    
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
            NSDictionary *userInfo = [notification userInfo];
            
            // Get the origin of the keyboard when it's displayed.
            NSValue* aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
            
            // Get the top of the keyboard as the y coordinate of its origin in self's view's coordinate system. The bottom of the text view's frame should align with the top of the keyboard's final position.
            CGRect keyboardRect = [aValue CGRectValue];
            NSLog(@"cgrect=%f",keyboardRect.size.height);
            
            // Get the duration of the animation.
            NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
            NSTimeInterval animationDuration;
            [animationDurationValue getValue:&animationDuration];
            
            // Animate the resize of the text view's frame in sync with the keyboard's appearance.
            [self autoMovekeyBoard:(keyboardRect.size.height-88)];
            
            //_chatTableView.frame= CGRectMake(_chatTableView.frame.origin.x, -210, _chatTableView.frame.size.width, _chatTableView.frame.size.height);
            titleL.alpha=0.0;
            _titleLines.alpha=0.0;

            _chatTableView.frame= CGRectMake(_chatTableView.frame.origin.x, -210+38, _chatTableView.frame.size.width, _chatTableView.frame.size.height);


        }

        
        else{
    /*
     Reduce the size of the text view so that it's not obscured by the keyboard.
     Animate the resize so that it's in sync with the appearance of the keyboard.
     */
    
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
    [self autoMovekeyBoard:keyboardRect.size.height];
            
            titleL.alpha=0.0;
            _titleLines.alpha=0.0;

            _chatTableView.frame= CGRectMake(_chatTableView.frame.origin.x, -210+38, _chatTableView.frame.size.width, _chatTableView.frame.size.height);
            
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
            NSDictionary* userInfo = [notification userInfo];
            
            /*
             Restore the size of the text view (fill self's view).
             Animate the resize so that it's in sync with the disappearance of the keyboard.
             */
            NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
            NSTimeInterval animationDuration;
            [animationDurationValue getValue:&animationDuration];
            
            
            [self autoMovekeyBoard:-88];
            titleL.alpha=1.0;
            _titleLines.alpha=1.0;


            _chatTableView.frame= CGRectMake(_chatTableView.frame.origin.x, 38, _chatTableView.frame.size.width, _chatTableView.frame.size.height);

        }
        
        
        else{
    NSDictionary* userInfo = [notification userInfo];
    
    /*
     Restore the size of the text view (fill self's view).
     Animate the resize so that it's in sync with the disappearance of the keyboard.
     */
    NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
    

    [self autoMovekeyBoard:0];
            
            _chatTableView.frame= CGRectMake(_chatTableView.frame.origin.x, 38, _chatTableView.frame.size.width, _chatTableView.frame.size.height);
            titleL.alpha=1.0;
            _titleLines.alpha=1.0;

           // self.view.frame= CGRectMake(0, 0, 320, 460);

            
        }
        
        
    }
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
}

//图文混排

-(void)getImageRange:(NSString*)message : (NSMutableArray*)array {
    NSRange range=[message rangeOfString: BEGIN_FLAG];
    NSRange range1=[message rangeOfString: END_FLAG];
    //判断当前字符串是否还有表情的标志。
    if (range.length>0 && range1.length>0) {
        if (range.location > 0) {
            [array addObject:[message substringToIndex:range.location]];
            [array addObject:[message substringWithRange:NSMakeRange(range.location, range1.location+1-range.location)]];
            NSString *str=[message substringFromIndex:range1.location+1];
            [self getImageRange:str :array];
        }else {
            NSString *nextstr=[message substringWithRange:NSMakeRange(range.location, range1.location+1-range.location)];
            //排除文字是“”的
            if (![nextstr isEqualToString:@""]) {
                [array addObject:nextstr];
                NSString *str=[message substringFromIndex:range1.location+1];
                [self getImageRange:str :array];
            }else {
                return;
            }
        }
        
    } else if (message != nil) {
            [array addObject:message];
        }
}

#define KFacialSizeWidth  18
#define KFacialSizeHeight 18
#define MAX_WIDTH 150
-(UIView *)assembleMessageAtIndex : (NSString *) message from:(BOOL)fromself
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [self getImageRange:message :array];
    UIView *returnView = [[UIView alloc] initWithFrame:CGRectZero];
    NSArray *data = array;
    UIFont *fon = [UIFont systemFontOfSize:13.0f];
    CGFloat upX = 0;
    CGFloat upY = 0;
    CGFloat X = 0;
    CGFloat Y = 0;
    if (data) {
        for (int i=0;i < [data count];i++) {
            NSString *str=[data objectAtIndex:i];
            NSLog(@"str--->%@",str);
                if ([str hasPrefix: BEGIN_FLAG] && [str hasSuffix: END_FLAG])
            {
                if (upX >= MAX_WIDTH)
                {
                    upY = upY + KFacialSizeHeight;
                    upX = 0;
                    X = 150;
                    Y = upY;
                }
                NSLog(@"str(image)---->%@",str);
                NSString *imageName=[str substringWithRange:NSMakeRange(2, str.length - 3)];
                UIImageView *img=[[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
                img.frame = CGRectMake(upX, upY, KFacialSizeWidth, KFacialSizeHeight);
                [returnView addSubview:img];
                [img release];
                upX=KFacialSizeWidth+upX;
                if (X<150) X = upX;
                    
                
            } else {
                for (int j = 0; j < [str length]; j++) {
                    NSString *temp = [str substringWithRange:NSMakeRange(j, 1)];
                    if (upX >= MAX_WIDTH)
                    {
                        upY = upY + KFacialSizeHeight;
                        upX = 0;
                        X = 150;
                        Y =upY;
                    }
                    CGSize size=[temp sizeWithFont:fon constrainedToSize:CGSizeMake(150, 40)];
                    UILabel *la = [[UILabel alloc] initWithFrame:CGRectMake(upX,upY,size.width,size.height)];
                    la.font = fon;
                    la.text = temp;
                    la.backgroundColor = [UIColor clearColor];
                    [returnView addSubview:la];
                    [la release];
                    upX=upX+size.width;
                    if (X<150) {
                        X = upX;
                    }
                }
            }
        }
    }
    returnView.frame = CGRectMake(15.0f,1.0f, X, Y); //@ 需要将该view的尺寸记下，方便以后使用
    NSLog(@"%.1f %.1f", X, Y);
    return returnView;
}



@end
