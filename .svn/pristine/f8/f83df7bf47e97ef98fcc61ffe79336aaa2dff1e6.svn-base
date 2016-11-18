//
//  HXCSegmentedControl.m
//  QuBanApp
//
//  Created by huangxianchao on 16/7/5.
//  Copyright © 2016年 DJBeauty. All rights reserved.
//

#import "HXCSegmentedControl.h"

@interface HXCSegmentedControl ()

/// 底部滑动条
@property (nonatomic,weak) UIView *bottomLine;
/// 当前选中的btn
@property (nonatomic,weak) UIButton *selectedBtn;

/// 字段标题数组
@property (nonatomic,strong) NSArray *titleArray;
/// 底部滑动条的颜色
@property (nonatomic,strong) UIColor *lineColor;
/// 标题颜色
@property (nonatomic,strong) UIColor *titleColor;
/// 选中的标题颜色
@property (nonatomic,strong) UIColor *titleSelectColor;
/// 标题的字体大小
@property (nonatomic,strong) UIFont *font;

@end

@implementation HXCSegmentedControl

+ (instancetype)segmentedControlWithFrame:(CGRect)frame
                               TitleArray:(NSArray *)titleArray
                                lineColor:(UIColor *)lineColor
                               titleColor:(UIColor *)titleColor
                         titleSelectColor:(UIColor *)titleSelectColor
                                     font:(UIFont *)font
                                 delegate:(id<HXCSegmentedControlDelegate>)delegate
                          bottomLineColor:(UIColor *)bottomLineColor
{
    HXCSegmentedControl *control = [[HXCSegmentedControl alloc] initWithFrame:frame];
    control.delegate = delegate;
    control.titleArray = titleArray;
    control.titleColor = titleColor;
    control.lineColor = lineColor;
    control.titleSelectColor = titleSelectColor;
    control.font = font;
    control.backgroundColor = [UIColor whiteColor];
    
    // 按钮
    NSInteger count = titleArray.count;
    CGFloat btnW = frame.size.width / count;
    CGFloat btnH = control.frame.size.height;

    for (int i = 0; i < count; i++)
    {
        CGFloat btnX = i * btnW;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = i;
        if (btn.tag == 0){
            btn.selected = YES;
            control.selectedBtn = btn;
        }
        btn.frame = CGRectMake(btnX, 0, btnW, btnH);
        [btn setTitle:titleArray[i] forState:UIControlStateNormal];
        [btn setTitleColor:titleColor forState:UIControlStateNormal];
        [btn setTitleColor:titleSelectColor forState:UIControlStateSelected];
        btn.titleLabel.font = font;
        [btn addTarget:control action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [control addSubview:btn];
    }
    
    // 底部滑动线条
    UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, control.frame.size.height - 2, btnW, 2)];
    control.bottomLine = bottomLine;
    bottomLine.backgroundColor = control.lineColor;
    [control addSubview:bottomLine];
    
    // 底部分割线
    UIView *bottomGrayLine = [[UIView alloc] initWithFrame:CGRectMake(0, control.frame.size.height - 0.5, control.frame.size.width, 0.5)];
    bottomGrayLine.backgroundColor =  bottomLineColor;
    [control addSubview:bottomGrayLine];
    
    return control;
}

- (void)btnAction:(UIButton *)btn
{
    self.selectedBtn.selected = NO;
    btn.selected = YES;
    self.selectedBtn = btn;
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.25 animations:^{
        CGRect tempFrame = weakSelf.bottomLine.frame;
        tempFrame.origin.x = btn.frame.origin.x;
        weakSelf.bottomLine.frame = tempFrame;
    }];

    if ([self.delegate respondsToSelector:@selector(hxcSegmentedControl:index:)]) {
        [self.delegate hxcSegmentedControl:self index:btn.tag];
    }
    
}


@end
