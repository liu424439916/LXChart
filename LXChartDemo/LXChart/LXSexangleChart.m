//
//  LXSexangleChart.m
//  LXChart
//
//  Created by 鑫 李 on 16/3/22.
//  Copyright © 2016年 Lision. All rights reserved.
//

#import "LXSexangleChart.h"
#import "LXSexangleChartValueLayer.h"
#import "LXChartItem.h"
#import "LXColor.h"
#import "NSString+Lision.h"
#import "UIColor+Lision.h"

#define kLXFont [UIFont systemFontOfSize:12]

const CGFloat fontSize = 12;

@interface LXSexangleChart ()

@property (nonatomic, assign) NSInteger level;
@property (nonatomic, strong) UIColor *foreColor;
@property (nonatomic, strong) UIColor *backColor;

// 记录ValuePoint的数组
@property (nonatomic, strong) NSArray *valuePoints;

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
    sexangleChart.showLine = NO;
    
    return sexangleChart;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        self.lineWidth = 2;
        self.duration = 2;
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
    if (_showLine) {
        [[_backColor getTransparentColorWithAlpha:0.2] set];
    }else {
        [LXWhiteColor set];
    }
    
    // 设置线宽
    CGContextSetLineWidth(ctx, _lineWidth);
    
    // 获取六边形最大边长
    CGFloat x = MIN(rect.size.width * 0.5 - _lineWidth - fontSize, rect.size.height * 0.5 - _lineWidth - fontSize);
    
    // 坐标系转换－平移原点
    CGContextTranslateCTM(ctx, x + _lineWidth + fontSize, x + _lineWidth + fontSize);
    
    // 入栈
    CGContextSaveGState(ctx);
    
    // 坐标系转换－反转y轴
    CGContextScaleCTM(ctx, 1.0, -1.0);
    
    // 设置折线衔接处理
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    
    for (int i = 0; i < _level; ++i) {
        CGFloat scaleX = x * (_level - i) / _level;
        
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
        [[_backColor getTransparentColorWithAlpha:1.0 / _level] setFill];
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
        
        // 出栈
        CGContextRestoreGState(ctx);
        
        // 描边
        CGContextAddPath(ctx, path);
        CGContextStrokePath(ctx);
        
        // 释放路径
        CGPathRelease(path);
    }
    
    // 出栈
    CGContextRestoreGState(ctx);
    
    // 值域路径
    CGMutablePathRef path = CGPathCreateMutable();
    
    // 记录路径值
    NSMutableArray *mValuePoints = [NSMutableArray array];
    
    // 绘制 键－值
    for (int i = 0; i < [_items count]; ++i) {
        
        CGPoint keyPoint = CGPointZero;
        CGPoint valuePoint = CGPointZero;
        
        switch (i) {
            case 0:
                keyPoint = CGPointMake(0, -x);
                valuePoint = CGPointMake(0, -x * _items[i].value);
                CGPathMoveToPoint(path, NULL, valuePoint.x, valuePoint.y);
                break;
            case 1:
                keyPoint = CGPointMake(x * sqrt3 / 2, -x / 2);
                valuePoint = CGPointMake(x * _items[i].value * sqrt3 / 2, -x * _items[i].value / 2);
                CGPathAddLineToPoint(path, NULL, valuePoint.x, valuePoint.y);
                break;
            case 2:
                keyPoint = CGPointMake(x * sqrt3 / 2, x / 2);
                valuePoint = CGPointMake(x * _items[i].value * sqrt3 / 2, x * _items[i].value / 2);
                CGPathAddLineToPoint(path, NULL, valuePoint.x, valuePoint.y);
                break;
            case 3:
                keyPoint = CGPointMake(0, x);
                valuePoint = CGPointMake(0, x * _items[i].value);
                CGPathAddLineToPoint(path, NULL, valuePoint.x, valuePoint.y);
                break;
            case 4:
                keyPoint = CGPointMake(-x * sqrt3 / 2, x / 2);
                valuePoint = CGPointMake(-x * _items[i].value * sqrt3 / 2, x * _items[i].value / 2);
                CGPathAddLineToPoint(path, NULL, valuePoint.x, valuePoint.y);
                break;
            case 5:
                keyPoint = CGPointMake(-x * sqrt3 / 2, -x / 2);
                valuePoint = CGPointMake(-x * _items[i].value * sqrt3 / 2, -x * _items[i].value / 2);
                CGPathAddLineToPoint(path, NULL, valuePoint.x, valuePoint.y);
                CGPathCloseSubpath(path);
                break;
            default:
                break;
        }
        
        CGPoint calculateVPoint = CGPointApplyAffineTransform(valuePoint, CGAffineTransformMakeTranslation(x + _lineWidth + fontSize, x + _lineWidth + fontSize));
        [mValuePoints addObject:[NSValue valueWithCGPoint:calculateVPoint]];
        
        // 计算－文字坐标偏移-x
        keyPoint.x = keyPoint.x - [_items[i].key sizeWithFont:kLXFont maxSize:CGSizeMake(x, (double)fontSize)].width / 2;
        
        // 计算－文字坐标偏移-y
        if (i <= _items.count / 4 || i > _items.count * 3 / 4) {
            keyPoint.y = keyPoint.y - fontSize;
        }
        
        // 绘制文字
        [_items[i].key drawAtPoint:keyPoint withAttributes:@{NSForegroundColorAttributeName : _foreColor, NSFontAttributeName : kLXFont}];
        
//        // 描边值域
//        if (_showLine) {
//            CGContextAddPath(ctx, path);
//            CGContextStrokePath(ctx);
//        }
    }
    [mValuePoints addObject:[mValuePoints firstObject]];
    self.valuePoints = mValuePoints;
    
    // 填充-没有动画效果
