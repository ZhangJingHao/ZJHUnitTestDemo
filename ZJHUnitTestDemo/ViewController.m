//
//  ViewController.m
//  ZJHUnitTestDemo
//
//  Created by ZJH on 2022/7/20.
//

#import "ViewController.h"
#import "PhotosViewController.h"
#import "ZJHLoginViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Home";
    
    [self setupUI];
}

- (void)setupUI {
    NSArray *nameArr = @[@"Kiwi示例", @"UI测试示例", @"UI Recording"];
    CGFloat btnW = self.view.frame.size.width * 0.6;
    CGFloat btnX = (self.view.frame.size.width - btnW) / 2;
    CGFloat btnH = 44;
    CGFloat btnY = 0;
    CGFloat statusH = [UIApplication sharedApplication].statusBarFrame.size.height;
    CGFloat navH = self.navigationController.navigationBar.frame.size.height;
    btnY = statusH + navH;
    for (int i = 0; i < nameArr.count; i++) {
        btnY = btnY + btnH + 30;
        CGRect btnF = CGRectMake(btnX, btnY, btnW, btnH);
        UIButton *btn = [[UIButton alloc] initWithFrame:btnF];
        [btn setTitle:nameArr[i] forState:UIControlStateNormal];
        btn.tag = i;
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        btn.backgroundColor = [UIColor orangeColor];
        btn.layer.cornerRadius = btnH * 0.15;
        btn.layer.masksToBounds = YES;
        [self.view addSubview:btn];
    }
}

- (void)clickBtn:(UIButton *)btn {
    if (btn.tag == 0) {
        PhotosViewController *vc = [PhotosViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (btn.tag == 1) {
        ZJHLoginViewController *vc = [ZJHLoginViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (btn.tag == 2) {
        UIViewController *vc = [UIViewController new];
        vc.view.backgroundColor = [UIColor systemBackgroundColor];
        vc.title = @"Hello world";
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
