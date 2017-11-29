//
//  BAMainController.m
//  LQJ
//
//  Created by 启思睿 on 2017/11/28.
//  Copyright © 2017年 启思睿. All rights reserved.
//

#import "BAMainController.h"
#import "BASlideMenu.h"
#import "BAMainViewCell.h"

@interface BAMainController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIButton *headerButton;
//@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation BAMainController
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
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
    cell.detailTextLabel.text = [self subTitles][indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            [self.sldeMenu showRootViewControllerAnimated:true];
            break;
        case 1:
            [self.sldeMenu showLeftViewControllerAnimated:true];
            break;
        case 2:
            [self.sldeMenu showRightViewControllerAnimated:true];
            break;
        case 3: {
            [self.sldeMenu showRootViewControllerAnimated:true];
            UIViewController *vc = [[UIViewController alloc] init];
            vc.title = @"新界面";
            vc.view.backgroundColor = [UIColor whiteColor];
            UINavigationController *nav = (UINavigationController *)self.sldeMenu.rootViewController;
            [nav pushViewController:vc animated:true];
        }
            break;
        case 4:
            self.sldeMenu.slideEnabled = !self.sldeMenu.slideEnabled;
            [tableView reloadData];
            break;
        default:
            break;
    }
}

#pragma mark -
#pragma mark TableViewDelegate&DataSource
- (NSArray *)titles {
    return @[@"显示主界面",@"显示左菜单",@"显示右菜单",@"Push新界面",@"设置滑动开关"];
}

- (NSArray *)subTitles {
    NSString *subTitle = self.sldeMenu.slideEnabled ? @"(已打开)" : @"(已关闭)" ;
    return @[@"",@"",@"",@"",subTitle];
}

-(void)showLeft{
    [self.sldeMenu showLeftViewControllerAnimated:true];
}

-(void)showRight{
    [self.sldeMenu showRightViewControllerAnimated:true];
}

@end
