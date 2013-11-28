//
//  NSString+DecodeUrl.m
//  Citrus
//
//  Created by Ankur Arya on 15/07/13.
//  Copyright (c) 2013 Arya Corp. All rights reserved.
//

#import "NSString+DecodeUrl.h"

@implementation NSString (DecodeUrl)

- (NSString *)stringByDecodingURLFormat
{
    NSString *result = [(NSString *)self stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    result = [result stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return result;
}
@end
