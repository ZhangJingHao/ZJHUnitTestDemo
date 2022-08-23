//
//  ZJHTestPlanViewController.m
//  ZJHUnitTestDemo
//
//  Created by ZJH on 2022/8/18.
//

#import "ZJHTestPlanViewController.h"

@interface ZJHTestPlanViewController ()

@end

@implementation ZJHTestPlanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    // 祖国统一
    self.title = NSLocalizedString(@"viewTitle", nil);
    
    [self setupUI];
}

- (void)setupUI {
    CGFloat statusH = [UIApplication sharedApplication].statusBarFrame.size.height;
    CGFloat navH = self.navigationController.navigationBar.frame.size.height;
    CGFloat labY = statusH + navH + 16;
    CGFloat labH = 44;
    CGRect labF = CGRectMake(0, labY, self.view.frame.size.width, labH);
    UILabel *tipLab = [[UILabel alloc] initWithFrame:labF];
    // 我们一定要解放台湾
    tipLab.text = NSLocalizedString(@"viewTip", nil);
    tipLab.textAlignment = NSTextAlignmentCenter;
    tipLab.font = [UIFont boldSystemFontOfSize:20];
    [self.view addSubview:tipLab];
    
    CGFloat imgY = labY + labH + 20;
    CGFloat imgX = 0;
    CGFloat imgW = self.view.frame.size.width - imgX * 2;
    CGFloat imgH = imgW * 0.618;
    CGRect imgF = CGRectMake(imgX, imgY, imgW, imgH);
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:imgF];
    imgView.image = [UIImage imageNamed:NSLocalizedString(@"taiwaiIcon", nil)];
    imgView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:imgView];
    
    CGFloat donationY = imgY + imgH + 30;
    CGFloat donationH = 44;
    CGRect donationF = CGRectMake(0, donationY, self.view.frame.size.width, donationH);
    UILabel *donationLab = [[UILabel alloc] initWithFrame:donationF];
    donationLab.text = NSLocalizedString(@"donationAmount", nil);
    donationLab.textColor = [UIColor redColor];
    donationLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:donationLab];

    CGFloat btnY = donationY + donationH + 20;
    CGFloat btnH = 44;
    CGFloat btnW = self.view.frame.size.width * 0.6;
    CGFloat btnX = (self.view.frame.size.width - btnW) / 2;
    CGRect btnF = CGRectMake(btnX, btnY, btnW, btnH);
    UIButton *btn = [[UIButton alloc] initWithFrame:btnF];
    [btn setTitle:NSLocalizedString(@"donationButton", nil) forState:UIControlStateNormal];
//    [btn setTitle:@"捐款" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor orangeColor];
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    btn.layer.cornerRadius = btnH * 0.1;
    btn.layer.masksToBounds = YES;
    [self.view addSubview:btn];
}

- (void)clickBtn:(UIButton *)btn {
    UIViewController *vc = [UIViewController new];
    vc.view.backgroundColor = [UIColor systemBackgroundColor];
    vc.title = NSLocalizedString(@"donationSuccess", nil);
    [self.navigationController pushViewController:vc animated:YES];
}

@end
