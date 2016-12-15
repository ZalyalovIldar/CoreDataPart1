//
//  SettingTableViewController.h
//  HWCoreDataPart1
//
//  Created by Ленар on 15.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UISwitch *nameSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *ageSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *sexSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *dobSwitch;

@end
