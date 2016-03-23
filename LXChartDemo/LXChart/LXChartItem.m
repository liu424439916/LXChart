//
//  LXItem.m
//  LXChart
//
//  Created by 鑫 李 on 16/3/23.
//  Copyright © 2016年 Lision. All rights reserved.
//

#import "LXChartItem.h"

@implementation LXChartItem

+ (instancetype)itemWithKey:(NSString *)key andValue:(double)value
{
    LXChartItem *item = [[LXChartItem alloc] initWithKey:key andValue:value];
    
    return item;
}

- (instancetype)initWithKey:(NSString *)key andValue:(double)value
{
    if (self = [super init]) {
        _key = key;
        _value = value;
    }
    
    return self;
}

@end
