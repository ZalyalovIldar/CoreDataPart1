//
//  TableFilterSetingsTVC.m
//  HWCoreDataPart1
//
//  Created by Ильяс Ихсанов on 16.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import "TableFilterSetingsTVC.h"
#import "TableSettings.h"

@interface TableFilterSetingsTVC ()
@property (weak, nonatomic) IBOutlet UISwitch *nameSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *dateOfBurnSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *ageSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *sexSwitch;



@end

@implementation TableFilterSetingsTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveButtonAction:)];
    self.navigationItem.rightBarButtonItem = saveButton;
    
    TableSettings *tableSettings = (TableSettings *)[[TableSettings sharedInstance] unarchiveData];
    NSArray *setArr = tableSettings.settingsArray;
    for (NSString *result in setArr) {
        if ([result isEqual:@"userName"]) {
            [self.nameSwitch setOn:YES];
        }
        if ([result isEqual:@"userDateOfBurn"]) {
            [self.dateOfBurnSwitch setOn:YES];
        }
        if ([result isEqual:@"userAge"]) {
            [self.ageSwitch setOn:YES];
        }
        if ([result isEqual:@"userSex"]) {
            [self.sexSwitch setOn:YES];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)saveButtonAction:(id)sender{
    NSMutableArray * saveSettings = [[NSMutableArray alloc]init];
    if (_nameSwitch.isOn) {
        [saveSettings addObject:@"userName"];
    }
    if (_dateOfBurnSwitch.isOn) {
        [saveSettings addObject:@"userDateOfBurn"];
    }
    if (_ageSwitch.isOn) {
        [saveSettings addObject:@"userAge"];
    }
    if (_sexSwitch.isOn) {
        [saveSettings addObject:@"userSex"];
    }
    TableSettings *tableSettings = [TableSettings new];
    tableSettings.settingsArray = [NSArray arrayWithArray:saveSettings];
    [[TableSettings sharedInstance] archiveData:tableSettings];
}



@end
