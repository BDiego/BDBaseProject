//
//  BDBaseView.m
//  BDBaseProject
//
//  Created by BDiego on 2016/6/6.
//  Copyright © 2016年 Sword. All rights reserved.
//

#import "BDBaseView.h"

@interface BDBaseView (){
    BOOL _didConstructed;
}

@end

@implementation BDBaseView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        [self constructSubviews];
    }
    
    return self;
}

- (void)didMoveToSuperview{
    [super didMoveToSuperview];
    
    if (!_didConstructed) {
        _didConstructed = YES;
        [self didConstructedSubviews];
        [self resizeContentView];
    }
}



- (void)constructSubviews{
}

- (void)didConstructedSubviews{}

- (void)resizeContentView{};


@end
