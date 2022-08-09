//
//  MOMen.m
//  ZJHUnitTestDemo
//
//  Created by ZJH on 2022/7/28.
//

#import "MOMen.h"

@implementation MOMen

-(NSString *)logstr:(NSString *)str
{
    NSLog(@"***ZJH MOMen - logstr : %@",str);
    return str;
}

+(NSString *)logstr:(NSString *)str
{
    NSLog(@"***ZJH MOMen + logstr : %@",str);
    return str;
}

@end
