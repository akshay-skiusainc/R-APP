//
//  R_iphone4PolicyViewController.h
//  RelianceApplication
//
//  Created by Anish on 10/17/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "R_iphone4help2ViewController.h"
@interface R_iphone4PolicyViewController : UIViewController
{
	
	NSString  *description;
	UIActivityIndicatorView		*activityIndicator;
    
    CGFloat start;
    BOOL directionUp;
    NSString    *TAGIS;
    
}
@property(strong,nonatomic) NSString    *TAGIS;
@property(strong,nonatomic) NSString    *loginScreen;
@property (strong, nonatomic) IBOutlet UIView *footerMainView;

@property (strong, nonatomic) IBOutlet UIScrollView *Scroller;
@property (strong, nonatomic) IBOutlet UILabel *policyLabel;
-(id)initWithStr:(NSString *)_loginScreen;
-(IBAction)BackBtnPressed:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *footerView;
- (IBAction)chat:(id)sender;
- (IBAction)openFooter:(id)sender;


@end
