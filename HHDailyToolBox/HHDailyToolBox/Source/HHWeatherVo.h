//
//  HHWeatherVo.h
//  HHDailyToolBox
//
//  Created by LeAustinHan on 15-2-27.
//  Copyright (c) 2015年 han. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HHWeatherVo : NSObject

@property (nonatomic,strong) NSString *tempCCur;
@property (nonatomic,strong) NSString *humidity;
@property (nonatomic,strong) NSString *visibility;
@property (nonatomic,strong) NSString *tempMinC;
@property (nonatomic,strong) NSString *tempMaxC ;
@property (nonatomic,strong) NSString *weatherIconUrl;
@property (nonatomic,strong) NSString *winddirDegree;
@property (nonatomic,strong) NSString *windspeedMiles;
@property (nonatomic,strong) NSString *weatherDesc;
@property (nonatomic,strong) NSString *dateString;


- (instancetype)initWithAttributes:(NSDictionary *)attributes;

@end
