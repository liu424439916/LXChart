//
//  LXSexangleChart.h
//  LXChart
//
//  Created by 鑫 李 on 16/3/22.
//  Copyright © 2016年 Lision. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LXChartItem;

@interface LXSexangleChart : UIView

@property (nonatomic, assign, getter=isShowLine) BOOL showLine;

@property (nonatomic, assign) CGFloat duration;
@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, strong) NSArray<LXChartItem *> *items;

+ (instancetype)sexangleChartWithFrame:(CGRect)frame foregroundColor:(UIColor *)foreColor backgroundColor:(UIColor *)backColor andLevel:(NSInteger)level;
- (instancetype)initWithFrame:(CGRect)frame foregroundColor:(UIColor *)foreColor backgroundColor:(UIColor *)backColor andLevel:(NSInteger)level;

@end
