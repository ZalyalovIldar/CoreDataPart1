//
//  DetailViewController.h
//  HWCoreDataPart1
//
//  Created by Ildar Zalyalov on 12.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HWCoreDataPart1+CoreDataModel.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) User *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UILabel *sexLabel;
@property (weak, nonatomic) IBOutlet UILabel *dobLabel;

@end

