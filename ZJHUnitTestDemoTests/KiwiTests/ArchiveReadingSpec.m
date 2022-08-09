//
//  ArchiveReadingSpec.m
//  ZJHUnitTestDemoTests
//
//  Created by ZJH on 2022/8/1.
//

#import <Kiwi/Kiwi.h>
#import "Store.h"
#import "Photo.h"
#import "User.h"

SPEC_BEGIN(ArchiveReadingSpec)

// 数据的读取
describe(@"ArchiveReading", ^{
    // 创建store类
    context(@"when store creating", ^{
        Store *store = [Store sharedInstance];
        // 类不能为空
        it(@"should not be nill", ^{
            [[store shouldNot] beNil];
            [[store.photos shouldNot] beNil];
            [[store.users shouldNot] beNil];
        });
    });
    
    // 读取store中的photos数据
    context(@"the photos in store", ^{
        Store* store = [Store sharedInstance];
        // 遍历读取数组的每个值，且都不为空
        it(@"should have an id and user for each", ^{
            for (Photo *photo in store.photos) {
                [[theValue(photo.identifier) shouldNot] equal:theValue(0)];
                [[photo.user shouldNot] beNil];
            }
        });
        
        // 至少有一个名称
        it(@"should have at least one phone with name", ^{
            NSInteger count = [[store.photos filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(Photo *photo, NSDictionary *bindings) {
                return (0 < [photo.name length]);
            }]] count];
            [[theValue(count) should] beGreaterThan:theValue(0)];
        });
    });
    
    // 读取store中的users数据
    context(@"the users in store", ^{
        Store *store = [Store sharedInstance];
        // 遍历读取数组的每个值，且都不为空
        it(@"should have id, name and at least 1 photo for each", ^{
            for (User *user in store.users) {
                [[theValue(user.identifier) shouldNot] equal:theValue(0)];
                [[theValue([user.username length]) should] beGreaterThan:theValue(0)];
                [[theValue([user.photos count]) should] beGreaterThan:theValue(0)];
            }
        });
        
        it(@"should at least 1 having a first name", ^{
            NSInteger count = [[store.users filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(User *user, NSDictionary *bindings) {
                return (0 < [user.firstName length]);
            }]] count];
            [[theValue(count) should] beGreaterThan:theValue(0)];
        });
        
        it(@"should at least 1 having a last name", ^{
            NSInteger count = [[store.users filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(User *user, NSDictionary *bindings) {
                return (0 < [user.lastName length]);
            }]] count];
            [[theValue(count) should] beGreaterThan:theValue(0)];
        });
    });
});



SPEC_END
