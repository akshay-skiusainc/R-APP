//
//  iphone4UserProfileViewController.h
//  RelianceApplication
//
//  Created by Anish on 10/30/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatabaseClass.h"
#import "R_AboutScreen_4.h"
@interface iphone4UserProfileViewController : DatabaseClass<UIPickerViewDelegate,UIPickerViewDataSource,UIActionSheetDelegate,UIImagePickerControllerDelegate,UIPopoverControllerDelegate>


@property (nonatomic,retain) IBOutlet UIActivityIndicatorView *profileActivityIndicator;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *emailaddr;

@property (nonatomic,retain) IBOutlet UIButton *likeBtn;
@property (nonatomic,retain) IBOutlet UIButton *commentBtn;
@property (nonatomic,retain) IBOutlet UIButton *profileBtn;
@property (nonatomic,retain) IBOutlet UIButton *appInfoBtn;
@property (nonatomic,retain) IBOutlet UIButton *cameraBtn;
@property (nonatomic,retain) IBOutlet UIButton *sharingBtn;

@property (nonatomic,retain) IBOutlet UILabel *likeLable;
@property (nonatomic,retain) IBOutlet UILabel *commentLable;

@property (nonatomic,retain) IBOutlet UIImageView *sharingBtnImg;
@property (nonatomic,retain) IBOutlet UIImageView *socialProfileImage;

@property (nonatomic, retain) id<SZFullUser>currentUser;
@property (nonatomic,retain) UIPopoverController *popover;
@property (nonatomic) int cameraTag;

@property (nonatomic,retain) NSMutableArray *entityArray;

@property (nonatomic,retain) IBOutlet UIView *scrollView;
@property (nonatomic,retain) IBOutlet UISwitch *fbSwitch;
@property (nonatomic,retain) IBOutlet UISwitch *twtSwitch;

@end
