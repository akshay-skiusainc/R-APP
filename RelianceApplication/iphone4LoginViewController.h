//
//  iphone4LoginViewController.h
//  RelianceApplication
//
//  Created by Ashwini Pawar on 13/08/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iphone4HomeViewController.h"
#import "Reachability.h"
#import <Twitter/Twitter.h>
#import <Accounts/Accounts.h>
#import <Twitter/Twitter.h>
#import "Reachability.h"
#import "R_iphone4PolicyViewController.h"


typedef enum SocialAccountType  {
	SocialAccountTypeFacebook = 1,
	SocialAccountTypeTwitter = 2
}SocialAccountType;
@interface iphone4LoginViewController : DatabaseClass<UITextFieldDelegate,UIAlertViewDelegate,UIPickerViewDelegate>
{NSString		*responseD;
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
    NSString    *NAMSIS;
    
	
}

@property (strong, nonatomic) IBOutlet UIButton *labelbtn;

@property (strong, nonatomic) IBOutlet UIButton *signupbutton;

@property (strong, nonatomic) IBOutlet UIImageView *fbbtn;

@property (strong, nonatomic) IBOutlet UIImageView *twtbtn;

@property (strong, nonatomic) IBOutlet UILabel *loginLabel;
@property (strong, nonatomic) IBOutlet UIImageView *mobpatch;
@property (strong, nonatomic) IBOutlet UIImageView *emailpatch;

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

- (IBAction)getMeButtonTapped:(id)sender;
- (IBAction)twitterButtonPressed;
- (id)initWithSocialAccountType:(SocialAccountType)socialAccountType;
-(IBAction)Submit:(id)sender;


- (IBAction)backButton:(id)sender;

-(IBAction)facebookclicked:(id)sender;
-(IBAction)twitterclicked:(id)sender;
-(IBAction)signupclicked:(id)sender;
@end
