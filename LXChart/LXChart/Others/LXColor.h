//
//  LXColor.h
//  LXChart
//
//  Created by 鑫 李 on 16/3/22.
//  Copyright © 2016年 Lision. All rights reserved.
//

#ifndef LXColor_h
#define LXColor_h

// 获得RGB颜色
#define LXRGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
// 获得RGBA颜色
#define LXRGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

// 红色
#define LXRedColor LXRGBColor(245.0, 94.0, 78.0)

// 黄色
#define LXYellowColor LXRGBColor(242.0, 197.0, 117.0)

// 白色
#define LXWhiteColor LXRGBColor(255.0, 255.0, 255.0)

// 灰色
#define LXLightGrayColor LXRGBColor(246.0, 246.0, 246.0)
#define LXGrayColor LXRGBColor(179, 179.0, 179.0)
#define LXDarkGrayColor LXRGBColor(128.0, 128.0, 128.0)

// 黑色
#define LXBlackColor LXRGBColor(0.0, 0.0, 0.0)


#endif /* LXColor_h */
