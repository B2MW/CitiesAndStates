//
//  City.h
//  CitiesAndStates
//
//  Created by Bradley Walker on 10/10/14.
//  Copyright (c) 2014 BlackSummerVentures. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface City : NSObject
@property NSString *cityName;
@property NSString *stateName;
@property NSString *stateAbbreviation;
@property UIImage *cityImage;

//-(void) initWithCityDetails:(cityName *)city:
@end
