//
//  ZJHKIFLoginViewController.m
//  ZJHUnitTestDemo
//
//  Created by ZJH on 2022/8/14.
//

#import "ZJHKIFLoginViewController.h"

@interface ZJHKIFLoginViewController ()

@property (nonatomic, weak) UITextField *phoneTextField;
@property (nonatomic, weak) UITextField *verifyCodeTextField;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UIButton *verifyBtn;
@property (nonatomic, assign) int timeCount;

@end

@implementation ZJHKIFLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"验证码登录";
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    [self setupUI];
    self.timeCount = 60;
}


- (void)setupUI {
    NSArray *nameArr = @[@"手机号：", @"验证码："];
    
    CGFloat labW = self.view.frame.size.width * 0.25;
    CGFloat labH = 40;
    CGFloat labY = 0;
    CGFloat statusH = [UIApplication sharedApplication].statusBarFrame.size.height;
    CGFloat navH = self.navigationController.navigationBar.frame.size.height;
    labY = statusH + navH;
    CGFloat textX = labW + 2;
    CGFloat textW = self.view.frame.size.width - textX - 30;
    for (int i = 0; i < nameArr.count; i++) {
        labY = labY + labH + 20;
        CGRect labF = CGRectMake(0, labY, labW, labH);
        UILabel *lab = [[UILabel alloc] initWithFrame:labF];
        lab.text = nameArr[i];
        lab.textAlignment = NSTextAlignmentRight;
        [self.view addSubview:lab];
        
        CGFloat temTextW = textW;
        if (i == 1) {
            temTextW = textW * 0.4;
        }
        CGRect textF = CGRectMake(textX, labY, temTextW, labH);
        UITextField *textField = [[UITextField alloc] initWithFrame:textF];
        textField.layer.borderColor = [[UIColor colorWithRed:215.0 / 255.0
                                                       green:215.0 / 255.0
                                                        blue:215.0 / 255.0 alpha:1] CGColor];
        textField.layer.borderWidth = 0.6f;
        textField.layer.cornerRadius = 6.0f;
        textField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
        textField.leftViewMode = UITextFieldViewModeAlways;
        [self.view addSubview:textField];
        
        if (i == 0) {
            textField.accessibilityLabel = @"phoneTextField";
            self.phoneTextField = textField;
        } else if(i == 1) {
            textField.accessibilityLabel = @"verifyCodeTextField";
            self.verifyCodeTextField = textField;
            
            CGFloat verifyX = textX + temTextW + 10;
            CGFloat verifYW = textW - temTextW - 10;
            CGRect verifyF = CGRectMake(verifyX, labY, verifYW, labH);
            UIButton *verifyBtn = [[UIButton alloc] initWithFrame:verifyF];
            verifyBtn.backgroundColor = [UIColor blueColor];
            [verifyBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
            verifyBtn.accessibilityLabel = @"verifyCodeBtn";
            [verifyBtn addTarget:self
                          action:@selector(clickVerifyBtn:)
                forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:verifyBtn];
            self.verifyBtn = verifyBtn;
        }
        
    }
    
    CGFloat btnW = self.view.frame.size.width * 0.8;
    CGFloat btnX = (self.view.frame.size.width - btnW) / 2;
    CGFloat btnH = 44;
    CGFloat btnY = labY + labH + 40;
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(btnX, btnY, btnW, btnH)];
    [btn setTitle:@"登录" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor orangeColor];
    btn.layer.cornerRadius = btnH / 2;
    btn.layer.masksToBounds = YES;
    [self.view addSubview:btn];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)clickBtn {
    if ([self.phoneTextField.text isEqualToString:@"10086"] &&
        [self.verifyCodeTextField.text isEqualToString:@"1234"]) {
        self.verifyCodeTextField.backgroundColor = [UIColor clearColor];

        UIViewController *vc = [UIViewController new];
        vc.view.backgroundColor = [UIColor systemBackgroundColor];
        vc.title = @"登录成功";
        [self.navigationController pushViewController:vc animated:YES];
    }
    else {
        self.verifyCodeTextField.backgroundColor = [UIColor redColor];

    }
}

- (void)clickVerifyBtn:(UIButton *)btn {
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                  target:self
                                                selector:@selector(timeMethod)
                                                userInfo:nil
                                                 repeats:YES];
    [self timeMethod];
}

- (void)timeMethod {
    self.timeCount--;
    if (self.timeCount < 0 ) {
        self.timeCount = 60;
        [self.timer invalidate];
        self.timer = nil;
    }
    
    [self.verifyBtn setTitle:[NSString stringWithFormat:@"%d", self.timeCount]
                    forState:UIControlStateNormal];
}

@end
