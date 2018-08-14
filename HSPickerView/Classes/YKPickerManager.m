//
//  YKPickerManager.m
//  YKPickerView
//
//  Created by 何松 on 2018/8/13.
//  Copyright © 2018年 何松. All rights reserved.
//

#import "YKPickerManager.h"

@implementation YKPickerManager

+ (YKPickerManager *)shareManager {
    static YKPickerManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[YKPickerManager alloc] init];
    });
    return manager;
}

- (void)showAddressPickerView:(UIColor *)tintColor defaultAddress:(NSString *)address commitBlock:(void (^)(NSString *, NSString *))commitBlock cancelBlock:(YKVoidBlock)cancelBlock {
    [self.addressPickerView showAddressPickerView:tintColor defaultAddress:address commitBlock:^(NSString *address, NSString *zipcode) {
        commitBlock(address,zipcode);
    } cancelBlock:^{
        if (cancelBlock) {
            cancelBlock();
        }
    }];
}

- (void)showGeneralPickerView:(UIColor *)tintColor dataArray:(NSArray<NSString *> *)dataArray defaultString:(NSString *)defaultString commitBlock:(void (^)(NSString *selectedItem,NSInteger index))commitBlock cancelBlock:(YKVoidBlock)cancelBlock {
    [self.generalPickerView showGeneralPickerView:tintColor dataArray:dataArray defaultString:defaultString commitBlock:^(NSString *selectedItem,NSInteger index) {
        commitBlock(selectedItem,index);
    } cancelBlock:^{
        if (cancelBlock) {
            cancelBlock();
        }
    }];
}

- (void)showDatePickerView:(UIColor *)tintColor datePickerModel:(UIDatePickerMode)model minimumDate:(NSDate *)minimumDate maximumDate:(NSDate *)maximumDate defaultDate:(NSString *)dateString commitBlock:(void (^)(NSString *))commitBlock cancelBlock:(YKVoidBlock)cancelBlock {
    [self.datePickerView showDatePickerView:tintColor datePickerModel:model minimumDate:minimumDate maximumDate:maximumDate defaultDate:dateString commitBlock:^(NSString *date) {
        commitBlock(date);
    } cancelBlock:^{
        if (cancelBlock) {
            cancelBlock();
        }
    }];
}


#pragma mark - Getter and Setter

- (YKAddressPickerView *)addressPickerView
{
    if (!_addressPickerView) {
        _addressPickerView = [[YKAddressPickerView alloc] init];
    }
    return _addressPickerView;
}

- (YKCommonDatePickerView *)datePickerView
{
    if (!_datePickerView) {
        _datePickerView = [[YKCommonDatePickerView alloc] init];
    }
    return _datePickerView;
}

- (YKGeneralPickerView *)generalPickerView
{
    if (!_generalPickerView) {
        _generalPickerView = [[YKGeneralPickerView alloc] init];
    }
    return _generalPickerView;
}

@end
