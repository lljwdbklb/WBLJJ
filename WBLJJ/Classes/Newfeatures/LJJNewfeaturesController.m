//
//  LJJNewfeaturesController.m
//  WBLJJ
//
//  Created by Jun on 13-12-22.
//  Copyright (c) 2013年 Jun. All rights reserved.
//

#import "LJJNewfeaturesController.h"

#import "UIButton+LJJ.h"

//4张行特性图片
#define kNewfeatureCount 4

@interface LJJNewfeaturesController()<UIScrollViewDelegate>

@property (weak, nonatomic)UIScrollView     * scrollView;
@property (weak, nonatomic)UIImageView      * bgImageView;
@property (weak, nonatomic)UIPageControl    * pageControl;

@end

@implementation LJJNewfeaturesController

- (void)loadView {
    self.view = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _bgImageView = (UIImageView *)self.view;
    [self.view setUserInteractionEnabled:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.bgImageView setImage:[UIImage imageNamed:@"new_feature_background"]];
    
    [self setupScrollView];
    [self setupPageControl];
    [self setupNewfeatures];
}

#pragma mark - 添加视图
#pragma mark 添加滚动视图
- (void)setupScrollView {
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    //设置基本属性
    [scroll setPagingEnabled:YES];
    [scroll setShowsHorizontalScrollIndicator:NO];
    //添加到视图
    [self.view addSubview:scroll];
    _scrollView = scroll;
    //设置代理
    [_scrollView setDelegate:self];
}
#pragma mark 添加分页视图
- (void)setupPageControl {
    UIPageControl * page = [[UIPageControl alloc]init];
    //设置位置与尺寸
    [page setBounds:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
    [page setCenter:CGPointMake(self.view.center.x, self.view.bounds.size.height*0.90)];
    //设置背景
    [page setPageIndicatorTintColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"new_feature_pagecontrol_point"]]];
    [page setCurrentPageIndicatorTintColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"new_feature_pagecontrol_checked_point"]]];
    //新特性页面数量
    [page setNumberOfPages:kNewfeatureCount];
    [self.view addSubview:page];
    _pageControl = page;
}
#pragma mark 添加新特性图片
- (void)setupNewfeatures {
    for (NSInteger i = 0; i < kNewfeatureCount; i++) {
        //new_feature_1-568h@2x 图片名
        NSString * imageName = [NSString stringWithFormat:@"new_feature_%d",i+1];
        UIImage * image = [UIImage imageNamed:imageName];
        UIImageView * imageView = [[UIImageView alloc]initWithImage:image];
        //设置尺寸
        CGFloat w = image.size.width;
        CGFloat h = image.size.height;
        CGFloat x = i * w;
        CGFloat y = 0;
        [imageView setFrame:CGRectMake(x, y, w, h)];
        [self.scrollView addSubview:imageView];
        
        
        //最后一张图片
        if (i == kNewfeatureCount-1) {
            UIButton * commit = [UIButton buttonWithIcon:@"new_feature_finish_button" highlightedIcon:@"new_feature_finish_button_highlighted"];
            [commit setCenter:CGPointMake(self.view.center.x,self.view.bounds.size.height*0.8)];
            [commit addTarget:self action:@selector(clickCommit) forControlEvents:UIControlEventTouchUpInside];
            //添加到视图
            [imageView addSubview:commit];
            
            //选中框
            UIButton * selected = [UIButton buttonWithIcon:@"new_feature_share_false" selectedIcon:@"new_feature_share_true"];
            [selected setCenter:CGPointMake(self.view.center.x,commit.frame.origin.y - selected.bounds.size.height)];
            [selected addTarget:self action:@selector(selectedSend:) forControlEvents:UIControlEventTouchUpInside];
            [selected setSelected:YES];
            //添加到视图
            [imageView addSubview:selected];
            
            [imageView setUserInteractionEnabled:YES];
        }
    }
    //总区域
    [self.scrollView setContentSize:CGSizeMake(self.view.bounds.size.width * kNewfeatureCount, 0)];
}

#pragma mark - 点击事件
#pragma mark 点击提交
- (void)clickCommit {
    
}
#pragma mark 点击选中发布
- (void)selectedSend:(UIButton *)sender {
    sender.selected = !sender.isSelected;
}
#pragma mark - scrollView 代理事件
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    int index = scrollView.contentOffset.x / self.view.bounds.size.width;
    [self.pageControl setCurrentPage:index];
}

@end
