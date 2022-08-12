//
//  ZJHLoginViewController.m
//  ZJHUnitTestDemo
//
//  Created by ZJH on 2022/8/10.
//

#import "ZJHLoginViewController.h"
#import "TTRecordListViewController.h"

@interface ZJHLoginViewController ()

@property (nonatomic, weak) UITextField *accountTextField;
@property (nonatomic, weak) UITextField *passwordTextField;


@end

@implementation ZJHLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    [self setupUI];
}

- (void)setupUI {
    NSArray *nameArr = @[@"账号：", @"密码："];
    
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
        
        CGRect textF = CGRectMake(textX, labY, textW, labH);
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
            self.accountTextField = textField;
        } else if(i == 1) {
            self.passwordTextField = textField;
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

- (void)clickBtn {
    if ([self.accountTextField.text isEqualToString:@"a"] &&
        [self.passwordTextField.text isEqualToString:@"123"]) {
        self.passwordTextField.backgroundColor = [UIColor clearColor];

        TTRecordListViewController *vc = [TTRecordListViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else {
        self.passwordTextField.backgroundColor = [UIColor redColor];

    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


@end
