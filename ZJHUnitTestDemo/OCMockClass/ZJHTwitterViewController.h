//
//  ZJHTwitterViewController.h
//  ZJHUnitTestDemo
//
//  Created by ZJH on 2022/7/27.
//

#import <UIKit/UIKit.h>
#import "ZJHTwitterConnection.h"
#import "ZJHTweetView.h"

@interface ZJHTwitterViewController : UIViewController

@property (nonatomic, strong) ZJHTwitterConnection *connection;

@property (nonatomic, strong) ZJHTweetView *tweetView;

- (void)updateTweetView;

@end

