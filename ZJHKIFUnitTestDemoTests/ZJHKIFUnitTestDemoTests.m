//
//  ZJHKIFUnitTestDemoTests.m
//  ZJHKIFUnitTestDemoTests
//
//  Created by ZJH on 2022/8/14.
//

#import <XCTest/XCTest.h>
#import <KIF/KIF.h>

@interface ZJHKIFUnitTestDemoTests : KIFTestCase

@end

@implementation ZJHKIFUnitTestDemoTests

// 所有用例开始前调用
- (void)beforeAll {
    NSLog(@"***ZJH beforeAll 所有用例开始前调用");
}

// 所有用例跑完后调用
- (void)afterAll  {
    NSLog(@"***ZJH afterAll 所有用例跑完后调用");
}

// 单个用例开始前调用
- (void)beforeEach {
    NSLog(@"***ZJH beforeEach 单个用例开始前调用");
}

// 单个用例结束后调用
- (void)afterEach {
    NSLog(@"***ZJH afterEach 单个用例结束后调用");
}

- (void)testExample {
    // 点击 “KIFUnitTest” 按钮
    [tester tapViewWithAccessibilityLabel:@"KIFUnitTest"];

    // 输入手机号
    [tester enterText:@"10086" intoViewWithAccessibilityLabel:@"phoneTextField"];
    
    // 点击验证码
    [tester tapViewWithAccessibilityLabel:@"verifyCodeBtn"];
    
    // 选择手动输入验证码还是自动输入
    if (0) {
        // 等待15s：手动输入验证码
        [tester waitForTimeInterval:15];
    } else {
        // 等待网络请求 5
        [tester waitForTimeInterval:5];
        // 输入固定的验证码
        [tester enterText:@"1234" intoViewWithAccessibilityLabel:@"verifyCodeTextField"];
    }
    
    // 点击 “登录” 按钮
    [tester tapViewWithAccessibilityLabel:@"登录"];
    
    // 停顿2s,然后结束
    [tester waitForTimeInterval:2];
}

@end
