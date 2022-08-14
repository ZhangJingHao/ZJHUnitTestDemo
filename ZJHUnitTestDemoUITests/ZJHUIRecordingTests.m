//
//  ZJHUIRecordingTests.m
//  ZJHUnitTestDemoUITests
//
//  Created by ZJH on 2022/8/10.
//

#import <XCTest/XCTest.h>

@interface ZJHUIRecordingTests : XCTestCase

@end

@implementation ZJHUIRecordingTests

- (void)setUp {
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;

    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
}

- (void)testExample {
    // 启动app
    XCUIApplication *app = [[XCUIApplication alloc] init];
    // 获取 “UI Recording” 按钮，并点击
    [app.staticTexts[@"UI Recording"] tap];
    // 获取 “Hello world” navigationBar，获取 "Home"，并点击
    [app.navigationBars[@"Hello world"].buttons[@"Home"] tap];
}

@end
