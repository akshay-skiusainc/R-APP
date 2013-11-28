//
//  AAWebViewController.h
//  Citrus
//
//  Created by Ankur Arya on 13/07/13.
//  Copyright (c) 2013 Arya Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSString+DecodeUrl.h"
#import "AACancelTxnViewController.h"
@interface AAWebViewController : UIViewController<UIWebViewDelegate>
{
    NSDictionary *dict;
}

@property (weak, nonatomic) IBOutlet UILabel *OAMT;
@property (nonatomic, retain) NSMutableArray *m_total;
@property (nonatomic, retain) NSString *order_total;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic, retain) NSMutableDictionary *detailsDict;
@property (weak, nonatomic) IBOutlet UILabel *txnNumber;
@property (weak, nonatomic) IBOutlet UIView *Cancelview;
@property (weak, nonatomic) IBOutlet UILabel *TS;
@property (weak, nonatomic) IBOutlet UITextView *TXTVIEW;

@property (weak, nonatomic) IBOutlet UILabel *txnStatus;
@property (weak, nonatomic) IBOutlet UILabel *ODRAMT;
@end
