//
//  TableSettings.m
//  HWCoreDataPart1
//
//  Created by Ильяс Ихсанов on 17.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import "TableSettings.h"

@implementation TableSettings

+ (instancetype)sharedInstance{
    static id _singleTon = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _singleTon = [[self alloc] init];
    });
    return _singleTon;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.settingsArray forKey:@"settingsArr"];
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (!self) {
        return nil;
    }
    self.settingsArray = [aDecoder decodeObjectForKey:@"settingsArr"];
    return self;
}
-(void)archiveData:(TableSettings *)tableSettings{
    NSData * archiveData = [NSKeyedArchiver archivedDataWithRootObject:tableSettings];
    [[NSUserDefaults standardUserDefaults] setObject:archiveData forKey:@"tableSettings"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(NSArray*)unarchiveData{
    NSData *unarchiveData = [[NSUserDefaults standardUserDefaults] objectForKey:@"tableSettings"];
    NSArray *userData = [NSKeyedUnarchiver unarchiveObjectWithData:unarchiveData];
    return userData;
}

@end
