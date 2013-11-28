//
//  SubjectiveViewController.h
//  Relapp
//
//  Created by Anish on 8/6/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"
@interface SubjectiveViewController : GAITrackedViewController<UITextViewDelegate>

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
- (IBAction)merchandise:(id)sender;
-(IBAction)toRelApp:(id)sender;
- (IBAction)myProfile:(id)sender;
-(IBAction)chat:(id)sender;
@end
