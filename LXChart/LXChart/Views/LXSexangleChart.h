//
//  LXSexangleChart.h
//  LXChart
//
//  Created by 鑫 李 on 16/3/22.
//  Copyright © 2016年 Lision. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXSexangleChart : UIView

+ (instancetype)sexangleChartWithFrame:(CGRect)frame foregroundColor:(UIColor *)foreColor backgroundColor:(UIColor *)backColor andLevel:(NSInteger)level;

- (instancetype)initWithFrame:(CGRect)frame foregroundColor:(UIColor *)foreColor backgroundColor:(UIColor *)backColor andLevel:(NSInteger)level;

@end
