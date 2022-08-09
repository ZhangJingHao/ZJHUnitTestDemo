//
//  ZJHMockDemoTests.m
//  ZJHUnitTestDemoTests
//
//  Created by ZJH on 2022/7/28.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "MOPerson.h"
#import "MOOCMockDemo.h"
#import "MOPerson+Tests.h"
#import "ZJHOrderListViewController.h"

@interface ZJHMockDemoTests : XCTestCase

@end

@implementation ZJHMockDemoTests

/// Nice Mock
- (void)testTalkNiceMock {
    // 新建person类
    MOPerson *person1 = [MOPerson new];

    // mock一个Men对象
    id mockA = OCMClassMock([MOMen class]);
    person1.men = mockA;
  
    // person类执行方法
    [person1 talk:@"123"];
    
    // 验证 logstr 方法有被调用
    OCMVerify([mockA logstr:[OCMArg any]]);
}

/// Strict Mock
- (void)testTalkStrictMock {
    // StrictMock生成mockA
    id mockA = OCMStrictClassMock([MOPerson class]);
    // 使用stub进行存根
    OCMStub([mockA talk:[OCMArg any]]);
    
    // 执行talk方法
    [mockA talk:@"123"];
    
    // 验证mock方法有没有被执行
    OCMVerifyAll(mockA);
}

/// Partial Mock
- (void)testTalkPartialMock {
    MOPerson *person1 = [MOPerson new];

    MOMen *men = [MOMen new];
    id mockA = OCMPartialMock(men);
    // 如果方法被 stub,调用 stub 后的方法，如果方法没有被 stub,调用原来的对象的方法
//    OCMStub([mockA logstr:[OCMArg any]]).andReturn(@"456");;
    person1.men = mockA;
    [person1 talk:@"123"];
    
    OCMVerify([mockA logstr:[OCMArg any]]);
}

/// 运行后验证
- (void)testMockVerify {
    // 新建person类
    MOPerson *person1 = [MOPerson new];

    // mock一个Men对象
    id mock = OCMClassMock([MOMen class]);
    OCMStub([mock logstr:[OCMArg any]]).andReturn(@"456");
    person1.men = mock;
    
    [person1 talk:@"123"];
    [person1 talk:@"123"];

    /* run code under test */
    OCMVerify([mock logstr:@"123"]);
    OCMVerify(never(),    [mock logstr:@"111"]); // 从没被调用
    OCMVerify(times(2),   [mock logstr:@"123"]); // 调用了N次
    OCMVerify(atLeast(1), [mock logstr:@"123"]); // 最少被调用了N次
    OCMVerify(atMost(3),  [mock logstr:@"123"]); // 最多被调用了N次
}

/// 验证预期
- (void)testMockExpect {
    // 新建mock
    id mock = OCMClassMock([MOOCMockDemo class]);

    // 预期下列方法顺序执行
    [mock setExpectationOrderMatters:YES];
    
    // 预期 + 参数验证
    OCMExpect([mock handleLoadSuccessWithPerson:[OCMArg checkWithBlock:^BOOL(id obj) {
        MOPerson *person = (MOPerson *)obj;
        return [person.name isEqualToString:@"momo"];
    }]]);
    // 预期方法
    OCMExpect([mock showError:NO]);

    // 预期不执行
    OCMReject([mock handleLoadFailWithPerson:[OCMArg any]]);
    OCMReject([mock showError:YES]).ignoringNonObjectArgs; // 忽视参数

    // 执行方法
    NSDictionary *info = @{@"name": @"momo"};
    [MOOCMockDemo handleLoadFinished:info];
    
    // 断言
    OCMVerifyAll(mock); // OCMVerifyAll 会验证前面的期望是否有效，只要有一个没调用，就会出错。
    OCMVerifyAllWithDelay(mock, 1); // 支持延迟验证
    
    // 停止Mocking
    [mock stopMocking];
}

/// 网络接口的模拟
- (void)testMockNetwork {
    ZJHOrderListViewController *listVc = [ZJHOrderListViewController new];
    
    id mockManager = OCMClassMock([ZJHNetworkTool class]);
    // mock请求方法，并返回特定参数
    OCMStub([mockManager requestUrl:[OCMArg any] param:[OCMArg any] completion:[OCMArg any]]).andDo(^(NSInvocation *invocation){
        
        void (^successBlock)(NSDictionary *respondDic) = nil;
        
        [invocation getArgument:&successBlock atIndex:4];
        
        successBlock( @{ @"data" : @[@"a", @"b", @"c"] } );
    });
  
    [listVc getListData];
    
    OCMVerifyAll(mockManager);
}


@end

