//
//  GlobalClass.h
//  Dabaang2Application
//
//  Created by Javed Sunesra on 11/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalClass : NSObject
{
	
    NSDictionary *str;
    NSDictionary *onset;
	NSDictionary *videolinks;
	NSDictionary *Dwall;
	NSDictionary *CNC;    
	NSDictionary *Bookmyshow; 
    NSDictionary *Feedback;
    NSString *coming;
	NSDictionary *music;
	NSDictionary *Notifications;
    NSDictionary *Contests;
    NSString *rateit;
    NSString *dirnote;
    NSDictionary *detailCastnCrew;
    NSDictionary *detailCast;
    NSDictionary *productionImage;
    NSDictionary *detailCrew;
    NSString *checking;
    NSString *BACK;
    NSString *appcount;
    NSString *emo;
    NSString *CHECK_LOADING;

    
    NSMutableArray *chatdata;
    
    NSString *called;
    NSString *loggin;
    NSDictionary *groups;
    NSDictionary *category;
    NSString *DISMISSIT;
    NSDictionary    *directorsNote;
    
    NSDictionary    *news;
    NSDictionary* contestData;
    NSDictionary* BTS;
    NSDictionary* Banner;
    NSDictionary* appData;
    NSDictionary    *Merchandise;
    NSDictionary *FBSTATUS;
    NSString *TransStatus;
    NSDictionary *moviedata;


    NSDictionary *moviesharetxt;
    
    
    
    NSString *CHECK_CATALOG;
    
    NSString *CHECK_FETCH;
    NSString *REL_DATA;
    NSString *MOVIE_DATA;

    
    
    
}
@property(nonatomic,retain) NSString *REL_DATA;

@property(nonatomic,retain) NSString *MOVIE_DATA;

@property(nonatomic,retain) NSString *CHECK_FETCH;


@property(nonatomic,retain) NSString *CHECK_CATALOG;
@property(nonatomic,retain)NSDictionary *moviesharetxt;

@property(nonatomic,retain) NSString *CHECK_LOADING;

@property(nonatomic,retain) NSString *navchecking;
@property(nonatomic,retain) NSString *bms_link;
@property(nonatomic,retain) NSString *iapreceived;

@property(nonatomic,retain) NSString *IAPProduct1;
@property(nonatomic,retain)NSDictionary *moviedata;

@property(nonatomic,retain)NSMutableArray *Mid_added;
@property(nonatomic,retain)NSMutableArray *QtyOfProducts;


@property(nonatomic,retain)NSDictionary *newsshare;

@property(nonatomic,retain)NSDictionary *FBSTATUS;


@property(nonatomic,retain)NSDictionary *Merchandise;

@property(nonatomic,retain)NSDictionary *Banner;
@property(nonatomic,retain) NSDictionary *trailers;

@property(nonatomic,retain)NSDictionary *BTS;
@property(nonatomic,retain) NSString *Leftcheck;
@property(nonatomic,retain)NSDictionary *contestData;
@property(nonatomic,retain)NSDictionary *productionImage;
@property(nonatomic,retain)NSDictionary *contestHeader;
@property(nonatomic,retain)NSDictionary *contest_bg;
@property(nonatomic,retain)NSDictionary *contest_btn;
@property(nonatomic,retain)NSDictionary *detailCastnCrew;
@property(nonatomic,retain)NSDictionary *detailCast;
@property(nonatomic,retain)NSDictionary *detailCrew;
@property(nonatomic,retain)NSDictionary *appData;
@property(nonatomic,retain)NSDictionary *behindscene_video;
@property(nonatomic,retain)NSDictionary *behindscene_images;
@property(nonatomic,retain) NSMutableArray *chatdata;
@property(nonatomic,retain) NSString *called;
@property(nonatomic,retain) NSString *loggin;
@property(nonatomic,retain) NSString *DISMISSIT;
@property(nonatomic,retain)NSDictionary *directorsNote;
@property(nonatomic,retain)NSDictionary *news;
@property(nonatomic,retain)NSDictionary *wallpapers;
@property(nonatomic,retain)NSDictionary *groups;

@property(nonatomic,retain) NSString *BACK;
@property(nonatomic,retain) NSString *appcount;
@property(nonatomic,retain) NSString *coming;
@property(nonatomic,retain) NSString *dev;
@property(nonatomic,retain) NSString *rateit;
@property(nonatomic,retain) NSString *dirnote;
@property(nonatomic,retain) NSString *emo;
@property(nonatomic,retain) NSString *TransStatus;


@property(nonatomic,retain)NSDictionary *movieCategory;

@property(nonatomic,retain) NSString *checking;

@property(nonatomic,retain)NSDictionary *category;

@property(nonatomic,retain)NSDictionary *str;  
@property(nonatomic,retain)NSDictionary *onset;  
@property(nonatomic,retain)NSDictionary *videolinks;    
@property(nonatomic,retain)NSDictionary *Dwall;
@property(nonatomic,retain)NSDictionary *CNC; 
@property(nonatomic,retain)NSDictionary *Bookmyshow;
@property(nonatomic,retain)NSDictionary *Feedback;
@property(nonatomic,retain)NSDictionary *music;
@property(nonatomic,retain)NSDictionary *Notifications;
@property(nonatomic,retain)NSDictionary *Contests;

@property(nonatomic,retain)NSDictionary *videosharetext;
@property(nonatomic,retain)NSDictionary *twitter;
@property(nonatomic,retain)NSDictionary *facebook;
@property(nonatomic,retain)NSDictionary *mug;
@property(nonatomic,retain)NSDictionary *Tshirt;
@property(nonatomic,retain)NSDictionary *movie_poster;
@property(nonatomic,retain)NSString *fetchall;
@property(nonatomic,retain)NSDictionary *fbtoken;
@property(nonatomic,retain)NSDictionary *GROUPNAME;

@property(nonatomic,retain)NSDictionary *xtraDictionary;

@property(nonatomic,retain)NSDictionary *awardCat;
@property(nonatomic,retain)NSDictionary *awardMovie;
@property(nonatomic,retain)NSDictionary *detailAwards;
@property(nonatomic,retain)NSDictionary *awardInfo;






+(GlobalClass*)getInstance; 
+(GlobalClass *)getCheck;    

@end
