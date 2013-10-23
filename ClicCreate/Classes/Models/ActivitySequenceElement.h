//
//  ActivitySequenceElement.h
//  ClicCreate
//
//  Created by Lluís Gómez Hernando on 07/10/13.
//  Copyright (c) 2013 Lluís Gómez Hernando. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ActivitySequenceElement : NSObject

@property (strong, nonatomic) NSString *identifier;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSString *activityName;
@property (strong, nonatomic) NSString *jumpBackward;
@property (strong, nonatomic) NSString *jumpForward;
@property (strong, nonatomic) NSString *navButtons;

@end
