//
//  PolicyViewController.h
//  YJHD
//
//  Created by Ashwini Pawar on 03/04/13.
//  Copyright (c) 2013 SKI USA 35. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iphone5PolicyViewController : UIViewController
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
