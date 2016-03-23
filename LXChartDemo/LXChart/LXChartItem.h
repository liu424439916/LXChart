//
//  LXItem.h
//  LXChart
//
//  Created by 鑫 李 on 16/3/23.
//  Copyright © 2016年 Lision. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXChartItem : NSObject

@property (nonatomic, copy) NSString *key;
@property (nonatomic, assign) double value;

+ (instancetype)itemWithKey:(NSString *)key andValue:(double)value;
- (instancetype)initWithKey:(NSString *)key andValue:(double)value;

@end
