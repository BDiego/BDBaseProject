//
//  BDPublicFunctions.h
//  BDBaseProject
//
//  Created by BDiego on 2016/6/6.
//  Copyright © 2016年 Sword. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BDPublicFunctions : NSObject

//获取当前的window，不一定是keywindow
UIWindow *mainWindow(void);

//当前最高一级VC
UIViewController *topMostViewController(void);

//可以任意地方调用这个push，不需要跑回基类VC调用self.navigationController这么麻烦
void pushViewController (UIViewController *vc,BOOL animated);

void pushWithClassName (NSString *className,BOOL animated);

//通过class来push，properties是入参
void pushWithVCClass (Class vcClass,NSDictionary *properties);

//通过className的stringpush
void pushWithVCClassName (NSString *className,NSDictionary *properties);

//present，同上
void presentViewController (UIViewController *vc,BOOL animated);

NSString * BDAppVersion(void);

UIColor * randomColor(void);
@end
