// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Project.h instead.

#import <CoreData/CoreData.h>


extern const struct ProjectAttributes {
	__unsafe_unretained NSString *projectID;
	__unsafe_unretained NSString *xmlFilePath;
} ProjectAttributes;

extern const struct ProjectRelationships {
	__unsafe_unretained NSString *activities;
} ProjectRelationships;

extern const struct ProjectFetchedProperties {
} ProjectFetchedProperties;

@class Activity;




@interface ProjectID : NSManagedObjectID {}
@end

@interface _Project : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ProjectID*)objectID;





@property (nonatomic, strong) NSNumber* projectID;



@property int16_t projectIDValue;
- (int16_t)projectIDValue;
- (void)setProjectIDValue:(int16_t)value_;

//- (BOOL)validateProjectID:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* xmlFilePath;



//- (BOOL)validateXmlFilePath:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *activities;

- (NSMutableSet*)activitiesSet;





@end

@interface _Project (CoreDataGeneratedAccessors)

- (void)addActivities:(NSSet*)value_;
- (void)removeActivities:(NSSet*)value_;
- (void)addActivitiesObject:(Activity*)value_;
- (void)removeActivitiesObject:(Activity*)value_;

@end

@interface _Project (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveProjectID;
- (void)setPrimitiveProjectID:(NSNumber*)value;

- (int16_t)primitiveProjectIDValue;
- (void)setPrimitiveProjectIDValue:(int16_t)value_;




- (NSString*)primitiveXmlFilePath;
- (void)setPrimitiveXmlFilePath:(NSString*)value;





- (NSMutableSet*)primitiveActivities;
- (void)setPrimitiveActivities:(NSMutableSet*)value;


@end
