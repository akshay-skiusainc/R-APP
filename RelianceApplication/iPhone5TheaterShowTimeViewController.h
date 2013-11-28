//
//  iPhone5TheaterShowTimeViewController.h
//  RelianceApplication
//
//  Created by Ashwini Pawar on 08/08/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iPhone5TheaterShowTimeViewController : UIViewController
{
    NSString *str;
    int showTimeTag;
	NSString *bmsurl;
    UILabel *showTimeLable[1000];
    NSMutableArray *timeArray;
    CGFloat start;
    BOOL directionUp;
    NSArray *listItems;
    NSArray *tomorowListItems;
    
    
}
@property (nonatomic, retain) NSString *tomorowtime;
@property (strong, nonatomic) IBOutlet UIView *footerMainView;
@property (weak, nonatomic) IBOutlet UILabel *showTimingsLable;
@property (nonatomic,retain)NSString *str;
//@property (weak, nonatomic) IBOutlet UIButton *buttonReferenceTodaysShow;
@property (strong, nonatomic) IBOutlet UIScrollView *showTimeScroller;
@property (nonatomic)int showTimeTag;
@property (strong, nonatomic) IBOutlet UIView *footerView;
@property (strong, nonatomic) IBOutlet UIButton *Bookmyshowbutton;
@property (nonatomic,retain)NSString *theaterName;
@property(nonatomic,retain)NSString *bmsurl;
@property (strong, nonatomic) IBOutlet UILabel *todaysShowLabel;
@property (strong, nonatomic) IBOutlet UILabel *tomorrowsShowLabel;
- (IBAction)bookMyShowButton:(id)sender;
//- (IBAction)buttonTodaysShowTiming:(id)sender;
//@property (strong, nonatomic) IBOutlet UIImageView *headerimage;

- (IBAction)openFooter:(id)sender;
-(id)initWithShowTiming:(NSString *)_str;
- (IBAction)merchandise:(id)sender;
-(IBAction)toRelApp:(id)sender;
- (IBAction)myProfile:(id)sender;
-(IBAction)chat:(id)sender;
@end
