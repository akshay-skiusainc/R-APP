//
//  iphone4PolicyViewController.h
//  Relapp
//
//  Created by Anish on 8/16/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface iphone4PolicyViewController : UIViewController
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
