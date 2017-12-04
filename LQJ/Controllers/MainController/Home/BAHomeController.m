//
//  BAHomeController.m
//  LQJ
//
//  Created by 启思睿 on 2017/11/29.
//  Copyright © 2017年 启思睿. All rights reserved.
//

#import "BAHomeController.h"
#import "BAMainViewCell.h"
#import "UIViewController+SideCategory.h"
#import "BAGuideController.h"

@interface BAHomeController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIButton *headerButton;
@end

@implementation BAHomeController

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:Rect(0, 0, ScreenWidth, ScreenHeight-StatusBarHeight-TabBarHeight-NaviBarHeight)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (UIButton *)headerButton {
    if (!_headerButton) {
        _headerButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 37, 37)];
        _headerButton.layer.cornerRadius = _headerButton.bounds.size.width/2.0f;
        _headerButton.layer.masksToBounds = true;
        [_headerButton setImage:[UIImage imageNamed:@"header"] forState:UIControlStateNormal];
        [_headerButton addTarget:self action:@selector(showLeft) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return _headerButton;
}

//- (UIImageView *)imageView {
//
//    if (!_imageView) {
//        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 64)];
//        _imageView.image = [UIImage imageNamed:@"header"];
//    }
//    return _imageView;
//}


- (void)viewWillAppear:(BOOL)animated{
    // 显示tabbar
//    if ([self.rdv_tabBarController isTabBarHidden]) {
//        [self.rdv_tabBarController setTabBarHidden:NO animated:NO];
//    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.title = @"社区";
    
    [self.view addSubview:self.tableView];
    
    //左
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.headerButton];
    //    [self.view addSubview:_imageView];
    
    
}


#pragma mark -
#pragma mark TableViewDelegate&DataSource

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 60;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Tips";
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //    return [self titles].count;
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellIdentifier = @"cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = [self titles][indexPath.row];
    cell.detailTextLabel.textColor = [UIColor colorWithRed:3/255.0f green:102/255.0f blue:214/255.0f alpha:1];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            BALog(@"0");
            break;
        case 1:
            BALog(@"1");
            break;
        case 2:
            BALog(@"2");
            break;
        case 3: {
            BALog(@"3");
        }
            break;
        case 4:{
            BALog(@"4");
            BAGuideController *vddd = [BAGuideController new];
            vddd.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vddd animated:YES];
            
        }
            break;
        default:
            break;
    }
}

#pragma mark -
#pragma mark TableViewDelegate&DataSource
- (NSArray *)titles {
    return @[@"赛事1",@"赛事1",@"赛事1",@"赛事1", @"赛事1"];
}

-(void)showLeft{
//    [self.sldeMenu showLeftViewControllerAnimated:true];
    [self sideOpenVC];
}

@end
