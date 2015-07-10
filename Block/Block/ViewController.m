//
//  ViewController.m
//  Block
//
//  Created by Robert on 15/3/2.
//  Copyright (c) 2015年 NationSky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *textLabel;

@end

@implementation ViewController


typedef NSString* (^IntToStringConverter)(NSUInteger paramInteger);


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"ViewControllerA";
    
    self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    self.textLabel.center = self.view.center;
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.textLabel];
    
    // 独立Block 使用方式
    // 1.定义Block并调用
    NSString *(^intToString)(NSUInteger) = ^(NSUInteger paramInteger) {
        NSString *result = [NSString stringWithFormat:@"%lu",(unsigned long)paramInteger];
        return result;
    };
    NSString *string = intToString(1);
    NSLog(@"%@",string);
    
    // 2.Block作为参数
    string = [self convertIntToString:2 usingBlockObject:intToString];
    NSLog(@"%@",string);
    
    //内联Block 使用方式
    string = [self convertIntToString:3 usingBlockObject:^NSString *(NSUInteger paramInteger) {
        NSString *result = [NSString stringWithFormat:@"%lu",(unsigned long)paramInteger];
        return result;
    }];
    NSLog(@"%@",string);
    
    //Block执行的代码，这是在编译的时候已经生成好的；
    //一个包含Block执行时需要的所有外部变量值的数据结构。 Block将使用到的、作用域附近到的变量的值建立一份快照拷贝到栈上。
    //被__block修饰的变量称作Block变量。 基本类型的Block变量等效于全局变量、或静态变量。
    
    //Block三种类型
    /*
     NSGlobalBlock：类似函数，位于text段；
     NSStackBlock：位于栈内存，函数返回后Block将无效；
     NSMallocBlock：位于堆内存。
     
     NSGlobalBlock，我们只要实现一个没有对周围变量没有引用的Block，就会显示为是它。而如果其中加入了对定义环境变量的
     引用，就是NSStackBlock。那么NSMallocBlock又是哪来的呢？malloc一词其实大家都熟悉，就是在堆上分配动态内存时。
     没错，如果你对一个NSStackBlock对象使用了Block_copy()或者发送了copy消息，就会得到NSMallocBlock。这一段中的
     几项结论可从代码实验得出。
     
     NSGlobalBlock:
     float (^sum)(float, float) = ^(float a, float b){
        return a + b;
     };
     
     NSStackBlock:
     NSArray *testArr = @[@"1", @"2"];
     void (^TestBlock)(void) = ^{
        NSLog(@"testArr :%@", testArr);
     };
     
     NSMallocBlock:
     NSStackBlock做copy操作
    */
    
    //循环引用问题
    //这种情况会造成循环引用
    /*
     self.myblock = ^{
        [self doSomething];
     };
     */
    //__weak typeof(self) weakSelf = self;
}

- (NSString *)convertIntToString:(NSUInteger)paramInteger usingBlockObject:(IntToStringConverter)paramBlockObject{
    
    return paramBlockObject(paramInteger);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    SecondViewController *secondVC = [[SecondViewController alloc]init];
    [secondVC returnString:^(NSString *secondString) {
        self.textLabel.text = secondString;
    }];
    [self.navigationController pushViewController:secondVC animated:YES];
}
@end
