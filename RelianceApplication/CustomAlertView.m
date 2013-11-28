//
//  CustomAlertView.m
//  MobilePOS
//
// Created by Raintek on 2/11/12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.

#import "CustomAlertView.h"
#import "AppDelegate.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@implementation CustomAlertView

#pragma mark -
#pragma mark Memory management
- (void)dealloc 
{
   // [super dealloc];
}

#pragma mark -
#pragma mark UIView Overrides
- (void)layoutSubviews
{
	for (UIView *subview in self.subviews){ //Fast Enumeration
		//NSLog(@"subview class :%@",[subview class]); //Get Class Description of Each Subview
		//NSLog(@"subview.tag %i",subview.tag); //Get Button Tags
		
		if ([subview isMemberOfClass:[UIImageView class]]) { //Find UIImageView Containing Blue Background
			subview.hidden = YES; //Hide UIImageView Containing Blue Background
             [subview removeFromSuperview]; //Also Works
		}
        
		if ([subview isMemberOfClass:[UILabel class]]) { //Point to UILabels To Change Text
			UILabel *label = (UILabel*)subview;	//Cast From UIView to UILabel
			//label.textColor = [UIColor colorWithRed:210.0f/255.0f green:210.0f/255.0f blue:210.0f/255.0f alpha:1.0f];
            label.textColor=[UIColor whiteColor];
			label.shadowColor = [UIColor blackColor];
            label.textAlignment=NSTextAlignmentLeft;
            label.font= [UIFont boldSystemFontOfSize:15];
			label.shadowOffset = CGSizeMake(0.0f, 1.0f);
		}
	}
}

