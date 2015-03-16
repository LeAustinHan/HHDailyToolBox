//
//  HHSchemeVCL.h
//  HHDailyToolBox
//
//  Created by LeAustinHan on 15-3-4.
//  Copyright (c) 2015年 han. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^DissMissSchemeVCL)(void);

@interface HHSchemeVCL : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *receiveDataLabel;

@property (copy,nonatomic)  DissMissSchemeVCL dissmissBlock;

@end
