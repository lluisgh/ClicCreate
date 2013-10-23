//
//  ActivitySequence.h
//  ClicCreate
//
//  Created by Lluís Gómez Hernando on 21/09/13.
//  Copyright (c) 2013 Lluís Gómez Hernando. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GDataXMLNode.h"

@interface ActivitySequence : NSObject

@property (assign, nonatomic) NSUInteger currentActivity;
@property (strong, nonatomic) NSMutableArray *elements;



+ (ActivitySequence *)activitySequenceFromXML:(GDataXMLElement *)xmlElement;

@end
