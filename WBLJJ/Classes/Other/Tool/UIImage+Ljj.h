//
//  UIImage+Ljj.h
//  WeiBo
//
//  Created by Jun on 13-10-31.
//  Copyright (c) 2013年 Jun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Ljj)
/**
 *
 *  拉伸图片
 *
 *  @param named    沙盒中得图片名
 *
 *  @return 修改后格式的对象
 */
+(id)resizingImageWithNamed:(NSString *)named;

/**
 *
 *  拉伸图片
 *
 *  @param named    沙盒中得图片名
 *  @param xPic     图片X轴比例
 *  @param yPic     图片Y轴比例
 *
 *  @return 修改后格式的对象
 */
+(id)resizingImageWithNamed:(NSString *)named xPic:(CGFloat)xPic yPic:(CGFloat)yPic;
@end
