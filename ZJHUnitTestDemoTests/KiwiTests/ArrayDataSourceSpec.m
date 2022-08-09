//
//  ArrayDataSourceSpec.m
//  ZJHUnitTestDemoTests
//
//  Created by ZJH on 2022/8/1.
//

#import <Kiwi/Kiwi.h>
#import "ArrayDataSource.h"

SPEC_BEGIN(ArrayDataSourceSpec)

/* 得益于将 array 的 dataSource 进行抽象和封装，我们可以单独对其进行测试。
   基本思路是我们希望在为一个 tableView 设置好数据源后，tableView 可以正确地从数据源获取组织 UI 所需要的信息，
   基本上来说，也就是能够得到“有多少行”以及“每行的 cell 是什么”这两个问题的答案。
   到这里，有写过 iOS 的开发者应该都明白我们要测试的是什么了。
   没错，就是 -tableView:numberOfRowsInSection: 以及 -tableView:cellForRowAtIndexPath: 这两个接口的实现。
 */
describe(@"ArrayDataSource", ^{
    // init方法校验
    context(@"Initializing", ^{
        it(@"should not be allowed using init", ^{
            [[[[ArrayDataSource alloc] init] should] beNil];
        });
    });
    
    // 配置方法校验
    context(@"Configuration", ^{
        __block UITableViewCell *configuredCell = nil;
        __block id configuredObject = nil;
        
        TableViewCellConfigureBlock block = ^(UITableViewCell *a, id b){
            configuredCell = a;
            configuredObject = b;
            
            [[configuredObject should] equal:@"a"];

        };
        // 生成数据源
        ArrayDataSource *dataSource = [[ArrayDataSource alloc] initWithItems:@[@"a", @"b"]
                                                              cellIdentifier:@"foo"
                                                          configureCellBlock:block];
        // mock一个tableView
        id mockTableView = [UITableView mock];
        UITableViewCell *cell = [[UITableViewCell alloc] init];
        
        __block id result = nil;
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        
        it(@"should receive cell request", ^{
            // tableView设置存根
            [[mockTableView should] receive:@selector(dequeueReusableCellWithIdentifier:forIndexPath:)
                                  andReturn:cell
                              withArguments:@"foo",indexPath];
            // dataSource 调用代理方法
            result = [dataSource tableView:mockTableView cellForRowAtIndexPath:indexPath];
        });
        
        it(@"should return the dummy cell", ^{
            [[result should] equal:cell];
        });
        
        // 后调用了
//        it(@"should have benn passed to the block", ^{
//            [[configuredCell should] equal:cell];
//        });
//
//        it(@"should have the same configured object", ^{
//            [[configuredObject should] equal:@"a"];
//        });
    });
    
    // 获取数据方法校验
    context(@"number of rows", ^{
        id mockTableView = [UITableView mock];
        ArrayDataSource *dataSource = [[ArrayDataSource alloc] initWithItems:@[@"a", @"b"]
                                                              cellIdentifier:@"foo"
                                                          configureCellBlock:nil];
        it(@"should be 2 items", ^{
            NSInteger count = [dataSource tableView:mockTableView numberOfRowsInSection:0];
            [[theValue(count) should] equal:theValue(2)];
        });
    });
});

SPEC_END

