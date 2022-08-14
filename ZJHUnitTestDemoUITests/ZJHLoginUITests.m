//
//  ZJHLoginUITests.m
//  ZJHUnitTestDemoUITests
//
//  Created by ZJH on 2022/8/12.
//

#import <XCTest/XCTest.h>

@interface ZJHLoginUITests : XCTestCase

@end

@implementation ZJHLoginUITests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;

    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

/// 根据 UI Recording 生成代码
- (void)testLogin1 {
    /*
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.staticTexts[@"UITestDemo"] tap];
    [[[[[[[[[app.windows childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeTextField] elementBoundByIndex:0] tap];
    [app.buttons[@"shift"] tap];
    
    XCUIElement *aKey = app.keys[@"a"];
    [aKey tap];
    [aKey tap];
    [[[[[[[[[[[app childrenMatchingType:XCUIElementTypeWindow] elementBoundByIndex:0] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeTextField] elementBoundByIndex:1] tap];
    
    XCUIElement *moreKey = app.keys[@"more"];
    [moreKey tap];
    [moreKey tap];
    
    XCUIElement *key = app.keys[@"1"];
    [key tap];
    [key tap];
    
    XCUIElement *key2 = app.keys[@"2"];
    [key2 tap];
    [key2 tap];
    
    XCUIElement *key3 = app.keys[@"3"];
    [key3 tap];
    [key3 tap];
    
    XCUIElement *key4 = app.keys[@"4"];
    [key4 tap];
    [key4 tap];
    
    XCUIElement *button = app.buttons[@"\U767b\U5f55"];
    [button.staticTexts[@"\U767b\U5f55"] tap];
    
    XCUIElement *deleteKey = app.keys[@"delete"];
    [deleteKey tap];
    [deleteKey tap];
    [button tap];
    [app.navigationBars[@"Record List"].buttons[@"\U767b\U5f55"] tap];
    */
}