- (void)drawRect:(CGRect)rect 
{
    appD = (AppDelegate *)[[UIApplication sharedApplication] delegate];

	//////////////GET REFERENCE TO CURRENT GRAPHICS CONTEXT
	CGContextRef context = UIGraphicsGetCurrentContext();
	
    //////////////CREATE BASE SHAPE WITH ROUNDED CORNERS FROM BOUNDS
	CGRect activeBounds = self.bounds;
	CGFloat cornerRadius = 10.0f;	
	CGFloat inset = 6.5f;	
	CGFloat originX = activeBounds.origin.x + inset;
	CGFloat originY = activeBounds.origin.y + inset;
	CGFloat width = activeBounds.size.width - (inset*2.0f);
	CGFloat height = activeBounds.size.height - (inset*2.0f);
    
	CGRect bPathFrame = CGRectMake(originX, originY, width, height);
    CGPathRef path = [UIBezierPath bezierPathWithRoundedRect:bPathFrame cornerRadius:cornerRadius].CGPath;
	
	//////////////CREATE BASE SHAPE WITH FILL AND SHADOW
	CGContextAddPath(context, path);
	CGContextSetFillColorWithColor(context, [UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:210.0f/255.0f alpha:1.0f].CGColor);
	CGContextSetShadowWithColor(context, CGSizeMake(0.0f, 1.0f), 6.0f, [UIColor colorWithRed:0.0f/255.0f green:0.0f/255.0f blue:0.0f/255.0f alpha:1.0f].CGColor);
    CGContextDrawPath(context, kCGPathFill);
	
	//////////////CLIP STATE
	CGContextSaveGState(context); //Save Context State Before Clipping To "path"
	CGContextAddPath(context, path);
	CGContextClip(context);
	
	//////////////DRAW GRADIENT
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	size_t count = 3;
	CGFloat locations[3] = {0.0f, 0.57f, 1.0f}; 
//	CGFloat components[12] = 
//	{	70.0f/255.0f, 70.0f/255.0f, 70.0f/255.0f, 1.0f,     //1
//		55.0f/255.0f, 55.0f/255.0f, 55.0f/255.0f, 1.0f,     //2
//		40.0f/255.0f, 40.0f/255.0f, 40.0f/255.0f, 1.0f};	//3
    
    // GREEN COLOR
    if (appD.customAlert==1) {
        NSLog(@"appD.customAlert called %d",appD.customAlert);
        CGFloat components[12] =
        {	53.0f/255.0f, 148.0f/255.0f, 40.0f/255.0f, 1.0f,     //1
            53.0f/255.0f, 148.0f/255.0f, 40.0f/255.0f, 1.0f,     //2
            53.0f/255.0f, 148.0f/255.0f, 40.0f/255.0f, 1.0f};	//3
        CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, count);
        
        CGPoint startPoint = CGPointMake(activeBounds.size.width * 0.5f, 0.0f);
        CGPoint endPoint = CGPointMake(activeBounds.size.width * 0.5f, activeBounds.size.height);
        
        CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
        CGColorSpaceRelease(colorSpace);
        CGGradientRelease(gradient);
    }

    
    
    // RED COLOR
    if (appD.customAlert==2) {
        NSLog(@"appD.customAlert called %d",appD.customAlert);

    CGFloat components[12] =
	{	200.0f/255.0f, 21.0f/255.0f, 79.0f/255.0f, 1.0f,     //1
		200.0f/255.0f, 21.0f/255.0f, 79.0f/255.0f, 1.0f,     //2
		200.0f/255.0f, 21.0f/255.0f, 79.0f/255.0f, 1.0f};	//3
        CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, count);
        
        CGPoint startPoint = CGPointMake(activeBounds.size.width * 0.5f, 0.0f);
        CGPoint endPoint = CGPointMake(activeBounds.size.width * 0.5f, activeBounds.size.height);
        
        CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
        CGColorSpaceRelease(colorSpace);
        CGGradientRelease(gradient);
        
    }
    
    //Amber
    if (appD.customAlert==3) {
        NSLog(@"appD.customAlert called %d",appD.customAlert);


    CGFloat components[12]=
    {235.0f/255.0f, 178.0f/255.0f, 45.0f/255.0f, 1.0f,
    235.0f/255.0f, 178.0f/255.0f, 45.0f/255.0f, 1.0f,
        235.0f/255.0f, 178.0f/255.0f, 45.0f/255.0f, 1.0f,};
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, count);
    
	CGPoint startPoint = CGPointMake(activeBounds.size.width * 0.5f, 0.0f);
	CGPoint endPoint = CGPointMake(activeBounds.size.width * 0.5f, activeBounds.size.height);
    
	CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
	CGColorSpaceRelease(colorSpace);
	CGGradientRelease(gradient);
    }

	
	
	//////////////HATCHED BACKGROUND
    //CGFloat buttonOffset = 92.5f; //Offset buttonOffset by half point for crisp lines
    CGFloat buttonOffset= (activeBounds.size.height - 65.0f);
	CGContextSaveGState(context); //Save Context State Before Clipping "hatchPath"
	CGRect hatchFrame = CGRectMake(0.0f, buttonOffset, activeBounds.size.width, (activeBounds.size.height - buttonOffset+1.0f));
	CGContextClipToRect(context, hatchFrame);
	
	CGFloat spacer = 4.0f;
	int rows = (activeBounds.size.width + activeBounds.size.height/spacer);
	CGFloat padding = 0.0f;
	CGMutablePathRef hatchPath = CGPathCreateMutable();
	for(int i=1; i<=rows; i++) {
		CGPathMoveToPoint(hatchPath, NULL, spacer * i, padding);
		CGPathAddLineToPoint(hatchPath, NULL, padding, spacer * i);
	}
	CGContextAddPath(context, hatchPath);
	CGPathRelease(hatchPath);
	CGContextSetLineWidth(context, 1.0f);
	CGContextSetLineCap(context, kCGLineCapRound);
	CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:0.15f].CGColor);
	CGContextDrawPath(context, kCGPathStroke);
	CGContextRestoreGState(context); //Restore Last Context State Before Clipping "hatchPath"
	
	//////////////DRAW LINE
	CGMutablePathRef linePath = CGPathCreateMutable(); 
	CGFloat linePathY = (buttonOffset - 1.0f);
	CGPathMoveToPoint(linePath, NULL, 0.0f, linePathY);
	CGPathAddLineToPoint(linePath, NULL, activeBounds.size.width, linePathY);
	CGContextAddPath(context, linePath);
	CGPathRelease(linePath);
	CGContextSetLineWidth(context, 1.0f);
	CGContextSaveGState(context); //Save Context State Before Drawing "linePath" Shadow
	CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:240.0f/255.0f alpha:0.6f].CGColor);
	CGContextSetShadowWithColor(context, CGSizeMake(0.0f, 1.0f), 0.0f, [UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:0.2f].CGColor);
	CGContextDrawPath(context, kCGPathStroke);
	CGContextRestoreGState(context); //Restore Context State After Drawing "linePath" Shadow
	
	//////////////STROKE PATH FOR INNER SHADOW
	CGContextAddPath(context, path);
	CGContextSetLineWidth(context, 3.0f);
	CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:240.0f/255.0f alpha:1.0f].CGColor);
	CGContextSetShadowWithColor(context, CGSizeMake(0.0f, 0.0f), 6.0f, [UIColor colorWithRed:0.0f/255.0f green:0.0f/255.0f blue:0.0f/255.0f alpha:1.0f].CGColor);
	CGContextDrawPath(context, kCGPathStroke);
    
	//////////////STROKE PATH TO COVER UP PIXILATION ON CORNERS FROM CLIPPING
    CGContextRestoreGState(context); //Restore First Context State Before Clipping "path"
	CGContextAddPath(context, path);
	CGContextSetLineWidth(context, 3.0f);
//	CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:240.0f/255.0f alpha:1.0f].CGColor);
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:0.0/255.0f green:0.0/255.0f blue:0.0/255.0f alpha:46.0f].CGColor);
	CGContextSetShadowWithColor(context, CGSizeMake(0.0f, 0.0f), 0.0f, [UIColor colorWithRed:0.0f/255.0f green:0.0f/255.0f blue:0.0f/255.0f alpha:0.1f].CGColor);
	CGContextDrawPath(context, kCGPathStroke);
	
}

@end

