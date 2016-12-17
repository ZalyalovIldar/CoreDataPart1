//
//  TableSettings.h
//  HWCoreDataPart1
//
//  Created by Ильяс Ихсанов on 17.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TableSettings : NSObject <NSCoding>

@property (strong, nonatomic) NSArray *settingsArray;

+(instancetype)sharedInstance;
-(void)archiveData:(TableSettings *)tableSettings;
-(NSArray*)unarchiveData;

@end
