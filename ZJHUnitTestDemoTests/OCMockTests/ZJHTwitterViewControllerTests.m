//
//  ZJHTwitterViewControllerTests.m
//  ZJHUnitTestDemoTests
//
//  Created by ZJH on 2022/7/27.
//

#import <XCTest/XCTest.h>
#import "ZJHTwitterViewController.h"
#import <OCMock/OCMock.h>

@interface ZJHTwitterViewControllerTests : XCTestCase

@end

@implementation ZJHTwitterViewControllerTests

- (void)testExample {
    //--------- Given Start ---------//
    // 1. 构建Controller实例
    ZJHTwitterViewController *controller = [ZJHTwitterViewController new];
    
    // 2. Mock一个ZJHTwitterConnection实例
    id mockConnection = OCMClassMock([ZJHTwitterConnection class]);
    controller.connection = mockConnection;
    
    // 创建一些数据
    ZJHTweetModel *testTweet1 = [ZJHTweetModel new];
    ZJHTweetModel *testTweet2 = [ZJHTweetModel new];
    NSArray *tweetArray = @[testTweet1, testTweet2];
    // 3. stub Connection 的 fetchTweets 方法使之固定返回Tweet模型数组
    OCMStub([mockConnection fetchTweets]).andReturn(tweetArray);
    
    // 4. Mock一个TweetView实例
    id mockView = OCMClassMock([ZJHTweetView class]);
    controller.tweetView = mockView;
    
    //--------- When Start ---------//
    // 5. 调用测试目标方法updateTweetView。里面会调用fetchTweets，然后会得到我们存根的数组tweetArray
    [controller updateTweetView];
    
    //--------- Then Start ---------//
    // 6. 验证 mock TweetView 的 addTweet: 显示Tweet到界面的操作被触发
    OCMVerify([mockView addTweet:[OCMArg any]]);
}


@end
