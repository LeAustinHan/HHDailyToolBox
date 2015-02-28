//
//  SecondViewController.h
//  HHDailyToolBox
//
//  Created by LeAustinHan on 15-1-14.
//  Copyright (c) 2015年 han. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HHUI/FlatUIKit.h"

@interface HHWeatherVCL : UIViewController<UITextFieldDelegate,FUIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *bgImgView;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIconImgView;
@property (weak, nonatomic) IBOutlet UIImageView *weatherContextImgView;

@property (weak, nonatomic) IBOutlet FUIButton *doneBtn;
@property (weak, nonatomic) IBOutlet UILabel *tempLabel;
@property (weak, nonatomic) IBOutlet UILabel *windLabel;
@property (weak, nonatomic) IBOutlet UILabel *curInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *curTemLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@property (weak, nonatomic) IBOutlet UITextField *cityTextField;

@end

