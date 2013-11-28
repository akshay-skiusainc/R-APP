//
//  ProfileViewController.h
//  YJHD
//
//  Created by Ashwini Pawar on 03/04/13.
//  Copyright (c) 2013 SKI USA 35. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatabaseClass.h"
@interface iphone5ProfileViewController : DatabaseClass
{
    
    CGFloat start;
    BOOL directionUp;
    
}
@property (strong, nonatomic) IBOutlet UIView *footerView;
@property (strong, nonatomic) IBOutlet UIView *footerMainView;
@property (strong, nonatomic) IBOutlet UILabel *mobileLabel;
@property (strong, nonatomic) IBOutlet UILabel *emailLabel;
-(IBAction)chat:(id)sender;
@end
