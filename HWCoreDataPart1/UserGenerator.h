//
//  UserGenerator.h
//  HWCoreDataPart1
//
//  Created by Ильяс Ихсанов on 17.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserGenerator : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSDate * dateOfBurn;
@property int age;
@property (strong, nonatomic) NSString * sex;

-(NSString *)getRandomName;
-(NSDate *)getRandomDateOfBurn;

@end
