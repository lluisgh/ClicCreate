#import "Project.h"

#import "GDataXMLNode.h"

@interface Project ()

// Private interface goes here.

@end


@implementation Project

// Custom logic goes here.
@synthesize projectSettings;
@synthesize activitySequence;
@synthesize activities;
@synthesize media;

- (Project *)loadXML
{
    NSData *xmlData = [[NSMutableData alloc] initWithContentsOfFile:self.path];
    NSError *error;
    
    GDataXMLDocument *document = [[GDataXMLDocument alloc] initWithData:xmlData
                                                                options:0
                                                                  error:&error];
    if (document == nil) {
        return nil;
    }
    
    NSLog(@"%@", document.rootElement);
    return nil;
}

@end
