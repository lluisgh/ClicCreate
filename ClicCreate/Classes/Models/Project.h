#import "_Project.h"

#import "ProjectSettings.h"
#import "ActivitySequence.h"
@interface Project : _Project{}
// Custom logic goes here.

@property (strong, nonatomic) ProjectSettings *projectSettings;
@property (strong, nonatomic) ActivitySequence *activitySequence;
@property (strong, nonatomic) NSSet *activities;
@property (strong, nonatomic) NSArray *media;

- (void)loadXML;

@end
