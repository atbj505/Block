//
//  ViewController.m
//  Block
//
//  Created by Robert on 15/3/2.
//  Copyright (c) 2015年 NationSky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    SecondViewController *secondVC = [[SecondViewController alloc]init];
    [secondVC returnColor:^(UIColor *color) {
        self.view.backgroundColor = color;
    }];
    [self.navigationController pushViewController:secondVC animated:YES];
}
@end
