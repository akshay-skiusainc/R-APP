//
//  AACancelTxnViewController.m
//  Citrus
//
//  Created by Ankur Arya on 17/07/13.
//  Copyright (c) 2013 Arya Corp. All rights reserved.
//

#import "AACancelTxnViewController.h"

@interface AACancelTxnViewController ()

@end

@implementation AACancelTxnViewController

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
    NSLog(@"canceled");
    // Do any additional setup after loading the view from its nib.
    self.nameLbl.text = [self.userInfoDict objectForKey:@"firstName"];
    self.txnLbl.text = [self.userInfoDict objectForKey:@"TxId"];
    self.txnIdLbl.text = [self.userInfoDict objectForKey:@"transactionId"];
    self.loadStatusLbl.text = [self.userInfoDict objectForKey:@"loadStatus"];
    self.txnStatus.text = [self.userInfoDict objectForKey:@"TxStatus"];
    
    [self performSelector:@selector(back) withObject:nil afterDelay:0.2];
    
//    UIViewController *prevVC = [self.navigationController.viewControllers objectAtIndex:1];
//    [self.navigationController popToViewController:prevVC animated:YES];
//    /NSLog(@"Dictiihggh =%@",self.userInfoDict);
}

-(IBAction)back
{
  //  [self.parentViewController.parentViewController dismissModalViewControllerAnimated:YES];

    [self dismissModalViewControllerAnimated:YES];
//    [self.navigationController popViewControllerAnimated:YES];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
