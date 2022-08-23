//
//  ZJHTestPlanUITests.m
//  ZJHUnitTestDemoUITests
//
//  Created by ZJH on 2022/8/18.
//

#import <XCTest/XCTest.h>

@interface ZJHTestPlanUITests : XCTestCase

@end

@implementation ZJHTestPlanUITests

- (void)setUp {
    self.continueAfterFailure = NO;
    [[[XCUIApplication alloc] init] launch];
}

- (void)testExample {
    // 拿到当前application程序
    XCUIApplication *app = [[XCUIApplication alloc] init];
    // 点击 “Test Plan Demo” 按钮
    [app.staticTexts[@"Test Plan Demo"] tap];
    
    // 我们一定要解放台湾
    NSInteger labCount = app.staticTexts.count;
    XCUIElement *tipLab =[app.staticTexts elementBoundByIndex:labCount-3];
    NSString *str1 = tipLab.label;
    XCTAssertEqualObjects(str1, [self localizedString:@"viewTip"]);
    
    // 捐款金额：100 ¥
    XCUIElement *donationLab =[app.staticTexts elementBoundByIndex:labCount-2];
    NSString *str2 = donationLab.label;
    XCTAssertEqualObjects(str2, [self localizedString:@"donationAmount"]);

    sleep(1); // 停顿一下
    
    // 捐款
    NSInteger btnCount = app.buttons.count;
    XCUIElement *donationMoneyBtn = [app.buttons elementBoundByIndex:btnCount-1];
    NSString *str3 = donationMoneyBtn.label;
    XCTAssertEqualObjects(str3, [self localizedString:@"donationButton"]);
    [donationMoneyBtn tap];
    
//    // 捐款
//    NSInteger btnCount1 = app.buttons.count;
//    XCUIElement *donationMoneyBtn1 = [app.buttons elementBoundByIndex:btnCount1-1];
//    [donationMoneyBtn1 tap]; // 点击捐款
//
    // 捐款成功
    XCUIElement *succView = app.staticTexts[[self localizedString:@"donationSuccess"]];
    XCTAssertTrue(succView.exists);
}

- (NSString *)localizedString:(NSString *)keyStr {
    NSBundle *bundle = [NSBundle bundleForClass:[ZJHTestPlanUITests class]];
    return NSLocalizedStringFromTableInBundle(keyStr, nil, bundle, nil);
}

@end
