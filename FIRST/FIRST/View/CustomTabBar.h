//
//  CustomTabBar.h
//  FIRST
//
//  Created by 谢鑫 on 2019/9/22.
//  Copyright © 2019 Shae. All rights reserved.
//自定义TabBar,继承自UIView

#import <UIKit/UIKit.h>
//要先声明CustomTabBar不然协议中的CustomTabBar会报错

@class CustomTabBar;
NS_ASSUME_NONNULL_BEGIN
@protocol CustomTabBarDelegate <NSObject>

-(void)tabBar:(CustomTabBar *)tabBar itemSelectedAtIndex:(NSInteger)index;

@end

@interface CustomTabBar : UIView
@property (nonatomic,weak)id<CustomTabBarDelegate>delegate;
+(instancetype)tabBarWithTitles:(NSArray*)titles;//带titls的初始化方法
@end

NS_ASSUME_NONNULL_END
