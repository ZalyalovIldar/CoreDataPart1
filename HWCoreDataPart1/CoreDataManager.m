//
//  CoreDataManager.m
//  HWCoreDataPart1
//
//  Created by Ildar Zalyalov on 12.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import "CoreDataManager.h"
#import "Random.h"

@implementation CoreDataManager

+ (instancetype)sharedInstance{
    static id _singleTon = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _singleTon = [[self alloc] init];
    });
    return _singleTon;
}

#pragma mark - CustomMethods

- (NSManagedObjectContext *)getCurrentContext
{
    return self.persistentContainer.viewContext;
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer
{
  
    @synchronized (self)
    {
        if (_persistentContainer == nil)
        {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"HWCoreDataPart1"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error)
            {
                if (error != nil)
                {
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext
{
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error])
    {
     
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}
    
- (void)deleteAllDataFromDB:(NSFetchedResultsController *)fetchResult
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Event"];
    [fetchRequest setIncludesPropertyValues:NO];
    NSManagedObjectContext *theContext = [fetchResult managedObjectContext];
    
    NSError *error;
    NSArray *objects = [theContext executeFetchRequest:fetchRequest error:&error];
    for (NSManagedObject *object in objects)
    {
        [theContext deleteObject:object];
    }
    
    error = nil;
    [theContext save:&error];
    
    
}

- (void) createRandomUser:(NSManagedObjectContext *)context
{
    Event *user = [[Event alloc]initWithContext:context];
    
    Random *random = [Random new];
    user.name = [random getRandomName];
    user.age = [random getRandomAge];
    user.sex = [random getRandomSex];
    user.birthDate = [random getRandomDateOfBirth];
    NSError *error = nil;
    if (![context save:&error])
    {
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}
@end
    
    

