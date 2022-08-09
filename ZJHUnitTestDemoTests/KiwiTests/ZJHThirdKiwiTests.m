//
//  ZJHThirdKiwiTests.m
//  ZJHUnitTestDemoTests
//
//  Created by ZJH on 2022/7/20.
//

// 可以用下面的内容替换原来的tests.m中的内容,然后cmd+u
// 测试失败可自行解决;解决不了的,继续往下看.
#import "Kiwi.h"
#import "ZJHKiwiCar.h"
#import "ZJHNetworkTool.h"

SPEC_BEGIN(ZJHExpectationKiwiSpec)

describe(@"ZJHKiwiCar Test", ^{
    it(@"A Car Rule", ^{
        id car = [ZJHKiwiCar new];
        [[car shouldNot] beNil]; // car对象不能为nil
        [[car should] beKindOfClass:[ZJHKiwiCar class]]; // 应该是ZJHKiwiCar类
        [[car shouldNot] conformToProtocol:@protocol(NSCopying)]; // 应该没有实现NSCopying协议
        [[[car should] have:4] wheels]; // 应该有4个轮子
        [[theValue([(ZJHKiwiCar *)car speed]) should] equal:theValue(42.0f)]; // 测速应该是42
        [[car should] receive:@selector(changeToGear:) withArguments: theValue(3)]; // 接收的参数应该是3
        [car changeToGear: 3]; // 调用方法
    });
    
    it(@"Scalar packing",^{ // 标量装箱
        [[theValue(1 + 1) should] equal:theValue(2)];
        [[theValue(YES) shouldNot] equal:theValue(NO)];
        [[theValue(20u) should] beBetween:theValue(1) and:theValue(30.0)];
        ZJHKiwiCar * car = [ZJHKiwiCar new];
        [[theValue(car.speed) should] beGreaterThan:theValue(40.0f)];
    });
    
    it(@"Message Pattern", ^{ // 消息模式
        ZJHKiwiCar *cruiser = [[ZJHKiwiCar alloc]init];
        [[cruiser should] receive:@selector(jumpToStarSystemWithIndex:) withArguments: theValue(3)];
        [cruiser jumpToStarSystemWithIndex: 3]; // 期望传的参数是3
    });
    
    it(@"Expectations: Count changes", ^{ // 期望: 数量的变化
        NSMutableArray * array = [NSMutableArray arrayWithCapacity: 42];
        
        [[theBlock(^{ // 数量应该+1
            [array addObject:@"foo"];
        }) should] change:^{
            return (NSInteger)[array count];
        } by:+1];
        
        [[theBlock(^{ // 数量不应该改变
            [array addObject:@"bar"];
            [array removeObject:@"foo"];
        }) shouldNot] change:^{ return (NSInteger)[array count]; }];
        
        [[theBlock(^{ // 数量应该-1
            [array removeObject:@"bar"];
        }) should] change:^{ return (NSInteger)[array count]; } by:-1];
    });
    
    it(@"Notification", ^{ // 期望:通知
        [[@"自定义通知" should] bePosted];
        NSNotification *myNotification = [NSNotification notificationWithName:@"自定义通知"
                                                                       object:nil];
        [[NSNotificationCenter defaultCenter] postNotification:myNotification];
    });
    
    
    it(@"Mock", ^{ // 模拟对象
        id carMock = [ZJHKiwiCar mock]; // 模拟创建一个对象
        [ [carMock should] beMemberOfClass:[ZJHKiwiCar class]]; // 判断对象的类型
        [ [carMock should] receive:@selector(currentGear) andReturn:theValue(3)]; // 存根 currentGear 方法，并返回值为3
        [ [theValue([carMock currentGear]) should] equal:theValue(3)]; // 调用模拟对象的方法。
        
        id carNullMock = [ZJHKiwiCar nullMock]; // 模拟创建一个空对象
        /* 当mock对象收到了没有被stub过的调用(更准确的说，走进了消息转发的forwoardInvocation:方法里)时：
          ·nullMock: 就当无事发生，忽略这个调用
          ·partialMock: 让初始化时传入的object来响应这个selector
          ·普通Mock：抛出exception  */
        [carNullMock applyBrakes];

        // 模拟协议
        id flyerMock = [KWMock mockForProtocol:@protocol(ZJHKiwiFlyingMachine)];
        [ [flyerMock should] conformToProtocol:@protocol(ZJHKiwiFlyingMachine)];
        [flyerMock stub:@selector(dragCoefficient) andReturn:theValue(17.0f)];

        id flyerNullMock = [KWMock nullMockForProtocol:@protocol(ZJHKiwiFlyingMachine)];
        [flyerNullMock takeOff];
    });
    
    it(@"stub", ^{ // 存根
        
        id mock = [ZJHKiwiCar mock]; // 设置对象的名字为Rolls-Royce
        [mock stub:@selector(carName) andReturn:@"Rolls-Royce"];
        [ [[mock carName] should] equal:@"Rolls-Royce"];
        
        // 模拟对象接收的消息的某个参数是一个block;通常必须捕捉并执行这个block才能确认这个block的行为.
        id robotMock = [KWMock nullMockForClass:[ZJHKiwiCar class]];
        // 捕捉block参数
        KWCaptureSpy *spy = [robotMock captureArgument:@selector(speak:afterDelay:whenDone:) atIndex:2];
        // 设置存储参数
        [[robotMock should] receive:@selector(speak:) withArguments:@"Goodbye"];
        // 模拟对象接收的消息的某个参数是一个block
        [robotMock speak:@"Hello" afterDelay:2 whenDone:^{
            [robotMock speak:@"Goodbye"];
        }];
        // 获取block，并执行block参数
        void (^block)(void) = spy.argument;
        block();
    });
    
    it(@"shouldEventually", ^{ // 异步测试
        __block NSString *featchData = nil;
        
        // 模拟发送请求，处理异步回调
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            featchData = @"数据返回";
        });
        
        [[expectFutureValue(featchData) shouldEventually] beNonNil];
    });
    
    it(@"mock Network", ^{
        id networkMock = [ZJHNetworkTool mock];
        [networkMock stub:@selector(requestUrl:param:completion:) withBlock:^id(NSArray *params) {
            return nil;
        }];
        
        [networkMock requestUrl:@"someURL" param:@{} completion:^(NSDictionary *respondDic) { }];
            
        [ZJHNetworkTool requestUrl:@"someURL" param:@{} completion:^(NSDictionary * _Nonnull respondDic) {
            NSLog(@"");
        }];
    });
    
});



SPEC_END
