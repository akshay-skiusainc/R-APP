//
//  help2ViewController.h
//  YJHD
//
//  Created by SKI USA 35 on 4/10/13.
//  Copyright (c) 2013 SKI USA 35. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iphone5help2ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
	
	NSMutableArray *_quotes;
	UITableView *_tableView;
	NSString	*faq1;

    NSMutableArray * arr;
    NSMutableArray *content;

    CGFloat start;
    BOOL directionUp;
    
}
@property (strong, nonatomic) IBOutlet UIView *footerView;
@property (strong, nonatomic) IBOutlet UIView *footerMainView;
-(IBAction)dismiss:(id)sender;

@property(nonatomic,retain)NSString	*faq1;

@property (strong, nonatomic) IBOutlet UILabel *showans;
@property (strong,nonatomic)UIImageView *customImageView;
@property(nonatomic,retain) NSMutableArray *quotes;
-(IBAction)chat:(id)sender;
@end
