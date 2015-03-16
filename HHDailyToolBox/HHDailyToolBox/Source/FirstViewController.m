//
//  FirstViewController.m
//  HHDailyToolBox
//
//  Created by LeAustinHan on 15-1-14.
//  Copyright (c) 2015年 han. All rights reserved.
//

#import "FirstViewController.h"
#import "HHUI/HHTestObject.h"
#import "HHAFNetwork/AFJSONRequestOperation.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib
    
    [self hostAppSaveData];
    
    [self performSelector:@selector(scaleView) withObject:nil afterDelay:5.0];
    
}

- (void)hostAppSaveData{
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.DailyToolBox"];
    
    [userDefaults setObject:@"有霾" forKey:@"com.weather.describe"];
    [userDefaults setInteger:12 forKey:@"com.weather.degree"];
    
    
    [userDefaults synchronize];
}

- (void)scaleView{
    
    CGSize size = CGSizeMake(2, 2);
    
    UIView *testView = [[UIView alloc] initWithFrame:CGRectMake((self.view.frame.size.width - size.width)/2, (self.view.frame.size.height - size.height)/2, 2, 2)];
    
    [self.view addSubview:testView];
    
    CGRect rect = testView.frame;
    
    testView.backgroundColor = [UIColor redColor];

    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDuration:2];
    //在出动画的时候减缓速度
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    //添加动画开始及结束的代理
    [UIView setAnimationDelegate:self];
    
    rect = CGRectMake(rect.origin.x - 100 , rect.origin.y - 100,200, 200);
    testView.frame = rect;
    
    //动画效果
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.view cache:YES];
    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)jsonTest{
    NSURL *url = [NSURL URLWithString:@"https://alpha-api.app.net/stream/0/posts/stream/global"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSLog(@"App.net Global Stream: %@", JSON);
    } failure:nil];
    [operation start];
}

- (IBAction)pushNextVCL:(id)sender{
    UIViewController *testVCL = [[UIViewController alloc] init];
    
}


@end
