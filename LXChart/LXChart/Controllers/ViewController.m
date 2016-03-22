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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    LXSexangleChart *sexangleChart = [[LXSexangleChart alloc] initWithFrame:CGRectMake(10, 60, 300, 300)];
    [self.view addSubview:sexangleChart];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
