//
//  ZJHNetworkTool.m
//  ZJHUnitTestDemo
//
//  Created by ZJH on 2022/7/27.
//

#import "ZJHNetworkTool.h"

@implementation ZJHNetworkTool

/// 网络请求
+ (void)requestUrl:(NSString *)url
             param:(NSDictionary *)param
        completion:(void (^)(NSDictionary *respondDic))completion {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (int i = 0; i < 10000; i++) {
            NSLog(@"hello");
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion) {
                completion( @{@"code" : @"200"} );
            }
        });
    });
}

@end
