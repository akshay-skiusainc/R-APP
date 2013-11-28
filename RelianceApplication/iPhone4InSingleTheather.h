//
//  iPhone5InSingleTheather.h
//  RelianceApplication
//
//  Created by Ashwini Pawar on 08/08/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalClass.h"
#import "iPhone4TheaterShowTimeViewController.h"
//#import	"iphone5Bookmyshow.h"
@interface iPhone4InSingleTheather : UIViewController
{
    UIView  *mainView;
    NSString *selectedTheater;
    NSString *Theater_Address;
    NSString* Theater_latitude;
    NSString* Theater_longitude;
    UILabel *theatre;
    UILabel *th_addres;
    IBOutlet UIButton *directToMap;
    UIButton        *loadmap;
    UIImageView     *rating;
    UIImageView     *STARIMAGE[10];
	NSString		*rate;
	NSString *Category;
	NSString *Action;
	NSString *Label;
	NSString *bmsurl;
    
    
    
    CGFloat start;
    BOOL directionUp;
      
}
@property (nonatomic, retain) NSString *tomorowtime;
@property (strong, nonatomic) IBOutlet UIView *footerMainView;


@property (strong, nonatomic) IBOutlet UIButton *Bookmyshowbutton;

@property (retain, nonatomic) IBOutlet UIButton *showTimeButtonOutlet;
@property (retain, nonatomic) IBOutlet UIButton *todayShowTimeButtonReference;
@property (retain, nonatomic) IBOutlet UIButton *tomorrowShowTimeButtonRefrence;
@property (nonatomic, retain) NSString *bmsurl;


@property (nonatomic, retain) NSString *selectedTheater;
@property (nonatomic, retain) NSString *Theater_Address;
@property (nonatomic, retain) NSString *Theater_latitude;
@property (nonatomic, retain) NSString *Theater_longitude;
@property (nonatomic, retain) NSString *current_latitude;
@property (nonatomic, retain) NSString *current_longitude;
@property (nonatomic, retain) NSString *Phone_no;
@property (nonatomic, retain) NSString *time1;


@property (nonatomic, retain) NSString *rate;
@property (strong, nonatomic) IBOutlet UIButton *openFooerButton;
@property (strong, nonatomic) IBOutlet UIView *footerView;

- (IBAction)todayShowTimeButton:(id)sender;
- (IBAction)tomorrowShowTimeButton:(id)sender;
- (IBAction)bookMyShowButton:(id)sender;
- (IBAction)openFooter:(id)sender;
-(IBAction)chat:(id)sender;
- (IBAction)merchandise:(id)sender;
-(IBAction)toRelApp:(id)sender;
- (IBAction)myProfile:(id)sender;
@end
