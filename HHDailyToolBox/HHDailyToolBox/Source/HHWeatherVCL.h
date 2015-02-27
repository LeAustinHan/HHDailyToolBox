//
//  SecondViewController.h
//  HHDailyToolBox
//
//  Created by LeAustinHan on 15-1-14.
//  Copyright (c) 2015年 han. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HHWeatherVCL : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *weatherIconImgView;

@property (weak, nonatomic) IBOutlet UILabel *tempLabel;
@property (weak, nonatomic) IBOutlet UILabel *windLabel;
@property (weak, nonatomic) IBOutlet UILabel *curInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *curTemLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;

@end