//    [[_foreColor getTransparentColorWithAlpha:.5] setFill];
//    CGContextAddPath(ctx, path);
//    CGContextFillPath(ctx);
    
    // 释放路径
    CGPathRelease(path);
}

- (void)setItems:(NSArray<LXChartItem *> *)items
{
    _items = items;
    
    [self setNeedsDisplay];
}

- (void)setValuePoints:(NSArray *)valuePoints
{
    _valuePoints = valuePoints;
    
    [self updateAnimation];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(_duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self addValueLayer];
    });
}

- (void)updateAnimation
{
    CGFloat l = MIN(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
    
    NSMutableArray *mPointLayers = [NSMutableArray array];
    
    for (int index = 0; index < _valuePoints.count; ++index) {
        CGPoint p = [_valuePoints[index] CGPointValue];
        // 加入动画Layer
        CALayer *valuePointLayer = [[CALayer alloc] init];
        valuePointLayer = [[CALayer alloc] init];
        valuePointLayer.frame = CGRectMake(p.x - _lineWidth, p.y - _lineWidth, _lineWidth * 2, _lineWidth * 2);
        valuePointLayer.cornerRadius = _lineWidth;
        valuePointLayer.backgroundColor = [[_foreColor getTransparentColorWithAlpha:0.6] CGColor];
        [self.layer addSublayer:valuePointLayer];
        
        // 加入动画
        CABasicAnimation *moveAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
        moveAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(l, l)];
        moveAnimation.toValue = [NSValue valueWithCGPoint:p];
        moveAnimation.autoreverses = YES;
        moveAnimation.repeatCount = 0.5;
        moveAnimation.duration = _duration;
        
        // 闪烁动画
//        CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//        scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
//        scaleAnimation.toValue = [NSNumber numberWithFloat:1.5];
//        scaleAnimation.autoreverses = YES;
//        scaleAnimation.repeatCount = MAXFLOAT;
//        scaleAnimation.duration = 0.25;
//        
//        CAAnimationGroup *groupAnnimation = [CAAnimationGroup animation];
//        groupAnnimation.duration = _duration;
//        groupAnnimation.autoreverses = YES;
//        groupAnnimation.animations = @[moveAnimation, scaleAnimation];
//        groupAnnimation.repeatCount = 0.5;
        
        // 开始动画
        [valuePointLayer addAnimation:moveAnimation forKey:@"moveAnimation"];
        
        [mPointLayers addObject:valuePointLayer];
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(_duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        for (CALayer *layer in mPointLayers) {
            [layer removeFromSuperlayer];
        }
    });
}

- (void)addValueLayer
{
    // 获取颜色值－r g b a
    CGFloat r = 0;
    CGFloat g = 0;
    CGFloat b = 0;
    CGFloat a = 0;
    [_foreColor getRed:&r green:&g blue:&b alpha:&a];
    
    LXSexangleChartValueLayer *valueLayer = [[LXSexangleChartValueLayer alloc] init];
    // 设置颜色值
    valueLayer.r = r;
    valueLayer.g = g;
    valueLayer.b = b;
    valueLayer.a = a;
    // 设置关键点
    valueLayer.vp_0 = [_valuePoints[0] CGPointValue];
    valueLayer.vp_1 = [_valuePoints[1] CGPointValue];
    valueLayer.vp_2 = [_valuePoints[2] CGPointValue];
    valueLayer.vp_3 = [_valuePoints[3] CGPointValue];
    valueLayer.vp_4 = [_valuePoints[4] CGPointValue];
    valueLayer.vp_5 = [_valuePoints[5] CGPointValue];
    
    valueLayer.bounds = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    // 设置层的位置
    CGFloat l = MIN(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
    valueLayer.position = CGPointMake(l, l);
    // 开始绘制图层
    [valueLayer setNeedsDisplay];
    [self.layer addSublayer:valueLayer];
}

@end
