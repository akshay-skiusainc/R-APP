//
//  iphone4DetailCNC.h
//  RelianceApplication
//
//  Created by Ashwini Pawar on 14/08/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iphone4Settings.h"
#import "iphone4Merchandise.h"

@interface iphone4DetailCNC : UIViewController
{
    NSString *data[1000];
    NSString* data1[1000];
    NSString* data2[1000];
    
    NSString *data3[1000];
    NSString *data4[1000];
    NSString *data5[1000];
    
    NSString *data6[1000];
    
    int TotalCastData;
    int TotalCrewData;
    int castnCrew;
    UIScrollView	*Scroller;
    UIImageView *imageViewForCast[1000];
    UIImageView *imageViewForCrew[1000];
    UIButton *labelbutton[1000];
    UIButton *labelbutton1[1000];
    UILabel *castLabel[1000];
    UILabel *crewLabel[1000];
    UILabel *crewHeadLabel[1000];
    CGFloat start;
    BOOL directionUp;
    
}
@property (strong, nonatomic) IBOutlet UIView *footerMainView;


@property (strong, nonatomic) IBOutlet UIView *footerView;
- (IBAction)openFooter:(id)sender;
-(IBAction)toRelApp:(UIButton *)sender;
- (IBAction)merchandise:(id)sender;
-(IBAction)chat:(id)sender;
- (IBAction)myProfile:(id)sender;


@end
