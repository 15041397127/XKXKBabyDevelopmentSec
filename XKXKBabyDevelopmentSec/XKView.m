//
//  XKView.m
//  XKBabyDevelopment
//
//  Created by 张旭 on 16/6/18.
//  Copyright © 2016年 zhangXu. All rights reserved.
//

#import "XKView.h"
#import "XKCircleMacros.h"
@implementation XKView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor  = [UIColor clearColor];
        self.navView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, XKUIScreenwidth, 100)];
        self.navView.image = [UIImage imageNamed:@"顶部栏"];
        [self addSubview:self.navView];
        
        self.babyButton = [[UIButton alloc]initWithFrame:CGRectMake(XKUIScreenwidth/2-42, 42, 84, 84)];
        self.babyButton.layer.cornerRadius = 21;
        self.babyButton.layer.masksToBounds = YES;
        [self.babyButton setBackgroundImage:[UIImage imageNamed:@"头像小王子"] forState:UIControlStateNormal];
        [self addSubview:self.babyButton];
        
        
        self.pointerView = [[UIImageView alloc]initWithFrame:CGRectMake(XKUIScreenwidth/2-0.5,self.bounds.size.width/2-12, 1,100)];
        self.pointerView.image = [UIImage imageNamed:@"指针"];
        [self addSubview:self.pointerView];
        
        self.maskImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0,CGRectGetHeight(self.navView.frame), self.navView.frame.size.width, 60)];
        self.maskImgView.image= [UIImage imageNamed:@"阴影750x60px"];
        [self addSubview:self.maskImgView];
   
    }
    
    
    return self;
}

- (void)drawRect:(CGRect)rect{
    
    CGContextRef con  = UIGraphicsGetCurrentContext();
    
    /**
     *  最外圈
     */
    //最外面的小全

    CGFloat radius1 = self.bounds.size.width/2;
    CGContextAddArc(con, radius1, 100, radius1, 0, 2*M_PI, NO);
    CGContextAddArc(con, radius1, 100, radius1-12, 2*M_PI, 0, YES);
    CGContextSetFillColorWithColor(con, [UIColor colorWithRed:74/255.0 green:194/255.0 blue:235/255.0 alpha:1.0].CGColor);
    CGContextFillPath(con);

    
    CGFloat radiusMax = self.bounds.size.width/2+1;
    CGContextAddArc(con, radius1, 100, radiusMax, 0, 2*M_PI, NO);
    CGContextAddArc(con, radius1, 100, radiusMax-1, 2*M_PI, 0, YES);
    CGContextSetFillColorWithColor(con, [UIColor whiteColor].CGColor);
    CGContextFillPath(con);
    
    
    CGFloat radius = radius1-12;
    CGContextAddArc(con, radius1, 100, radius, 0, 2*M_PI, NO);
    CGContextAddArc(con, radius1, 100, radius-20, 2*M_PI, 0, YES);
    CGContextSetFillColorWithColor(con, [UIColor colorWithRed:127/255.0 green:221/255.0 blue:255/255.0 alpha:1.0].CGColor);
    CGContextFillPath(con);
    
 
    CGFloat rediusTwo = radius-20;
    CGContextAddArc(con, radius1, 100, rediusTwo, 0, 2*M_PI, NO);
    CGContextAddArc(con, radius1, 100, rediusTwo-20, 2*M_PI, 0, YES);
    CGContextSetFillColorWithColor(con, [UIColor colorWithRed:153/255.0 green:228/255.0 blue:255/255.0 alpha:1.0].CGColor);
    CGContextFillPath(con);
   
    CGFloat redius2 = rediusTwo -20;
    CGContextAddArc(con, radius1, 100, redius2, 0, 2*M_PI, NO);
    CGContextAddArc(con, radius1, 100, redius2-20, 2*M_PI, 0, YES);
    CGContextSetFillColorWithColor(con, [UIColor colorWithRed:178/255.0 green:235/255.0 blue:255/255.0 alpha:1.0].CGColor);
    CGContextFillPath(con);

    CGFloat redius3 = redius2 - 20;
    CGContextAddArc(con, radius1, 100, redius3, 0, 2*M_PI, NO);
    CGContextAddArc(con, radius1, 100, redius3-20, 2*M_PI, 0, YES);
    CGContextSetFillColorWithColor(con, [UIColor colorWithRed:204/255.0 green:241/255.0 blue:255/255.0 alpha:1.0].CGColor);
    CGContextFillPath(con);
  
    CGFloat redius4 = redius3 - 20;
    CGContextAddArc(con, radius1, 100, redius4, 0, 2*M_PI, NO);
    CGContextAddArc(con, radius1, 100, redius4-20, 2*M_PI, 0, YES);
    CGContextSetFillColorWithColor(con, [UIColor colorWithRed:229/255.0 green:248/255.0 blue:255/255.0 alpha:1.0].CGColor);
    CGContextFillPath(con);
    
    CGFloat redius5 = redius4 - 20;
    CGContextAddArc(con, radius1, 100, redius5, 0, 2*M_PI, NO);
//    CGContextAddArc(con, radius1, 100, redius4-20, 2*M_PI, 0, YES);
    CGContextSetFillColorWithColor(con, [UIColor colorWithRed:18/255.0 green:176/255.0 blue:226/255.0 alpha:1.0].CGColor);
    CGContextFillPath(con);

    

}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
