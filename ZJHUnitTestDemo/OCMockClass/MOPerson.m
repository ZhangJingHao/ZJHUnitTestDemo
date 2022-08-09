//
//  MOPerson.m
//  ZJHUnitTestDemo
//
//  Created by ZJH on 2022/7/28.
//

#import "MOPerson.h"

@implementation MOPerson

-(void)talk:(NSString *)str
{
    NSLog(@"***ZJH 调用talk方法 ：%@", str);
    
    NSString *str2 = [self.men logstr:str];
    
    [MOAnimaiton logstr:str2];
}


@end
