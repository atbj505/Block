//
//  ThirdViewController.m
//  Block
//
//  Created by Robert on 15/7/10.
//  Copyright (c) 2015年 NationSky. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@property (nonatomic, strong) UITextField *textField;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"ViewControllerC";
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    self.textField.center = self.view.center;
    self.textField.backgroundColor = [UIColor blackColor];
    self.textField.textColor = [UIColor whiteColor];
    [self.view addSubview:self.textField];
}

- (void)returnString:(Callback)string {
    if (string) {
        self.thirdString = string;
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    self.thirdString(self.textField.text);
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
