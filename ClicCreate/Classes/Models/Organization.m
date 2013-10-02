//
//  Organization.m
//  ClicCreate
//
//  Created by Lluís Gómez Hernando on 02/10/13.
//  Copyright (c) 2013 Lluís Gómez Hernando. All rights reserved.
//

#import "Organization.h"

@implementation Organization

+ (Organization *)organizationFromXMLElement:(GDataXMLElement *)xmlElement
{
    Organization *organization = [Organization new];

    [organization setName:[[xmlElement attributeForName:@"name"] stringValue]];
    [organization setMail:[[xmlElement attributeForName:@"mail"] stringValue]];
    [organization setUrlString:[[xmlElement attributeForName:@"url"] stringValue]];
    [organization setCity:[[xmlElement attributeForName:@"city"] stringValue]];
    [organization setCountry:[[xmlElement attributeForName:@"country"] stringValue]];
    [organization setState:[[xmlElement attributeForName:@"state"] stringValue]];
    
    GDataXMLElement *commentsElement = [[xmlElement elementsForName:@"comments"] firstObject];
    NSArray *paragraphs = [commentsElement elementsForName:@"p"];
    NSMutableString *comments = [NSMutableString new];
    for (GDataXMLElement *paragraph in paragraphs) {
        [comments appendString:[paragraph stringValue]];
    }
    [organization setComments:comments];
    
    return organization;
}

@end
