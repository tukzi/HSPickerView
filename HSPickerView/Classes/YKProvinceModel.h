//
//  YKProvinceModel.h
//  YKPickerView
//
//  Created by 何松 on 2018/8/13.
//  Copyright © 2018年 何松. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel/YYModel.h>

@interface YKProvinceModel : NSObject <YYModel>

@property (nonatomic, copy)   NSString *bankArea;
@property (nonatomic, copy)   NSString *bankAreaCode;
@property (nonatomic, strong) NSArray *cityList;

@end


@interface YKCityModel : NSObject

//银行地址信息
@property (nonatomic, copy) NSString *bankCity;
@property (nonatomic, copy) NSString *bankCityCode;

//城市信息
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *zipcode;
@property (nonatomic, strong) NSArray *child;

@end
