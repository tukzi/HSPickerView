//
//  YKCommonDatePickerView.m
//  YKPickerView
//
//  Created by 何松 on 2018/8/13.
//  Copyright © 2018年 何松. All rights reserved.
//

#import "YKCommonDatePickerView.h"

@interface YKCommonDatePickerView()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIView *containerView;

@end

@implementation YKCommonDatePickerView

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



- (void)showDatePickerView:(UIColor *)tintColor datePickerModel:(UIDatePickerMode)model minimumDate:(NSDate *)minimumDate maximumDate:(NSDate *)maximumDate defaultDate:(NSString *)dateString commitBlock:(void (^)(NSString *))commitBlock cancelBlock:(YKVoidBlock)cancelBlock
{
    if (dateString && dateString.length > 0) {
        self.date = [self returnDate:dateString];
    }else {
        self.date = [NSDate date];
    }
    self.datePickerMode = model;
    self.minimumDate = minimumDate;
    self.maximumDate = maximumDate;
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];//设置为中文
    self.locale = locale;
    self.toolbar.tintColor = tintColor;
    [self showWithAnimation];
    __weak typeof(self) weakSelf = self;
    self.toolbar.cancelBlock = ^ {
        if (cancelBlock) {
            [weakSelf hiddenWithAnimation];
            cancelBlock();
        }
    };
    self.toolbar.commitBlock = ^{
        if (commitBlock) {
            [weakSelf hiddenWithAnimation];
            commitBlock([weakSelf returnDateString:weakSelf.date]);
        }
    };
}




/**
 格式化NSDate
 
 @param date NSDate
 @return     时间字符串
 */
- (NSString *)returnDateString:(NSDate *)date
{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.dateFormat = @"yyyy-MM-dd";
    NSString *string = [format stringFromDate:date];
    return string;
}


/**
 格式化NSString
 
 @param dateString 时间字符串
 @return           NSDate
 */
- (NSDate *)returnDate:(NSString *)dateString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [dateFormatter dateFromString:dateString];
    return date;
}




@end
