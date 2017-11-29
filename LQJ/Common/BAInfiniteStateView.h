//
//  BAInfiniteStateView.h
//  LQJ
//
//  Created by 启思睿 on 2017/11/29.
//  Copyright © 2017年 启思睿. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum : NSUInteger {
    BAInfiniteViewStateLoading,
    BAInfiniteViewStateStoped,
    BAInfiniteViewStateLoadFaild,
    BAInfiniteViewStateEnd,
} BAInfiniteViewState;

@interface BAInfiniteStateView : UIView

- (BOOL)isLoading;

- (BOOL)isEnd;

- (void)setInfiniteState:(BAInfiniteViewState)state;

@end
