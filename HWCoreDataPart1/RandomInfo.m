//
//  RandomInfo.m
//  HWCoreDataPart1
//
//  Created by Ленар on 15.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import "RandomInfo.h"

@implementation RandomInfo

- (NSString*)getRandomName{
    NSArray *arr = @[@"Игорь",@"Ваня",@"Петр",@"Ленар",@"Ильяс",@"Ильдар",@"Гулия",@"Рустам",@"Максим",@"Наташа",@"Тимофей",@"Ильгиз",@"Динар",@"Вика",@"Лиза"];
    int num = arc4random_uniform(15);
    if(num==6 || num==9 || num==13 || num==14){
        self.sex = @"Женский";
    }else self.sex = @"Мужской";
    NSString *name = [arr objectAtIndex:num];
    return name;
}

- (int)getRandomAge{
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:15];
    for (int i=0; i<=15; i++) {
        NSNumber *num = [NSNumber numberWithInt:i+10];
        [arr addObject:num];
    }
    int random = arc4random_uniform(15);
    self.date = [NSDate dateWithTimeIntervalSinceNow:-60*60*24*365*[[arr objectAtIndex:random] intValue]];
    return [[arr objectAtIndex:random] intValue];
}

- (NSString*)getRandomSex{
    return self.sex;
}

- (NSDate*)getRandomDOB{
    return self.date;
}

@end
