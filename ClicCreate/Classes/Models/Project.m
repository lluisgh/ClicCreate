#import "Project.h"

#import "GDataXMLNode.h"
#import "Activity.h"
#import "Media.h"
@interface Project ()

// Private interface goes here.

@end


@implementation Project

// Custom logic goes here.
@synthesize projectSettings = _projectSettings;
@synthesize activitySequence = _activitySequence;
@synthesize activities = _activities;
@synthesize media = _media;

- (void)loadXML
{
    NSData *xmlData = [[NSMutableData alloc] initWithContentsOfFile:self.xmlFilePath];
    NSError *error;
    
    GDataXMLDocument *document = [[GDataXMLDocument alloc] initWithData:xmlData
                                                                options:0
                                                                  error:&error];
    //Comprovem que existeix
    if (document != nil) {
        GDataXMLElement *rootElement = document.rootElement;
        
        //Obtenim els project settings
        GDataXMLElement *projectSettingsXML = [[rootElement elementsForName:@"settings"] firstObject];
        ProjectSettings *projectSettings = [ProjectSettings projectSettingsFromXML:projectSettingsXML];
        [self setProjectSettings:projectSettings];
        
        //Obtenim l'activity sequence
        GDataXMLElement *activitySequenceXML = [[rootElement elementsForName:@"sequence"] firstObject];
        ActivitySequence *activitySequence = [ActivitySequence activitySequenceFromXML:activitySequenceXML];
        [self setActivitySequence:activitySequence];
        
        //Obtenim les activitats
        GDataXMLElement *activitiesRoot = [[rootElement elementsForName:@"activities"] firstObject];
        NSArray *activityNodes = [activitiesRoot elementsForName:@"activity"];
        [self parseActivitiesFromXMLNodes:activityNodes];

        //Obtenim el contingut multimèdia
        GDataXMLElement *mediaRoot = [[rootElement elementsForName:@"mediaBag"] firstObject];
        NSArray *mediaNodes = [mediaRoot elementsForName:@"media"];
        [self parseMediaFromXML:mediaNodes];
        NSLog(@"%@", self);
    }
}

- (void)parseActivitiesFromXMLNodes:(NSArray *)nodes
{
    NSMutableSet *activities = [[NSMutableSet alloc] init];
    for (GDataXMLElement *xmlElement in nodes) {
        Activity *activity = [Activity activityFromXML:xmlElement];
        [activity setProject:self];
        [activities addObject:activity];
    }
    
    [self setActivities:activities];
}

- (void)parseMediaFromXML:(NSArray *)nodes
{
    NSMutableArray *mediaArray = [[NSMutableArray alloc] init];
    for (GDataXMLElement *xmlElement in nodes) {
        Media *media = [Media mediaFromXML:xmlElement];
        [mediaArray addObject:media];
    }
    
    [self setMedia:mediaArray];
}

@end
