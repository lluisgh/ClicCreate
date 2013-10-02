//
//  Author.m
//  ClicCreate
//
//  Created by Lluís Gómez Hernando on 02/10/13.
//  Copyright (c) 2013 Lluís Gómez Hernando. All rights reserved.
//

#import "Author.h"

@implementation Author

+ (Author *)authorFromElement:(GDataXMLElement *)xmlElement
{
    Author * author = [Author new];
    
    [author setName:[[xmlElement attributeForName:@"name"] stringValue]];
    [author setMail:[[xmlElement attributeForName:@"mail"] stringValue]];
    [author setUrlString:[[xmlElement attributeForName:@"url"] stringValue]];
    [author setRole:[[xmlElement attributeForName:@"rol"] stringValue]];
    [author setOrganization:[[xmlElement attributeForName:@"organization"] stringValue]];

    GDataXMLElement *commentsElement = [[xmlElement elementsForName:@"comments"] firstObject];
    NSArray *paragraphs = [commentsElement elementsForName:@"p"];
    NSMutableString *comments = [NSMutableString new];
    for (GDataXMLElement *paragraph in paragraphs) {
        [comments appendString:[paragraph stringValue]];
    }
    [author setComments:comments];

    return author;
}

@end
