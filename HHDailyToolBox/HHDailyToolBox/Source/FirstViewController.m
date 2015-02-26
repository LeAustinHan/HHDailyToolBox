//
//  FirstViewController.m
//  HHDailyToolBox
//
//  Created by LeAustinHan on 15-1-14.
//  Copyright (c) 2015年 han. All rights reserved.
//

#import "FirstViewController.h"
#import "HHUI/HHTestObject.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib
    
    HHTestObject *testObjc = [[HHTestObject alloc] init];
    [testObjc libraryPrintDictionary:@{@"🐑":@"年",@"大":@"吉"}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
