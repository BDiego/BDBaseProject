//
//  BDViewControllerProtocol.h
//  BDBaseProject
//
//  Created by BDiego on 2016/6/6.
//  Copyright © 2016年 Sword. All rights reserved.
//

@protocol BDViewControllerProtocol <NSObject>

@optional

- (void)constructContentView;
- (void)didConstructedContentView; //a good place to add gesure target
- (void)resizeContentView;

- (void)onRequest;
- (void)onRefresh;
- (void)onLoadMore;

//statusbar
- (void)setStatusBarHidden:(BOOL)hidden animation:(UIStatusBarAnimation)animate;
-(void)creatLeftItemTarget:(id)target selector:(SEL)selector;
-(void)creatRightItemTarget:(id)target selector:(SEL)selector Title:(NSString *)title Image:(UIImage *)image;

@end
