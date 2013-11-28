//
//  iphone4CNCViewController.h
//  RelianceApplication
//
//  Created by Ashwini Pawar on 14/08/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iphone4CNCViewController : UIViewController<UIScrollViewDelegate>
{
    int check;
    UILabel	*Description;
    NSString *data[1000];
    NSString* data1[1000];
    NSString* data2[1000];
    NSString* prodImageStr;
    NSString* realName[1000];
    int TotalData;
	NSString *webtitle[1000];
    UIButton *charSketchButton[1000];
    UIButton *dwnloadWallButton[1000];
    UIButton *productionButton;
    UIWebView *webImageView[1000];
	NSString *webdesc[1000];
    UIImageView *PAGINGEFFECT[10];
    UIImageView *pagingbackground;
    UIImageView *scrollBgImage;
     UIImageView *BlackImage[1000];
     UILabel *castNameLabel[1000];
    UIImageView *blackDwnView[1000];
    UIActivityIndicatorView *bigActivityIndicator[1000];
    CGFloat start;
    BOOL directionUp;
    UIImageView                 *ActIndImage1[1000];
	UIActivityIndicatorView     *activityIndicator1[1000];
}
@property (strong, nonatomic) IBOutlet UIView *footerMainView;

@property (retain, nonatomic) IBOutlet UIScrollView *Scroller1;
@property (strong, nonatomic) IBOutlet UIButton *productionHouseButtonRef;
@property (strong, nonatomic) IBOutlet UIView *footerView;
@property(nonatomic)int check;
@property (strong,nonatomic)UIScrollView *scroll;
@property (retain, nonatomic)UIImageView *pagingbackground;
@property (nonatomic,retain)NSString * fromDetailsVC;

- (IBAction)buttonProductionDetails:(id)sender;
- (IBAction)ranbirCharacterButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *bigView;
-(id)initwithStr:(NSString *)_fromDeatilVC;
- (IBAction)openFooter:(id)sender;
- (IBAction)merchandise:(id)sender;
-(IBAction)toRelApp:(id)sender;
- (IBAction)myProfile:(id)sender;
-(IBAction)chat:(id)sender;

@end
