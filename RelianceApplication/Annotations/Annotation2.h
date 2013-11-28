//
//  Annotation2.h
//  iAgentProduct
//
//  Created by Ankush Gupta on 02/11/11.
//  Copyright 2011 Vigyaapan Technologies. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface Annotation2 : NSObject <MKAnnotation> {
	CLLocationCoordinate2D _coordinate;
	NSString *title;
	NSString *subtitle;
	NSUInteger _pinID;
}
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *subtitle;

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate andID:(NSUInteger)pinID;



@end
