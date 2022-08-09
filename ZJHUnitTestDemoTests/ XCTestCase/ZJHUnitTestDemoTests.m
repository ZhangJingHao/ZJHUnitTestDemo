//
//  ZJHUnitTestDemoTests.m
//  ZJHUnitTestDemoTests
//
//  Created by ZJH on 2022/7/21.
//

#import <XCTest/XCTest.h>

// 所有的测试类需要继承 XCTestCase
@interface ZJHUnitTestDemoTests : XCTestCase

@end

@implementation ZJHUnitTestDemoTests

/// 在每一个测试方法调用前，都会被调用；用来初始化 test 用例的一些初始值
- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    // 在这里设置代码。在调用类中的每个测试方法之前调用此方法。
}

/// 在每一个测试方法调用后，都会被调用；用来重置 test 方法的数值
- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    // 在这里输入删除代码。在调用类中的每个测试方法之后调用此方法。
}

/// 测试方法命名以 test 开始
- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    // 这是一个功能测试用例。
    // 使用XCTAssert和相关函数来验证您的测试产生正确的结果。
}

/// 性能测试
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    // 这是一个性能测试用例。
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        // 把你想要测量时间的代码放在这里。
    }];
}

@end
