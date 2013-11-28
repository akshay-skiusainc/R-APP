//
//  RageIAPHelper.m
//  In App Rage
//
//  Created by Ray Wenderlich on 9/5/12.
//  Copyright (c) 2012 Razeware LLC. All rights reserved.
//

#import "RageIAPHelper.h"

@implementation RageIAPHelper

+ (RageIAPHelper *)sharedInstance {
    static dispatch_once_t once;
    static RageIAPHelper * sharedInstance;
    
    dispatch_once(&once, ^{
//        NSSet * productIdentifiers = [NSSet setWithObjects:
//                                      @"com.skiusainc.RelianceEntertainment.Premium",
//                                      @"com.skiusainc.RelianceEntertainment.Premium",
//                                      nil];
        
        GlobalClass *obj=[GlobalClass getInstance];

        NSLog(@"oooooo=%@",obj.IAPProduct1);
        NSSet * productIdentifiers = [NSSet setWithObjects:obj.IAPProduct1,obj.IAPProduct1,
                                      nil];

        sharedInstance = [[self alloc] initWithProductIdentifiers:productIdentifiers];
    });
    return sharedInstance;
}

@end
