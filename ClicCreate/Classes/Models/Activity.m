//
//  Activity.m
//  ClicCreate
//
//  Created by Lluís Gómez Hernando on 25/09/13.
//  Copyright (c) 2013 Lluís Gómez Hernando. All rights reserved.
//

#import "Activity.h"
#import "Project.h"

@implementation Activity

// Només obtindrem el nom per guardar-les a CoreData i poder-les llistar. Les parsejarem lazily.
+ (Activity *)activityFromXML:(GDataXMLElement *)activityXML
{
    NSManagedObjectContext *moc = [SharedAppDelegate managedObjectContext];
    
    Activity *activity = [Activity insertInManagedObjectContext:moc];
    [activity setName:[[activityXML attributeForName:@"name"] stringValue]];
    
    [SharedAppDelegate saveContext];
    return activity;
}

- (void)loadXML
{
    NSData *projectXMLData = [[NSMutableData alloc] initWithContentsOfFile:self.project.xmlFilePath];
    
    GDataXMLDocument *document = [[GDataXMLDocument alloc] initWithData:projectXMLData
                                                                options:0
                                                                  error:nil];
    if (document != nil) {
        GDataXMLElement *rootElement = document.rootElement;
        NSString *activityXPath = [NSString stringWithFormat:@".//activity[@name='%@']", self.name];
        NSArray *nodes = [rootElement nodesForXPath:activityXPath error:nil];
        GDataXMLElement *activityXML = [nodes firstObject];
        
        NSArray *messages = [activityXML elementsForName:@"messages"];
        for (GDataXMLElement *message in messages) {
            [self parseMessage:message];
        }
        
    }
}

- (void)parseMessage:(GDataXMLElement *)message
{
    NSArray *cells = [message elementsForName:@"cell"];
    for (GDataXMLElement *cell in cells) {
        [self parseCell:cell];
    }
}

- (void)parseCell:(GDataXMLElement *)cell
{
    NSString *type = [[cell attributeForName:@"type"] stringValue];
    
    NSArray *medias = [cell elementsForName:@"media"];
    for (GDataXMLElement *media in medias) {
        if ([type isEqualToString:@"initial"]) {
            self.initialAudioFileName = [[media attributeForName:@"file"] stringValue];
        } else { // type == final
            self.finalAudioFileName = [[media attributeForName:@"file"] stringValue];
        }
    }
    
    NSArray *paragraphs = [cell elementsForName:@"p"];
    for (GDataXMLElement *paragraph in paragraphs) {
        if ([type isEqualToString:@"initial"]) {
            self.initialText = [paragraph stringValue];
        } else { // type == final
            self.finalText = [paragraph stringValue];
        }
    }
}
@end
