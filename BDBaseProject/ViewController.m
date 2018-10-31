//
//  ViewController.m
//  BDBaseProject
//
//  Created by WangYibao on 2018/7/12.
//  Copyright © 2018年 Sword. All rights reserved.
//

#import "ViewController.h"
#import "BDAlertControllerManager.h"
#import <UIImage+GIF.h>
#import <SDWebImageDownloader.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    if (iPhoneXStyle) {
        NSLog(@"iPhoneXStyle 好使");
    }else{
        NSLog(@"iPhoneXStyle 不好使");
    }
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
