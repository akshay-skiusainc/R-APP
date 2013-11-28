//
//  R_MovieCatalogue_4.h
//  RelianceApplication
//
//  Created by Akshay Jain on 10/17/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatabaseClass.h"

@interface R_MovieCatalogue_4 : DatabaseClass<UIGestureRecognizerDelegate,UIScrollViewDelegate,UITextViewDelegate>
{
    UIButton    *btn[1000];
    UIImageView *movieImage[1000];
    UITextView *moviName[1000];
    UILabel *MovieLabel[1000];
    UIImageView *grayImage[1000];
    UIImageView *PAGINGEFFECT[10];
    int TotalCategory;
    int td;
    UIButton* Overlaybtn;
}


@property (retain, nonatomic)  NSMutableArray *movieNameArray;
@property (retain, nonatomic)  NSMutableArray *movieNameArray1;

@property (strong, nonatomic) IBOutlet UIScrollView *type_scroller;
@property (strong, nonatomic) IBOutlet UIScrollView *Movie_Scroller;
//@property (strong, nonatomic) IBOutlet UIScrollView *Movie_Scroller1;

@property (strong, nonatomic) NSString *TAG;


@end
