//
//  iphone5Notification.h
//  RelianceApplication
//
//  Created by Ashwini Pawar on 25/08/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iphone5Notification : UIViewController
{
    NSMutableArray * arr;
	NSString* data1[1000];
	NSString* data2[1000];
	NSString* data3[1000];
	
	NSString* data4[1000];
	
	NSString* data5[1000];
	NSString* data6[1000];
	NSString* data7[1000];
	NSString* data8[1000];
	NSString	*geturl;
	int  NumOfRows;
	
	UIActivityIndicatorView*	activityIndicator;
    UIImageView *imagewall[1000];
    UIImageView *imageSmall[1000];
    UIImageView *imageSmall2[1000];
    UILabel *mainLabel[1000];
    UILabel *subLabel[1000];
    UIButton *closeButton[1000];
    
	int	TotalData;
    
    CGFloat start;
    BOOL directionUp;
    
}
@property (strong, nonatomic) NSString *TAG;
@property (strong, nonatomic) IBOutlet UIScrollView *notiScroll;
@property (strong, nonatomic) IBOutlet UIView *footerMainView;
@property (strong, nonatomic) IBOutlet UIView *footerView;
-(IBAction)chat:(id)sender;
- (IBAction)merchandise:(id)sender;
-(IBAction)toRelApp:(id)sender;
- (IBAction)myProfile:(id)sender;
@property (nonatomic, assign) BOOL disableAlertViewResizing;
@property (strong, nonatomic) IBOutlet UITableView *notificationTableView;


@end
