//
//  UIColor+Lision.m
//  LXChart
//
//  Created by 鑫 李 on 16/3/23.
//  Copyright © 2016年 Lision. All rights reserved.
//

#import "UIColor+Lision.h"

@implementation UIColor (Lision)

- (UIColor *)getTransparentColorWithAlpha:(double)alpha
{
    CGFloat r = 0;
    CGFloat g = 0;
    CGFloat b = 0;
    CGFloat a = 0;
    
    [self getRed:&r green:&g blue:&b alpha:&a];
    
    UIColor *transparentColor = [[UIColor alloc] initWithRed:r green:g blue:b alpha:alpha];
    
    return transparentColor;
}

@end
