//
//  ContactUsViewController.h
//  YJHD
//
//  Created by Ashwini Pawar on 03/04/13.
//  Copyright (c) 2013 SKI USA 35. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface iphone5ContactUsViewController : UIViewController
{
    CGFloat start;
    BOOL directionUp;
    
}
@property (strong, nonatomic) IBOutlet UIView *footerView;
@property (strong, nonatomic) IBOutlet UIView *footerMainView;
- (IBAction)merchandise:(id)sender;
-(IBAction)toRelApp:(id)sender;
- (IBAction)myProfile:(id)sender;
-(IBAction)chat:(id)sender;
- (IBAction)mailUsButton:(id)sender;
- (IBAction)skiusaSiteButton:(id)sender;
@end
