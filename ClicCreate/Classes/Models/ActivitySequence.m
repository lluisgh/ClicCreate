//
//  ActivitySequence.m
//  ClicCreate
//
//  Created by Lluís Gómez Hernando on 21/09/13.
//  Copyright (c) 2013 Lluís Gómez Hernando. All rights reserved.
//

#import "ActivitySequence.h"

#import "ActivitySequenceElement.h"

@implementation ActivitySequence

//- (void)getActivitySequence:(CXMLElement *)root {
//	iClicAppDelegate *appDelegate = (iClicAppDelegate *)[[UIApplication sharedApplication] delegate];
//	
//	project.activitySequence.currentAct = 0;
//	project.activitySequence.elements = [[NSMutableArray alloc] init];
//	NSArray * theNodes = [root nodesForXPath:@"./item" error:nil];
//	
//	for (CXMLElement *theElement in theNodes) {
//		ActivitySequenceElement * activitySequenceElement = [[ActivitySequenceElement alloc] init];
//		activitySequenceElement.tag = [[[theElement attributeForName:@"id"] stringValue] copy];
//		activitySequenceElement.activityName = [[[theElement attributeForName:@"name"] stringValue] copy];
//		activitySequenceElement.navButtons = [[[theElement attributeForName:@"navButtons"] stringValue] copy];
//		
//		NSArray * jumps = [theElement nodesForXPath:@"./jump" error:nil];
//		for (CXMLElement *jump in jumps) {
//			if([[[jump attributeForName:@"id"] stringValue] isEqual:@"forward"])
//				activitySequenceElement.jumpForward = [[[jump attributeForName:@"tag"] stringValue] copy];
//			else
//				activitySequenceElement.jumpBackward = [[[jump attributeForName:@"tag"] stringValue] copy];
//		}
//		
//		[project.activitySequence.elements addObject:activitySequenceElement];
//		[activitySequenceElement release];
//	}
//    
//	appDelegate.currentProject.activitySequence = project.activitySequence;
//}


+ (ActivitySequence *)activitySequenceFromXML:(GDataXMLElement *)xmlElement
{
    ActivitySequence *activitySequence = [ActivitySequence new];
    
    [activitySequence setCurrentActivity:0];
    [activitySequence setElements:[NSMutableArray new]];
    
    NSArray *nodes = [xmlElement elementsForName:@"item"];
    for (GDataXMLElement *element in nodes) {
        ActivitySequenceElement *actSeqElement = [ActivitySequenceElement new];
        [actSeqElement setIdentifier:[[element attributeForName:@"id"] stringValue]];
        [actSeqElement setActivityName:[[element attributeForName:@"name"] stringValue]];
        [actSeqElement setNavButtons:[[element attributeForName:@"navButtons"] stringValue]];
        
        NSArray *jumps = [element elementsForName:@"jump"];
        for (GDataXMLElement *jumpElement in jumps) {
            NSString *tag = [[jumpElement attributeForName:@"tag"] stringValue];
            if ([[[jumpElement attributeForName:@"id"] stringValue] isEqualToString:@"forward"]) {
                [actSeqElement setJumpForward:tag];
            } else {
                [actSeqElement setJumpBackward:tag];
            }
        }
        [activitySequence.elements addObject:actSeqElement];
    }
    
    return activitySequence;
}

@end
