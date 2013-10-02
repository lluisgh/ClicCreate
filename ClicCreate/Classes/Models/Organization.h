//
//  Organization.h
//  ClicCreate
//
//  Created by Lluís Gómez Hernando on 02/10/13.
//  Copyright (c) 2013 Lluís Gómez Hernando. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GDataXMLNode.h"

@interface Organization : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *mail;
@property (strong, nonatomic) NSString *urlString;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSString *pc;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *country;
@property (strong, nonatomic) NSString *state;
@property (strong, nonatomic) NSString *comments;

+ (Organization *)organizationFromXMLElement:(GDataXMLElement *)xmlElement;

@end
