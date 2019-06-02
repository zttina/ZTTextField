//
//  ZTTextFieldsView.h
//  ZTTextField
//
//  Created by zttina on 2019/5/25.
//  Copyright © 2019 zttina. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZTTextFieldsView : UIView

#pragma mark--属性
/**
 小文本框的圆角。默认是6
 */
@property (nonatomic, assign) CGFloat cornerRadius;

/**
 小文本框里面的文字。默认是[UIFont systemFontOfSize:15]
 */
@property (nonatomic, strong) UIFont *font;

/**
 小文本框里面的placeHolder。默认是0（几个框有几个0）。
 */
@property (nonatomic, copy) NSString *placeHolder;

/**
 小文本框的border颜色。默认是[UIColor blackColor]
 */
@property (nonatomic, strong) UIColor *borderColor;

/**
 小文本框的border的宽。默认是1
 */
@property (nonatomic, assign) CGFloat borderWidth;

/**
 小文本框的textColor。默认是[UIColor blackColor]
 */
@property (nonatomic, strong) UIColor *textColor;

#pragma mark--初始化方法
/**
设置背景颜色
 @param frame view的frame
 @param num 小textField的个数
 @param space 小textField之间的间隙
 @return view
 */
- (instancetype)initWithFrame:(CGRect)frame textNum:(NSInteger)num space:(CGFloat)space;

#pragma mark--外部调用方法

/**
 调起键盘，成为第一响应者
 */
- (void)becomeFirstResponder;

/**
 键盘消失。
 */
- (void)resignFirstResponder;

@end

NS_ASSUME_NONNULL_END
