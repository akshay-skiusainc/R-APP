
#import <UIKit/UIKit.h>
#import "FaceViewController.h"
#import "DatabaseClass.h"
#import "XMPPRoster.h"
#import "SMChatDelegate.h"
#import "SMMessageDelegate.h"
#import "XMPPRoomCoreDataStorage.h"

#import "XMPP.h"
#import "XMPPRoster.h"
#import "SMMessageDelegate.h"
#import "GroupViewController.h"
#import "AppDelegate.h"
#import "SMChatDelegate.h"
@class BaseTabBarController;

@interface ChatViewController : DatabaseClass<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate> {
	NSString                   *_titleString;
	NSMutableString            *_messageString;
	NSString                   *_phraseString;
	NSMutableArray		       *_chatArray;
	
	UITableView                *_chatTableView;
	UITextField                *_messageTextField;
	BOOL                       _isFromNewSMS;
	FaceViewController      *_phraseViewController;
	NSDate                     *_lastTime;
    

	int  totalrows;
	NSString		*post;
	NSString		*passtag;
	
	int check;
	int getrows;
	int STARTROW;
	
	NSDictionary* getthedata;
    NSDictionary *chatInfo;
    
	NSTimer *_timer;
    
	UIActivityIndicatorView	*activityIndicator;
    NSString    *backcheck;
    NSString *messageStr;
    NSString *myusername;
    NSTimer *_timer2;
    
    
    XMPPStream *xmppStream;
	XMPPRoster *xmppRoster;
    
    XMPPReconnect *xmppReconnect;
	XMPPRoomCoreDataStorage *xmppRosterStorage;
    


    
}

@property (nonatomic, readonly) XMPPStream *xmppStream;
@property (nonatomic, readonly) XMPPRoster *xmppRoster;
@property (nonatomic, strong, readonly) XMPPReconnect *xmppReconnect;
@property (nonatomic, strong, readonly) XMPPRoomCoreDataStorage *xmppRosterStorage;

@property (nonatomic, assign) id  _chatDelegate;
//@property (nonatomic, assign) id  _messageDelegate;
@property (nonatomic, assign) NSObject <SMMessageDelegate> *_messageDelegate;
@property(nonatomic,retain)NSString		*passtag;
@property (nonatomic, assign) BOOL disableAlertViewResizing;
@property (strong,nonatomic)NSString *strFromLogin;

@property (nonatomic, retain) BaseTabBarController *basetempController;
@property (nonatomic, retain) IBOutlet FaceViewController   *phraseViewController;
@property (nonatomic, retain) IBOutlet UITableView            *chatTableView;
@property (nonatomic, retain) IBOutlet UITextField            *messageTextField;
@property (nonatomic, retain) IBOutlet UILabel            *titleL;
@property (nonatomic, retain) IBOutlet UIImageView            *titleLines;


@property (nonatomic, retain) NSString               *phraseString;
@property (nonatomic, retain) NSString               *titleString;
@property (nonatomic, retain) NSMutableString        *messageString;
@property (nonatomic, retain) NSMutableArray		 *chatArray;

@property (nonatomic, retain) NSDate                 *lastTime;
@property (nonatomic, retain) NSString               *groupname;

@property (nonatomic, retain) NSString               *titlegroupname;




-(IBAction)sendMessage_Click:(id)sender;
-(IBAction)showPhraseInfo:(id)sender;


-(void)openUDPServer;
-(void)sendMassage:(NSString *)message;
-(void)deleteContentFromTableView;

- (UIView *)bubbleView:(NSString *)text from:(BOOL)fromSelf;

-(void)getImageRange:(NSString*)message : (NSMutableArray*)array;
-(UIView *)assembleMessageAtIndex : (NSString *) message from: (BOOL)fromself;


@end
