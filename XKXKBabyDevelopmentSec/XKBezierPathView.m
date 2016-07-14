//
//  XKBezierPathView.m
//  XKXKBabyDevelopmentSec
//
//  Created by 张旭 on 16/7/1.
//  Copyright © 2016年 zhangXu. All rights reserved.
//

#import "XKBezierPathView.h"
#import "XKCircleMacros.h"
#import "KTOneFingerRotationGestureRecognizer.h"
@implementation XKBezierPathView





/**
 *  添加BezierPath画圆弧
 */


-(void)drawRect:(CGRect)rect{
    
#define kDegreesToTadians(degrees)  ((pi * degrees)/180)
    const CGFloat pi = M_PI;
    CGPoint center = CGPointMake(self.bounds.size.width/2,0);
    CGFloat radius6 = 15;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius6 startAngle:0.5*M_PI endAngle:0.0*M_PI clockwise:NO];
    path.lineCapStyle = kCGLineCapButt;
    //    path.lineJoinStyle = kCGLineCapButt;
    path.lineWidth = 10.0;
    
    UIColor *strokeColor = [UIColor purpleColor];
    [strokeColor set];
    
    [path stroke];
    
    
    
    //       UIBezierPath *path = [UIBezierPath bezierPath];
    //       path.lineWidth = 20.0;
    //       path.lineCapStyle = kCGLineCapButt;
    //       CGPoint center = CGPointMake(XKUIScreenwidth/2, 100);
    //       CGFloat radius6 = redius2+10;
    //       UIColor * strokeColor = [UIColor redColor];
    //        [strokeColor set];
    //
    //    [path addArcWithCenter:center radius:radius6  startAngle:0.75*M_PI endAngle:0.1*M_PI clockwise:NO];
    //
    //    [path stroke];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
