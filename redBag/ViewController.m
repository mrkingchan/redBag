//
//  ViewController.m
//  redBag
//
//  Created by Chan on 2017/4/13.
//  Copyright © 2017年 Chan. All rights reserved.
//

#import "ViewController.h"
#import "RedBagView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [RedBagView redBagViwWithDataSource:@[@"1",@"2",@"3",@"4",@"5",@"rere",@"rtytys",@"tsyshshs",@"rwtwyw",@"rywyw",@"tsshshs",@"tssyyshs",@"ysshsjsjs"]
                           withcomplete:^(NSInteger index) {
                               
                           }];
    
}

@end
