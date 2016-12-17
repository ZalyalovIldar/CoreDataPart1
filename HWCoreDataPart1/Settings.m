//
//  Settings.m
//  HWCoreDataPart1
//
//  Created by Наталья on 17.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import "Settings.h"

NSString *const IPNameSwitchStatusKey = @"ip_nameSwitchStatus";
NSString *const  IPAgeSwitchStatus = @"ip_ageSwitchSatus";
NSString *const IPBirthDateSwitchStatus = @"ip_birthDateSwitchStatus";
NSString *const IPSexSwitchStatus = @"ip_sexSwitchStatus";

@implementation Settings


- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (!self)
    {
        return nil;
    }
    
    self.nameSwitchStatus = [decoder decodeBoolForKey:IPNameSwitchStatusKey];
    self.ageSwitchStatus = [decoder decodeBoolForKey:IPAgeSwitchStatus];
    self.birthDateSwitchStatus = [decoder decodeBoolForKey:IPBirthDateSwitchStatus];
    self.sexSwitchStatus = [decoder decodeBoolForKey:IPSexSwitchStatus];
       return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    
    [encoder encodeBool:self.nameSwitchStatus forKey:IPNameSwitchStatusKey];
    [encoder encodeBool:self.ageSwitchStatus forKey:IPAgeSwitchStatus];
    [encoder encodeBool:self.birthDateSwitchStatus forKey:IPBirthDateSwitchStatus];
    [encoder encodeBool:self.sexSwitchStatus forKey:IPSexSwitchStatus];
}



@end
