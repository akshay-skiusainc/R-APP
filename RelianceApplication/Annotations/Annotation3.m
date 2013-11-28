//
//  Annotation3.m
//  iAgentProduct
//
//  Created by Ankush Gupta on 02/11/11.
//  Copyright 2011 Vigyaapan Technologies. All rights reserved.
//

#import "Annotation3.h"


@implementation Annotation3
@synthesize title;
@synthesize subtitle;
@synthesize coordinate=_coordinate;


- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate andID:(NSUInteger)pinID{
	self = [super init];
	if (self != nil) {
		_coordinate = coordinate;
		_pinID = pinID;
	}
	return self;
}

- (NSString *)title {
	return [NSString stringWithFormat:@"%@", title];
}

- (NSString *)subtitle {
	return [NSString stringWithFormat:@"%@", subtitle];
}@end
