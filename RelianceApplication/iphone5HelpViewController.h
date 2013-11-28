//
//  HelpViewController.h
//  YJHD
//
//  Created by SKI USA 35 on 4/10/13.
//  Copyright (c) 2013 SKI USA 35. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iphone5help2ViewController.h"
@interface iphone5HelpViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
	NSString		*data1[1000];
	NSString		*data2[1000];
	NSString		*data3[1000];
	NSString		*data4[1000];
	NSString		*data5[1000];
	NSString		*data6[1000];
	
	int   NumOfRows;
	
	NSMutableArray *_quotes;
	UITableView *_tableView;
	
	UIActivityIndicatorView*	activityIndicator;


    CGFloat start;
    BOOL directionUp;
    
}
@property (strong, nonatomic) IBOutlet UIView *footerView;
@property (strong, nonatomic) IBOutlet UIView *footerMainView;
-(IBAction)chat:(id)sender;

@end
