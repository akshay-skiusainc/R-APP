//
//  Annotation5.h
//  iAgentProduct
//
//  Created by Ankush Gupta on 05/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface Annotation5 : NSObject<MKAnnotation>
{
    CLLocationCoordinate2D _coordinate;
	NSString *title;
	NSString *subtitle;
	NSUInteger _pinID;
}
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *subtitle;

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate andID:(NSUInteger)pinID;


@end

