//
//  SecondViewController.m
//  HHDailyToolBox
//
//  Created by LeAustinHan on 15-1-14.
//  Copyright (c) 2015年 han. All rights reserved.
//

#import "HHWeatherVCL.h"
#import "HHAFNetwork/AFHTTPRequestOperation.h"
#import "HHAFNetwork/AFJSONRequestSerializer.h"

@interface HHWeatherVCL ()

@end

@implementation HHWeatherVCL
static NSString * const BaseURLString = @"http://www.raywenderlich.com/demos/weather_sample/";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)jsonTapAction:(id)sender{
    NSString *string = [NSString stringWithFormat:@"%@weather.php?format=json",BaseURLString];
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONRequestSerializer serializer];
    
//    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
//        self.weather = (NSDictionary *)responseObject;
//        self.title = @"JSON Retrieved";
//    }failure:<#^(AFHTTPRequestOperation *operation, NSError *error)failure#>];
    
}

@end
