//
//  NSString+Lision.m
//  LXChart
//
//  Created by 鑫 李 on 16/3/23.
//  Copyright © 2016年 Lision. All rights reserved.
//

#import "NSString+Lision.h"

@implementation NSString (Lision)

- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

@end
