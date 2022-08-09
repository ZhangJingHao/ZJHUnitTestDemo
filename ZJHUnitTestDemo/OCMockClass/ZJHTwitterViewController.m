//
//  ZJHTwitterViewController.m
//  ZJHUnitTestDemo
//
//  Created by ZJH on 2022/7/27.
//

#import "ZJHTwitterViewController.h"

@interface ZJHTwitterViewController ()

@end

@implementation ZJHTwitterViewController

- (void)updateTweetView {
    NSArray *tweets = [self.connection fetchTweets];
    if (tweets != nil) {
        // 展示数据
        for (ZJHTweetModel *item in tweets) {
            [self.tweetView addTweet:item];
        }
    }
    else {
        // 处理异常情况
        
    }
}



@end
