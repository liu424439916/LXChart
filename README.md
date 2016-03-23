# LXChart
A simple and beautiful six mans star chart lib with animation for iOS

![Demo_LXChart_SexangleChart.gif](https://github.com/Lision/LXChart/blob/master/LXChartDemo/Demo_LXChart_SexangleChart.gif)

#Requirements

LXChart works on iOS 7.0+ and is compatible with ARC projects.
It depends on the following Apple frameworks, which should already be included with most Xcode templates:

- Foundation.framework
- UIKit.framework
- CoreGraphics.framework
- QuartzCore.framework

You will need LLVM 3.0 or later in order to build PNChart.

#Usage
Sry... At present, LXChart is not supported Cocoapods.

1. Download the LXChart.
2. Copy the LXChart folder to your project.
3. Include LXChart wherever you need it with #import "LXChart.h".

#Demonstration code
````
   #import "LXChart.h"

    // Init a LXSexangleChart
    LXSexangleChart *sexangleChart = [LXSexangleChart sexangleChartWithFrame:CGRectMake(10, 60, 300, 300) foregroundColor:LXRedColor backgroundColor:LXBlueColor andLevel:4];
    
    // Optional params
//    sexangleChart.duration = 1.5;
//    sexangleChart.lineWidth = 2.2;
//    sexangleChart.showLine = YES;
    
    // Set the data for LXSexangleChart
    sexangleChart.items = @[[LXChartItem itemWithKey:@"攻击" andValue:.9],
                            [LXChartItem itemWithKey:@"防御" andValue:.5],
                            [LXChartItem itemWithKey:@"击杀" andValue:.6],
                            [LXChartItem itemWithKey:@"助攻" andValue:.7],
                            [LXChartItem itemWithKey:@"拆塔" andValue:.6],
                            [LXChartItem itemWithKey:@"补刀" andValue:.7]];
    
    // Add the LXSexangleChart to your view
    [self.view addSubview:sexangleChart];
````
