//
//  BDTextField.m
//  BDBaseProject
//
//  Created by BDiego on 2016/6/6.
//  Copyright © 2016年 Sword. All rights reserved.
//
#import "BDTextField.h"

@implementation BDTextField

- (CGRect)placeholderRectForBounds:(CGRect)bounds{
    return CGRectMake(bounds.origin.x+5, bounds.origin.y, bounds.size.width-5, bounds.size.height);
}

- (CGRect)editingRectForBounds:(CGRect)bounds{
    return CGRectMake(bounds.origin.x+5, bounds.origin.y, bounds.size.width-5, bounds.size.height);
}



@end
