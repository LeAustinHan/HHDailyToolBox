//
//  HHSchemeVCL.m
//  HHDailyToolBox
//
//  Created by LeAustinHan on 15-3-4.
//  Copyright (c) 2015年 han. All rights reserved.
//

#import "HHSchemeVCL.h"

@interface HHSchemeVCL ()

@end

@implementation HHSchemeVCL


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissAction:(id)sender{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
    return;
    
    if (self.dissmissBlock) {
        self.dissmissBlock();
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
