//
//  LJJBtn.m
//  move
//
//  Created by Jun on 13-12-16.
//  Copyright (c) 2013年 Jun. All rights reserved.
//

#import "LJJBtn.h"
#import "UIImage+Ljj.h"

@implementation LJJBtn

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (id)initWithIcon:(NSString *)icon highlightedIcon:(NSString *)highlightedIcon {
    if (self = [self initWithFrame:CGRectZero]){
        [self setImage:[UIImage resizingImageWithNamed:icon] forState:UIControlStateNormal];
        [self setImage:[UIImage resizingImageWithNamed:highlightedIcon] forState:UIControlStateHighlighted];
    }
    return self;
}

- (id)initWithTitle:(NSString *)title icon:(NSString *)icon highlightedIcon:(NSString *)highlightedIcon {
    if (self = [self initWithIcon:icon highlightedIcon:highlightedIcon]) {
        [self setTitle:title forState:UIControlStateNormal];
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    return contentRect;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    return contentRect;
}

@end
