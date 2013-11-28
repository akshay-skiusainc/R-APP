//
//  R_iphone4HelpViewController.h
//  RelianceApplication
//
//  Created by Anish on 10/17/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "R_iphone4help2ViewController.h"

@interface R_iphone4HelpViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
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
@property (strong, nonatomic) IBOutlet UIView *footerMainView;

-(IBAction)BackBtnPressed:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *footerView;
- (IBAction)chat:(id)sender;
- (IBAction)openFooter:(id)sender;


@end
