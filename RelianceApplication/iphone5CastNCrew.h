//
//  iphone5CastNCrew.h
//  YJHD
//
//  Created by Ashwini Pawar on 15/04/13.
//  Copyright (c) 2013 SKI USA 35. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iPhone5DetailCastNCrewViewController.h"
#import "DatabaseClass.h"
//#import "iphone5DownloadViewController.h"
@interface iphone5CastNCrew : DatabaseClass<UIScrollViewDelegate>
{
    int check;
    UILabel	*Description;
    NSString *data[1000];
//    NSString* data1[1000];
//    NSString* data2[1000];
   // int TotalData;
    NSString* prodImageStr;
	NSString *webtitle[1000];
    UIButton *charSketchButton[1000];
    UIButton *dwnloadWallButton[1000];
    UIWebView *webImageView[1000];
	NSString *webdesc[1000];
    UIImageView *PAGINGEFFECT[10];
    UIImageView *pagingbackground;
    UIImageView *blackDwnView[1000];
    UIActivityIndicatorView *bigActivityIndicator[1000];
    CGFloat start;
    BOOL directionUp;
    UIImageView *scrollBgImage;
    UIImageView *BlackImage[1000];
    UILabel *castNameLabel[1000];
    UIButton *productionButton;
    UIImageView                 *ActIndImage1[1000];
	UIActivityIndicatorView     *activityIndicator1[1000];
}
@property (strong, nonatomic) IBOutlet UIView *footerMainView;

-(IBAction)Downloads:(id)sender;

//@property (strong, nonatomic) IBOutlet UIScrollView *Scroller;
@property (strong, nonatomic) IBOutlet UIView *Scrollview;
@property (retain, nonatomic) IBOutlet UIScrollView *Scroller1;
@property(nonatomic)int check;
@property (strong,nonatomic)UIScrollView *scroll;
@property (retain, nonatomic)UIImageView *pagingbackground;


@property (retain, nonatomic) IBOutlet UIImageView *imageView3;
@property (retain, nonatomic) IBOutlet UIImageView *imageView4;

@property (strong, nonatomic) IBOutlet UIButton *productionHouseButtonRef;
@property (retain, nonatomic) IBOutlet UIImageView *ranbirNameView;
@property (retain, nonatomic) IBOutlet UIImageView *deepikaNameView;
@property (retain, nonatomic) IBOutlet UIImageView *kalkiNameView;
@property (retain, nonatomic) IBOutlet UIButton *ranbirCharacterView;
@property (retain, nonatomic) IBOutlet UIButton *DeepikaCharacterView;
@property (retain, nonatomic) IBOutlet UIButton *kalkiCharacterView;
@property (weak, nonatomic) IBOutlet UIButton *adityaChracterView;
@property (weak, nonatomic) IBOutlet UIImageView *adityaNameView;
@property (nonatomic,retain)NSString * fromDetailsVC;
@property (strong, nonatomic) IBOutlet UIView *footerView;
- (IBAction)buttonProductionDetails:(id)sender;
- (IBAction)ranbirCharacterButton:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *bunnyLabel;
@property (strong, nonatomic) IBOutlet UILabel *ranbirLabel;
@property (strong, nonatomic) IBOutlet UILabel *ranbirCharacterLabel;


@property (strong, nonatomic) IBOutlet UILabel *nainaLabel;
@property (strong, nonatomic) IBOutlet UILabel *DeepikaLabel;
@property (strong, nonatomic) IBOutlet UILabel *deepikaCharacterLabel;

@property (strong, nonatomic) IBOutlet UILabel *aditiLabel;
@property (strong, nonatomic) IBOutlet UILabel *kalkiLabel;
@property (strong, nonatomic) IBOutlet UILabel *kalkiCharacterLabel;

@property (strong, nonatomic) IBOutlet UILabel *aviLabel;
@property (strong, nonatomic) IBOutlet UILabel *adityaLabel;
@property (strong, nonatomic) IBOutlet UILabel *adityaChracterLabel;

@property (strong, nonatomic) IBOutlet UIView *bigView;
@property (strong, nonatomic) IBOutlet UIButton *deepikaMorePics;
@property (strong, nonatomic) IBOutlet UIButton *ranbirMorePics;
@property (strong, nonatomic) IBOutlet UIButton *kalkiMorePics;
@property (strong, nonatomic) IBOutlet UIView *adityaMorePics;
-(id)initwithStr:(NSString *)_fromDeatilVC;
- (IBAction)openFooter:(id)sender;
- (IBAction)merchandise:(id)sender;
-(IBAction)toRelApp:(id)sender;
- (IBAction)myProfile:(id)sender;
-(IBAction)chat:(id)sender;

@end
