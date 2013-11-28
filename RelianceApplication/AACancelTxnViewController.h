//
//  AACancelTxnViewController.h
//  Citrus
//
//  Created by Ankur Arya on 17/07/13.
//  Copyright (c) 2013 Arya Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AACancelTxnViewController : UIViewController

@property (nonatomic, retain) NSDictionary *userInfoDict;
@property (weak, nonatomic) IBOutlet UILabel *nameLbl;
@property (weak, nonatomic) IBOutlet UILabel *txnLbl;
@property (weak, nonatomic) IBOutlet UILabel *txnStatus;
@property (weak, nonatomic) IBOutlet UILabel *loadStatusLbl;
@property (weak, nonatomic) IBOutlet UILabel *txnIdLbl;

-(IBAction)back;

@end
