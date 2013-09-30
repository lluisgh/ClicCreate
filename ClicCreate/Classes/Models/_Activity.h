// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Activity.h instead.

#import <CoreData/CoreData.h>


extern const struct ActivityAttributes {
	__unsafe_unretained NSString *activityID;
	__unsafe_unretained NSString *name;
} ActivityAttributes;

extern const struct ActivityRelationships {
	__unsafe_unretained NSString *project;
} ActivityRelationships;

extern const struct ActivityFetchedProperties {
} ActivityFetchedProperties;

@class Project;




@interface ActivityID : NSManagedObjectID {}
@end

@interface _Activity : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ActivityID*)objectID;





@property (nonatomic, strong) NSNumber* activityID;



@property int16_t activityIDValue;
- (int16_t)activityIDValue;
- (void)setActivityIDValue:(int16_t)value_;

//- (BOOL)validateActivityID:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Project *project;

//- (BOOL)validateProject:(id*)value_ error:(NSError**)error_;





@end

@interface _Activity (CoreDataGeneratedAccessors)

@end

@interface _Activity (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveActivityID;
- (void)setPrimitiveActivityID:(NSNumber*)value;

- (int16_t)primitiveActivityIDValue;
- (void)setPrimitiveActivityIDValue:(int16_t)value_;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;





- (Project*)primitiveProject;
- (void)setPrimitiveProject:(Project*)value;


@end
