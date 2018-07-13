//
//  UIView+Utils.h
//  BDBaseProject
//
//  Created by BDiego on 2016/6/6.
//  Copyright © 2016年 Sword. All rights reserved.
//

#import <UIKit/UIKit.h>

CGPoint CGRectGetCenter(CGRect rect);
CGRect  CGRectMoveToCenter(CGRect rect, CGPoint center);

@interface UIView (Utils)


@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize size;

@property (readonly) CGPoint bottomLeft;
@property (readonly) CGPoint bottomRight;
@property (readonly) CGPoint topRight;

@property (nonatomic) CGFloat height;
@property (nonatomic) CGFloat width;

@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat left;

@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat right;


- (void) moveBy: (CGPoint) delta;
- (void) scaleBy: (CGFloat) scaleFactor;
- (void) fitInSize: (CGSize) aSize;

- (void)removeAllSubviews;
- (void)removeSubviews:(NSArray *)subViews;
- (void)addSubviews:(NSArray *)subViews;


@end
