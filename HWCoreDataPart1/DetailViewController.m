//
//  DetailViewController.m
//  HWCoreDataPart1
//
//  Created by Ildar Zalyalov on 12.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import "DetailViewController.h"
#import "Settings.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UISwitch *nameSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *ageSwitch;

@property (weak, nonatomic) IBOutlet UISwitch *birthDateswitch;
@property (weak, nonatomic) IBOutlet UISwitch *sexSwitch;

@property (nonatomic, strong) Settings *settings;



@end

@implementation DetailViewController

- (void)configureView {
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"settings"];
    Settings *settings = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    self.settings =settings ? settings : [[Settings alloc] init];
    
    [self.nameSwitch setOn:settings.nameSwitchStatus animated:NO];
    [self.ageSwitch setOn:settings.ageSwitchStatus animated:NO];
    [self.birthDateswitch setOn:settings.birthDateSwitchStatus animated:NO];
    [self.sexSwitch setOn:settings.sexSwitchStatus animated:NO];
    
    // Update the user interface for the detail item.
    if (self.detailItem) {
       // self.detailDescriptionLabel.text = self.detailItem.timestamp.description;
    }
}


- (IBAction)saveButtonDidClicked:(id)sender {
    
    Settings *settings = [Settings new];
    settings.nameSwitchStatus = self.nameSwitch.isOn;
    settings.ageSwitchStatus = self.ageSwitch.isOn;
    settings.birthDateSwitchStatus = self.birthDateswitch.isOn;
    settings.sexSwitchStatus = self.sexSwitch.isOn;
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:settings];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"settings"];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Сохранить" message:@"Ваши изменения были успешно сохранены" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Managing the detail item

- (void)setDetailItem:(Event *)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}


@end
