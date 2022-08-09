//
//  ZJHMathToolTests.m
//  ZJHUnitTestDemoTests
//
//  Created by ZJH on 2022/7/21.
//

#import <XCTest/XCTest.h>
#import "ZJHMathTool.h"

@interface ZJHMathToolTests : XCTestCase

@property (nonatomic, strong) ZJHMathTool *mathTool;

@end

@implementation ZJHMathToolTests

// 新建ZJHMathTool对象
- (void)setUp {
    self.mathTool = [ZJHMathTool new];
}

// 销毁ZJHMathTool对象
- (void)tearDown {
    self.mathTool = nil;
}

// 测试加法
- (void)testMathAdd {
    int result = [self.mathTool sumA:2 andB:3];
    XCTAssert(result == 5, @"加法计算出错");
}

// 测试减法
- (void)testMathSub {
    int result = [self.mathTool subA:5 andB:2];
    XCTAssert(result == 3, @"减法计算出错");
}


@end
