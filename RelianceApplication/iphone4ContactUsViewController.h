//
//  iphone4ContactUsViewController.h
//  Relapp
//
//  Created by Anish on 8/16/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface iphone4ContactUsViewController : UIViewController
{
    CGFloat start;
    BOOL directionUp;
    
}
@property (strong, nonatomic) IBOutlet UIView *footerMainView;

@property (strong, nonatomic) IBOutlet UIView *footerView;
- (IBAction)openFooter:(id)sender;
- (IBAction)mailUsButton:(id)sender;
- (IBAction)skiusaSiteButton:(id)sender;
-(IBAction)BackBtnPressed:(id)sender;
- (IBAction)chat:(id)sender;
- (IBAction)merchandise:(id)sender;
-(IBAction)toRelApp:(id)sender;
- (IBAction)myProfile:(id)sender;

@end
