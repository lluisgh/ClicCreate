//
//  Revision.h
//  ClicCreate
//
//  Created by Lluís Gómez Hernando on 02/10/13.
//  Copyright (c) 2013 Lluís Gómez Hernando. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GDataXMLNode.h"

@interface Revision : NSObject

@property (strong, nonatomic) NSString *dateString;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSMutableArray *authors;
@property (strong, nonatomic) NSString *comments;


+ (Revision *)revisionFromXML:(GDataXMLElement *)xmlElement;

@end
