//
//  CoreDataManager.h
//  HWCoreDataPart1
//
//  Created by Ildar Zalyalov on 12.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "HWCoreDataPart1+CoreDataModel.h"

@interface CoreDataManager : NSObject
+ (instancetype)sharedInstance;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;
- (NSManagedObjectContext *)getCurrentContext;
- (void)deleteAllInfoWithCount:(NSFetchedResultsController*)fetchResult;
- (void)createNewRandomUser:(NSManagedObjectContext*)context;

@end
