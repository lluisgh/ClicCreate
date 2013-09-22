// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Project.h instead.

#import <CoreData/CoreData.h>


extern const struct ProjectAttributes {
	__unsafe_unretained NSString *path;
	__unsafe_unretained NSString *projectID;
} ProjectAttributes;

extern const struct ProjectRelationships {
} ProjectRelationships;

extern const struct ProjectFetchedProperties {
} ProjectFetchedProperties;





@interface ProjectID : NSManagedObjectID {}
@end

@interface _Project : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ProjectID*)objectID;





@property (nonatomic, strong) NSString* path;



//- (BOOL)validatePath:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* projectID;



@property int16_t projectIDValue;
- (int16_t)projectIDValue;
- (void)setProjectIDValue:(int16_t)value_;

//- (BOOL)validateProjectID:(id*)value_ error:(NSError**)error_;






@end

@interface _Project (CoreDataGeneratedAccessors)

@end

@interface _Project (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitivePath;
- (void)setPrimitivePath:(NSString*)value;




- (NSNumber*)primitiveProjectID;
- (void)setPrimitiveProjectID:(NSNumber*)value;

- (int16_t)primitiveProjectIDValue;
- (void)setPrimitiveProjectIDValue:(int16_t)value_;




@end
