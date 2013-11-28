//
//  R_iphone4help2ViewController.h
//  RelianceApplication
//
//  Created by Anish on 10/17/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface R_iphone4help2ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
	
	NSMutableArray *_quotes;
	UITableView *_tableView;
	NSString	*faq1;
    
    NSMutableArray * arr;
    NSMutableArray *content;
    CGFloat start;
    BOOL directionUp;
    
}
@property (strong, nonatomic) IBOutlet UIView *footerMainView;
-(IBAction)dismiss:(id)sender;

@property(nonatomic,retain)NSString	*faq1;

@property (strong, nonatomic) IBOutlet UILabel *showans;
@property (strong,nonatomic)UIImageView *customImageView;
-(IBAction)BackBtnPressed:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *footerView;
- (IBAction)chat:(id)sender;
- (IBAction)openFooter:(id)sender;


@end
