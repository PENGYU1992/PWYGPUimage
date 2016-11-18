//
//  HXCSegmentedControl.h
//  QuBanApp
//
//  Created by huangxianchao on 16/7/5.
//  Copyright © 2016年 DJBeauty. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HXCSegmentedControl;
@protocol HXCSegmentedControlDelegate <NSObject>
@optional
//改变选中的分段标题触发
- (void)hxcSegmentedControl:(HXCSegmentedControl *)hxcSegmentedControl
                   index:(NSInteger) index;
@end

@interface HXCSegmentedControl : UIView

@property (nonatomic,weak) id<HXCSegmentedControlDelegate> delegate;

/**
 * @author huangxianchao, 16-07-05 11:07:24
 *
 * @param titleArray       字段标题数值
 * @param lineColor        底部滑动的线颜色
 * @param titleColor       标题颜色
 * @param titleSelectColor 选中的标题颜色
 * @param font             标题字体大小
 */
+ (instancetype)segmentedControlWithFrame:(CGRect)frame
                               TitleArray:(NSArray *)titleArray
                                lineColor:(UIColor *)lineColor
                               titleColor:(UIColor *)titleColor
                         titleSelectColor:(UIColor *)titleSelectColor
                                     font:(UIFont *)font
                                 delegate:(id<HXCSegmentedControlDelegate>)delegate
                          bottomLineColor:(UIColor *)bottomLineColor;


@end
