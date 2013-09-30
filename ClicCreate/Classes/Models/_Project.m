// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Project.m instead.

#import "_Project.h"

const struct ProjectAttributes ProjectAttributes = {
	.projectID = @"projectID",
	.xmlFilePath = @"xmlFilePath",
};

const struct ProjectRelationships ProjectRelationships = {
	.activities = @"activities",
};

const struct ProjectFetchedProperties ProjectFetchedProperties = {
};

@implementation ProjectID
@end

@implementation _Project

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Project" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Project";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Project" inManagedObjectContext:moc_];
}

- (ProjectID*)objectID {
	return (ProjectID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"projectIDValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"projectID"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic projectID;



- (int16_t)projectIDValue {
	NSNumber *result = [self projectID];
	return [result shortValue];
}

- (void)setProjectIDValue:(int16_t)value_ {
	[self setProjectID:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveProjectIDValue {
	NSNumber *result = [self primitiveProjectID];
	return [result shortValue];
}

- (void)setPrimitiveProjectIDValue:(int16_t)value_ {
	[self setPrimitiveProjectID:[NSNumber numberWithShort:value_]];
}





@dynamic xmlFilePath;






@dynamic activities;

	
- (NSMutableSet*)activitiesSet {
	[self willAccessValueForKey:@"activities"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"activities"];
  
	[self didAccessValueForKey:@"activities"];
	return result;
}
	






@end
