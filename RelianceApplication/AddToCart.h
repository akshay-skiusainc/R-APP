//
//  AddToCart.h
//  RelianceApplication
//
//  Created by Akshay Jain on 9/4/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatabaseClass.h"
#import "AAViewController.h"
@interface AddToCart : DatabaseClass<UIPickerViewDelegate,UIPickerViewDataSource>
{
    UIImageView             *ImagePatch[1000];
    UIImageView             *ImagePatch2[1000];
    UITextView              *Description[1000];
    UIImageView             *Imageview[1000];
    UILabel                 *Price[1000];
    UIButton                *Qtybtn[1000];
    UIButton                *Removebtn[1000];
    UIScrollView *VideoScroller;
    UIActivityIndicatorView     *activityIndicator;
    NSMutableArray  *m_total;

    int tagreceived;
}
@property (weak, nonatomic) IBOutlet UILabel *subtotal;
@property (weak, nonatomic) IBOutlet UILabel *ShippingCharges;
@property (weak, nonatomic) IBOutlet UILabel *ORDERTOTAL;
@property (weak, nonatomic) IBOutlet UIImageView *Pricebg;
@property (nonatomic,retain) UIPopoverController *popover;

@property (weak, nonatomic) IBOutlet UIImageView *BCKIMAGE;
@property (strong, nonatomic)  UIScrollView *VideoScroller;
@property (nonatomic,retain) UIPickerView *heightPicker;
@property(nonatomic,retain) NSMutableArray *heightArray;
@property(nonatomic,retain) NSTimer *timer;
@property (weak, nonatomic) IBOutlet UILabel *labelsubtotal;
@property (weak, nonatomic) IBOutlet UIButton *buybutton;


-(IBAction)back;
@end
