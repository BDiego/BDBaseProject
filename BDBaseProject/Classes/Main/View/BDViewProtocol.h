//
//  BDViewProtocol.h
//  BDBaseProject
//
//  Created by BDiego on 2016/6/6.
//  Copyright © 2016年 Sword. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol BDViewProtocol <NSObject>

@optional

- (void)constructSubviews;

- (void)didConstructedSubviews;

- (void)resizeContentView;

@end
