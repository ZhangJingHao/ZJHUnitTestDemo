//
//  ZJHPersonTests.m
//  ZJHUnitTestDemoTests
//
//  Created by ZJH on 2022/7/21.
//

#import <XCTest/XCTest.h>
#import "ZJHPerson.h"

@interface ZJHPersonTests : XCTestCase

@property (nonatomic, strong) ZJHPerson *person;

@end

@implementation ZJHPersonTests

- (void)setUp {
    self.person = [ZJHPerson new];
}

- (void)tearDown {
    self.person = nil;
}

- (void)testPerformanceExample {
    [self measureBlock:^{
        [self.person sayHello];
    }];
}

@end
