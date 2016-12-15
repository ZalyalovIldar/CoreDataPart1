//
//  TableSettings.m
//  HWCoreDataPart1
//
//  Created by Ленар on 15.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import "TableSettings.h"

static NSString *const tableSettings = @"settings";

@implementation TableSettings

+(instancetype)sharedInstance{
    static id _singleTon = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _singleTon = [[self alloc]init];
    });
    return _singleTon;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (!self) {
        return nil;
    }
    self.settingArr = [aDecoder decodeObjectForKey:tableSettings];
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.settingArr forKey:tableSettings];
}

-(void)archiveData:(TableSettings*)tabelSettings{
    NSData *saveData = [NSKeyedArchiver archivedDataWithRootObject:tabelSettings];
    [[NSUserDefaults standardUserDefaults] setObject:saveData forKey:tableSettings];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(NSArray*)unarchiveData{
    NSData *savedData = [[NSUserDefaults standardUserDefaults] objectForKey:tableSettings];
    NSArray *userData = [NSKeyedUnarchiver unarchiveObjectWithData:savedData];
    return userData;
}



@end
