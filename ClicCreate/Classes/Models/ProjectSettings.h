//
//  ProjectSettings.h
//  ClicCreate
//
//  Created by Lluís Gómez Hernando on 21/09/13.
//  Copyright (c) 2013 Lluís Gómez Hernando. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GDataXMLNode.h"

@interface ProjectSettings : NSObject

@property (strong, nonatomic) NSString *title;

@property (strong, nonatomic) NSString *iconFileName;
@property (strong, nonatomic) NSString *skinFileName;

@property (strong, nonatomic) NSString *areaDescriptor;
@property (strong, nonatomic) NSString *levelDescriptor;
@property (strong, nonatomic) NSString *textDescriptor;

@property (strong, nonatomic) NSString *description;

@property (strong, nonatomic) NSMutableArray *languages;
@property (strong, nonatomic) NSMutableArray *revisions;
@property (strong, nonatomic) NSMutableArray *organizations;
@property (strong, nonatomic) NSMutableArray *authors;

+ (ProjectSettings *)projectSettingsFromXML:(GDataXMLElement *)xmlElement;

@end
