////////////////////////////////////////////////////////////////////////////////
//
//  TYPHOON FRAMEWORK
//  Copyright 2013, Typhoon Framework Contributors
//  All Rights Reserved.
//
//  NOTICE: The authors permit you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

#import "TyphoonWeakComponentsPool.h"

@implementation TyphoonWeakComponentsPool
{
    NSMapTable *dictionaryWithNonRetainedObjects;
}

- (id)init
{
    self = [super init];
    if (self) {
        dictionaryWithNonRetainedObjects = [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsStrongMemory valueOptions:NSPointerFunctionsWeakMemory];
    }
    return self;
}

- (void)setObject:(id)object forKey:(id <NSCopying>)aKey
{
    [dictionaryWithNonRetainedObjects setObject:object forKey:aKey];
}

- (id)objectForKey:(id <NSCopying>)aKey
{
    return [dictionaryWithNonRetainedObjects objectForKey:aKey];
}

- (id)objectForKeyedSubscript:(id <NSCopying>)aKey {
    return [self objectForKey:aKey];
}

- (void)setObject:(id)object forKeyedSubscript:(id <NSCopying>)aKey {
    return [self setObject:object forKey:aKey];
}

- (NSArray *)allValues
{
    return [[dictionaryWithNonRetainedObjects keyEnumerator] allObjects];
}

- (void)removeAllObjects
{
    [dictionaryWithNonRetainedObjects removeAllObjects];
}

@end
