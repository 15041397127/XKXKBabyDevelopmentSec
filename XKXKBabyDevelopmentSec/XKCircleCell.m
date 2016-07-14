//
//  XKCircleCell.m
//  XKXKBabyDevelopmentSec
//
//  Created by 张旭 on 16/6/20.
//  Copyright © 2016年 zhangXu. All rights reserved.
//

#import "XKCircleCell.h"
#import "XKCircleMacros.h"
@implementation XKCircleCell
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
//        self.layer.cornerRadius = frame.size.width/2;
//        self.layer.borderColor = [UIColor blueColor].CGColor;
//        self.layer.borderWidth = 2.0;
        
//        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,1,12)];
//        label.textAlignment = NSTextAlignmentCenter;
//        [self.contentView addSubview:label];
//        self.textLabel = label;
//        self.textLabel.backgroundColor = [UIColor grayColor];
//        _textLabel.layer.anchorPoint = CGPointMake(0.5, 0.5);
//        _textLabel.transform = CGAffineTransformMakeRotation(M_PI/2);
//        _textLabel.font = [UIFont systemFontOfSize:9.0f];
//        [self addSubview:self.textLabel];
        //刻度
//        _rulerView = [[UIView alloc]initWithFrame:CGRectMake(4, 0.5, 1, 10)];
        
        self.backgroundColor = [UIColor clearColor];
        _rulerView = [[UIView alloc]init];
        _rulerView.backgroundColor = [UIColor whiteColor];
        _rulerView.layer.anchorPoint = CGPointMake(0.5, 0.5);
        _rulerView.transform = CGAffineTransformMakeRotation(M_PI/2);
        
        [self.contentView addSubview:_rulerView];
        
        
        
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.bounds.size.height-50, (self.bounds.size.height-20)/2, 60, 20)];
        _titleLabel.font = [UIFont systemFontOfSize:11.0f];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.layer.anchorPoint = CGPointMake(0.5, 0.5);
        _titleLabel.transform = CGAffineTransformMakeRotation(M_PI/2);
        [self.contentView addSubview:_titleLabel];
    
  
 
    
        
    }
    return self;
}

-(void)drawRect:(CGRect)rect{
    
  
    
#define kDegreesToTadians(degrees)  ((pi * degrees)/180)
    const CGFloat pi = M_PI;
    CGPoint center = CGPointMake(XKUIScreenwidth/2, 100);
    CGFloat radius6 = XKUIScreenwidth/2+1-12;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius6 startAngle:-10 endAngle:70 clockwise:NO];
    path.lineCapStyle = kCGLineCapButt;
    //    path.lineJoinStyle = kCGLineCapButt;
    path.lineWidth = 20.0;
    
    UIColor *strokeColor = [UIColor blueColor];
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





@end
