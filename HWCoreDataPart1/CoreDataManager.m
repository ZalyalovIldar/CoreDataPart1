//
//  CoreDataManager.m
//  HWCoreDataPart1
//
//  Created by Ildar Zalyalov on 12.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import "CoreDataManager.h"
#import "RandomInfo.h"
#import "TableSettings.h"

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

- (NSManagedObjectContext *)getCurrentContext{
    return self.persistentContainer.viewContext;
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"HWCoreDataPart1"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

#pragma mark - delete all info from DB

- (void)deleteAllInfoWithCount:(NSFetchedResultsController*)fetchResult{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"User"];
    [fetchRequest setIncludesPropertyValues:NO];
    NSManagedObjectContext *theContext = [fetchResult managedObjectContext];
    NSError *error;
    NSArray *fetchedObjects = [theContext executeFetchRequest:fetchRequest error:&error];
    for (NSManagedObject *object in fetchedObjects)
    {
        [theContext deleteObject:object];
    }
    
    error = nil;
    [theContext save:&error];
}

#pragma mark - Add new random user

- (void)createNewRandomUser:(NSManagedObjectContext*)context{
    User *newUser = [[User alloc] initWithContext:context];
    RandomInfo *info = [RandomInfo new];
    newUser.name = [info getRandomName];
    newUser.age = [info getRandomAge];
    newUser.sex = [info getRandomSex];
    newUser.dob = [info getRandomDOB];
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
