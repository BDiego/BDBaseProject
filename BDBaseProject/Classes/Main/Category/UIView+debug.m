//
//  UIView+debug.m
//  BDBaseProject
//
//  Created by BDiego on 2016/6/6.
//  Copyright © 2016年 Sword. All rights reserved.
//

#import "UIView+debug.h"

//边框颜色 调试用
#define ViewDebuggingComponent           NO        //新参数, 会在自定义AWBaseComponent显示随机颜色Border，仅在调试时生效
#define ViewDebuggingAll                 NO       //新参数, 会在所有UIView显示随机颜色Border，仅在调试时生效

#import <objc/runtime.h>
IMP __original_layoutSubviews = NULL;
void __swizzle_layoutSubviews(UIView *self, SEL _cmd){
    ((void(*)(UIView *, SEL))__original_layoutSubviews)(self, _cmd);
}

#ifdef DEBUG
static CGColorRef randomCGColor(){
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.8;  //  0.8 to 1.0
    CGFloat brightness = 1;
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];

    return [color CGColor];
}

static CGColorRef redColor(){
    return [UIColor redColor].CGColor;
}

IMP __original_willMoveToSuperview = NULL;
void __swizzle_willMoveToSuperview(UIView *self, SEL _cmd, UIView *newSuperview){
    ((void(*)(UIView *, SEL, UIView *))__original_willMoveToSuperview)(self, _cmd, newSuperview);
    if(ViewDebuggingAll || (ViewDebuggingComponent && ([self isKindOfClass:NSClassFromString(@"BDBaseView")]))){
        if (self.layer.borderWidth <= 0.f) {
            self.layer.borderWidth = 1.f;
            self.layer.borderColor = randomCGColor();
        }
    }
}

#endif



@implementation UIView (debug)
+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method oringal_method = class_getInstanceMethod([self class], @selector(layoutSubviews));
        __original_layoutSubviews = method_setImplementation(oringal_method, (IMP)__swizzle_layoutSubviews);
        
#ifdef DEBUG
                //oringal_method = class_getInstanceMethod([self class], @selector(addGestureRecognizer:));
                //__original_addGestureRecognizer = method_setImplementation(oringal_method, (IMP)__swizzle_addGestureRecognizer);
        
        oringal_method = class_getInstanceMethod([self class], @selector(willMoveToSuperview:));
        __original_willMoveToSuperview = method_setImplementation(oringal_method, (IMP)__swizzle_willMoveToSuperview);
#endif
    });
}
@end
