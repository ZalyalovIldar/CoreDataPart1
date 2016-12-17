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
@property (weak, nonatomic) IBOutlet UILabel *detailNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailAgeLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailDOBLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailSexLabel;

@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *userSex;
@property int userAge;
@property (nonatomic, copy) NSDate *userDateOfBurnDate;

@end

