//
//  Activity.h
//  ClicCreate
//
//  Created by Lluís Gómez Hernando on 25/09/13.
//  Copyright (c) 2013 Lluís Gómez Hernando. All rights reserved.
//

#import "_Activity.h"
#import "GDataXMLNode.h"

@interface Activity : _Activity{}

//Messages: audio
@property (strong, nonatomic) NSString *initialAudioFileName;
@property (strong, nonatomic) NSString *finalAudioFileName;

//Messages: text
@property (strong, nonatomic) NSString *initialText;
@property (strong, nonatomic) NSString *finalText;

//ActivitySettings
@property (strong, nonatomic) NSString *backgroundImageFileName;
@property (strong, nonatomic) NSString *backgroundColorCode;
@property (assign, nonatomic) NSInteger backgroundMargin;

- (void)loadXML;
+ (Activity *)activityFromXML:(GDataXMLElement *)activityXML;

@end
