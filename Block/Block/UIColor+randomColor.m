//
//  UIColor+randomColor.m
//  Block
//
//  Created by Robert on 15/3/2.
//  Copyright (c) 2015年 NationSky. All rights reserved.
//

#import "UIColor+randomColor.h"

@implementation UIColor (randomColor)
+(UIColor*)randomColor{
    CGFloat red = (CGFloat)arc4random() / RAND_MAX;
    CGFloat green = (CGFloat)arc4random() / RAND_MAX;
    CGFloat blue = (CGFloat)arc4random() / RAND_MAX;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1]; }
@end
