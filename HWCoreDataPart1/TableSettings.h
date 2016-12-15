//
//  TableSettings.h
//  HWCoreDataPart1
//
//  Created by Ленар on 15.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TableSettings : NSObject <NSCoding>

+(instancetype)sharedInstance;
-(void)archiveData:(TableSettings*)tabelSettings;
-(NSArray*)unarchiveData;
-(instancetype)initWithCoder:(NSCoder *)aDecoder;

@property (strong,nonatomic) NSArray *settingArr;

@end
