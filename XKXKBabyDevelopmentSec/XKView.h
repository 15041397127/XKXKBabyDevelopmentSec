//
//  XKView.h
//  XKBabyDevelopment
//
//  Created by 张旭 on 16/6/18.
//  Copyright © 2016年 zhangXu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XKView : UIView
@property (nonatomic ,strong)UIImageView *navView;
@property (nonatomic ,strong)UIButton *babyButton;
@property (nonatomic ,strong)UIImageView *pointerView;
@property (nonatomic ,strong)UIImageView *maskImgView;
-(id)initWithFrame:(CGRect)frame;


@end
