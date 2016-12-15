//
//  SettingTableViewController.m
//  HWCoreDataPart1
//
//  Created by Ленар on 15.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import "SettingTableViewController.h"
#import "TableSettings.h"

@interface SettingTableViewController ()

@end

@implementation SettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TableSettings *setting = (TableSettings*)[[TableSettings sharedInstance] unarchiveData];
    NSArray *arr = [NSArray arrayWithArray:setting.settingArr];
    for (NSString *str in arr) {
        if ([str isEqual:@"name"]) {
            [self.nameSwitch setOn:YES];
        }
        if ([str isEqual:@"age"]) {
            [self.ageSwitch setOn:YES];
        }
        if ([str isEqual:@"sex"]) {
            [self.sexSwitch setOn:YES];
        }
        if ([str isEqual:@"dob"]) {
            [self.dobSwitch setOn:YES];
        }
    }
}

- (IBAction)cancelAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)doneAction:(id)sender {
    NSMutableArray *arr = [NSMutableArray new];
    if ([self.nameSwitch isOn]) {
        [arr addObject:@"name"];
    }
    if ([self.ageSwitch isOn]) {
        [arr addObject:@"age"];
    }
    if ([self.sexSwitch isOn]) {
        [arr addObject:@"sex"];
    }
    if ([self.dobSwitch isOn]) {
        [arr addObject:@"dob"];
    }
    TableSettings *setting = [TableSettings new];
    setting.settingArr = [NSArray arrayWithArray:arr];
    [[TableSettings sharedInstance] archiveData:setting];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
