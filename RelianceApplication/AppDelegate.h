//
//  AppDelegate.h
//  RelianceApplication
//
//  Created by Akshay on 8/6/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"
#import "iphone4LoginViewController.h"
#import	"GlobalClass.h"
#import <Accounts/Accounts.h>
#import <Twitter/Twitter.h>
#import "XMPPFramework.h"
#import "XMPPRoster.h"
#import "XMPP.h"
#import "SMChatDelegate.h"
#import "SMMessageDelegate.h"
#import "XMPPRoomCoreDataStorage.h"
#import "XMPPReconnect.h"
#import "XMPPStream.h"
#import "GCDAsyncSocket.h"
#import "XMPPReconnect.h"
#import "XMPPCapabilitiesCoreDataStorage.h"
#import "XMPPvCardAvatarModule.h"
#import "XMPPvCardCoreDataStorage.h"

#import "GAI.h"


#define kSocialAccountTypeKey @"SOCIAL_ACCOUNT_TYPE"


@class ACAccount;

@class DDMenuController;
@interface AppDelegate : UIResponder <UIApplicationDelegate,XMPPRosterDelegate>
{
    XMPPStream *xmppStream;
	XMPPRoster *xmppRoster;
    
    XMPPReconnect *xmppReconnect;
    
	XMPPRosterCoreDataStorage *xmppRosterStorage;
    XMPPvCardCoreDataStorage *xmppvCardStorage;
	XMPPvCardTempModule *xmppvCardTempModule;
	XMPPvCardAvatarModule *xmppvCardAvatarModule;
	XMPPCapabilities *xmppCapabilities;
	XMPPCapabilitiesCoreDataStorage *xmppCapabilitiesStorage;

	NSString *password;
	
	BOOL isOpen;
    
	
	__weak NSObject <SMChatDelegate> *_chatDelegate;
	__weak NSObject <SMMessageDelegate> *_messageDelegate;

}
@property (strong, nonatomic) DDMenuController *menuController;
@property (retain, nonatomic) UINavigationController *navController;

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,retain)  NSString* hexTop;
@property (nonatomic,retain)  NSString* hexBottom;
@property (nonatomic) NSUInteger customAlert;

@property (nonatomic, retain) XMPPRoomCoreDataStorage *xmppRosterStorage;

@property (nonatomic, readonly) XMPPStream *xmppStream;
@property (nonatomic, readonly) XMPPRoster *xmppRoster;
@property (nonatomic, strong, readonly) XMPPReconnect *xmppReconnect;
@property (nonatomic, strong, readonly) XMPPvCardTempModule *xmppvCardTempModule;
@property (nonatomic, strong, readonly) XMPPvCardAvatarModule *xmppvCardAvatarModule;
@property (nonatomic, strong, readonly) XMPPCapabilities *xmppCapabilities;
@property (nonatomic, strong, readonly) XMPPCapabilitiesCoreDataStorage *xmppCapabilitiesStorage;
@property (nonatomic, assign) id  _chatDelegate;
//@property (nonatomic, assign) id  _messageDelegate;
@property (nonatomic, assign) NSObject <SMMessageDelegate> *_messageDelegate;

- (void)openFacebookSession;
- (void)closeFacebookSession;

- (void)getTwitterAccountOnCompletion:(void(^)(ACAccount *))completionHandler;


- (void)setupStream;

- (void)goOnline;
- (void)goOffline;
- (BOOL)connect;
- (void)disconnect;
-(void)group1;
-(void)group2;
-(void)group3;
-(void)group4;
-(void)leavegroup1;
-(void)leavegroup2;
-(void)leavegroup3;
-(void)leavegroup4;
- (void)teardownStream;
//Github Testing Anish

@end