/// 修改 UI Recording 生成的代码
- (void)testLogin2 {
    // 拿到当前application程序
    XCUIApplication *app = [[XCUIApplication alloc] init];
    // 点击 "UITestDemo" 按钮
    [app.staticTexts[@"UITestDemo"] tap];
    
    // 点击账号textField
    [[[[[[[[[app.windows childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeTextField] elementBoundByIndex:0] tap];
    /* (lldb) po app
         t =   110.37s Requesting snapshot of accessibility hierarchy for app with pid 7340
         t =   110.76s Requesting snapshot of accessibility hierarchy for app with pid 7340
     Attributes: Application, pid: 7340, label: 'ZJHUnitTestDemo'
     Element subtree:
      →Application, 0x6000027d6ae0, pid: 7340, label: 'ZJHUnitTestDemo'
         Window (Main), 0x6000027d7480, {{0.0, 0.0}, {375.0, 812.0}}
           Other, 0x6000027d7560, {{0.0, 0.0}, {375.0, 812.0}}
             Other, 0x6000027d7640, {{0.0, 0.0}, {375.0, 812.0}}
               Other, 0x6000027d7720, {{0.0, 0.0}, {375.0, 812.0}}
                 NavigationBar, 0x6000027d7800, {{0.0, 50.0}, {375.0, 44.0}}, identifier: '登录'
                   Button, 0x6000027d78e0, {{0.0, 50.0}, {77.7, 44.0}}, label: 'Home'
                   StaticText, 0x6000027d79c0, {{170.3, 61.7}, {34.7, 20.3}}, label: '登录'
                 Other, 0x6000027d7aa0, {{0.0, 0.0}, {375.0, 812.0}}
                   Other, 0x6000027d7b80, {{0.0, 0.0}, {375.0, 812.0}}
                     Other, 0x6000027d7c60, {{0.0, 0.0}, {375.0, 812.0}}
                       StaticText, 0x6000027d7d40, {{0.0, 154.0}, {93.8, 40.0}}, label: '账号：'
                       TextField, 0x6000027d7e20, {{95.8, 154.0}, {249.2, 40.0}}
                       StaticText, 0x6000027d7f00, {{0.0, 214.0}, {93.8, 40.0}}, label: '密码：'
                       TextField, 0x6000027e7f00, {{95.8, 214.0}, {249.2, 40.0}}
                       Button, 0x6000027e7e20, {{37.5, 294.0}, {300.0, 44.0}}, label: '登录'
                         StaticText, 0x6000027e7d40, {{169.2, 305.0}, {37.0, 22.0}}, label: '登录'
     Path to element:
      →Application, 0x6000027d6ae0, pid: 7340, label: 'ZJHUnitTestDemo'
     Query chain:
      →Find: Target Application 'zjh.ZJHUnitTestDemo'
       Output: {
         Application, pid: 7340, label: 'ZJHUnitTestDemo'
       }

     (lldb) */
    
    // 点击键盘 shift，切换大小写
    [app.buttons[@"shift"] tap];
    
    // 点击键盘 a
    XCUIElement *aKey = app.keys[@"a"];
    [aKey tap];
//    [aKey tap]; // 多余tag 需要注释掉
    
    // 点击密码textField
    [[[[[[[[[[[app childrenMatchingType:XCUIElementTypeWindow] elementBoundByIndex:0] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeTextField] elementBoundByIndex:1] tap];
    
    // 切换数字键盘
    XCUIElement *moreKey = app.keys[@"more"];
    [moreKey tap];
//    [moreKey tap];
    
    // 输入1、2、3、4
    XCUIElement *key = app.keys[@"1"];
    [key tap];
//    [key tap];
    
    XCUIElement *key2 = app.keys[@"2"];
    [key2 tap];
//    [key2 tap];
    
    XCUIElement *key3 = app.keys[@"3"];
    [key3 tap];
//    [key3 tap];
    
    XCUIElement *key4 = app.keys[@"4"];
    [key4 tap];
//    [key4 tap];
    
    // 点击登录按钮
    XCUIElement *button = app.buttons[@"登录"];
    [button.staticTexts[@"登录"] tap];
    
    // 点击键盘删除按钮
    XCUIElement *deleteKey = app.keys[@"delete"];
    [deleteKey tap];
//    [deleteKey tap];
    
    // 点击登录按钮
    [button tap];
    
    // 点击返回按钮
    [app.navigationBars[@"Record List"].buttons[@"登录"] tap];
}

/// 精简代码
- (void)testLogin3 {
    // 拿到当前application程序
    XCUIApplication *app = [[XCUIApplication alloc] init];
    
    // 获取 “UITestDemo” 按钮，并点击，跳转到登录页面
    [app.staticTexts[@"UITestDemo"] tap];
    
    // 拿到当前app下的textfeild的搜索器
    XCUIElementQuery *tfQuery = app.textFields;
    // 账号textField
    XCUIElement *accountTF = [tfQuery elementBoundByIndex:0];
    // 密码textField
    XCUIElement *passwordTF = [tfQuery elementBoundByIndex:1];
    
    // 拿到当前app下的button的搜索器
    XCUIElementQuery *btnQuery = app.buttons;
    // 获取登录按钮
    XCUIElement *loginBtn = btnQuery[@"登录"];

    // 模拟UI操作
    [accountTF tap]; // 点击账号textField
    [accountTF typeText:@"a"]; // 输入字母a
    [passwordTF tap];// 点击密码textField
    [passwordTF typeText:@"1234"]; // 输入字母123456
    [loginBtn tap]; // 点击登录，提示密码错误
    
    // 获取键盘的删除按钮
    XCUIElement *deleteBtn = app.keys[@"delete"];
    [deleteBtn tap]; // 点击一次删除按钮
    
    // 再次点击登录按钮
    [loginBtn tap]; // 点击登录，成功跳转

    // 获取 “Record List” navigationBar，
    XCUIElement *navBarElement = app.navigationBars[@"Record List"];
    // 获取返回按钮
    XCUIElement *backBtn = navBarElement.buttons[@"登录"];
    // 点击返回按钮
    [backBtn tap];
}

@end
