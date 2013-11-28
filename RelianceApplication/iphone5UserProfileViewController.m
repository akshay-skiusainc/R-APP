//
//  iphone5UserProfileViewController.m
//  RelianceApplication

//  Created by Anish on 10/30/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import "iphone5UserProfileViewController.h"
#import "AboutInfoViewController.h"

#import "R_AboutScreen_5.h"
@interface iphone5UserProfileViewController ()

@end

@implementation iphone5UserProfileViewController

@synthesize  likeBtn,commentBtn,profileBtn,likeLable,commentLable,appInfoBtn,currentUser,profileActivityIndicator,socialProfileImage,cameraBtn,popover,cameraTag,sharingBtnImg,scrollView,sharingBtn,fbSwitch,twtSwitch;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    profileActivityIndicator.hidden=NO;
    [profileActivityIndicator startAnimating];
    
    sharingBtnImg.image=[UIImage imageNamed:@"close_arrow.png"];
    
    
    
    currentUser = [SZUserUtils currentUser];
    SZUserSettings *settings = [SZUserUtils currentUserSettings];
    [settings populateFullUser:currentUser];
    
    socialProfileImage.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"color_pacth_400x400.png"]];
    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:socialProfileImage];
    NSURL *url1 = [NSURL URLWithString:[currentUser smallImageUrl]];
    ((AsyncImageView *)socialProfileImage).imageURL =url1;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self getLikesByUser];
        [self listCommentsByUser];
        //[self getLikesByUser];
        
    });

    
    NSUInteger check = [[NSUserDefaults standardUserDefaults] integerForKey:@"fbSwitch"];
    if (check==1) {
        [fbSwitch setOn:YES];
    }
    else
        [fbSwitch setOn:NO];
    
    
    check = [[NSUserDefaults standardUserDefaults] integerForKey:@"twtSwitch"];
    if (check==1) {
        [twtSwitch setOn:YES];
    }
    else
        [twtSwitch setOn:NO];
    
    
}
- (IBAction) toggleEnabledTextForSwitch1onSomeLabel: (UISwitch *) sender {
    if (sender==fbSwitch) {
        
        if (fbSwitch.on)
        {
            
            NSUserDefaults *setUserDefaults=[NSUserDefaults standardUserDefaults];
            [setUserDefaults setInteger:1 forKey:@"fbSwitch"];
            
            NSLog(@"1");

        }
        else
        {
            NSUserDefaults *setUserDefaults=[NSUserDefaults standardUserDefaults];
            [setUserDefaults setInteger:0 forKey:@"fbSwitch"];
            NSLog(@"0");

        }
    }
    
    if (sender==twtSwitch) {
        
        if (twtSwitch.on)
        {
            NSUserDefaults *setUserDefaults=[NSUserDefaults standardUserDefaults];
            [setUserDefaults setInteger:1 forKey:@"twtSwitch"];
        }
        else
        {
            NSUserDefaults *setUserDefaults=[NSUserDefaults standardUserDefaults];
            [setUserDefaults setInteger:0 forKey:@"twtSwitch"];
        }
    }
}

- (void)getLikesByUser {
    
    NSNumber *start1 = [NSNumber numberWithInteger:0];
    NSNumber *end1 = [NSNumber numberWithInteger:50];
    currentUser = [SZUserUtils currentUser];
    [SZLikeUtils getLikesForUser:currentUser start:start1 end:end1 success:^(NSArray *likes) {
        NSLog(@"Got likes:%d %@",[likes count], likes);
        likeLable.text=[NSString stringWithFormat:@"%d",[likes count]];
        
        // [[NSUserDefaults standardUserDefaults] setInteger:[likes count] forKey:@"getLikesByUser"];
        NSLog(@"My name is %@ %d %@ %@!",[SZUserUtils currentUser], [currentUser objectID], [currentUser lastName],[currentUser description]);
    } failure:^(NSError *error) {
        NSLog(@"Failed getting likes: %@", [error localizedDescription]);
    }];
    
}
- (void)listCommentsByUser {
    [SZCommentUtils getCommentsByUser:currentUser first:nil last:nil success:^(NSArray *comments) {
        NSLog(@"Fetched comments: %@", comments);
        commentLable.text=[NSString stringWithFormat:@"%d",[comments count]];
        [profileActivityIndicator stopAnimating];
        profileActivityIndicator.hidden=YES;
    } failure:^(NSError *error) {
        NSLog(@"Failed: %@", [error localizedDescription]);
    }];
    
}

