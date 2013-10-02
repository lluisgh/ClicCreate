//
//  Revision.m
//  ClicCreate
//
//  Created by Lluís Gómez Hernando on 02/10/13.
//  Copyright (c) 2013 Lluís Gómez Hernando. All rights reserved.
//

#import "Revision.h"

#import "Author.h"

@implementation Revision

+ (Revision *)revisionFromXML:(GDataXMLElement *)xmlElement
{
    Revision *revision = [Revision new];
    
    [revision setDateString:[[xmlElement attributeForName:@"date"] stringValue]];
    [revision setDescription:[[xmlElement attributeForName:@"description"] stringValue]];
    
    [revision setAuthors:[NSMutableArray new]];
    NSArray *authorNodes = [xmlElement elementsForName:@"author"];
    for (GDataXMLElement *authorElement in authorNodes) {
        Author *author = [Author authorFromElement:authorElement];
        [revision.authors addObject:author];
    }

    GDataXMLElement *commentsElement = [[xmlElement elementsForName:@"comments"] firstObject];
    NSArray *paragraphs = [commentsElement elementsForName:@"p"];
    NSMutableString *comments = [NSMutableString new];
    for (GDataXMLElement *paragraph in paragraphs) {
        [comments appendString:[paragraph stringValue]];
    }
    [revision setComments:comments];
    
    return revision;
}



@end
