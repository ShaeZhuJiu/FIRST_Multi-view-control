//
//  CustomTabBar.m
//  FIRST
//
//  Created by 谢鑫 on 2019/9/22.
//  Copyright © 2019 Shae. All rights reserved.
//

#import "CustomTabBar.h"
#import "CustomTabBarItem.h"
static const CGFloat TabBarHeight=44;
//匿名类别
@interface CustomTabBar ()
@property (nonatomic,strong)NSArray *mTitles;//用于接受传入的数组titles
@property (nonatomic,weak)CustomTabBarItem *preSelectedItem;//上一个选中的CustomTabBarItem
-(void)addItems;//添加CustomTabBarItem的方法
@end

@implementation CustomTabBar
//实现初始化方法
+ (instancetype)tabBarWithTitles:(NSArray *)titles{
    CustomTabBar *tabBar=[[CustomTabBar alloc]init];
    [tabBar setBackgroundColor:[UIColor lightGrayColor]];
    tabBar.mTitles=titles;//给mTitles赋值titles
    return tabBar;
}
//添加CustomTabBarItem的具体实现方法
- (void)addItems{
    CGFloat itemCount=self.mTitles.count;
    CGFloat itemWidth=self.frame.size.width/itemCount;
    CGFloat itemHight=self.frame.size.height;
    for (int i=0; i<itemCount; i++) {
        CustomTabBarItem *item=[CustomTabBarItem itemWithFrame:CGRectMake(itemWidth*i, 0, itemWidth, itemHight) title:self.mTitles[i]];
        [self addSubview:item];
        [item addTarget:self action:@selector(itemSelected:) forControlEvents:UIControlEventTouchUpInside];
        [item setTag:i+1];//tag从1开始
    }
}
-(void)itemSelected:(CustomTabBarItem *)sender{
    //如果选择的和上一次相同就直接返回
    if(sender==self.preSelectedItem){
        return;
    }
    //设置之前的item不选择
    [sender setSelected:NO];
    //设置当前sender已经选择
    [sender setSelected:YES];
    //调用协议方法，通过代理方法和MainViewController通信，控制viewController的切换
    [self.delegate tabBar:self itemSelectedAtIndex:sender.tag];
    
    NSLog(@"%ld",(long)sender.tag);
    self.preSelectedItem=sender;
}
//将要加入父视图
- (void)willMoveToSuperview:(UIView *)newSuperview{
    self.frame=CGRectMake(0, newSuperview.frame.size.height-TabBarHeight,newSuperview.frame.size.width , TabBarHeight);
    [self addItems];
    //默认的item
    CustomTabBarItem *item=[self viewWithTag:1];//通过tag调用item
    [self itemSelected:item];//按钮的响应方法也可以单独调用
    self.preSelectedItem=item;
  
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
