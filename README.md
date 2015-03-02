# Block
block实验

__block传值方式实现__

```objc
//SecondViewController.h
typedef void (^ablock)(NSString *str);
```

```objc
//SecondViewController.h
@property (nonatomic, strong)ablock returnBlock;
```

```objc
//SecondViewController.h
- (void)blockMethod:(ablock)block;
```

```objc
//SecondViewController.m
self.returnBlock(想要传的变量)；
```

```objc
//SecondViewController.m
- (void)blockMethod:(ablock)block{
	self.returnBlock = block;
}
```

```objc
//FirstViewController.m
SecondViewController *secondVC = [[SecondViewController alloc]init];
[secondVC blockMethod:^(NSString *str) {
    self.textField.text = str;
}];
```
