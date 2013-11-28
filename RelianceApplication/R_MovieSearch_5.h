//
//  R_MovieSearch_5.h
//  RelianceApplication
//
//  Created by Ashwini Pawar on 30/10/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatabaseClass.h"
#import "R_OpenMovie_5.h"

@interface R_MovieSearch_5 : DatabaseClass<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UIGestureRecognizerDelegate>
{
    UIScrollView    *GalleryScroll;
    UIImageView     *frame[1000];
    NSMutableArray   *category_array;
    NSMutableArray   *Decade_array;
    NSMutableArray   *alphabetical_array;
    int gettag;
    
    UILabel *MovieLabel[1000];
    UIImageView     *grayImage[100];

}
@property (retain, nonatomic)  NSMutableArray *movieNameArray;

@property (weak, nonatomic) IBOutlet UITextField *cat_textfield;
@property (weak, nonatomic) IBOutlet UITextField *Decade_textfield;
@property (weak, nonatomic) IBOutlet UITextField *alphabetical_textfield;
@property (weak, nonatomic) IBOutlet UITableView *dropdownTable;
@property (strong, nonatomic) NSString *TAG;

@end
