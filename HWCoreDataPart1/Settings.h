//
//  Settings.h
//  HWCoreDataPart1
//
//  Created by Наталья on 17.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Settings : NSObject <NSCoding>

@property (nonatomic, assign) BOOL nameSwitchStatus;
@property (nonatomic, assign) BOOL ageSwitchStatus;
@property (nonatomic, assign) BOOL birthDateSwitchStatus;
@property (nonatomic, assign) BOOL sexSwitchStatus;



@end
