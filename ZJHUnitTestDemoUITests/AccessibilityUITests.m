//
//  AccessibilityUITests.m
//  ZJHUnitTestDemoUITests
//
//  Created by ZJH on 2022/8/13.
//

#import <XCTest/XCTest.h>

@interface AccessibilityUITests : XCTestCase

@end

@implementation AccessibilityUITests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;

    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
}

- (void)testExample {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.staticTexts[@"Accessibility Demo"] tap];
    
    XCUIElement *button = app.buttons[@"我是Button"];
    XCTAssertTrue(button.exists);
    XCUIElement *label = app.staticTexts[@"我是Label"];
    XCTAssertTrue(label.exists);
    XCUIElement *view = app.otherElements[@"我是View"];
    XCTAssertTrue(view.exists);
    XCUIElement *imgview = app.images[@"我是Image"];
    XCTAssertTrue(imgview.exists);
    
    sleep(1);
}

@end
