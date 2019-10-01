//
//  CustomTabBarItem.h
//  FIRST
//
//  Created by 谢鑫 on 2019/9/22.
//  Copyright © 2019 Shae. All rights reserved.
// 自定义CustomTabBarItem，继承自UIButton

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomTabBarItem : UIButton
//带尺寸和题目的初始化h方法
+(instancetype)itemWithFrame:(CGRect)frame title:(NSString*)title;
@end

NS_ASSUME_NONNULL_END
