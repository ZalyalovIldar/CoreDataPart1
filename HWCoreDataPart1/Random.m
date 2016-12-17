//
//  Random.m
//  HWCoreDataPart1
//
//  Created by Наталья on 17.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import "Random.h"

@interface Random ()

@property (nonatomic, strong) NSString *sex;
@property (nonatomic, strong) NSDate *birthDate;
@end

@implementation Random

- (NSString *)getRandomName
{
    NSArray *nameArray = @[@"Natasha",@"Chingiz",@"Nikita",@"Selvana", @"Ksusha",@"Bob",@"Richard"];
    int num = arc4random_uniform(7);
    if(num==0 || num==3 || num==4){
        self.sex = @"Ж";
    }else self.sex = @"М";
    NSString *name = [nameArray objectAtIndex:num];
    return name;
}

- (int)getRandomAge
{
    int random = arc4random_uniform(30);
    self.birthDate = [NSDate dateWithTimeIntervalSinceNow:-(60.0f*60.0f*24.0f * 365 * random)];
    return random;
    
}

- (NSString*)getRandomSex
{
    return self.sex;
}

- (NSDate*)getRandomDateOfBirth
{
    return self.birthDate;
}

@end
