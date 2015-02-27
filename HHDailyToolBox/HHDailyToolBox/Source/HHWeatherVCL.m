//
//  SecondViewController.m
//  HHDailyToolBox
//
//  Created by LeAustinHan on 15-1-14.
//  Copyright (c) 2015年 han. All rights reserved.
//

#import "HHWeatherVCL.h"
#import "HHAFNetwork/AFHTTPRequestOperation.h"
#import "HHWeatherVo.h"

#import "HHAFNetwork/AFImageRequestOperation.h"

#import "HHAFNetwork/UIImageView+AFNetworking.h"



@interface HHWeatherVCL ()

@property (nonatomic,strong) NSDictionary *weather;

@end

@implementation HHWeatherVCL
static NSString * const BaseURLString = @"http://api.worldweatheronline.com/free/v2/";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self jsonTapAction:nil];
    self.weatherIconImgView.layer.cornerRadius = 4.0;
    self.weatherIconImgView.layer.borderWidth = 2.0;
    self.weatherIconImgView.layer.borderColor = [UIColor whiteColor].CGColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)jsonTapAction:(id)sender{
    NSString *string = [NSString stringWithFormat:@"%@weather.ashx?key=5a757e32d11224a63d9bb655b2fa5&q=Beijing&date=today&format=json",BaseURLString];
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.weather = (NSDictionary *)responseObject;
       // self.title = @"JSON Retrieved";
        NSLog(@"get weather == %@",self.weather);
        [self showWeatherInfomation];
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Weather"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
    }];
    
    [operation start];
}

- (void)showWeatherInfomation
{
    if(!self.weather)
        return ;
    
    HHWeatherVo *weatherVo = [[HHWeatherVo alloc] initWithAttributes:[self.weather objectForKey:@"data"]];
    
    NSLog(@"get weather == %@",weatherVo.weatherIconUrl);
    self.curTemLabel.text = [NSString stringWithFormat:@"%@°",weatherVo.tempCCur];
    self.curInfoLabel.text = [NSString stringWithFormat:@"湿度 %%%@,能见度%@",weatherVo.humidity,weatherVo.visibility];
    self.tempLabel.text = [NSString stringWithFormat:@"最低  %@°C,最高 %@°C",weatherVo.tempMinC,weatherVo.tempMaxC];
    self.windLabel.text = [NSString stringWithFormat:@"风力%@级,风速%@m/s",weatherVo.winddirDegree,weatherVo.windspeedMiles];
    
    self.weatherIconImgView.hidden = NO;
    self.curTemLabel.hidden = NO;
    self.curInfoLabel.hidden = NO;
    self.tempLabel.hidden = NO;
    self.windLabel.hidden = NO;
    
    [self.indicator stopAnimating];
    [self requestImage:weatherVo.weatherIconUrl];
    
}

- (void)requestImage:(NSString *)string{
    
    NSURL *url = [NSURL URLWithString:string];
    //NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];

    //方法1
//    self.weatherIconImgView.imageResponseSerializer = [AFImageResponseSerializer serializer];
//    [self.weatherIconImgView setImageWithURLRequest:urlRequest placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
//        self.weatherIconImgView.image = image;
//        NSLog(@"get weatherIcon");
//    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
//        NSLog(@"fail weatherIcon");
//    }];
    
    //方法2
//       [[AFImageRequestOperation imageRequestOperationWithRequest:urlRequest
//                                                      success:^(UIImage *image){
//                                                          NSLog(@"get weatherIcon");
//                                                          self.weatherIconImgView.image = image;
//                                                      }] start];
    //方法3
    [self.weatherIconImgView setImageWithURL:url];
    
    
}

@end
