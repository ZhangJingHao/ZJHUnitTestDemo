//
//  ZJHRecordUITests.m
//  ZJHUnitTestDemoUITests
//
//  Created by ZJH on 2022/8/12.
//

#import <XCTest/XCTest.h>

@interface ZJHRecordUITests : XCTestCase

@end

@implementation ZJHRecordUITests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;

    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
}

- (void)testExample {
    // 拿到当前application程序
    XCUIApplication *app = [[XCUIApplication alloc] init];
    // 点击 "UITestDemo" 按钮
    [app.staticTexts[@"UITestDemo"] tap];
    
    // 拿到当前app下的textfeild的搜索器
    XCUIElementQuery *tfQuery = app.textFields;
    XCUIElement *accountTF = [tfQuery elementBoundByIndex:0];
    XCUIElement *passwordTF = [tfQuery elementBoundByIndex:1];
    // 拿到当前app下的button的搜索器
    XCUIElementQuery *btnQuery = app.buttons;
    XCUIElement *loginBtn = btnQuery[@"登录"];

    // 模拟UI操作
    [accountTF tap];
    [accountTF typeText:@"a"]; // 输入字母a
    [passwordTF tap];// 点击密码textField
    [passwordTF typeText:@"123"]; // 输入字母123
    
    // 点击登录，成功跳转笔记列表页面
    [loginBtn tap];

    
    // 添加笔记1
    [self addRecordWithApp:app msg:@"今天天气真好！🌞"];
    
    // 添加笔记2
    [self addRecordWithApp:app msg:@"今天詹姆斯特别给力，带领球队走向胜利。✌️"];
    
    // 截图
    [self addAttachmentWithScreenshot:[app screenshot] attachmentName:@"MyScreenshot"];

    // 递归删除所有笔记
    while (app.cells.count > 0) {
        [self deleteFirstRecordWithApp:app];
    }

    sleep(1.1);
}

/**
 添加笔记
 
 @param app app 实例
 @param msg 笔记内容
 */
- (void)addRecordWithApp:(XCUIApplication *)app msg:(NSString *)msg {
    // 暂存当前 cell 数量
    NSInteger cellsCount = app.cells.count;
    // 设置一个预期 判断 app.cells 的 count 属性会等于 cellsCount+1， 等待直至失败，如果符合则不再等待
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"count == %d",cellsCount+1];
    [self expectationForPredicate:predicate evaluatedWithObject:app.cells handler:nil];
    
    
    // 定位导航栏+号按钮，点击进入添加笔记页面
    XCUIElement *addButton = app.navigationBars[@"Record List"].buttons[@"Add"];
    [addButton tap];
    
    // 测试 未输入任何内容点击保存
    [app.navigationBars[@"Write Anything"].buttons[@"Save"] tap];
    
    // 定位文本输入框 输入内容
    XCUIElement *textView = app.textViews.firstMatch;
    [textView typeText:msg];
    
    // 保存
    [app.navigationBars[@"Write Anything"].buttons[@"Save"] tap];
    
    // 等待预期
    [self waitShortTimeForExpectations];
}

/**
 删除最近一个笔记
 
 @param app app 实例
 */
- (void)deleteFirstRecordWithApp:(XCUIApplication *)app {
    NSInteger cellsCount = app.cells.count;
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"count == %d",cellsCount-1];
    // 设置一个预期 判断 app.cells 的 count 属性会等于 cellsCount-1， 等待直至失败，如果符合则不再等待
    [self expectationForPredicate:predicate evaluatedWithObject:app.cells handler:nil];
    
    // 定位到 cell 元素
    XCUIElement *firstCell = app.cells.firstMatch;
    
    // 左滑出现删除按钮
    [firstCell swipeLeft];
    
    // 定位删除按钮
    XCUIElement *deleteButton = [app.buttons matchingIdentifier:@"Delete"].firstMatch;
    
    // 点击删除按钮
    if (deleteButton.exists) {
        [deleteButton tap];
    }
    
    // 等待预期
    [self waitShortTimeForExpectations];
}

- (void)waitShortTimeForExpectations {
    [self waitForExpectationsWithTimeout:10 handler:nil];
}

// 截图
- (void)addAttachmentWithScreenshot:(XCUIScreenshot *)screenshot attachmentName:(NSString *)attachmentName {
    // 实例化一个附件对象 并传入截屏对象
    XCTAttachment *attachment = [XCTAttachment attachmentWithScreenshot:screenshot];
    // 附件的存储策略 如果选择 XCTAttachmentLifetimeDeleteOnSuccess 则测试成功的情况会被删除
    attachment.lifetime = XCTAttachmentLifetimeKeepAlways;
    // 设置一个名字 方便区分
    attachment.name = attachmentName;
    [self addAttachment:attachment];
}

@end
