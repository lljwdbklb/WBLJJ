//
//  MoveCell.h
//  move
//
//  Created by Jun on 13-12-16.
//  Copyright (c) 2013年 Jun. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kMargin 10

typedef enum {
    kLJJMoveCellOnce,
    kLJJMoveCellTop,
    kLJJMoveCellMiddle,
    kLJJMoveCellBottom
}LJJMoveCellType;

@interface LJJMoveCell : UITableViewCell

- (void)setType:(LJJMoveCellType)type;

@end
