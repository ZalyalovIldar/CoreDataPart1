//
//  UserGenerator.m
//  HWCoreDataPart1
//
//  Created by Ильяс Ихсанов on 17.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import "UserGenerator.h"

@implementation UserGenerator

-(NSString *)getRandomName{
    
    NSArray *menNamesArray = @[@"Ильяс",@"Игорь",@"Альберт",@"Олег",@"Карим",@"Сергей"];
    NSArray *womenNamesArray = @[@"Маша", @"Катя", @"Ира", @"Мадина", @"Гльчачак", @"Мадина"];
    int random = arc4random_uniform(5);
    if ([UserGenerator boyOrgirls]) {
        _sex = @"Женский";
        _name = [womenNamesArray objectAtIndex:random];
        _age = arc4random_uniform(30);
    }else{
        _sex = @"Мужской";
        _name = [menNamesArray objectAtIndex:random];
        _age = arc4random_uniform(30);
    }
    
    return _name;
}

-(NSDate *)getRandomDateOfBurn{
    NSDate *now = [NSDate date];
    NSTimeInterval year = 60*60*24*365*_age;
    NSDate *lastWeek = [NSDate dateWithTimeInterval:-year
                                          sinceDate:now];
    NSLog(@"Last Week: %@", lastWeek);
    return lastWeek;
}


+(BOOL)boyOrgirls
{
    int tmp = (arc4random() % 30)+1;
    if(tmp % 5 == 0)
        return YES;
    return NO;
}
@end
