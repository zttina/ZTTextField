//
//  ZTViewController.m
//  ZTTextField
//
//  Created by zttina on 05/25/2019.
//  Copyright (c) 2019 zttina. All rights reserved.
//

#import "ZTViewController.h"
#import "ZTTextFieldsView.h"

@interface ZTViewController ()

@property (nonatomic, strong) ZTTextFieldsView *textFieldsView;
@end

@implementation ZTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //外部调用
    self.textFieldsView = [[ZTTextFieldsView alloc] initWithFrame:CGRectMake(50, 100, (self.view.frame.size.width - 50*2), 80)
                                                          textNum:5
                                                            space:6];
    [self.view addSubview:self.textFieldsView];
    //调起键盘
    [self.textFieldsView becomeFirstResponder];
    //设置小文本框圆角
    self.textFieldsView.cornerRadius = 10;
    //设置小文本框字体
    self.textFieldsView.font = [UIFont boldSystemFontOfSize:16];
    //设置小文本框的placeHolder。
    self.textFieldsView.placeHolder = @"这有五";
    //设置小文本框的borderColor
    self.textFieldsView.borderColor = [UIColor redColor];
    //设置小文本框的borderWidth
    self.textFieldsView.borderWidth = 0.5;
    //设置小文本框的textColor
    self.textFieldsView.textColor = [UIColor blueColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    //键盘消失
    [self.textFieldsView resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
