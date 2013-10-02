//
//  Author.h
//  ClicCreate
//
//  Created by Lluís Gómez Hernando on 02/10/13.
//  Copyright (c) 2013 Lluís Gómez Hernando. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GDataXMLNode.h"

@interface Author : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *mail;
@property (strong, nonatomic) NSString *urlString;
@property (strong, nonatomic) NSString *role;
@property (strong, nonatomic) NSString *organization;
@property (strong, nonatomic) NSString *comments;

+ (Author *)authorFromElement:(GDataXMLElement *)xmlElement;

@end
