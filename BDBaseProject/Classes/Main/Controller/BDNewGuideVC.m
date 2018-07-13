//
//  BDNewGuideVC.m
//  BDBaseProject
//
//  Created by BDiego on 2016/6/6.
//  Copyright © 2016年 Sword. All rights reserved.
//

#import "BDNewGuideVC.h"
#import "AppDelegate.h"

#define IOS_SCALE ([[UIScreen mainScreen] scale]/3)


@interface BDNewGuideVC ()<UIScrollViewDelegate>

@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation BDNewGuideVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatSubViews];
}

-(void)creatSubViews{
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    
    UIImageView *lastImageView = nil;
    for (int i = 1; i<5; i++) {
        
        NSString *imageStr = [NSString stringWithFormat:@"welcome_%d.jpg",i];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageStr]];
        imageView.userInteractionEnabled = YES;
        [scrollView addSubview:imageView];
        if (!lastImageView) {
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(scrollView);
                make.top.bottom.equalTo(self.view);
                make.width.mas_equalTo(kScreenWidth);
            }];
        } else {
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(lastImageView.mas_right);
                make.top.bottom.equalTo(self.view);
                make.width.mas_equalTo(kScreenWidth);
            }];
        }
        lastImageView = imageView;
    }
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(lastImageView.mas_right);
    }];
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0,kScreenWidth-30, kScreenWidth, 30)];
    self.pageControl.numberOfPages = 4;
    self.pageControl.currentPage = 0;
    self.pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    self.pageControl.currentPageIndicatorTintColor = kThemeColor;
    self.pageControl.userInteractionEnabled = NO;
    [self.view addSubview:self.pageControl];
    
    CGFloat margin = 43 * IOS_SCALE;
    
    UIButton *loginBtn =  [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.backgroundColor = kThemeColor;
    [loginBtn setTitle:@"进入登录" forState:UIControlStateNormal];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    loginBtn.layer.cornerRadius = 5;
    loginBtn.layer.masksToBounds = YES;
    [loginBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];

    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(kScreenWidth-74);
        make.centerX.mas_equalTo(0);
        make.height.mas_equalTo(45);
        make.width.mas_equalTo(kScreenWidth - margin*2);
    }];
    
}

-(void)btnClick{
    
    //[APP_DELEGATE configRootVC];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView { //有动画
    [self showCurrentPage];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self showCurrentPage];
}

- (void)showCurrentPage {
        
    CGFloat pageWidth = kScreenWidth;
    NSInteger currentPage = floor((self.scrollView.contentOffset.x - pageWidth/2)/pageWidth) +1;
    self.pageControl.currentPage = currentPage;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x > kScreenWidth*3+10) {
        [self btnClick];
    }
}

//这里有个情况就是屏幕设置了放大，放大以后屏幕的高度并不标准
- (NSString*)getFileNameWithHeight:(CGFloat)height {
    if (height <= 960) {
        return @"960";
    }
    if (height <= 1136) {
        return @"1136";
    }
    if (height <= 1334) {
        return @"1334";
    }
    if (height <= 2208) {
        return @"2208";
    }
    return @"2208";
}






@end
