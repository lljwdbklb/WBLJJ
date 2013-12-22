//
//  UIButton+LJJ.h
//  WBLJJ
//
//  Created by Jun on 13-12-22.
//  Copyright (c) 2013年 Jun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (LJJ)
/**
 *  构造方法
 *
 *  @param icon            默认图片
 *  @param highlightedIcon 高亮图片
 *
 *  @return 返回对象
 */
- (id)initWithIcon:(NSString *)icon highlightedIcon:(NSString *)highlightedIcon;
+ (UIButton *)buttonWithIcon:(NSString *)icon highlightedIcon:(NSString *)highlightedIcon;

/**
 *  构造方法
 *
 *  @param icon         默认图片
 *  @param selectedIcon 选中图片
 *
 *  @return 返回对象
 */
- (id)initWithIcon:(NSString *)icon selectedIcon:(NSString *)selectedIcon;
+ (UIButton *)buttonWithIcon:(NSString *)icon selectedIcon:(NSString *)selectedIcon;
@end
