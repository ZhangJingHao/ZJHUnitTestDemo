//
//  TTRecordViewController.m
//  TestingTutorial
//
//  Created by xietao on 2018/12/11.
//  Copyright © 2018 com.fruitday. All rights reserved.
//

#import "TTRecordViewController.h"
#import "TTFakeNetworking.h"
#import "TTConstant.h"

@interface TTRecordViewController ()

@property (nonatomic, strong) UITextView *mTextView;

@property (nonatomic, strong) NSString *tempRecordString;

@end

@implementation TTRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Write Anything"];
    self.view.backgroundColor = [UIColor systemBackgroundColor];

    CGFloat statusH = [UIApplication sharedApplication].statusBarFrame.size.height;
    CGFloat navH = self.navigationController.navigationBar.frame.size.height;
    CGFloat textY = statusH + navH;
    CGFloat textH = self.view.frame.size.height * 0.4;
    CGRect textF = CGRectMake(0, textY, self.view.frame.size.width, textH);
    UITextView *mTextView = [[UITextView alloc] initWithFrame:textF];
    [self.view addSubview:mTextView];
    self.mTextView = mTextView;
    
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave
                                                  target:self
                                                  action:@selector(recordDoneAction:)];
}

- (void)saveRecordWithMsg:(NSString *)msg {
    NSNumber *timeStamp = [NSNumber numberWithDouble:[NSDate date].timeIntervalSince1970];
    NSLog(@"--%@",timeStamp);
    [TTFakeNetworkingInstance requestWithService:apiRecordSave parameter:@{@"msg":msg,@"timeStamp":timeStamp} completionHandler:^(NSDictionary *response) {
        [kNotificationCenter postNotificationName:kRecordDoneNotificationKey object:nil];
        [self.navigationController popViewControllerAnimated:YES];
    }];

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.mTextView becomeFirstResponder];
}


- (void)recordDoneAction:(id)sender {
    self.tempRecordString = self.mTextView.text;
    
    if (self.tempRecordString) {
        [self saveRecordWithMsg:self.tempRecordString];
    }else{
        NSLog(@"您还没有输入任何内容！");
    }
}

#pragma mark - UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView {
    self.tempRecordString = textView.text;
}

@end
