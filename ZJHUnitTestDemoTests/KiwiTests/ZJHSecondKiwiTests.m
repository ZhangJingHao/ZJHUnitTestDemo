//
//  ZJHSecondKiwiTests.m
//  ZJHUnitTestDemoTests
//
//  Created by ZJH on 2022/7/20.
//

#import "Kiwi.h"
#import "ZJHKiwiSample.h"

// SPEC_BEGIN(ClassName) 和 SPEC_END 宏,用于标记 KWSpec 类的开始和结束,以及测试用例的分组声明
SPEC_BEGIN(ZJHKiwiSampleSpec)

describe(@"ZJHKiwiSample Kiwi test", ^{
    registerMatchers(@"ZJH"); // 注册所有使用"ZJH"命名空间前缀的匹配器.
    
    context(@"a state the component is in", ^{
        let(variable, ^{ // 在每个包含的 "it" 执行前执行执行一次.
            return [[ZJHKiwiSample alloc]init];
        });
        
        beforeAll(^{ // 在所有内嵌上下文或当前上下文的 it block执行之前执行一次.
            NSLog(@"beforAll");
        });
        
        afterAll(^{ // 在所有内嵌上下文或当前上下文的 it block执行之后执行一次.
            NSLog(@"afterAll");
        });
        
        beforeEach(^{ // 在所有包含的上下文环境的 it block执行之前,均各执行一次.用于初始化指定上下文环境的代码
            NSLog(@"beforeEach");
        });
        
        afterEach(^{ // 在所有包含的上下文环境的 it block执行之后,均各执行一次.
            NSLog(@"afterEach");
        });
        
        it(@"should do something", ^{ // 声明一个测试用例.这里描述了对对象或行为的期望.
            NSLog(@"should do something");
        });
        
        specify(^{ // 可用于标记尚未完成的功能或用例,仅会使Xcode输出一个黄色警告
            NSLog(@"specify");
            [[variable shouldNot] beNil];
        });
        
        context(@"inner context", ^{
            NSLog(@"inner context");
            it(@"does another thing", ^{
                NSLog(@"does another thing");
            });
            
            pending(@"等待实现的东西", ^{ // 可用于标记尚未完成的功能或用例,仅会使Xcode输出一个黄色警告
                NSLog(@"等待实现的东西");
            });
        });
    });
});

SPEC_END
