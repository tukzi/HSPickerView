//
//  YKPickerManager.h
//  YKPickerView
//
//  Created by 何松 on 2018/8/13.
//  Copyright © 2018年 何松. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YKAddressPickerView.h"
#import "YKCommonDatePickerView.h"
#import "YKGeneralPickerView.h"
#import "YKToolbar.h"

@interface YKPickerManager : NSObject

+ (YKPickerManager *)shareManager;

@property (nonatomic, strong) YKAddressPickerView *addressPickerView;
@property (nonatomic, strong) YKCommonDatePickerView *datePickerView;
@property (nonatomic, strong) YKGeneralPickerView *generalPickerView;

/**
 显示省市区选择框
 
 @param tintColor    主题颜色
 @param address      默认地址
 @param commitBlock  确认回调
 @param cancelBlock  取消回调
 */
- (void)showAddressPickerView:(UIColor *)tintColor defaultAddress:(NSString *)address commitBlock:(void(^)(NSString *address,NSString *zipcode))commitBlock cancelBlock:(YKVoidBlock)cancelBlock;

/**
 显示选择框
 
 @param tintColor       主题颜色
 @param dataArray       默认选中
 @param defaultString   默认选中
 @param commitBlock     确认回调
 @param cancelBlock     取消回调
 */
- (void)showGeneralPickerView:(UIColor *)tintColor dataArray:(NSArray<NSString *> *)dataArray defaultString:(NSString *)defaultString commitBlock:(void (^)(NSString *selectedItem,NSInteger index))commitBlock cancelBlock:(YKVoidBlock)cancelBlock;

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
