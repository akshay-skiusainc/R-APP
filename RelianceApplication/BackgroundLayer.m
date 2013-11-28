//
//  BackgroundLayer.m
//  BrokerTestApp
//
//  Created by  on 2/02/12.
//  Copyright (c) 2012 AFG. All rights reserved.
//

#import "BackgroundLayer.h"
#import "AppDelegate.h"

@implementation BackgroundLayer

//Metallic grey gradient background
+ (CAGradientLayer*) greyGradient {
	
	UIColor *colorOne		= [UIColor colorWithWhite:0.9 alpha:1.0];
	UIColor *colorTwo		= [UIColor colorWithHue:0.625 saturation:0.0 brightness:0.85 alpha:1.0];
	UIColor *colorThree	    = [UIColor colorWithHue:0.625 saturation:0.0 brightness:0.7 alpha:1.0];
	UIColor *colorFour		= [UIColor colorWithHue:0.625 saturation:0.0 brightness:0.4 alpha:1.0];
    
	NSArray *colors =  [NSArray arrayWithObjects:(id)colorOne.CGColor, colorTwo.CGColor, colorThree.CGColor, colorFour.CGColor, nil];
	
	NSNumber *stopOne		= [NSNumber numberWithFloat:0.0];
	NSNumber *stopTwo		= [NSNumber numberWithFloat:0.02];
	NSNumber *stopThree	    = [NSNumber numberWithFloat:0.99];
	NSNumber *stopFour		= [NSNumber numberWithFloat:1.0];
	
	NSArray *locations = [NSArray arrayWithObjects:stopOne, stopTwo, stopThree, stopFour, nil];
	
	CAGradientLayer *headerLayer = [CAGradientLayer layer];
	headerLayer.colors = colors;
	headerLayer.locations = locations;
	
	return headerLayer;
}

//Blue gradient background
+ (CAGradientLayer*) blueGradient {
    
   AppDelegate *appD=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSLog(@"top hex value is ************************************************ %@",appD.hexTop);
      NSLog(@"Bottom hex value is ************************************************ %@",appD.hexBottom);
    UIColor *colorOne = [self colorWithHexString: [appD.hexTop substringFromIndex:1]];
//    UIColor *colorTwo = [UIColor colorWithRed:(182/255.0)  green:(208/255.0)  blue:(199/255.0)  alpha:1.0];
    UIColor *colorTwo = [self colorWithHexString:[appD.hexBottom substringFromIndex:1]];
    NSArray *colors = [NSArray arrayWithObjects:(id)colorOne.CGColor, colorTwo.CGColor, nil];
    
    NSNumber *stopOne = [NSNumber numberWithFloat:0.0];
    NSNumber *stopTwo = [NSNumber numberWithFloat:1.0];
    
    NSArray *locations = [NSArray arrayWithObjects:stopOne, stopTwo, nil];
    
    CAGradientLayer *headerLayer = [CAGradientLayer layer];
	headerLayer.colors = colors;
	headerLayer.locations = locations;
	
	return headerLayer;
                       
}

+ (UIColor *) colorWithHexString: (NSString *) hex
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
	
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
	
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
	
    if ([cString length] != 6) return  [UIColor grayColor];
	
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
	
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
	
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
	
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
	
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

@end
