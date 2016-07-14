//
//  XKCollectionViewLayout.m
//  XKXKBabyDevelopmentSec
//
//  Created by 张旭 on 16/6/20.
//  Copyright © 2016年 zhangXu. All rights reserved.
//

#import "XKCollectionViewLayout.h"
#import "XKCircleMacros.h"
#import "RometeView.h"
@implementation XKCollectionViewLayout

@synthesize visibleNum = _visibleNum;

- (instancetype)init{
    if (self = [super init]) {

        _itemOffset   =_itemOffset+XKCircleCellSize.height/2;//可以改变弧度
        _visibleNum   = 6;
        _itemHeight   = [UIScreen mainScreen].bounds.size.width/_visibleNum;
  

    }
    return self;
}
 

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}


- (void)prepareLayout
{
    [super prepareLayout];


    
    _cellCount = [[self collectionView] numberOfItemsInSection:0];
    if (!self.cellCount) {
        return;
    }
    
    _circleRadius =  XKUIScreenwidth/2+12;

 
    _offset = -self.collectionView.contentOffset.x / self.itemHeight;
   
    RometeView *romate = [RometeView sharedRometeView];

    romate.backgroundColor = [UIColor clearColor];
    CGFloat newIndex1 = self.offset;
    CGAffineTransform translation1;
    CGAffineTransform rotation1 = CGAffineTransformMakeRotation(-(M_PI/14+90/(self.visibleNum-1)*newIndex1*M_PI/90));
    
    romate.center = CGPointMake(self.collectionView.contentOffset.x+self.collectionView.bounds.size.width/2+self.cellSize.width/2,0);
    
    
    
    translation1 =CGAffineTransformMakeTranslation(-(self.itemOffset-XKCircleCellSize.width),0);
    
    romate.transform = CGAffineTransformConcat(translation1, rotation1);
    
    
    [self.collectionView addSubview:romate];
    
    
    
}
- (CGSize)collectionViewContentSize
{
    


    
    //横滑
    return CGSizeMake((self.cellCount-1)*self.itemHeight+self.collectionView.bounds.size.width,self.collectionView.bounds.size.width);
    
  
}

//给出所有可见元素的UICollectionViewLayoutAttributes
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    

    NSMutableArray *attributes = [NSMutableArray array];
    
    
    _cellCount = [self.collectionView numberOfItemsInSection:0];

    NSInteger firstIndex = floorf(CGRectGetMinX(rect) / self.itemHeight);
    NSInteger lastIndex = floorf(CGRectGetMaxX(rect) / self.itemHeight);
    
    NSInteger visibleFirstIndex = fmax(0, firstIndex-6);
    NSInteger visibleLastIndex = fmin( self.cellCount-1 ,lastIndex+1);
    
    for( NSInteger i = visibleFirstIndex; i <= visibleLastIndex; i++ ){
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *theAttributes = [self layoutAttributesForItemAtIndexPath:indexPath];
        
        [attributes addObject:theAttributes];
    }
    
    return [attributes copy];
}




- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{

    
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];


    
     self.cellCount = [self.collectionView numberOfItemsInSection:0];


    attributes.size = XKCircleCellSize;
    if (indexPath.section ==1) {
//        attributes.size = CGSizeMake(20, 100);
        attributes.frame = CGRectMake(20, 50, 20, 100);
        

        
    }
    

    //修正位置
    CGFloat newIndex = indexPath.item + self.offset;
    CGAffineTransform translation;
    CGAffineTransform rotation = CGAffineTransformMakeRotation(-(M_PI/2+90/(self.visibleNum-1)*newIndex*M_PI/180));


    
    attributes.center = CGPointMake(self.collectionView.contentOffset.x+self.collectionView.bounds.size.width/2+self.cellSize.width/2,0);
    
    
    
    translation =CGAffineTransformMakeTranslation(-(self.circleRadius-self.itemOffset-XKCircleCellSize.width) ,0);
    
    attributes.transform = CGAffineTransformConcat(translation, rotation);

    
    
    CGFloat fadeFactor =(1-fabs(15*newIndex/180*M_PI)*0.6);
    attributes.alpha = fadeFactor;
    
    
    

    
    return attributes;
    
    
    

}



@end
