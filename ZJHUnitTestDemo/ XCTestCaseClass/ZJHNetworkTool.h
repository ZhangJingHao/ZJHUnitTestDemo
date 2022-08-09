//
//  ZJHNetworkTool.h
//  ZJHUnitTestDemo
//
//  Created by ZJH on 2022/7/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZJHNetworkTool : NSObject

/// 网络请求
+ (void)requestUrl:(NSString *)url
             param:(NSDictionary *)param
        completion:(void (^)(NSDictionary *respondDic))completion;

@end

NS_ASSUME_NONNULL_END
