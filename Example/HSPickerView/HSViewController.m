//
//  HSViewController.m
//  HSPickerView
//
//  Created by hesong_ios@163.com on 08/14/2018.
//  Copyright (c) 2018 hesong_ios@163.com. All rights reserved.
//

#import "HSViewController.h"
#import "YKPickerManager.h"

@interface HSViewController ()

@property (nonatomic, weak) UIButton *btn,*btn1,*btn2;

@end

@implementation HSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 200, 50)];
    btn.layer.cornerRadius = 3;
    btn.layer.masksToBounds = YES;
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn setTitle:@"日期选择" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(showDate:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    self.btn = btn;
    
    UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(100, 170, 200, 50)];
    btn1.layer.cornerRadius = 3;
    btn1.layer.masksToBounds = YES;
    [btn1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    btn1.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn1 setTitle:@"地址选择" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(showAdderess:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    self.btn1 = btn1;
    
    UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(100, 240, 200, 50)];
    btn2.layer.cornerRadius = 3;
    btn2.layer.masksToBounds = YES;
    [btn2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    btn2.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn2 setTitle:@"单项选择" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(showSingle:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    self.btn2 = btn2;
}

#pragma mark - Private Method
- (void)showDate:(id)sender{
    [[YKPickerManager shareManager] showDatePickerView:[UIColor redColor] datePickerModel:UIDatePickerModeDate minimumDate:nil maximumDate:nil defaultDate:@"" commitBlock:^(NSString *date) {
        [self.btn setTitle:date forState:UIControlStateNormal];
    } cancelBlock:^{
        
    }];
}

- (void)showAdderess:(id)sender{
    [[YKPickerManager shareManager] showAddressPickerView:[UIColor redColor] defaultAddress:@"" commitBlock:^(NSString *address, NSString *zipcode) {
        [self.btn1 setTitle:address forState:UIControlStateNormal];
    } cancelBlock:^{
        
    }];
}

- (void)showSingle:(id)sender{
    [[YKPickerManager shareManager] showGeneralPickerView:[UIColor redColor] dataArray:@[@"shine",@"terence",@"char",@"lucien"] defaultString:@"char" commitBlock:^(NSString *selectedItem, NSInteger index) {
        [self.btn2 setTitle:selectedItem forState:UIControlStateNormal];
    } cancelBlock:^{
        
    }];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
