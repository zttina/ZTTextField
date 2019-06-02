//
//  ZTTextFieldsView.m
//  ZTTextField
//
//  Created by zttina on 2019/5/25.
//  Copyright © 2019 zttina. All rights reserved.
//

#import "ZTTextFieldsView.h"

#define ZTBaseTag 10000
@interface ZTTextFieldsView()

// 小textField之间的间隙
@property (nonatomic, assign) CGFloat space;
// 小textField的个数 (用textfield的目的是为了拓展光标功能)
@property (nonatomic, assign) NSInteger textNum;
// 隐藏的textField
@property (nonatomic, strong) UITextField *carNumTextField;

@end

@implementation ZTTextFieldsView

- (instancetype)initWithFrame:(CGRect)frame textNum:(NSInteger)num space:(CGFloat)space {
    
    if (self = [super initWithFrame:frame]) {
        self.space = space;
        self.textNum = num;
        _cornerRadius = 6;
        _font = [UIFont systemFontOfSize:15];
        _borderColor = [UIColor blackColor];
        _borderWidth = 1;
        _textColor = [UIColor blackColor];
        [self createUI];
        [self addMethod];
    }
    return self;
}

#pragma mark--创建UI
- (void)createUI {
    
    //创建隐藏的textField
    [self createCarNumTextField];
    //创建小的textField
    [self createTextFields];
}

- (void)createTextFields {
    
    CGFloat textW = (self.frame.size.width - self.space * (self.textNum - 1)) * 1.0 / self.textNum;
    textW = (textW < 0) ? 0 : textW;
    
    // 创建text field
    for (NSInteger i=0; i<self.textNum; i++) {
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(i * (textW + self.space), 0, textW, self.frame.size.height)];
        [self addSubview:textField];
        textField.textAlignment = NSTextAlignmentCenter;
        textField.tag = ZTBaseTag + i;
        textField.enabled = NO;
        textField.layer.cornerRadius = self.cornerRadius;
        textField.font = self.font;
        
        if (i < self.placeHolder.length) {
            textField.placeholder = [self.placeHolder substringWithRange:NSMakeRange(i, 1)];
        } else {
            textField.placeholder = @"0";
        }
        
        textField.layer.borderColor = self.borderColor.CGColor;
        textField.layer.borderWidth = self.borderWidth;
        textField.textColor = self.textColor;
    }
}

- (void)createCarNumTextField {
    self.carNumTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self addSubview:self.carNumTextField];
    self.carNumTextField.hidden = YES;
    self.carNumTextField.keyboardType = UIKeyboardTypeNumberPad;
}

#pragma mark--添加方法
-(void)addMethod{
    // 监听文本框变化
    [self.carNumTextField addTarget:self
                             action:@selector(carNumTextFieldChange:)
                   forControlEvents:UIControlEventEditingChanged];
    
    //添加tap手势，textFields
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(textFieldsBecomeFirstResponder)];
    [self addGestureRecognizer:tap];
}

#pragma mark--内部方法实现
- (void)textFieldsBecomeFirstResponder {
    [self.carNumTextField becomeFirstResponder];
}

-(void)carNumTextFieldChange:(UITextField *)textField{
    
    if (textField.text.length > self.textNum) {
        textField.text = [textField.text substringToIndex:self.textNum];
    }
    for (NSInteger i=0; i < self.textNum; i++) {
        
        UITextField *textField1 = (UITextField *)[self viewWithTag:ZTBaseTag + i];
        textField1.text = @"";
        if (i < textField.text.length) {
            textField1.text = [textField.text substringWithRange:NSMakeRange(i, 1)];
        }
    }
}
#pragma mark--外部方法的实现
- (void)becomeFirstResponder {
    [self textFieldsBecomeFirstResponder];
}

- (void)resignFirstResponder {
    [self.carNumTextField resignFirstResponder];
}

#pragma mark--属性赋值
- (void)setCornerRadius:(CGFloat)cornerRadius {
    for (NSInteger i=0; i < self.textNum; i++) {
        UITextField *textField = (UITextField *)[self viewWithTag:ZTBaseTag + i];
        textField.layer.cornerRadius = cornerRadius;
    }
}

- (void)setFont:(UIFont *)font {
    for (NSInteger i=0; i < self.textNum; i++) {
        UITextField *textField = (UITextField *)[self viewWithTag:ZTBaseTag + i];
        textField.font = font;
    }
}

- (void)setPlaceHolder:(NSString *)placeHolder {
    for (NSInteger i=0; i < self.textNum; i++) {
        UITextField *textField = (UITextField *)[self viewWithTag:ZTBaseTag + i];
        if (i < placeHolder.length) {
            textField.placeholder = [placeHolder substringWithRange:NSMakeRange(i, 1)];
        }else {
            textField.placeholder = @"0";
        }
    }
}

- (void)setBorderColor:(UIColor *)borderColor {
    for (NSInteger i=0; i < self.textNum; i++) {
        UITextField *textField = (UITextField *)[self viewWithTag:ZTBaseTag + i];
        textField.layer.borderColor = borderColor.CGColor;
    }
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    for (NSInteger i=0; i < self.textNum; i++) {
        UITextField *textField = (UITextField *)[self viewWithTag:ZTBaseTag + i];
        textField.layer.borderWidth = borderWidth;
    }
}

- (void)setTextColor:(UIColor *)textColor {
    for (NSInteger i=0; i < self.textNum; i++) {
        UITextField *textField = (UITextField *)[self viewWithTag:ZTBaseTag + i];
        textField.textColor = textColor;
    }
}

#pragma mark--重写touchesBegagn方法，防止和外部点击事件冲突
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {}

@end

