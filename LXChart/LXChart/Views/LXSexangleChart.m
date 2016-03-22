//
//  LXSexangleChart.m
//  LXChart
//
//  Created by 鑫 李 on 16/3/22.
//  Copyright © 2016年 Lision. All rights reserved.
//

#import "LXSexangleChart.h"
#import "LXColor.h"

#define kLXFont [UIFont systemFontOfSize:12]

const CGFloat fontSize = 12;

@interface LXSexangleChart ()

@property (nonatomic, assign) NSInteger level;
@property (nonatomic, assign) NSInteger lineWidth;
@property (nonatomic, strong) UIColor *foreColor;
@property (nonatomic, strong) UIColor *backColor;

@end

@implementation LXSexangleChart

+ (instancetype)sexangleChartWithFrame:(CGRect)frame foregroundColor:(UIColor *)foreColor backgroundColor:(UIColor *)backColor andLevel:(NSInteger)level
{
    LXSexangleChart *sexangleChart = [[LXSexangleChart alloc] initWithFrame:frame foregroundColor:foreColor backgroundColor:backColor andLevel:level];
    
    return sexangleChart;
}

- (instancetype)initWithFrame:(CGRect)frame foregroundColor:(UIColor *)foreColor backgroundColor:(UIColor *)backColor andLevel:(NSInteger)level
{
    LXSexangleChart *sexangleChart = [[LXSexangleChart alloc] initWithFrame:frame];
    sexangleChart.foreColor = foreColor;
    sexangleChart.backColor = backColor;
    sexangleChart.level = level;
    
    return sexangleChart;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        self.lineWidth = 1;
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGFloat sqrt3 = sqrtf(3);
    
    // 获取图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 设置默认颜色
    [LXGrayColor set];
    
    // 设置线宽
    CGContextSetLineWidth(ctx, self.lineWidth);
    
    // 获取六边形最大边长
    CGFloat x = MIN(rect.size.width * 0.5 - self.lineWidth - fontSize, rect.size.height * 0.5 - self.lineWidth - fontSize);
    
    // 坐标系转换
    CGContextTranslateCTM(ctx, x + self.lineWidth + fontSize, x + self.lineWidth + fontSize);
    CGContextScaleCTM(ctx, 1.0, -1.0);
    
    // 设置折线衔接处理
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    
    for (int i = 0; i < self.level; ++i) {
        CGFloat scaleX = x * (self.level - i) / self.level;
        
        // 入栈
        CGContextSaveGState(ctx);
        
        // 边线
        CGMutablePathRef path = CGPathCreateMutable();
        
        // 画6边型
        CGPathMoveToPoint(path, NULL, 0, scaleX);
        CGPathAddLineToPoint(path, NULL, scaleX * sqrt3 / 2, scaleX / 2);
        CGPathAddLineToPoint(path, NULL, scaleX * sqrt3 / 2, -scaleX / 2);
        CGPathAddLineToPoint(path, NULL, 0, -scaleX);
        CGPathAddLineToPoint(path, NULL, -scaleX * sqrt3 / 2, -scaleX / 2);
        CGPathAddLineToPoint(path, NULL, -scaleX * sqrt3 / 2, scaleX / 2);
        CGPathCloseSubpath(path);
        
        // 填充
        [LXRGBAColor(0.0, 0.0, 0.0, 1.0/self.level) setFill];
        
        CGContextAddPath(ctx, path);
        CGContextFillPath(ctx);
        
        // 对角线
        CGMutablePathRef diagonalPath = CGPathCreateMutable();
        
        // 连接对角线
        CGPathMoveToPoint(diagonalPath, NULL, 0, scaleX);
        CGPathAddLineToPoint(path, NULL, 0, -scaleX);
        CGPathMoveToPoint(path, NULL, scaleX * sqrt3 / 2, scaleX / 2);
        CGPathAddLineToPoint(path, NULL, -scaleX * sqrt3 / 2, -scaleX / 2);
        CGPathMoveToPoint(path, NULL, scaleX * sqrt3 / 2, -scaleX / 2);
        CGPathAddLineToPoint(path, NULL, -scaleX * sqrt3 / 2, scaleX / 2);
        
        if (i == 0) {
            
        }
        
        // 出栈
        CGContextRestoreGState(ctx);
        
        // 描边
        CGContextAddPath(ctx, path);
        CGContextStrokePath(ctx);
        
        // 释放路径
        CGPathRelease(path);
    }
    
    // y轴倒置 其实在之前y轴第一次倒置时入栈这时出栈即可
    CGContextScaleCTM(ctx, 1.0, -1.0);
    
    // 绘制文字
    NSArray *strs = @[@"攻击", @"防御", @"带线", @"推塔", @"补兵", @"经济"];
    for (int i = 0; i < strs.count; ++i) {
        
        CGPoint point = CGPointMake(0, 0);
        switch (i) {
            case 0:
                point = CGPointMake(0, -x - fontSize);
                break;
            case 1:
                point = CGPointMake(x * sqrt3 / 2, -x / 2 - fontSize);
                break;
            case 2:
                point = CGPointMake(x * sqrt3 / 2, x / 2);
                break;
            case 3:
                point = CGPointMake(0, x);
                break;
            case 4:
                point = CGPointMake(-x * sqrt3 / 2, x / 2);
                break;
            case 5:
                point = CGPointMake(-x * sqrt3 / 2, -x / 2 - fontSize);
                break;
            default:
                break;
        }
        point.x = point.x - fontSize * [strs[i] length] / 2;
        
        [strs[i] drawAtPoint:point withAttributes:@{NSForegroundColorAttributeName : LXRedColor, NSFontAttributeName : kLXFont}];
    }
    
}

@end