- (void)showUserProfile {
    
    // Pass nil to show the current user
    [SZUserUtils showUserProfileInViewController:self user:nil completion:^(id<SZFullUser> user) {
        NSLog(@"Done showing profile");
    }];
}

- (void)showUserSettings {
    [SZUserUtils showUserSettingsInViewController:self completion:^{
        NSLog(@"Done showing settings");
    }];
}


- (void)listCommentsByApplication {
    
    [SZCommentUtils getCommentsByApplicationWithFirst:nil last:nil success:^(NSArray *comments) {
        NSLog(@"Fetched comments: %@", comments);
    } failure:^(NSError *error) {
        NSLog(@"Failed: %@", [error localizedDescription]);
    }];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    GlobalClass *OBJ = [GlobalClass getInstance];
    OBJ.fetchall=@"1";
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *q = [NSString stringWithFormat:@"select PHONE,EMAIL From USER WHERE ID=1"];
    [self getProfileDetails:q];
    _username.text=MobileNo;
    _emailaddr.text=Email;
    

    // Do any additional setup after loading the view from its nib.
    cameraTag=0;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"home_bg.jpg"]];
    
    
    UIImage *buttonImage = [UIImage imageNamed:@"back-btn.png"];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setImage:buttonImage forState:UIControlStateNormal];
    
    button.frame = CGRectMake(0, 0, buttonImage.size.width, buttonImage.size.height);
    
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    self.navigationItem.leftBarButtonItem = customBarItem;
    
    
    
    
    
}

-(void)back {
    
    [self.navigationController popViewControllerAnimated:YES];
}





-(IBAction)ButtonClicked:(id)sender
{
    if (sender==likeBtn) {
        [self showUserProfile];
    }
    
    if (sender==commentBtn) {
        [self showUserProfile];
    }
    
    if (sender==profileBtn) {
        [self showUserSettings];
        
    }
    
    if (sender==appInfoBtn) {
        R_AboutScreen_5 *aboutVC=[[R_AboutScreen_5 alloc]initWithNibName:@"R_AboutScreen_5" bundle:nil];
        
        aboutVC.modalTransitionStyle= UIModalTransitionStyleCrossDissolve;
        [self presentViewController:aboutVC animated:YES completion:nil];

        
    }
    
    if (sender==cameraBtn) {
        UIActionSheet *selectShare = [[UIActionSheet alloc] initWithTitle:@"Select" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Camera",@"Photo Library",nil];
        selectShare.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
        
        [selectShare showInView:[UIApplication sharedApplication].keyWindow];
        
        
    }
    
    
    if (sender==sharingBtn) {
        if(scrollView.frame.origin.y == 0)
        {
            sharingBtnImg.image=[UIImage imageNamed:@"open_arrow.png"];
            [UIView beginAnimations:@"Animate Text Field Up" context:nil];
            [UIView setAnimationDuration:.3];
            [UIView setAnimationBeginsFromCurrentState:YES];
            scrollView.frame = CGRectMake(scrollView.frame.origin.x,
                                          -133,
                                          scrollView.frame.size.width,
                                          scrollView.frame.size.height);
            [UIView commitAnimations];
        }
        else if(scrollView.frame.origin.y == -133)
        {
            sharingBtnImg.image=[UIImage imageNamed:@"close_arrow.png"];
            [UIView beginAnimations:@"Animate Text Field Up" context:nil];
            [UIView setAnimationDuration:.3];
            [UIView setAnimationBeginsFromCurrentState:YES];
            scrollView.frame = CGRectMake(scrollView.frame.origin.x,
                                          0,
                                          scrollView.frame.size.width,
                                          scrollView.frame.size.height);
            [UIView commitAnimations];
        }
        
        
    }
}


-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (buttonIndex == 0) {
        cameraTag=1;
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.cameraDevice=UIImagePickerControllerCameraDeviceFront;
        picker.delegate = self;
        [self presentViewController:picker animated:YES completion:nil];
    }
    
    
    if (buttonIndex == 1)
    {
        cameraTag=2;
        
        if([popover isPopoverVisible])
        {
            [popover dismissPopoverAnimated:YES];
        }
        
        else {
            
            //            UIImagePickerController *imagePickerView = [[UIImagePickerController alloc] init];
            //            imagePickerView.delegate = self;
            //            imagePickerView.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            //            imagePickerView.allowsEditing = YES;
            //
            //            popover = [[UIPopoverController alloc]initWithContentViewController:imagePickerView];
            //            popover.delegate = self;
            //            [popover presentPopoverFromRect:socialProfileImage.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            picker.allowsEditing=YES;
            // picker.cameraDevice=UIImagePickerControllerCameraDeviceFront;
            picker.delegate = self;
            [self presentViewController:picker animated:YES completion:nil];
        }
        
    }
    
    
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    if (cameraTag==1)
    {
        [picker dismissModalViewControllerAnimated:YES];
        socialProfileImage.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        socialProfileImage.image = [self scaleImage:socialProfileImage.image toSize:CGSizeMake(252, 274)];
        
        SZUserSettings *settings = [SZUserUtils currentUserSettings];
        settings.profileImage = socialProfileImage.image;
        // settings.bio = @"I do some stuff from time to time";
        
        // Update the server
        [SZUserUtils saveUserSettings:settings success:^(SZUserSettings *settings, id<SocializeFullUser> updatedUser) {
            NSLog(@"Saved user %d", [updatedUser objectID]);
        } failure:^(NSError *error) {
            NSLog(@"Broke: %@", [error localizedDescription]);
        }];
        
    }
    
    if (cameraTag==2) {
        
        socialProfileImage.image = [info objectForKey:@"UIImagePickerControllerEditedImage"];
        socialProfileImage.image = [self scaleImage:socialProfileImage.image toSize:CGSizeMake(252, 274)];
        
        SZUserSettings *settings = [SZUserUtils currentUserSettings];
        settings.profileImage = socialProfileImage.image;
        // settings.bio = @"I do some stuff from time to time";
        
        // Update the server
        [SZUserUtils saveUserSettings:settings success:^(SZUserSettings *settings, id<SocializeFullUser> updatedUser) {
            NSLog(@"Saved user %d", [updatedUser objectID]);
        } failure:^(NSError *error) {
            NSLog(@"Broke: %@", [error localizedDescription]);
        }];
        
        
        [picker dismissModalViewControllerAnimated:YES];
    }
    
}

