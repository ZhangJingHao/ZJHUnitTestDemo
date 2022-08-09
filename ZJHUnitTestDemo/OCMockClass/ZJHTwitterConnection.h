//
//  ZJHTwitterConnection.h
//  ZJHUnitTestDemo
//
//  Created by ZJH on 2022/7/27.
//

#import <Foundation/Foundation.h>
#import "ZJHTweetModel.h"


@interface ZJHTwitterConnection : NSObject

// 检索新推文的方法。它返回一个ZJHTweetModel对象数组，如果无法处理请求，则返回nil。
- (NSArray <ZJHTweetModel *> *)fetchTweets;

@end

