//
//  SecondViewController.m
//  Block
//
//  Created by Robert on 15/3/2.
//  Copyright (c) 2015年 NationSky. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "UIColor+randomColor.h"

@interface SecondViewController ()
@property (nonatomic, strong)UIButton *btn;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"ViewControllerB";
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    ThirdViewController *third = [[ThirdViewController alloc] init];
    [third returnString:self.secondString];
    [self.navigationController pushViewController:third animated:YES];
}

- (void)returnString:(Callback)string{
    //将viewcontroller传进来的block传给本类的block属性
    //等待一个适当时机调用（button点击事件）
    self.secondString = string;
}
@end
