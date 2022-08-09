//
//  PhotosViewControllerSpec.m
//  ZJHUnitTestDemoTests
//
//  Created by ZJH on 2022/8/1.
//

#import <Kiwi/Kiwi.h>
#import "PhotosViewController.h"
#import "PhotoViewController.h"
#import "Photo.h"

SPEC_BEGIN(PhotosViewControllerSpec)

/* ViewController 一般被认为是最难测试甚至不可测试的部分。
   而通过 objc.io 的抽离方式可以使 MVC 更加清晰，也让 ViewController 的代码简洁不少。
   保持良好的 MVC 结构，尽可能精简 ViewController，对其的测试还是有可能及有意义的。
   在 PhotosViewControllerSpec 里做了对 ViewConroller 的一个简单测试。
   我们模拟了 tableView 中对一个 cell 的点击，然后检查 navigationController 的 push 操作是否确实被调用，
   以及被 push 的对象是否是我们想要的下一个 ViewController。

   要测试的是 PhotosViewController 的实例，因此我们生成一个。
   对于它的 UINavigationController，因为其没有在导航栈中，也这不是我们要测试的对象（保持测试的单一性），
   所以用一个 mock 对象来代替。然后为其设定 -pushViewController:animated: 需要被调用的期望。
   然后再用输入参数捕获将被 push 的对象抓出来，进行判断
 */
describe(@"PhotosViewController", ^{
    context(@"when click a cell in table view", ^{
        it(@"A PhotoViewController should be pushed", ^{
            // 新建PhotosViewController对象
            PhotosViewController *photosViewController = [[PhotosViewController alloc] init];
            // 判断view的创建
            UIView *view = photosViewController.view;
            [[view shouldNot] beNil];
            
            // mock一个导航条
            UINavigationController *mockNavController = [UINavigationController mock];
            // 设置photosViewController存根
            [photosViewController stub:@selector(navigationController) andReturn:mockNavController];
            // 设置mockNavController存根
            [[mockNavController should] receive:@selector(pushViewController:animated:)];
            // 添加参数捕捉
            KWCaptureSpy *spy = [mockNavController captureArgument:@selector(pushViewController:animated:)
                                                           atIndex:0];
            // 调用参数
            [photosViewController tableView:photosViewController.tableView
                    didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
            
            // 获取捕捉的参数
            id obj = spy.argument;
            PhotoViewController *vc = obj;
            // 校验参数是否正确
            [[vc should] beKindOfClass:[PhotoViewController class]];
            [[vc.photo shouldNot] beNil];
        });
    });
});

SPEC_END
