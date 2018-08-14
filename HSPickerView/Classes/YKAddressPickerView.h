//
//  YKAddressPickerView.h
//  YKPickerView
//
//  Created by 何松 on 2018/8/13.
//  Copyright © 2018年 何松. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YKToolbar.h"

@interface YKAddressPickerView : UIPickerView

@property (nonatomic, strong) YKToolbar *toolbar;

/**
 显示省市区选择框

 @param tintColor    主题颜色
 @param address      默认地址
 @param commitBlock  确认回调
 @param cancelBlock  取消回调
 */
- (void)showAddressPickerView:(UIColor *)tintColor defaultAddress:(NSString *)address commitBlock:(void(^)(NSString *address,NSString *zipcode))commitBlock cancelBlock:(YKVoidBlock)cancelBlock;

@end
