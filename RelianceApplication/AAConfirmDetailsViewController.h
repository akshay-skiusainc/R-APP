//
//  AAConfirmDetailsViewController.h
//  Citrus
//
//  Created by Ankur Arya on 13/07/13.
//  Copyright (c) 2013 Arya Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AAWebViewController.h"
#import "DatabaseClass.h"
@interface AAConfirmDetailsViewController : DatabaseClass
@property (weak, nonatomic) IBOutlet UILabel *firstNameLbl;
@property (weak, nonatomic) IBOutlet UILabel *lastNameLbl;
@property (weak, nonatomic) IBOutlet UILabel *emailLbl;
@property (weak, nonatomic) IBOutlet UILabel *amountLbl;
@property (weak, nonatomic) IBOutlet UILabel *tIDLbl;
@property (nonatomic, retain) NSMutableDictionary *detailsDict;
@property (weak, nonatomic) IBOutlet UILabel *hmacUrl;
@property (weak, nonatomic) IBOutlet UILabel *returnUrl;
- (IBAction)payNow:(id)sender;

@end
