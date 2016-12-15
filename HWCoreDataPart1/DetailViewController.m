//
//  DetailViewController.m
//  HWCoreDataPart1
//
//  Created by Ne Ildar Zalyalov, A Lenar Gilyazov on 12.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)configureView {
    if (self.detailItem) {
        self.detailDescriptionLabel.text = self.detailItem.name.description;
        self.ageLabel.text = [NSString stringWithFormat:@"%hd",self.detailItem.age];
        self.sexLabel.text = self.detailItem.sex.description;
        self.dobLabel.text = self.detailItem.dob.description;
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
}


#pragma mark - Managing the detail item

- (void)setDetailItem:(User *)newUserItem {
    if (_detailItem != newUserItem) {
        _detailItem = newUserItem;
        
        [self configureView];
    }
}


@end
