//
//  BALeftController.m
//  LQJ
//
//  Created by 启思睿 on 2017/11/28.
//  Copyright © 2017年 启思睿. All rights reserved.
//

#import "BALeftController.h"
#import "BASideViewController.h"
#import "UIViewController+SideCategory.h"

@interface BALeftController ()
{
    UIImageView *_imageView;
}

@end

@implementation BALeftController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"header"]];
    _imageView.frame = self.view.bounds;
    [self.view addSubview:_imageView];
}

@end
