//
//  SecondViewController.h
//  Block
//
//  Created by Robert on 15/3/2.
//  Copyright (c) 2015年 NationSky. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^Callback)(NSString *secondString);

@interface SecondViewController : UIViewController

@property (nonatomic, copy)Callback secondString;

- (void)returnString:(Callback)string;

@end
