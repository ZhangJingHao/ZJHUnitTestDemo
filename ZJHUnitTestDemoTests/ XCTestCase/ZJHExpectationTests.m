//
//  ZJHExpectationTests.m
//  ZJHUnitTestDemoTests
//
//  Created by ZJH on 2022/7/27.
//

#import <XCTest/XCTest.h>
#import "ZJHNetworkTool.h"

@interface ZJHExpectationTests : XCTestCase

@end

@implementation ZJHExpectationTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

/// 异步测试XCTestExpectation：测试类持有期望
- (void)testAsyncMethod1 {
    // 新建期望：测试类持有的初始化方法
    XCTestExpectation *expect1 = [self expectationWithDescription:@"asyncTest1"];

    // 履行期望：执行异步操作
    [ZJHNetworkTool requestUrl:@"getTestData" param:@{} completion:^(NSDictionary * _Nonnull respondDic) {
        // 异步结束，标注期望达成
        [expect1 fulfill];
    }];
    
    // 等待期望被履行：测试类持有时的等待方法
    [self waitForExpectationsWithTimeout:3.0 handler:^(NSError * _Nullable error) {
        NSLog(@"***ZJH error : %@", error);
    }];
}

/// 异步测试XCTestExpectation：自己类持有期望
- (void)testAsyncMethod2 {
    // 新建期望：自己持有的初始化方法
    XCTestExpectation *expect2 = [[XCTestExpectation alloc] initWithDescription:@"asyncTest2"];
    
    // 履行期望：执行异步操作
    [ZJHNetworkTool requestUrl:@"getTestData" param:@{} completion:^(NSDictionary * _Nonnull respondDic) {
        XCTAssertTrue([respondDic[@"code"] isEqualToString:@"200"]);
        // 异步结束，标注期望达成
        [expect2 fulfill];
    }];

    // 等待期望被履行：自己持有时的等待方法
    [self waitForExpectations:@[expect2] timeout:3];
}

/// 异步测试XCTWaiter
- (void)testAsyncMethod3 {
    // 新建期望
    XCTWaiter *waiter = [[XCTWaiter alloc] initWithDelegate:self];
    XCTestExpectation *expect3 = [[XCTestExpectation alloc] initWithDescription:@"asyncTest3"];
        
    // 履行期望：执行异步操作
    [ZJHNetworkTool requestUrl:@"getTestData" param:@{} completion:^(NSDictionary * respondDic) {
        XCTAssertTrue([respondDic[@"code"] isEqualToString:@"200"]);
        // 异步结束，标注期望达成
        [expect3 fulfill];
    }];

    // 等待期望被履行
    XCTWaiterResult result = [waiter waitForExpectations:@[expect3]
                                                 timeout:3
                                            enforceOrder:NO];

    XCTAssert(result == XCTWaiterResultCompleted, @"failure: %ld", result);
}

// 如果有期望超时，则调用。
- (void)waiter:(XCTWaiter *)waiter didTimeoutWithUnfulfilledExpectations:(NSArray<XCTestExpectation *> *)unfulfilledExpectations {
    NSLog(@"***ZJH 如果有期望超时，则调用。");
}

// 当履行的期望被强制要求按顺序履行，但期望以错误的顺序被履行，则调用。
- (void)waiter:(XCTWaiter *)waiter fulfillmentDidViolateOrderingConstraintsForExpectation:(XCTestExpectation *)expectation requiredExpectation:(XCTestExpectation *)requiredExpectation {
    NSLog(@"***ZJH 当履行的期望被强制要求按顺序履行，但期望以错误的顺序被履行，则调用。");
}

// 当某个期望被标记为被倒置，则调用。
- (void)waiter:(XCTWaiter *)waiter didFulfillInvertedExpectation:(XCTestExpectation *)expectation {
    NSLog(@"***ZJH 当某个期望被标记为被倒置，则调用。");
}

// 当 waiter 在 fullfill 和超时之前被打断，则调用。
- (void)nestedWaiter:(XCTWaiter *)waiter wasInterruptedByTimedOutWaiter:(XCTWaiter *)outerWaiter {
    NSLog(@"***ZJH 当 waiter 在 fullfill 和超时之前被打断，则调用。");
}

@end
