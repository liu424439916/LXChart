//
//  LXSexangleChartValueLayer.m
//  LXChart
//
//  Created by 鑫 李 on 16/3/23.
//  Copyright © 2016年 Lision. All rights reserved.
//

#import "LXSexangleChartValueLayer.h"

@implementation LXSexangleChartValueLayer

- (void)drawInContext:(CGContextRef)ctx
{
    // 设置颜色-路径颜色
//    CGContextSetRGBStrokeColor(ctx, _r, _g, _b, _a * 0.6);
    // 设置颜色-填充颜色
    CGContextSetRGBFillColor(ctx, _r, _g, _b, _a * 0.4);
    
    // 绘制六芒星
    CGContextMoveToPoint(ctx, _vp_0.x, _vp_0.y);
    CGContextAddLineToPoint(ctx, _vp_1.x, _vp_1.y);
    CGContextAddLineToPoint(ctx, _vp_2.x, _vp_2.y);
    CGContextAddLineToPoint(ctx, _vp_3.x, _vp_3.y);
    CGContextAddLineToPoint(ctx, _vp_4.x, _vp_4.y);
    CGContextAddLineToPoint(ctx, _vp_5.x, _vp_5.y);
    CGContextClosePath(ctx);
    
    // 绘制路径
//    CGContextStrokePath(ctx);
    // 填充值域
    CGContextFillPath(ctx);
}

@end
