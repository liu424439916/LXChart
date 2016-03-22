//
//  ViewController.m
//  LXChart
//
//  Created by 鑫 李 on 16/3/22.
//  Copyright © 2016年 Lision. All rights reserved.
//

#import "ViewController.h"
#import "LXSexangleChart.h"
#import "LXDefault.h"
#import "LXColor.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LXSexangleChart *sexangleChart = [[LXSexangleChart alloc] initWithFrame:CGRectMake(10, 60, 300, 300) foregroundColor:LXRedColor backgroundColor:LXRGBAColor(0.0, 0.0, 0.0, 1.0/4) andLevel:4];
    [self.view addSubview:sexangleChart];
}

@end
