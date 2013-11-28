//
//  iphone4ObjectiveViewController.h
//  Relapp
//
//  Created by Anish on 8/16/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"
@interface iphone4ObjectiveViewController:GAITrackedViewController

{
    CGFloat start;
    BOOL directionUp;
    
}
@property (strong, nonatomic) IBOutlet UIView *footerMainView;

@property (unsafe_unretained, nonatomic) IBOutlet UITextView *Questionlabel;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *ans1label;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *ans2label;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *ans3label;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *ans4label;
@property (unsafe_unretained, nonatomic) IBOutlet UIButton *ANS1BUTTON;
@property (unsafe_unretained, nonatomic) IBOutlet UIButton *ANS2BUTTON;
@property (unsafe_unretained, nonatomic) IBOutlet UIButton *ANS3BUTTON;
@property (unsafe_unretained, nonatomic) IBOutlet UIButton *ANS4BUTTON;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicaror;

@property(nonatomic,retain)NSString *Questionis;
@property(nonatomic,retain)NSString *ANS1;
@property(nonatomic,retain)NSString *ANS2;
@property(nonatomic,retain)NSString *ANS3;
@property(nonatomic,retain)NSString *ANS4;

@property(nonatomic,retain)NSString *CorrectAns;
@property(nonatomic,retain)NSString   *QID;
@property(nonatomic,retain) NSString   *selectedans;
@property(nonatomic, retain) NSString *importedUrl;
@property(nonatomic, retain) IBOutlet UIImageView *contestImage;
@property (nonatomic, retain) NSMutableData *data;
@property(nonatomic, retain) IBOutlet UIActivityIndicatorView *objActIndicator;
@property (weak, nonatomic) IBOutlet UIView *footerView;
- (IBAction)openFooter:(id)sender;
-(IBAction)ANSSELECTED:(id)sender;
-(IBAction)toRelApp:(UIButton *)sender;
- (IBAction)merchandise:(id)sender;
-(IBAction)chat:(id)sender;
- (IBAction)myProfile:(id)sender;

@end
