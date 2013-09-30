// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Activity.m instead.

#import "_Activity.h"

const struct ActivityAttributes ActivityAttributes = {
	.activityID = @"activityID",
	.name = @"name",
};

const struct ActivityRelationships ActivityRelationships = {
	.project = @"project",
};

const struct ActivityFetchedProperties ActivityFetchedProperties = {
};

@implementation ActivityID
@end

@implementation _Activity

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Activity" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Activity";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Activity" inManagedObjectContext:moc_];
}

- (ActivityID*)objectID {
	return (ActivityID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"activityIDValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"activityID"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic activityID;



- (int16_t)activityIDValue {
	NSNumber *result = [self activityID];
	return [result shortValue];
}

- (void)setActivityIDValue:(int16_t)value_ {
	[self setActivityID:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveActivityIDValue {
	NSNumber *result = [self primitiveActivityID];
	return [result shortValue];
}

- (void)setPrimitiveActivityIDValue:(int16_t)value_ {
	[self setPrimitiveActivityID:[NSNumber numberWithShort:value_]];
}





@dynamic name;






@dynamic project;

	






@end
