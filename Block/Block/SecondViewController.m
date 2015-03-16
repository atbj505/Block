//
//  SecondViewController.m
//  Block
//
//  Created by Robert on 15/3/2.
//  Copyright (c) 2015年 NationSky. All rights reserved.
//

#import "SecondViewController.h"
#import "UIColor+randomColor.h"

@interface SecondViewController ()
@property (nonatomic, strong)UIButton *btn;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 150, 150)];
    self.btn.center = self.view.center;
    self.btn.backgroundColor = [UIColor randomColor];
    [self.btn addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn];
}
- (void)changeColor:(UIButton *)btn{
    self.changedColor(btn.backgroundColor);
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)returnColor:(CallbackColor)color{
    //将viewcontroller传进来的block传给本类的block属性
    //等待一个适当时机调用（button点击事件）
    self.changedColor = color;
}
@end
