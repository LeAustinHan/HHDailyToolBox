//
//  HHWeatherVo.m
//  HHDailyToolBox
//
//  Created by LeAustinHan on 15-2-27.
//  Copyright (c) 2015年 han. All rights reserved.
//

#import "HHWeatherVo.h"

@implementation HHWeatherVo

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    NSDictionary *weatherDic = [[attributes valueForKeyPath:@"weather"] firstObject];
    NSDictionary *currentDic = [[attributes valueForKeyPath:@"current_condition"] firstObject];
    self.dateString     = [weatherDic valueForKeyPath:@"date"];
    self.tempMinC       = [weatherDic valueForKeyPath:@"mintempC"];
    self.tempMaxC       = [weatherDic valueForKeyPath:@"maxtempC"];
    
    self.visibility     = [currentDic valueForKeyPath:@"visibility"];
    self.humidity       = [currentDic valueForKeyPath:@"humidity"];
    self.tempCCur       = [currentDic valueForKeyPath:@"temp_C"];
    float windDegree    = [[currentDic valueForKeyPath:@"winddirDegree"] integerValue]/100;
    self.winddirDegree  = [NSString stringWithFormat:@"%.2f",windDegree];
    self.windspeedMiles = [currentDic valueForKeyPath:@"windspeedMiles"];
    self.weatherDesc    = [[currentDic valueForKeyPath:@"weatherDesc"] valueForKeyPath:@"value"];
    self.weatherIconUrl = [[[currentDic valueForKeyPath:@"weatherIconUrl"] firstObject] valueForKeyPath:@"value"];
    
    return self;
}


@end
