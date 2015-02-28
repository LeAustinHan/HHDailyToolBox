//
//  HHWeatherSevice.m
//  HHDailyToolBox
//
//  Created by LeAustinHan on 15-2-28.
//  Copyright (c) 2015年 han. All rights reserved.
//

#import "HHWeatherSevice.h"

static NSString * const BaseURLString = @"http://api.worldweatheronline.com/free/v2/";

@implementation HHWeatherSevice
- (id)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)requestCityWeather:(NSDictionary *)param
                   success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                   failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure{
    
    NSString *cityString = [param objectForKey:@"city"];
    NSString *string = [NSString stringWithFormat:@"%@weather.ashx?key=5a757e32d11224a63d9bb655b2fa5&q=%@&date=today&format=json",BaseURLString,cityString];
    NSLog(@"string = %@",string);
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    self.operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    self.operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [self.operation setCompletionBlockWithSuccess:success failure:failure];
    [self.operation start];

}


@end
