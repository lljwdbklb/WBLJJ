//
//  MoveCell.m
//  move
//
//  Created by Jun on 13-12-16.
//  Copyright (c) 2013年 Jun. All rights reserved.
//

#import "LJJMoveCell.h"
#import "UIImage+Ljj.h"

@interface LJJMoveCell()
{
    UIImageView * _bgImageView;
    UIImageView * _selectedBgImageView;
}

@end

@implementation LJJMoveCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundView = [[UIImageView alloc]init];
        _bgImageView = (UIImageView *)self.backgroundView;
        self.selectedBackgroundView = [[UIImageView alloc]init];
        _selectedBgImageView = (UIImageView *)self.selectedBackgroundView;
        
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    frame.origin.x = kMargin;
    frame.size.width = frame.size.width - kMargin * 2;
    [super setFrame:frame];
}

- (void)setType:(LJJMoveCellType)type {
    switch (type) {
        case kLJJMoveCellOnce:{
            [_bgImageView setImage:[UIImage resizingImageWithNamed:@"common_card_background"]];
            [_selectedBgImageView setImage:[UIImage resizingImageWithNamed:@"common_card_background_highlighted"]];
        }break;
        case kLJJMoveCellTop:{
            [_bgImageView setImage:[UIImage resizingImageWithNamed:@"common_card_top_background"]];
            [_selectedBgImageView setImage:[UIImage resizingImageWithNamed:@"common_card_top_background_highlighted"]];
        }break;
        case kLJJMoveCellBottom:{
            [_bgImageView setImage:[UIImage resizingImageWithNamed:@"common_card_bottom_background"]];
            [_selectedBgImageView setImage:[UIImage resizingImageWithNamed:@"common_card_bottom_background_highlighted"]];
        }break;
        case kLJJMoveCellMiddle:{
            [_bgImageView setImage:[UIImage resizingImageWithNamed:@"common_card_middle_background"]];
            [_selectedBgImageView setImage:[UIImage resizingImageWithNamed:@"common_card_middle_background_highlighted"]];
        }break;
    }
}


@end