- (void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)image
                  editingInfo:(NSDictionary *)editingInfo
{
    
    socialProfileImage.image = image;
    //    imageView.image = [self scaleImage:imageView.image toSize:CGSizeMake(252, 274)];
    //
    //    //imageView.image = resizedImage(imageView.image, CGRectMake(0, 0, 107, 107));
    //
    //    [addPhotoBtn setBackgroundImage:imageView.image forState:UIControlStateNormal];
    
    
    [[picker parentViewController] dismissModalViewControllerAnimated:YES];
}


// Rescaling the image to be shown on profile
- (UIImage *)scaleImage:(UIImage *)sourceImage toSize:(CGSize)targetSize
{
	UIImage *newImage = nil;
	
	CGSize imageSize = sourceImage.size;
	CGFloat width = imageSize.width;
	CGFloat height = imageSize.height;
    
    NSLog(@"Image width is: %f",width);
    NSLog(@"Image height is: %f",height);
	
	CGFloat targetWidth = targetSize.width;
	CGFloat targetHeight = targetSize.height;
	
	CGFloat scaleFactor = 0.0;
    CGFloat scaleFactor2 = 0.0;
	CGFloat scaledWidth = targetWidth;
	CGFloat scaledHeight = targetHeight;
	
	CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
	
	if (CGSizeEqualToSize(imageSize, targetSize) == NO)
        
        
        //if ((sourceImage.imageOrientation == UIImageOrientationUp) || (sourceImage.imageOrientation == UIImageOrientationDown)
    {
        
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
		
        
        if (widthFactor < heightFactor)
        {
			scaleFactor = heightFactor;
            scaleFactor2 = widthFactor;
            
            scaledWidth  = width * scaleFactor2;
            scaledHeight = height * scaleFactor;
            
        }
        else
        {
			scaleFactor = widthFactor;
            scaleFactor2 = heightFactor;
            
            scaledWidth  = width * scaleFactor;
            scaledHeight = height * scaleFactor2;
            
        }
		
        
        
        NSLog(@"Scaled width is: %f",scaledWidth);
        NSLog(@"Scaled height is: %f",scaledHeight);
		
        // center the image
		
        if (widthFactor < heightFactor) {
			thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        } else if (widthFactor > heightFactor) {
			thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
        
	}
    
    
	UIGraphicsBeginImageContext(targetSize);
	
	CGRect thumbnailRect = CGRectZero;
	thumbnailRect.origin = thumbnailPoint;
	thumbnailRect.size.width  = scaledWidth;
	thumbnailRect.size.height = scaledHeight;
	
	[sourceImage drawInRect:thumbnailRect];
	
	newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	if(newImage == nil) NSLog(@"could not scale image");
	
	return newImage;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
