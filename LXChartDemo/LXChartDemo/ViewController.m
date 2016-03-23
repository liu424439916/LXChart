//
//  ViewController.m
//  LXChartDemo
//
//  Created by 鑫 李 on 16/3/23.
//  Copyright © 2016年 Lision. All rights reserved.
//

#import "ViewController.h"
#import "LXChart.h"
#import "LXColor.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LXSexangleChart *sexangleChart = [LXSexangleChart sexangleChartWithFrame:CGRectMake(10, 60, 300, 300) foregroundColor:LXRedColor backgroundColor:LXBlueColor andLevel:4];
//    sexangleChart.duration = 1.5;
//    sexangleChart.lineWidth = 2.2;
//    sexangleChart.showLine = YES;
    
    sexangleChart.items = @[[LXChartItem itemWithKey:@"攻击" andValue:.9],
                            [LXChartItem itemWithKey:@"防御" andValue:.5],
                            [LXChartItem itemWithKey:@"击杀" andValue:.6],
                            [LXChartItem itemWithKey:@"助攻" andValue:.7],
                            [LXChartItem itemWithKey:@"拆塔" andValue:.6],
                            [LXChartItem itemWithKey:@"补刀" andValue:.7]];
    
    [self.view addSubview:sexangleChart];
}

@end
