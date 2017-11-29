//
//  BAActivityView.m
//  LQJ
//
//  Created by 启思睿 on 2017/11/29.
//  Copyright © 2017年 启思睿. All rights reserved.
//

#import "BAActivityView.h"
#import "Macro.h"

@interface BAActivityView ()

@property (nonatomic, weak) UIView *targetView;
@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) UIActivityIndicatorView *activityView;
@property (nonatomic, strong) UIButton *reloadButton;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation BAActivityView

- (void)dealloc
{
    NSLog(@"BAActivityView dealloc");
}

- (id)initWithTarget:(id)target targetHeight:(CGFloat)targetHeight
{
    self = [super init];
    if (self) {
        self.targetView = target;
        self.frame = Rect(0, 0, ScreenWidth, targetHeight);
        self.backgroundColor = [UIColor clearColor];
        
        self.textLabel = [[UILabel alloc] initWithFrame:Rect(0, 0, ViewWidth(self), 20)];
        self.textLabel.font = [UIFont systemFontOfSize:18.f];
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        self.textLabel.textColor = [UIColor grayColor];
        self.textLabel.backgroundColor = [UIColor clearColor];
        self.textLabel.center = Point(ViewWidth(self)/2, ViewHeight(self)/2);
        [self addSubview:self.textLabel];
        
        self.activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        self.activityView.frame = Rect(0, 0, 60, 60);
        self.activityView.center = Point(self.textLabel.center.x, self.textLabel.center.y-ViewHeight(self.textLabel)/2-ViewHeight(self.activityView)/2);
        [self addSubview:self.activityView];
        
        UIImage *img = [UIImage imageNamed:@"mask_network_icon"];
        self.imageView = [[UIImageView alloc] initWithImage:img];
        self.imageView.frame = Rect(0, 0, img.size.width, img.size.height);
        self.imageView.center = Point(self.textLabel.center.x, self.textLabel.center.y-ViewHeight(self.textLabel)/2-ViewHeight(self.imageView)/2-20);
        [self addSubview:self.imageView];
        
        self.reloadButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.reloadButton.frame = Rect(0, 0, 100, 40);
        self.reloadButton.center = Point(self.textLabel.center.x, self.textLabel.center.y+ViewHeight(self.reloadButton)/2+ViewHeight(self.reloadButton)/2);
        self.reloadButton.backgroundColor = [UIColor whiteColor];
        [self.reloadButton setTitle:@"重新加载" forState:UIControlStateNormal];
        [self.reloadButton setTitleColor:MasterColor forState:UIControlStateNormal];
        self.reloadButton.titleLabel.font = [UIFont systemFontOfSize:18.f];
        self.reloadButton.layer.borderWidth = 1.f;
        self.reloadButton.layer.borderColor = MasterColor.CGColor;
        self.reloadButton.layer.cornerRadius = 6.f;
        self.reloadButton.layer.masksToBounds = YES;
        [self.reloadButton addTarget:self action:@selector(reloadButtonClickEvent:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.reloadButton];
        
        [self.targetView addSubview:self];
        [self.targetView bringSubviewToFront:self];
    }
    return self;
}

- (void)reloadButtonClickEvent:(id)sender
{
    if (_reloadButtonClickEvent) {
        _reloadButtonClickEvent();
    }
}

- (void)setState:(BAActivityViewState)state
{
    _state = state;
    switch (state) {
        case BAActivityViewStateLoading:
        {
            _textLabel.text = @"努力加载中...";
            _textLabel.hidden = NO;
            [_activityView startAnimating];
            _activityView.hidden = NO;
            _imageView.hidden = YES;
            _reloadButton.hidden = YES;
            break;
        }
        case BAActivityViewStateFailed:
        {
            _activityView.hidden = YES;
            _textLabel.text = @"加载失败";
            _textLabel.hidden = NO;
            _imageView.hidden = YES;
            _reloadButton.hidden = NO;
            break;
        }
        case BAActivityViewStateSuccess:
        {
            _textLabel.text = @"加载完毕";
            _textLabel.hidden = YES;
            _activityView.hidden = YES;
            _reloadButton.hidden = YES;
            _imageView.hidden = YES;
            [_activityView stopAnimating];
            break;
        }
        case BAActivityViewStateBroken:
        {
            _textLabel.text = @"网络不给力，请检查网络设置。";
            _textLabel.hidden = NO;
            [_activityView stopAnimating];
            _activityView.hidden = YES;
            _reloadButton.hidden = NO;
            _imageView.hidden = NO;
            break;
        }
        case BAActivityViewStateNull:
        {
            _textLabel.hidden = YES;
            _activityView.hidden = YES;
            _reloadButton.hidden = YES;
            _imageView.hidden = YES;
            [_activityView stopAnimating];
            break;
        }
        default:
            break;
    }
}

+ (BAActivityView *)showInTarget:(id)target targetHeight:(CGFloat)targetHeight
{
    BAActivityView *activityView = [[BAActivityView alloc] initWithTarget:target targetHeight:targetHeight];
    return activityView;
}

@end
