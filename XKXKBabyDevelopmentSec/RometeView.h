//
//  RometeView.h
//  RomateDemo
//
//  Created by tianlei on 16/6/30.
//  Copyright © 2016年 tianlei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RometeView : UIView

+ (instancetype)sharedRometeView;

@property (nonatomic, assign) NSInteger menuCount;

@end
