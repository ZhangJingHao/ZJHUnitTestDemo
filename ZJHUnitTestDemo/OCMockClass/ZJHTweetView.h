//
//  ZJHTweetView.h
//  ZJHUnitTestDemo
//
//  Created by ZJH on 2022/7/27.
//

#import <UIKit/UIKit.h>
#import "ZJHTweetModel.h"

@interface ZJHTweetView : UIView

// 一个将单个推文添加到视图的方法
- (void)addTweet:(ZJHTweetModel *)aTweet;

@end

