//
//  NSString+Lision.h
//  LXChart
//
//  Created by 鑫 李 on 16/3/23.
//  Copyright © 2016年 Lision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Lision)

/**
 *  根据参数计算当前string的size
 *
 *  @param font    字体
 *  @param maxSize 最大边界
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

@end
