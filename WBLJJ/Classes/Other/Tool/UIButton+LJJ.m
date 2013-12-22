//
//  UIButton+LJJ.m
//  WBLJJ
//
//  Created by Jun on 13-12-22.
//  Copyright (c) 2013年 Jun. All rights reserved.
//

#import "UIButton+LJJ.h"

@implementation UIButton (LJJ)
- (id)initWithIcon:(NSString *)icon highlightedIcon:(NSString *)highlightedIcon {
    if (self = [super init]) {
        UIImage * commitImage = [UIImage imageNamed:icon];
        //设置图片
        [self setImage:commitImage forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:highlightedIcon]
                forState:UIControlStateHighlighted];
        //设置位置
        [self setBounds:(CGRect){CGPointZero,commitImage.size}];
    }
    return self;
}
+ (UIButton *)buttonWithIcon:(NSString *)icon highlightedIcon:(NSString *)highlightedIcon {
    return [[UIButton alloc]initWithIcon:icon highlightedIcon:highlightedIcon];
}

- (id)initWithIcon:(NSString *)icon selectedIcon:(NSString *)selectedIcon {
    if (self = [super init]) {
        UIImage * commitImage = [UIImage imageNamed:icon];
        //设置图片
        [self setImage:commitImage forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:selectedIcon]
              forState:UIControlStateSelected];
        //设置位置
        [self setBounds:(CGRect){CGPointZero,commitImage.size}];
    }
    return self;
}
+ (UIButton *)buttonWithIcon:(NSString *)icon selectedIcon:(NSString *)selectedIcon {
    return [[UIButton alloc]initWithIcon:icon selectedIcon:selectedIcon];
}

@end
