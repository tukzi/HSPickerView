//
//  YKCommonDatePickerView.h
//  YKPickerView
//
//  Created by 何松 on 2018/8/13.
//  Copyright © 2018年 何松. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YKToolbar.h"

@interface YKCommonDatePickerView : UIDatePicker

@property (nonatomic, strong) YKToolbar *toolbar;

/**
 显示时间选择框
 
 @param tintColor    主题颜色
 @param model        NSDate类型
 @param minimumDate  最小时间
 @param maximumDate  最大时间
 @param dateString   默认时间字符串
 @param commitBlock  确认回调
 @param cancelBlock  取消回调
 */
- (void)showDatePickerView:(UIColor *)tintColor datePickerModel:(UIDatePickerMode)model minimumDate:(NSDate *)minimumDate maximumDate:(NSDate *)maximumDate defaultDate:(NSString *)dateString commitBlock:(void(^)(NSString *date))commitBlock cancelBlock:(YKVoidBlock)cancelBlock;

@end
