//
//  ZJHKiwiCar.h
//  ZJHUnitTestDemo
//
//  Created by ZJH on 2022/7/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



NS_ASSUME_NONNULL_BEGIN

@protocol ZJHKiwiFlyingMachine <NSObject>
- (float)dragCoefficient;

- (void)takeOff;
@end



@interface ZJHKiwiCar : NSObject

@property (nonatomic, copy) NSString *carName;

@property (strong ,nonatomic) NSArray * wheels; //!< 车轮.
@property (assign, nonatomic) CGFloat speed; //!< 速度.
@property (assign, nonatomic) NSInteger currentGear;

- (BOOL)changeToGear:(NSInteger) gear;

- (void)jumpToStarSystemWithIndex: (CGFloat) index;

- (void)applyBrakes;

- (void)speak: (NSString *) str;
- (void)speak:(NSString *)str afterDelay:(NSInteger) delay whenDone: (void (^)(void))block;

@end

NS_ASSUME_NONNULL_END
