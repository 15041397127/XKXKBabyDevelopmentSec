//
//  RometeView.m
//  RomateDemo
//
//  Created by tianlei on 16/6/30.
//  Copyright © 2016年 tianlei. All rights reserved.
//

#import "RometeView.h"
#import "KTOneFingerRotationGestureRecognizer.h"
#import "XKCircleMacros.h"
@interface RometeView ()


@property (nonatomic, strong) NSMutableArray *btnArray;

@property (nonatomic, assign) CGFloat rotationAngleInRadians;

@property (nonatomic, strong) UIButton *button;

@property (nonatomic, assign) BOOL isShow;

@end


@implementation RometeView

static RometeView *shareInstance;

+ (instancetype)sharedRometeView{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[RometeView alloc] init];
    });
    return shareInstance;
}

- (instancetype)init{
    if (self = [super init]) {
        self.frame = CGRectMake(0, 100,XKUIScreenwidth,XKUIScreenwidth);
        //self.backgroundColor = [UIColor greenColor];
       // [self addGestureRecognizer:[[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(changeRomate:)]];
        [self addGestureRecognizer:[[KTOneFingerRotationGestureRecognizer alloc] initWithTarget:self action:@selector(changeRomate:)]];

    }
    return self;
}




- (void)changeRomate:(KTOneFingerRotationGestureRecognizer *)rotation{
    
    
    
//    self.transform = CGAffineTransformMakeRotation(self.rotationAngleInRadians
//                                                                   +rotation.rotation);
//
//    self.rotationAngleInRadians += rotation.rotation;
}

-(void)drawRect:(CGRect)rect{
    
#define kDegreesToTadians(degrees)  ((pi * degrees)/180)
    const CGFloat pi = M_PI;
    CGPoint center = CGPointMake(XKUIScreenwidth/2,200);
    CGFloat radius6 = XKUIScreenwidth/2-13-20;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius6 startAngle:0.59*M_PI endAngle:0.0*M_PI clockwise:NO];
    path.lineCapStyle = kCGLineCapButt;
    //    path.lineJoinStyle = kCGLineCapButt;
    path.lineWidth = 20.0;
    
    UIColor *strokeColor = [UIColor  colorWithRed:137/255.0 green:205/255.0 blue:70/255.0 alpha:1.0];
    [strokeColor set];
    
    [path stroke];
    
    
    CGFloat radius7 = radius6-20;
    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:center radius:radius7 startAngle:0.5*M_PI endAngle:0.0*M_PI clockwise:NO];
    path1.lineCapStyle = kCGLineCapButt;
    
    path1.lineCapStyle = kCGLineCapButt;
    
    path1.lineWidth = 20.0;
    UIColor *strokeColor1 = [UIColor  colorWithRed:255/255.0 green:129/255.0 blue:147/255.0 alpha:1.0];
    [strokeColor1 set];
    
    [path1 stroke];
    

    CGPoint center1 = CGPointMake(XKUIScreenwidth/2,160);
    CGFloat radius8 = radius7-20-13;
    UIBezierPath *path2 = [UIBezierPath bezierPathWithArcCenter:center1 radius:radius8 startAngle:0.0*M_PI endAngle:-0.4*M_PI clockwise:NO];
    path2.lineCapStyle = kCGLineCapButt;
    
    path2.lineCapStyle = kCGLineCapButt;
    
    path2.lineWidth = 20.0;
    UIColor *strokeColor2 = [UIColor  colorWithRed:57/255.0 green:208/255.0 blue:222/255.0 alpha:1.0];
    [strokeColor2 set];
    
    [path2 stroke];
    
    
    CGFloat radius9 = radius7-40;
    UIBezierPath *path3 = [UIBezierPath bezierPathWithArcCenter:center radius:radius9 startAngle:0.5*M_PI endAngle:0.0*M_PI clockwise:NO];
    path3.lineCapStyle = kCGLineCapButt;
    
    path3.lineCapStyle = kCGLineCapButt;
    
    path3.lineWidth = 20.0;
    UIColor *strokeColor3 = [UIColor  colorWithRed:57/255.0 green:208/255.0 blue:222/255.0 alpha:1.0];
    [strokeColor3 set];
    
    [path3 stroke];
    

}









@end
