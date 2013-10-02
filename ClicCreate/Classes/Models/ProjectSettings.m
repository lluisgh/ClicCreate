//
//  ProjectSettings.m
//  ClicCreate
//
//  Created by Lluís Gómez Hernando on 21/09/13.
//  Copyright (c) 2013 Lluís Gómez Hernando. All rights reserved.
//

#import "ProjectSettings.h"

#import "Revision.h"
#import "Organization.h"
#import "Author.h"

@implementation ProjectSettings

+ (ProjectSettings *)projectSettingsFromXML:(GDataXMLElement *)xmlElement
{
    ProjectSettings *projectSettings = [ProjectSettings new];
    NSArray *nodes;
    
    //Obtenim el títol
    nodes = [xmlElement elementsForName:@"title"];
    [projectSettings setTitle:[[nodes firstObject] stringValue]];
    
    //Obtenim l'icona
    nodes = [xmlElement elementsForName:@"icon"];
    [projectSettings setIconFileName:[[nodes firstObject] stringValue]];
    
    //Obtenim l'skin
    nodes = [xmlElement elementsForName:@"skin"];
    [projectSettings setSkinFileName:[[nodes firstObject] stringValue]];
    
    //Obtenim els descriptors
    nodes = [xmlElement elementsForName:@"descriptors"];
    for (GDataXMLElement *element in nodes) {
        [projectSettings setAreaDescriptor:[[element attributeForName:@"area"] stringValue]];
        [projectSettings setLevelDescriptor:[[element attributeForName:@"level"] stringValue]];
        [projectSettings setTextDescriptor:[element stringValue]];
    }
    
    //Obtenim la descripció
    nodes = [xmlElement elementsForName:@"description"];
    NSMutableString *description = [NSMutableString new];
    NSArray *paragraphs = [[nodes firstObject] elementsForName:@"p"];
    for (GDataXMLElement *paragraph in paragraphs) {
        [description appendString:[paragraph stringValue]];
    }
    [projectSettings setDescription:description];

    //Obtenim els idiomes
    nodes = [xmlElement elementsForName:@"language"];
    [projectSettings setLanguages:[NSMutableArray new]];
    for (GDataXMLElement *element in nodes) {
        [projectSettings.languages addObject:[element stringValue]];
    }
    
    //Obtenim les revisions
    nodes = [xmlElement elementsForName:@"revision"];
    [projectSettings setRevisions:[NSMutableArray new]];
    for (GDataXMLElement *element in nodes) {
        Revision *revision = [Revision revisionFromXML:element];
        [projectSettings.revisions addObject:revision];
    }
    
    //Obtenim les organitzacions
    nodes = [xmlElement elementsForName:@"organization"];
    [projectSettings setOrganizations:[NSMutableArray new]];
    for (GDataXMLElement *organizationElement in nodes) {
        Organization *organization = [Organization organizationFromXMLElement:organizationElement];
        [projectSettings.organizations addObject:organization];
    }
    
    //Obtenim els autors
    [projectSettings setAuthors:[NSMutableArray new]];
    nodes = [xmlElement elementsForName:@"authors"];
    for (GDataXMLElement *authorElement in nodes) {
        Author *author = [Author authorFromElement:authorElement];
        [projectSettings.authors addObject:author];
    }
    
    return projectSettings;
}

@end
