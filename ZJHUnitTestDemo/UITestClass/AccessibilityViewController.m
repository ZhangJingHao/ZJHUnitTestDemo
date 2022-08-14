//
//  AccessibilityViewController.m
//  ZJHUnitTestDemo
//
//  Created by ZJH on 2022/8/13.
//

#import "AccessibilityViewController.h"

@interface AccessibilityViewController ()

@end

@implementation AccessibilityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Accessibility Inspector";
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    
    [self setupUI];
}

- (void)setupUI {
    NSArray *nameArr = @[@"我是Button", @"我是Label", @"我是View", @"我是Image"];
    CGFloat btnW = self.view.frame.size.width * 0.6;
    CGFloat btnX = (self.view.frame.size.width - btnW) / 2;
    CGFloat btnH = 50;
    CGFloat btnY = 0;
    CGFloat statusH = [UIApplication sharedApplication].statusBarFrame.size.height;
    CGFloat navH = self.navigationController.navigationBar.frame.size.height;
    btnY = statusH + navH;
    for (int i = 0; i < nameArr.count; i++) {
        btnY = btnY + btnH + 30;
        CGRect btnF = CGRectMake(btnX, btnY, btnW, btnH);
        UIView *temView = nil;
        
        if (i == 0) { // 按钮
            UIButton *btn = [[UIButton alloc] initWithFrame:btnF];
            [btn setTitle:nameArr[i] forState:UIControlStateNormal];
            temView = btn;
        } else if (i == 1) { // label
            UILabel *lab = [[UILabel alloc] initWithFrame:btnF];
            lab.text = nameArr[i];
            lab.textAlignment = NSTextAlignmentCenter;
            temView = lab;
        } else if (i == 2) { // view
            UIView *view = [[UIView alloc] initWithFrame:btnF];
            view.isAccessibilityElement = YES;
            view.accessibilityIdentifier = nameArr[i];
//            view.accessibilityLabel = @"hhh";
            temView = view;
        } else if (i == 3) { // 图片
            UIImageView *imgView = [[UIImageView alloc] initWithFrame:btnF];
            imgView.image = [UIImage imageNamed:@"avatar"];
            imgView.accessibilityIdentifier = nameArr[i];
            temView = imgView;
        }
        
        if (temView) {
            temView.backgroundColor = [UIColor orangeColor];
            [self.view addSubview:temView];
        }
    }
}

@end
