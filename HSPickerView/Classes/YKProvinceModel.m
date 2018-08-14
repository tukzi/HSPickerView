//
//  YKProvinceModel.m
//  YKPickerView
//
//  Created by 何松 on 2018/8/13.
//  Copyright © 2018年 何松. All rights reserved.
//

#import "YKProvinceModel.h"

@implementation YKProvinceModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"cityList" : [YKCityModel class]};
}

@end

@implementation YKCityModel

@end
