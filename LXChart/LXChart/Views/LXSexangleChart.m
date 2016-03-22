//
//  LXSexangleChart.m
//  LXChart
//
//  Created by 鑫 李 on 16/3/22.
//  Copyright © 2016年 Lision. All rights reserved.
//

#import "LXSexangleChart.h"
#import "LXColor.h"

@interface LXSexangleChart ()

@property (nonatomic, assign) NSInteger level;
@property (nonatomic, strong) UIColor *color;

@end

@implementation LXSexangleChart

+ (instancetype)sexangleChartWithFrame:(CGRect)frame foregroundColor:(UIColor *)color andLevel:(NSInteger)level
{
    LXSexangleChart *sexangleChart = [[LXSexangleChart alloc] initWithFrame:frame foregroundColor:color andLevel:level];
    
    return sexangleChart;
}

- (instancetype)initWithFrame:(CGRect)frame foregroundColor:(UIColor *)color andLevel:(NSInteger)level
{
    LXSexangleChart *sexangleChart = [[LXSexangleChart alloc] initWithFrame:frame];
    sexangleChart.color = color;
    sexangleChart.level = level;
    
    return sexangleChart;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGFloat sqrt3 = sqrtf(3);
    
    // 获取图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 设置线宽
    CGContextSetLineWidth(ctx, 5);
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    // 获取六边形最大边长
    CGFloat x = MIN(rect.size.width * 0.5 - 5, rect.size.height * 0.5 - 5);
    
    // 坐标系转换
    CGContextTranslateCTM(ctx, x + 5, x + 5);
    CGContextScaleCTM(ctx, 1.0, -1.0);
    
    for (int i = 1; i <= 2 ; ++i) {
        // 入栈
        CGContextSaveGState(ctx);
        
        // 画6边型
        CGPathMoveToPoint(path, NULL, 0, x);
        CGPathAddLineToPoint(path, NULL, x * sqrt3/2, x / 2);
        CGPathAddLineToPoint(path, NULL, x * sqrt3/2, -x / 2);
        CGPathAddLineToPoint(path, NULL, 0, -x);
        CGPathAddLineToPoint(path, NULL, -x * sqrt3/2, -x / 2);
        CGPathAddLineToPoint(path, NULL, -x * sqrt3/2, x / 2);
        CGPathCloseSubpath(path);
        
        // 描边
        CGContextSetStrokeColorWithColor(ctx, LXGrayColor.CGColor);
        CGContextStrokePath(ctx);
        
        // 填充
        [LXLightGrayColor setFill];
        CGContextAddPath(ctx, path);
        CGContextFillPath(ctx);
        
        // 出栈
        CGContextRestoreGState(ctx);
        
//        x = x * 0.5;
    }
    
    CGContextAddPath(ctx, path);
    
    CGContextStrokePath(ctx);
    
    CGPathRelease(path);
}

@end
