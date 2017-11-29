//
//  BAInfiniteStateView.m
//  LQJ
//
//  Created by 启思睿 on 2017/11/29.
//  Copyright © 2017年 启思睿. All rights reserved.
//

#import "BAInfiniteStateView.h"

@interface BAInfiniteStateView ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIActivityIndicatorView *activityView;
@property (nonatomic, assign) BAInfiniteViewState currentState;

@end

@implementation BAInfiniteStateView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 6.f;
        self.layer.masksToBounds = YES;
        self.layer.borderWidth = 0.5f;
        self.layer.borderColor = RGB(200, 200, 200).CGColor;
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    _titleLabel = [[UILabel alloc] initWithFrame:Rect(0, 0, ViewWidth(self)*0.5, 21)];
    _titleLabel.font = [UIFont systemFontOfSize:16.f];
    _titleLabel.textColor = RGB(102, 102, 102);
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.center = Point(ViewWidth(self)/2, ViewHeight(self)/2);
    [self addSubview:_titleLabel];
    
    _activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _activityView.hidesWhenStopped = YES;
    _activityView.center = Point(95, 22);
    [self addSubview:_activityView];
}

- (void)setInfiniteState:(BAInfiniteViewState)state
{
    _currentState = state;
    if (state==BAInfiniteViewStateLoading) {
        _titleLabel.text = @"加载中...";
        [_activityView startAnimating];
    }
    else if (state==BAInfiniteViewStateStoped) {
        _titleLabel.text = @"上拉加载更多";
        [_activityView stopAnimating];
    }
    else if (state==BAInfiniteViewStateEnd) {
        _titleLabel.text = @"已经到底";
        [_activityView stopAnimating];
    }
    else if (state==BAInfiniteViewStateLoadFaild) {
        _titleLabel.text = @"加载失败";
        [_activityView stopAnimating];
    }
}

- (BOOL)isLoading
{
    if (_currentState==BAInfiniteViewStateLoading) {
        return YES;
    }
    return NO;
}

- (BOOL)isEnd
{
    if (_currentState==BAInfiniteViewStateEnd) {
        return YES;
    }
    return NO;
}

@end
