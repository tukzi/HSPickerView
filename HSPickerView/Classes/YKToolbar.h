//
//  YKToolbar.h
//  YKPickerView
//
//  Created by 何松 on 2018/8/13.
//  Copyright © 2018年 何松. All rights reserved.
//

#import <UIKit/UIKit.h>

#define WIDTH [[UIScreen mainScreen] bounds].size.width
#define HEIGHT [[UIScreen mainScreen] bounds].size.height
#define COLOR [UIColor colorWithRed:0.804  green:0.804  blue:0.804 alpha:1]
typedef void(^YKVoidBlock)(void);

@interface YKToolbar : UIToolbar

@property (nonatomic, strong) UIBarButtonItem *cancelButtonItem;
@property (nonatomic, strong) UIBarButtonItem *commitButtonItem;
@property (nonatomic, strong) UIBarButtonItem *titleButtonItem;

/**
 toolBar主题色
 */
@property (nonatomic, strong) UIColor *toolBarTintColor;

/**
 标题
 */
@property (nonatomic, copy) NSString *title;

/**
 标题字体颜色
 */
@property (nonatomic, strong) UIColor *titleColor;

/**
 取消
 */
@property (nonatomic, copy) NSString *cancelTitle;

/**
 取消字体颜色
 */
@property (nonatomic, strong) UIColor *cancelTitleColor;

/**
 提交
 */
@property (nonatomic, copy) NSString *commitTitle;

/**
 提交字体颜色
 */
@property (nonatomic, strong) UIColor *commitTitleColor;

/**
 取消回调
 */
@property (nonatomic,copy) void(^cancelBlock)();

/**
 提交回调
 */
@property (nonatomic,copy) void(^commitBlock)();


// 中间标题
@property (nonatomic, strong) UILabel *titleLabel;
// 分割线视图
@property (nonatomic, strong) UIView *lineView;

@end
