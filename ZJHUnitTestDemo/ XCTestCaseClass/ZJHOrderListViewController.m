//
//  ZJHOrderListViewController.m
//  ZJHUnitTestDemo
//
//  Created by ZJH on 2022/7/28.
//

#import "ZJHOrderListViewController.h"

@interface ZJHOrderListViewController ()

@property (nonatomic, strong) NSArray *dataArr;

@end

@implementation ZJHOrderListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)getListData {
    
    [ZJHNetworkTool requestUrl:@"url" param:@{} completion:^(NSDictionary * _Nonnull respondDic) {
        self.dataArr = respondDic[@"data"];
        [self refreshView];
    }];
    
}

- (void)refreshView {
    NSLog(@"***ZJH refreshView : %@", self.dataArr);
}

@end
