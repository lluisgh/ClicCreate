//
//  Media.h
//  ClicCreate
//
//  Created by Lluís Gómez Hernando on 25/09/13.
//  Copyright (c) 2013 Lluís Gómez Hernando. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GDataXMLNode.h"

@interface Media : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *fileName;

+ (Media *)mediaFromXML:(GDataXMLElement *)xmlElement;

@end
