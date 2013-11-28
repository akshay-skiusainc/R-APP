//
//  LoginViewController.h
//  Relapp
//
//  Created by Akshay on 8/1/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeController.h"
#import <Twitter/Twitter.h>

#import <Accounts/Accounts.h>
#import <Twitter/Twitter.h>
#import "Reachability.h"
typedef enum SocialAccountTypeiphone5  {
	SocialAccountTypeFacebookiphone5 = 1,
	SocialAccountTypeTwitteriphone5 = 2
}SocialAccountTypeiphone5 ;
@interface LoginViewController : DatabaseClass<UITextFieldDelegate,UIAlertViewDelegate,UIPickerViewDelegate>
{
    NSString		*responseD;
	bool			stricterFilter;
	UIButton	*Overlaybtn;
    UIActivityIndicatorView    *activityIndicator;
	UIAlertView		*alertBox;
	UIPickerView		*pickerView;
	UIImageView		*StatusSubmit;
	UILabel			*StatusLabel;
	NSMutableArray		*CodeSelector;
	NSMutableArray		*CodeSet;
	NSString			*userid;
	UIButton			*closeit;
	int	tt;
	Reachability* internetReachable;
	Reachability* hostReachable;
	UIImageView		*startScreen;
	Reachability* reachability;
	int	ntcheck;
    
	
}
@property (strong, nonatomic) IBOutlet UIButton *signupbutton;

@property (strong, nonatomic) IBOutlet UIImageView *fbbtn;

@property (strong, nonatomic) IBOutlet UIImageView *twtbtn;

@property (strong, nonatomic) IBOutlet UIImageView *mobpatch;
@property (strong, nonatomic) IBOutlet UIImageView *emailpatch;
@property (strong, nonatomic) IBOutlet UILabel *loginLabel;
@property (strong, nonatomic) IBOutlet UIButton *backButtonRef;

@property (strong, nonatomic) IBOutlet UIImageView *ccpatch;

@property (strong, nonatomic) IBOutlet UIButton *fblogin;

@property (strong, nonatomic) IBOutlet UIButton *twtlogin;

@property(nonatomic,retain)IBOutlet UITextField	*CountryCode;

@property(nonatomic,retain)IBOutlet UITextField   *Number;

@property(nonatomic,retain)IBOutlet UITextField   *Email1;
@property(nonatomic,retain)IBOutlet UITextField   *username;
@property (strong, nonatomic) IBOutlet UIImageView *usernamepatch;



@property (retain, nonatomic) IBOutlet UIView *LOGINVIEW;

@property(nonatomic,retain)IBOutlet UIButton   *submit;
@property (nonatomic, retain) ACAccountStore *accountStore;
@property (nonatomic, retain) ACAccount *facebookAccount;
- (IBAction)backButton:(id)sender;
- (IBAction)getMeButtonTapped:(id)sender;
- (IBAction)twitterButtonPressed;
-(IBAction)Submit:(id)sender;

- (IBAction)openFacebookSession;
    

-(IBAction)facebookclicked:(id)sender;
-(IBAction)twitterclicked:(id)sender;
-(IBAction)signupclicked:(id)sender;



- (id)initWithSocialAccountType:(SocialAccountTypeiphone5)socialAccountType;

@end
