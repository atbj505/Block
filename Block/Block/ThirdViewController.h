//
//  ThirdViewController.h
//  Block
//
//  Created by Robert on 15/7/10.
//  Copyright (c) 2015年 NationSky. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^Callback)(NSString *thirdString);

@interface ThirdViewController : UIViewController

@property (nonatomic, copy)Callback thirdString;

- (void)returnString:(Callback)string;

@end
