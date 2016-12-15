//
//  RandomInfo.h
//  HWCoreDataPart1
//
//  Created by Ленар on 15.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RandomInfo : NSObject

- (NSString*)getRandomName;
- (int)getRandomAge;
- (NSString*)getRandomSex;
- (NSDate*)getRandomDOB;

@property (strong, nonatomic)NSString *sex;
@property (strong, nonatomic)NSDate *date;

@end
