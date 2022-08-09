//
//  ZJHFirstKiwiTests.m
//  ZJHUnitTestDemoTests
//
//  Created by ZJH on 2022/7/20.
//

#import "Kiwi.h"

SPEC_BEGIN(SimpleStringSpec)

describe(@"SimpleString", ^{
    context(@"when assigned to 'Hello world'", ^{
        NSString *greeting = @"Hello world";
        it(@"should exist", ^{
            [[greeting shouldNot] beNil];
        });

        it(@"should equal to 'Hello world'", ^{
            [[greeting should] equal:@"Hello world"];
        });
    });
});

SPEC_END
