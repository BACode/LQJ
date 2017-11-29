//
//  BAActivityView.h
//  LQJ
//
//  Created by 启思睿 on 2017/11/29.
//  Copyright © 2017年 启思睿. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    BAActivityViewStateLoading,
    BAActivityViewStateFailed,
    BAActivityViewStateSuccess,
    BAActivityViewStateBroken,
    BAActivityViewStateNull
} BAActivityViewState;

typedef void(^ReloadButtonClickBlock)(void);

@interface BAActivityView : UIView

@property (nonatomic, assign) BAActivityViewState state;
@property (nonatomic, strong) ReloadButtonClickBlock reloadButtonClickEvent;

+ (BAActivityView *)showInTarget:(id)target targetHeight:(CGFloat)targetHeight;

@end
