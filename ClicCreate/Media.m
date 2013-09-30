//
//  Media.m
//  ClicCreate
//
//  Created by Lluís Gómez Hernando on 25/09/13.
//  Copyright (c) 2013 Lluís Gómez Hernando. All rights reserved.
//

#import "Media.h"

@implementation Media

+ (Media *)mediaFromXML:(GDataXMLElement *)xmlElement
{
    Media *media = [[Media alloc] init];
    
    NSString *name = [[xmlElement attributeForName:@"name"] stringValue];
    [media setName:name];
    
    NSString *fileName = [[xmlElement attributeForName:@"file"] stringValue];
    [media setFileName:fileName];
    
    return media;
}
@end
