//
//  YKGeneralPickerView.m
//  YKPickerView
//
//  Created by 何松 on 2018/8/13.
//  Copyright © 2018年 何松. All rights reserved.
//

#import "YKGeneralPickerView.h"


@interface YKGeneralPickerView()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) NSArray *datasArray;

@property (nonatomic, assign) NSInteger selectedIndex;
@property (nonatomic, copy) YKVoidBlock block;

@end

@implementation YKGeneralPickerView

- (instancetype)initWithFrame:(CGRect)frame
{
    [self initToolBar];
    [self initContainerView];
    
    CGRect initialFrame;
    if (CGRectIsEmpty(frame)) {
        initialFrame = CGRectMake(0, self.toolbar.frame.size.height, WIDTH, 216);
    } else {
        initialFrame = frame;
    }
    self = [super initWithFrame:initialFrame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.delegate = self;
        self.dataSource = self;
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [self initBgView];
    }
    return self;
}

- (void)initBgView
{
    self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0, HEIGHT - self.frame.size.height - 44, WIDTH, self.frame.size.height + self.toolbar.frame.size.height)];
}

- (void)initToolBar
{
    self.toolbar = [[YKToolbar alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 50)];
    self.toolbar.translucent = NO;
}

- (void)initContainerView
{
    self.containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    self.containerView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    self.containerView.userInteractionEnabled = YES;
    [self.containerView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenWithAnimation)]];
}

- (void)showWithAnimation {
    [self addViews];
    self.containerView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    CGFloat height = self.bgView.frame.size.height;
    self.bgView.center = CGPointMake(WIDTH / 2, HEIGHT + height / 2);
    [UIView animateWithDuration:0.25 animations:^{
        self.bgView.center = CGPointMake(WIDTH / 2, HEIGHT - height / 2);
        self.containerView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    }];
    
}

- (void)hiddenWithAnimation {
    self.block();
    CGFloat height = self.bgView.frame.size.height;
    [UIView animateWithDuration:0.25 animations:^{
        self.bgView.center = CGPointMake(WIDTH / 2, HEIGHT + height / 2);
        self.containerView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    } completion:^(BOOL finished) {
        [self hiddenViews];
    }];
}

- (void)addViews {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self.containerView];
    [window addSubview:self.bgView];
    [self.bgView addSubview:self.toolbar];
    [self.bgView addSubview:self];
}

- (void)hiddenViews {
    [self removeFromSuperview];
    [self.toolbar removeFromSuperview];
    [self.bgView removeFromSuperview];
    [self.containerView removeFromSuperview];
}

- (void)showGeneralPickerView:(UIColor *)tintColor dataArray:(NSArray<NSString *> *)dataArray defaultString:(NSString *)defaultString commitBlock:(void (^)(NSString *selectedItem,NSInteger index))commitBlock cancelBlock:(YKVoidBlock)cancelBlock
{
    
    self.block = cancelBlock;
    self.datasArray = dataArray;
    [self showDefaultItem:defaultString];
    [self reloadAllComponents];
    self.toolbar.tintColor = tintColor;
    [self showWithAnimation];
    __weak typeof(self) weakSelf = self;
    self.toolbar.cancelBlock = ^ {
        if (cancelBlock) {
            [weakSelf hiddenWithAnimation];
        }
    };
    
    self.toolbar.commitBlock = ^{
        if (commitBlock) {
            [weakSelf hiddenWithAnimation];
            commitBlock(weakSelf.datasArray[weakSelf.selectedIndex],weakSelf.selectedIndex);
        }
    };
}

- (void)showDefaultItem:(NSString *)defaultString
{
    NSInteger index = [self.datasArray indexOfObject:defaultString];
    [self reloadComponent:0];
    if (defaultString && index < self.datasArray.count) {
        self.selectedIndex = index;
        [self selectRow:index inComponent:0 animated:NO];
    } else{
        self.selectedIndex = 0;
    }
}

#pragma mark -<UIPickerViewDelegate,UIPickerViewDataSource>
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.datasArray[row];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    return self.datasArray.count;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.selectedIndex = row;
}


@end
