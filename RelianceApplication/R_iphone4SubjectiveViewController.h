//
//  R_iphone4SubjectiveViewController.h
//  RelianceApplication
//
//  Created by Anish on 10/17/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"



@interface R_iphone4SubjectiveViewController : GAITrackedViewController<UITextViewDelegate,UITextFieldDelegate>
{
    
    CGFloat start;
    BOOL directionUp;
    
}
@property (strong, nonatomic) IBOutlet UIView *footerMainView;


@property (unsafe_unretained, nonatomic) IBOutlet UITextView *Questionlabel;
@property(nonatomic,retain)NSString *Questionis;
@property(nonatomic,retain)NSString   *QID;
@property(nonatomic, retain) NSString *importedUrl;
@property(nonatomic, retain) IBOutlet UIImageView *contestImage;
@property (nonatomic, retain) NSMutableData *data;
@property(nonatomic,retain)  NSString   *selectedans;
@property(nonatomic,retain) IBOutlet UITextView *ansTextView;
@property (unsafe_unretained, nonatomic) IBOutlet UIScrollView *Scroller;
@property(nonatomic,retain)UILabel *placeHolderTitle;
@property (weak, nonatomic) IBOutlet UIView *footerView;
@property(nonatomic, retain) IBOutlet UIActivityIndicatorView *objActIndicator;
- (IBAction)openFooter:(id)sender;
-(IBAction)toRelApp:(UIButton *)sender;
- (IBAction)merchandise:(id)sender;
-(IBAction)chat:(id)sender;
- (IBAction)myProfile:(id)sender;


@end
