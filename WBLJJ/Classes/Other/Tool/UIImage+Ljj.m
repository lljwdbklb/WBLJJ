//
//  UIImage+Ljj.m
//  WeiBo
//
//  Created by Jun on 13-10-31.
//  Copyright (c) 2013年 Jun. All rights reserved.
//

#import "UIImage+Ljj.h"


@implementation UIImage (Ljj)

+(id)resizingImageWithNamed:(NSString *)named {
    return [self resizingImageWithNamed:named xPic:0.5 yPic:0.5];
}

+(id)resizingImageWithNamed:(NSString *)named xPic:(CGFloat)xPic yPic:(CGFloat)yPic{
    UIImage *image = [UIImage imageNamed:named];
    image = [image stretchableImageWithLeftCapWidth:image.size.width * xPic topCapHeight:image.size.height * yPic];
    return image;
}
@end
