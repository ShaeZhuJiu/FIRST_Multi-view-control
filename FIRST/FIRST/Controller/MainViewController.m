//
//  MainViewController.m
//  FIRST
//
//  Created by 谢鑫 on 2019/9/22.
//  Copyright © 2019 Shae. All rights reserved.
//

#import "MainViewController.h"
#import "AViewController.h"
#import "BViewController.h"
#import "CViewController.h"
#import "CustomTabBar.h"
@interface MainViewController ()<CustomTabBarDelegate>
@property (nonatomic,strong) AViewController *aViewController;
@property (nonatomic,strong) BViewController *bViewController;
@property (nonatomic,strong) CViewController *cViewController;
@property (nonatomic,strong) CustomTabBar *customTabBar;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor redColor];
    [self aViewController];//调试
    _customTabBar=[CustomTabBar tabBarWithTitles:@[@"1",@"2",@"3"]];
    _customTabBar.delegate=self;
    [self.view addSubview:_customTabBar];
}

#pragma mark - A,B,C三个viewController的初始化
- (AViewController *)aViewController{
    if (_aViewController==nil) {
        _aViewController=[[AViewController alloc]init];
        _aViewController.view.backgroundColor=[UIColor blueColor];//调试后续交给view设置
        [self addChildViewController:_aViewController];           //将视图控制器设置为主视图控制器的子控制器
        [self.view addSubview:_aViewController.view];             //将子控制器的视图添加到主控制器中
    }
    return _aViewController;
}
- (BViewController *)bViewController{
    if (_bViewController==nil) {
        _bViewController=[[BViewController alloc]init];
        _bViewController.view.backgroundColor=[UIColor yellowColor];//调试后续交给view设置
        [self addChildViewController:_bViewController];           //将视图控制器设置为主视图控制器的子控制器
        [self.view addSubview:_bViewController.view];             //将子控制器的视图添加到主控制器中
    }
    return _bViewController;
}
- (CViewController *)cViewController{
    if (_cViewController==nil) {
        _cViewController=[[CViewController alloc]init];
        _cViewController.view.backgroundColor=[UIColor greenColor];//调试后续交给view设置
        [self addChildViewController:_cViewController];           //将视图控制器设置为主视图控制器的子控制器
        [self.view addSubview:_cViewController.view];             //将子控制器的视图添加到主控制器中
    }
    return _cViewController;
}
//代理方法的具体实现，如果不实现这个d协议方法，会崩溃
-(void)tabBar:(CustomTabBar *)tabBar itemSelectedAtIndex:(NSInteger)index{
    NSLog(@"%ld test",index);
    //bringSubviewToFront将对应子视图控制器的view显示
    switch (index) {
        case 1:
            [self.view bringSubviewToFront:self.aViewController.view];
            break;
        case 2:
            [self.view bringSubviewToFront:self.bViewController.view];
            break;
        case 3:
            [self.view bringSubviewToFront:self.cViewController.view];
            break;
            
        default:
            break;
    }
    //最后都要把自定义的tabBar添加
    [self.view bringSubviewToFront:_customTabBar];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
