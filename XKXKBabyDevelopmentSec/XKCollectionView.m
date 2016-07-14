//
//  XKCollectionView.m
//  XKXKBabyDevelopmentSec
//
//  Created by 张旭 on 16/7/1.
//  Copyright © 2016年 zhangXu. All rights reserved.
//

#import "XKCollectionView.h"
#import "XKCircleMacros.h"
#import "KTOneFingerRotationGestureRecognizer.h"
@implementation XKCollectionView

- (instancetype)init{
    if (self = [super init]) {
        self.frame = CGRectMake(0, 0, XKUIScreenwidth,XKUIScreenheight);

        [self addGestureRecognizer:[[KTOneFingerRotationGestureRecognizer alloc] initWithTarget:self action:@selector(changeRomate:)]];
        
    }
    return self;
}


-(void)changeRomate:(KTOneFingerRotationGestureRecognizer *)rotation{
    
    self.transform = CGAffineTransformMakeRotation(self.rotationAngleInRadians
                                                   +rotation.rotation);
    
    self.rotationAngleInRadians += rotation.rotation;
    
    
    
}





/**
 *  添加BezierPath画圆弧
 */


-(void)drawRect:(CGRect)rect{

//#define kDegreesToTadians(degrees)  ((pi * degrees)/180)
//    const CGFloat pi = M_PI;
//    CGPoint center = CGPointMake(XKUIScreenwidth/2, 0);
//    CGFloat radius6 = XKUIScreenwidth/2+1-32;
//    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius6 startAngle:-10 endAngle:0.5*M_PI clockwise:NO];
//    path.lineCapStyle = kCGLineCapButt;
//    //    path.lineJoinStyle = kCGLineCapButt;
//    path.lineWidth = 20.0;
//    
//    UIColor *strokeColor = [UIColor purpleColor];
//    [strokeColor set];
//    
//    [path stroke];
    
    
    
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

@end
