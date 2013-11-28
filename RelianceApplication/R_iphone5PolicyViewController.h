//
//  R_iphone5PolicyViewController.h
//  RelianceApplication
//
//  Created by Anish on 10/17/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface R_iphone5PolicyViewController : UIViewController
{
	
	NSString  *description;
	UIActivityIndicatorView		*activityIndicator;
    
	
    CGFloat start;
    BOOL directionUp;
    
}
@property(strong,nonatomic) NSString    *TAGIS;
@property (strong, nonatomic) IBOutlet UIView *footerView;
@property (strong, nonatomic) IBOutlet UIView *footerMainView;
@property (strong, nonatomic) IBOutlet UIScrollView *Scroller;
@property (strong, nonatomic) IBOutlet UILabel *policyLabel;
-(IBAction)chat:(id)sender;
@end
