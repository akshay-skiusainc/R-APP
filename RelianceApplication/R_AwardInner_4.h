//
//  R_AwardInner_4.h
//  RelianceApplication
//
//  Created by Ashwini Pawar on 07/11/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface R_AwardInner_4 : DatabaseClass<UIGestureRecognizerDelegate,UIScrollViewDelegate,UITextFieldDelegate>
{
    UIScrollView *scroller;
    UIImageView *awardImages[1000];
    UIImageView *detailAwardImage;
    int totalAwardWinner;
}
@property (retain, nonatomic)  NSString *movieId;
@property (retain, nonatomic)  NSString *awardImage;
@property (strong, nonatomic)  UIImageView *specificAward;
@property (strong, nonatomic) IBOutlet UIScrollView *detailScroller;

@property (strong, nonatomic) IBOutlet UITextField *movieSearch;
@property (strong, nonatomic) IBOutlet UITableView *movieTable;
@property (retain, nonatomic)  NSMutableArray *movieNameArray;
@end
