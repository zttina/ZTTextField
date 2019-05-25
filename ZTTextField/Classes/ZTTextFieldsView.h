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


/**
设置背景颜色
 @param frame view的frame
 @param color view的背景颜色
 @return view
 */
- (instancetype)initWithFrame:(CGRect)frame withColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
