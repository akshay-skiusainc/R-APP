//
//  Daabang2SecondViewController.h
//  Dabaang2
//
//  Created by Javed Sunesra on 7/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreLocation/CoreLocation.h"
#import "MapKit/MapKit.h"
#import "annotation1.h"
#import "Annotation2.h"
#import "Annotation3.h"
#import "Annotation4.h"
#import "Annotation5.h"
#import "Annotation6.h"
#import "Annotation7.h"
#import "Annotation8.h"
#import "Annotation9.h"
#import "Annotation10.h"
#import "Annotation11.h"
#import "Annotation12.h"
#import "Annotation13.h"
#import "Annotation14.h"
#import "Annotation15.h"
#import "Annotation16.h"
#import "Annotation17.h"
#import "Annotation18.h"
#import "Annotation19.h"
#import "Annotation20.h"


//#import "GAITrackedViewController.h"
@interface iPhone5Daabang2SecondViewController : UIViewController<UIScrollViewDelegate, UITableViewDataSource,UITableViewDelegate,CLLocationManagerDelegate,MKMapViewDelegate,UIWebViewDelegate>
{
    IBOutlet MKMapView *mapView;
    CLLocationCoordinate2D theCoordinate;
    CLLocationManager *currentLocation;
    NSMutableArray              *Map_Annotaions;
    NSString *locationString;
    NSMutableArray      *ArrayForLocation;
    NSArray *jsonArray; 
      int u;
    float theater_lat ;
    float theater_lng ;
    NSString* THEATER_Name;
    NSString* Theater_address;
    NSMutableArray  *Theater_array;
    UIView      *backGroundView;
    UITableView *menuTableView;
    
    UIView *tableview;
    UIBarButtonItem *flipButton;
	UIBarButtonItem *doneButton;
    UIButton        *btn;
    UIScrollView    *Vscroll;
    int  NumOfRows;
    UIImageView     *ImagePatch[50] ;
    UIImageView     *ImagePatch1[50] ;

    
    UILabel         *THEATHER_LABEL[2];
    UIImageView        *header;
    UIImageView         *img_VDivider;
    UIImageView         *ActIndImage;
    UIActivityIndicatorView  *activityIndicator;
    NSString                *CurrentLatitude;
    NSString                *CurrentLongitude;
    NSString                *th_name[50];
	NSString                *bmsurl[500];

    
    int      countra[100];
    NSString    *TN[100];
    NSString    *TA[100];
    double    TLat[100];
    double      TLon[100];
    int     counter;

    UIImageView     *ImageBck;
    NSString    *NearbyTheatersList[100];
    NSString    *TheaterAddress[100];
    NSString    *Time[100];
    UILabel     *Th_name_Lbl[100];
    UILabel     *Th_add_Lbl[100];
    
    UIImageView *STARIMAGE[100];
    UILabel     *lbl1;
    NSString *str;
    
    UIScrollView    *VideoScroller;
//    UIImageView     *ImagePatch[100];
    UIImageView     *StarImage[100];
    UIImageView     *Compass[100];
    int             TotalNumOfRows;
    CLLocationCoordinate2D myLocation; 
    NSString    *phoneno[100];
    NSString        *cityname[10];

    NSString            *rating[1000];
 NSString    *TomorowTime[1000];
    NSString *tlati[1000];
    NSString *tlngi[1000];
    int     *ratingForThr[1000];
	UIImageView		*geometry;
	UIWebView			*ads;

    CGFloat start;
    BOOL directionUp;
    
}
@property (strong, nonatomic) IBOutlet UIView *footerMainView;

@property (strong, nonatomic) NSString *TAG;
@property (nonatomic, retain) NSMutableArray *Theater_array;
@property (nonatomic, retain) NSMutableArray *Theater_Add_array;
@property (nonatomic, retain) NSMutableArray *Theater_latitude;
@property (nonatomic, retain) NSMutableArray *Theater_Longitude;

@property (nonatomic, retain) UITableView *menuTableView;
@property (nonatomic,retain)MKMapView *mapView;
@property (nonatomic, retain) UIBarButtonItem *flipButton;
@property (nonatomic, retain) UIBarButtonItem *doneButton;

@property (strong, nonatomic) UIView *footerView;
@property (strong, nonatomic)UIButton *relianceButton;
@property (strong, nonatomic)UIButton *merchandiseButton;
@property (strong, nonatomic)UIButton *chatButton;
@property (strong, nonatomic)UIButton *myProfileButton;
@property (nonatomic, retain) UIView *backGroundView;

@property (nonatomic, retain) IBOutlet UIView *tableview;
- (IBAction)openFooter:(id)sender;
-(IBAction)chat:(id)sender;
@end
