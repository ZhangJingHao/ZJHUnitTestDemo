//
//  ZJHMultiAppTests.m
//  ZJHUnitTestDemoUITests
//
//  Created by ZJH on 2022/8/13.
//

#import <XCTest/XCTest.h>

@interface ZJHMultiAppTests : XCTestCase

@end

@implementation ZJHMultiAppTests

- (void)setUp {
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
}

- (void)testExample {
    // 返回 UI 测试 Target 设置中选中的 Target Application 的实例
    XCUIApplication *app = [[XCUIApplication alloc] init];
    
    // 使用 BundleId 获得另外一个 App 实例：需要先创建另个测试app
    XCUIApplication *anotherApp = [[XCUIApplication alloc] initWithBundleIdentifier:@"zjh.ZJHUnitTestDemo2"];

    // 先启动我们的主 App
    [app launch];
    
    // 做一系列测试1
    [app.staticTexts[@"UITestDemo"] tap];
    [app.navigationBars[@"登录"].buttons[@"Home"] tap];

    sleep(2);
        
    // 启动另一个 App
    [anotherApp activate];
    
    sleep(2);
    
    // 回到我们的主 App (在 App 未启动的情况下调 activate 会让 App 启动)
    [app activate];
    
    // 做一系列测试2
    [app.staticTexts[@"UITestDemo"] tap];
    [app.navigationBars[@"登录"].buttons[@"Home"] tap];
}

@end
