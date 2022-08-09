//
//  MOPerson.h
//  ZJHUnitTestDemo
//
//  Created by ZJH on 2022/7/28.
//

#import <Foundation/Foundation.h>
#import "MOMen.h"
#import "MOAnimaiton.h"

@protocol MOTitleLineViewDelegate <NSObject>

@optional

- (void)updateData;

@end

@interface MOPerson : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSUInteger age;


@property (nonatomic, strong) NSMutableArray <MOPerson *>*childens;
// 非对象类型 set:nil 会触发 `setNilValueForKey:`
@property (nonatomic, assign) BOOL hidden;


@property (nonatomic, strong) MOMen *men;


-(void)talk:(NSString *)str;

@end

