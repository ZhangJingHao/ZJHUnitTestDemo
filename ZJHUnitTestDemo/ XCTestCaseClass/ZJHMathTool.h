//
//  ZJHMathTool.h
//  ZJHUnitTestDemo
//
//  Created by ZJH on 2022/7/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZJHMathTool : NSObject

// a+b
- (int)sumA:(int)a andB:(int)b;

// a-b
- (int)subA:(int)a andB:(int)b;

// axb
- (int)multiplyA:(int)a andB:(int)b;

// a÷b
- (int)divideA:(int)a andB:(int)b;

@end

NS_ASSUME_NONNULL_END
