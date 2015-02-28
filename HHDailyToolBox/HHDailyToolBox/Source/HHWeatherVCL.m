//
//  SecondViewController.m
//  HHDailyToolBox
//
//  Created by LeAustinHan on 15-1-14.
//  Copyright (c) 2015年 han. All rights reserved.
//

#import "HHWeatherVCL.h"
#import "HHAFNetwork/AFHTTPRequestOperation.h"
#import "HHAFNetwork/AFImageRequestOperation.h"
#import "HHAFNetwork/UIImageView+AFNetworking.h"
#import "HHWeatherSevice.h"
#import "HHWeatherVo.h"


@interface HHWeatherVCL ()

@property (nonatomic,strong) NSDictionary *weather;

@property (nonatomic,strong)HHWeatherSevice *weatherService;

@end

@implementation HHWeatherVCL
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.weatherService = [[HHWeatherSevice alloc] init];
    
    self.weatherIconImgView.layer.cornerRadius = 15.0;
    self.weatherIconImgView.layer.borderWidth = 10.0;
    self.weatherIconImgView.layer.borderColor = [UIColor whiteColor].CGColor;
    
    self.doneBtn.titleLabel.font = [UIFont iconFontWithSize:16];
    self.doneBtn.buttonColor = [UIColor turquoiseColor];
    self.doneBtn.shadowColor = [UIColor greenSeaColor];
    self.doneBtn.shadowHeight = 3.0f;
    self.doneBtn.cornerRadius = 6.0f;
    
    self.cityTextField.delegate = self;
    
    [self weatherViewHidden:YES];
    [self loadBackgroundImage];
}

- (void)loadBackgroundImage{
    [self.indicator startAnimating];
    NSURL *url = [NSURL URLWithString:@"http://www.raywenderlich.com/wp-content/uploads/2014/01/sunny-background.png"];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    
    //方法1
    //    self.weatherIconImgView.imageResponseSerializer = [AFImageResponseSerializer serializer];
    //    [self.weatherIconImgView setImageWithURLRequest:urlRequest placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
    //        self.weatherIconImgView.image = image;
    //        NSLog(@"get weatherIcon");
    //    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
    //        NSLog(@"fail weatherIcon");
    //    }];
    
    //方法2
           [[AFImageRequestOperation imageRequestOperationWithRequest:urlRequest
                                                          success:^(UIImage *image){
                                                              NSLog(@"get weatherIcon");
                                                              self.bgImgView.image = image;
                                                              [self.indicator stopAnimating];
                                                              [self weatherViewHidden:NO];
                                                          }] start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)jsonTapAction:(id)sender{
    if (self.cityTextField.text.length==0) {
        FUIAlertView *alertView = [[FUIAlertView alloc] initWithTitle:@"Error city name"
                                                              message:@"Please check and try again"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:nil, nil];
        
        alertView.alertViewStyle = FUIAlertViewStylePlainTextInput;
        alertView.alertContainer.layer.cornerRadius = 5.0;
        alertView.alertContainer.layer.borderWidth = 10.0;
        alertView.alertContainer.layer.borderColor = [UIColor cloudsColor].CGColor;
        alertView.titleLabel.textColor = [UIColor cloudsColor];
        alertView.titleLabel.font = [UIFont boldFlatFontOfSize:16];
        alertView.messageLabel.textColor = [UIColor cloudsColor];
        alertView.messageLabel.font = [UIFont flatFontOfSize:14];
        alertView.backgroundOverlay.backgroundColor = [[UIColor cloudsColor] colorWithAlphaComponent:0.8];
        alertView.alertContainer.backgroundColor = [UIColor midnightBlueColor];
        alertView.defaultButtonColor = [UIColor cloudsColor];
        alertView.defaultButtonShadowColor = [UIColor asbestosColor];
        alertView.defaultButtonFont = [UIFont boldFlatFontOfSize:16];
        alertView.defaultButtonTitleColor = [UIColor asbestosColor];

        alertView.delegate = self;
        [alertView show];
        return;
    }
    
    [self.indicator startAnimating];
    
    __weak HHWeatherVCL *instance = self;
    [self.weatherService requestCityWeather:@{@"city":self.cityTextField.text} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.weather = (NSDictionary *)responseObject;
        NSLog(@"get weather == %@",self.weather);
        [instance reloadWeatherView];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        FUIAlertView *alertView = [[FUIAlertView alloc] initWithTitle:@"Hello" message:@"This is an alert view" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:@"Do Something", nil];
        alertView.alertViewStyle = FUIAlertViewStylePlainTextInput;
        [@[[alertView textFieldAtIndex:0], [alertView textFieldAtIndex:1]] enumerateObjectsUsingBlock:^(FUITextField *textField, NSUInteger idx, BOOL *stop) {
            [textField setTextFieldColor:[UIColor cloudsColor]];
            [textField setBorderColor:[UIColor asbestosColor]];
            [textField setCornerRadius:4];
            [textField setFont:[UIFont flatFontOfSize:14]];
            [textField setTextColor:[UIColor midnightBlueColor]];
        }];
//[[FUIAlertView alloc]initWithTitle:@"Error Retrieving Weather"
//                                                            message:[error localizedDescription]
//                                                           delegate:nil
//                                                  cancelButtonTitle:@"Ok"
//                                                  otherButtonTitles:nil];
        [alertView show];
    }];
}

- (void)weatherViewHidden:(BOOL)hidden{
    self.weatherIconImgView.hidden = hidden;
    self.weatherContextImgView.hidden = hidden;
    self.curTemLabel.hidden = hidden;
    self.curInfoLabel.hidden = hidden;
    self.tempLabel.hidden = hidden;
    self.windLabel.hidden = hidden;
    if (hidden) {
        [self.indicator startAnimating];
    }else{
        [self.indicator stopAnimating];
    }
}

- (void)reloadWeatherView
{
    if(!self.weather)
        return ;
    
    HHWeatherVo *weatherVo = [[HHWeatherVo alloc] initWithAttributes:[self.weather objectForKey:@"data"]];
    NSLog(@"get weather == %@",weatherVo.weatherIconUrl);
    self.curTemLabel.text = [NSString stringWithFormat:@"%@°",weatherVo.tempCCur];
    self.curInfoLabel.text = [NSString stringWithFormat:@"湿度 %%%@,能见度%@",weatherVo.humidity,weatherVo.visibility];
    self.tempLabel.text = [NSString stringWithFormat:@"最低  %@°C,最高 %@°C",weatherVo.tempMinC,weatherVo.tempMaxC];
    self.windLabel.text = [NSString stringWithFormat:@"风力%@级,风速%@m/s",weatherVo.winddirDegree,weatherVo.windspeedMiles];
    
    [self weatherViewHidden:NO];
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
    [self.weatherContextImgView setImageWithURL:url];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField;{
    [textField resignFirstResponder];
    return NO;
}

@end
