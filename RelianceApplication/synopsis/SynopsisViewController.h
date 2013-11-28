//
//  SynopsisViewController.h
//  Relapp
//
//  Created by Anish on 8/2/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SynopsisViewController : UIViewController
{
    NSString* data1[1000];
	NSString* data2[1000];
	NSString* data3[1000];
	
	NSString* data4[1000];
	
	NSString* data5[1000];
	NSString* data6[1000];
	NSString* data7[1000];
	NSString* data8[1000];
    int TotalData;
    
    UIActivityIndicatorView     *activityIndicator;
    UIActivityIndicatorView     *activityIndicator1;
    NSMutableArray *arr;
    CGFloat start;
    BOOL directionUp;
    
}
@property (strong, nonatomic) IBOutlet UIView *footerMainView;
@property (strong, nonatomic) NSString *TAG;
@property (strong, nonatomic) IBOutlet UILabel *firstLabel;

@property (strong, nonatomic) IBOutlet UIView *footerView;
@property (strong, nonatomic)UIImageView *firstImageView;

@property (strong, nonatomic) IBOutlet UIImageView *secondImageView;
@property (strong, nonatomic) IBOutlet UILabel *secondLabel;
@property(nonatomic,strong) NSMutableArray *arr;
@property (weak, nonatomic) IBOutlet UIScrollView *Scroll;
- (IBAction)back:(id)sender;

-(IBAction)toRelApp:(UIButton *)sender;
- (IBAction)merchandise:(id)sender;
-(IBAction)chat:(id)sender;
- (IBAction)myProfile:(id)sender;
@end
