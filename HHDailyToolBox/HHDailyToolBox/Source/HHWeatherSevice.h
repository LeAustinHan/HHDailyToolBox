//
//  HHWeatherSevice.h
//  HHDailyToolBox
//
//  Created by LeAustinHan on 15-2-28.
//  Copyright (c) 2015年 han. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HHAFNetwork/AFHTTPRequestOperation.h"

@interface HHWeatherSevice : NSObject

@property (nonatomic,strong)AFHTTPRequestOperation *operation;

- (void)requestCityWeather:(NSDictionary *)param
                   success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                   failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end
