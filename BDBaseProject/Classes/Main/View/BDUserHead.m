//
//  BDUserHead.m
//  BDBaseProject
//
//  Created by BDiego on 2016/6/6.
//  Copyright © 2016年 Sword. All rights reserved.
//

#import "BDUserHead.h"

@implementation BDUserHead

- (void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    self.layer.cornerRadius = frame.size.width/2.f;
    self.layer.masksToBounds = YES;
    self.layer.rasterizationScale =  [UIScreen mainScreen].scale;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.image = [UIImage imageNamed:@"icon_chatter_head"];
    }
    
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.layer.cornerRadius = self.width/2.f;
    self.layer.masksToBounds = YES;
    self.layer.rasterizationScale =  [UIScreen mainScreen].scale;
    
}


@end
