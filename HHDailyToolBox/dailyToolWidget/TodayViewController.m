//
//  TodayViewController.m
//  dailyToolWidget
//
//  Created by LeAustinHan on 15-3-4.
//  Copyright (c) 2015年 han. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.DailyToolBox"];
    
    NSInteger intWeather = [userDefaults integerForKey:@"com.weather.degree"];
    
    NSString *stringWeather = [userDefaults objectForKey:@"com.weather.describe"];
    
    self.dataLabel.text = [NSString stringWithFormat:@"今天%@,最高温度%i",stringWeather,intWeather];
    
    NSLog(@"get data = %i",intWeather);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)openContainingApp:(id)sender {
    
    NSURL *url = [NSURL URLWithString:@"DailyToolBox://"];
    
    [self.extensionContext openURL:url completionHandler:^(BOOL success) {
        
    }];
    
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

@end
