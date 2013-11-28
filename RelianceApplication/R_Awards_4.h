//
//  R_Awards_4.h
//  RelianceApplication
//
//  Created by Ashwini Pawar on 01/11/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatabaseClass.h"

@interface R_Awards_4 : DatabaseClass<UIGestureRecognizerDelegate,UIScrollViewDelegate>
{
    UIImageView *awardImages[1000];
    UIScrollView *scroller;
    
}
@property (strong, nonatomic) NSString *TAG;

@end
