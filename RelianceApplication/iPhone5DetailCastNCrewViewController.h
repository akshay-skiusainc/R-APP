//
//  DetailCastNCrewViewController.h
//  YJHD
//
//  Created by Ashwini Pawar on 02/04/13.
//  Copyright (c) 2013 SKI USA 35. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "RightController.h"
//#import "GroupchatViewController.h"
#import "iphone5CastNCrew.h"
#import "GAITrackedViewController.h"

@interface iPhone5DetailCastNCrewViewController : GAITrackedViewController <UIScrollViewDelegate>
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

@property (strong, nonatomic) IBOutlet UIScrollView *Scroller;
@property(nonatomic,weak) Class barButtonItemClass;
@property (strong, nonatomic) IBOutlet UIView *footerView;

- (IBAction)ranbirInfo:(id)sender;
- (IBAction)DeepikaInfo:(id)sender;
- (IBAction)kalkiInfo:(id)sender;
- (IBAction)adityaInfo:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *crewView;
- (IBAction)openFooter:(id)sender;
- (IBAction)merchandise:(id)sender;
-(IBAction)toRelApp:(id)sender;
- (IBAction)myProfile:(id)sender;
-(IBAction)chat:(id)sender;
@end
