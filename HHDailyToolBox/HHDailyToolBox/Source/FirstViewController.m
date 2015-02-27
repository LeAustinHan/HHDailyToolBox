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

#import "AFAppDotNetAPIClient.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib
    
    return;
    HHTestObject *testObjc = [[HHTestObject alloc] init];
    [testObjc libraryPrintDictionary:@{@"🐑":@"年",@"大":@"吉"}];
    
    NSURLSessionTask *task = [self globalTimelinePostsWithBlock:^(NSArray *posts, NSError *error) {
        if (!error) {

        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSURLSessionDataTask *)globalTimelinePostsWithBlock:(void (^)(NSArray *posts, NSError *error))block {
    return [[AFAppDotNetAPIClient sharedClient] GET:@"stream/0/posts/stream/global" parameters:nil success:^(NSURLSessionDataTask * __unused task, id JSON) {
        NSArray *postsFromResponse = [JSON valueForKeyPath:@"data"];
        NSLog(@"json data == %@",postsFromResponse);
        NSMutableArray *mutablePosts = [NSMutableArray arrayWithCapacity:[postsFromResponse count]];
        for (NSDictionary *attributes in postsFromResponse) {
//            Post *post = [[Post alloc] initWithAttributes:attributes];
//            [mutablePosts addObject:post];
        }
        
        if (block) {
            block([NSArray arrayWithArray:mutablePosts], nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block([NSArray array], error);
        }
    }];
}

- (void)jsonTest{
    NSURL *url = [NSURL URLWithString:@"https://alpha-api.app.net/stream/0/posts/stream/global"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSLog(@"App.net Global Stream: %@", JSON);
    } failure:nil];
    [operation start];
}


@end
