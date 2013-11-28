//
//  AAViewController.h
//  Citrus
//
//  Created by Ankur Arya on 13/07/13.
//  Copyright (c) 2013 Arya Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AAConfirmDetailsViewController.h"
#import "DatabaseClass.h"
@interface AAViewController : DatabaseClass<UITextFieldDelegate,UIScrollViewDelegate>
{
    long long int txnId;
    bool stricterFilter;
}
@property (retain, nonatomic)  NSMutableArray *stateNameArray;
@property (retain, nonatomic) IBOutlet UITableView *dropDownTbl;
@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *amount;
@property (weak, nonatomic) IBOutlet UITextField *state;
@property (weak, nonatomic) IBOutlet UITextField *zipcode;
@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UITextField *country;
@property (weak, nonatomic) IBOutlet NSString *getamount;
@property (weak, nonatomic) IBOutlet UITextField *quantity;
@property (weak, nonatomic) IBOutlet UITextField *city;
@property (weak, nonatomic) IBOutlet UITextField *contactno;

@property (strong, nonatomic) IBOutlet UIView *bgView;
@property (strong, nonatomic) IBOutlet UIScrollView *Scroller;
@property (strong, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UILabel *shippinglabel;
@property (weak, nonatomic) IBOutlet UITextField *Street2;



@property (nonatomic, retain) NSMutableArray *m_total;
@property (nonatomic, retain) NSString *order_total;


@property (nonatomic, retain) NSMutableDictionary *detailsDict;
@property (weak, nonatomic) IBOutlet UITextField *hmacUrl;
@property (weak, nonatomic) IBOutlet UITextField *returnUrl;

- (IBAction)next:(id)sender;

@end
