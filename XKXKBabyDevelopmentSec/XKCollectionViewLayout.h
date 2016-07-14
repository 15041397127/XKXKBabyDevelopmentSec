//
//  XKCollectionViewLayout.h
//  XKXKBabyDevelopmentSec
//
//  Created by 张旭 on 16/6/20.
//  Copyright © 2016年 zhangXu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XKCollectionViewLayout : UICollectionViewFlowLayout

@property (nonatomic, assign) NSInteger cellCount;
@property (nonatomic, assign) NSInteger cellCount1;
@property (nonatomic, assign) NSInteger cellCount2;
@property (nonatomic, assign) NSInteger cellCount3;
@property (nonatomic, assign) NSInteger cellCount4;
@property (nonatomic, assign) NSInteger cellCount5;
//itemHeight
@property (nonatomic, assign) CGFloat itemHeight;

//半径
@property (nonatomic, assign) CGFloat circleRadius;

@property (nonatomic, assign) CGFloat circleRadius1;

/**
 *  第一个元素距离左边界的距离
 */
@property (nonatomic, assign) CGFloat itemOffset;

/**
 *  滚动的偏移
 */
@property (nonatomic, assign) CGFloat offset;


/**
 *  可见item数量 默认是4
 */


@property (nonatomic,assign) NSInteger visibleNum;
@property (assign, nonatomic) CGSize cellSize;
-(instancetype)init;


@end
