//
//  R_AboutScreen_4.m
//  RelianceApplication
//
//  Created by Ashwini Pawar on 15/11/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import "R_AboutScreen_4.h"

@interface R_AboutScreen_4 ()

@end

@implementation R_AboutScreen_4

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage* app_bg_image = [UIImage imageNamed:@"rel_i4home_bg.jpg"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:app_bg_image];
    
        
}
-(IBAction)back:(UIButton *)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

-(BOOL)shouldAutorotate
{
    return NO;
}
-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationPortrait;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
