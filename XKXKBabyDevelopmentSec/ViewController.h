//
//  ViewController.h
//  XKXKBabyDevelopmentSec
//
//  Created by 张旭 on 16/6/20.
//  Copyright © 2016年 zhangXu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, copy) NSArray *items;

/**
 *
     设置锚点
 */
- (CGFloat)offsetForItem:(NSUInteger)item;
- (void)didEndScrolling;
- (void)scrollToItem:(NSUInteger)item animated:(BOOL)animated;
- (void)selectItem:(NSUInteger)item animated:(BOOL)animated;

+(CGFloat)heightWithBoundingWidth:(CGFloat )width Title:(NSString *)title;
@end

