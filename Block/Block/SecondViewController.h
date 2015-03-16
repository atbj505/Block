//
//  SecondViewController.h
//  Block
//
//  Created by Robert on 15/3/2.
//  Copyright (c) 2015年 NationSky. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^CallbackColor)(UIColor *color);

@interface SecondViewController : UIViewController
@property (nonatomic, copy)CallbackColor changedColor;
- (void)returnColor:(CallbackColor)color;
@end
