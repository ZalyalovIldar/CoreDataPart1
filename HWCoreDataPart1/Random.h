//
//  Random.h
//  HWCoreDataPart1
//
//  Created by Наталья on 17.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Random : NSObject

- (NSString *)getRandomName;
- (int)getRandomAge;
- (NSString*)getRandomSex;
- (NSDate*)getRandomDateOfBirth;


@end
