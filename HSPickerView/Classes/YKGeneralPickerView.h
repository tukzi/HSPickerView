//
//  YKGeneralPickerView.h
//  YKPickerView
//
//  Created by 何松 on 2018/8/13.
//  Copyright © 2018年 何松. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YKToolbar.h"

@interface YKGeneralPickerView : UIPickerView

@property (nonatomic, strong) YKToolbar *toolbar;

@property (nonatomic, strong) NSArray<NSNumber *> *indexes;

/**
 显示选择框
 
 @param tintColor       主题颜色
 @param defaultString   默认选中
 @param commitBlock     确认回调
 @param cancelBlock     取消回调
 */

- (void)showGeneralPickerView:(UIColor *)tintColor dataArray:(NSArray<NSString *> *)dataArray defaultString:(NSString *)defaultString commitBlock:(void (^)(NSString *selectedItem,NSInteger index))commitBlock cancelBlock:(YKVoidBlock)cancelBlock;

@end
