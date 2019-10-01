//
//  CustomTabBarItem.m
//  FIRST
//
//  Created by 谢鑫 on 2019/9/22.
//  Copyright © 2019 Shae. All rights reserved.
//

#import "CustomTabBarItem.h"

@implementation CustomTabBarItem
//实现初始化方法
+(instancetype)itemWithFrame:(CGRect)frame title:(NSString *)title{
    CustomTabBarItem *item=[self buttonWithType:UIButtonTypeCustom]; //按钮的初始化方法 buttonWithType
    item.frame=frame;
    
    [item setTitle:title forState:UIControlStateNormal];//按钮的属性设置 forState
    [item setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [item.titleLabel setFont:[UIFont systemFontOfSize:17]];
    
    [item setBackgroundImage:[UIImage imageNamed:@"normal"] forState:UIControlStateNormal];
    [item setBackgroundImage:[UIImage imageNamed:@"selected"] forState:UIControlStateSelected];
    return item;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
