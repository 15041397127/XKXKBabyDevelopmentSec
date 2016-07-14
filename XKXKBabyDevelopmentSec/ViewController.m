//
//  ViewController.m
//  XKXKBabyDevelopmentSec
//
//  Created by 张旭 on 16/6/20.
//  Copyright © 2016年 zhangXu. All rights reserved.
//

#import "ViewController.h"
#import "XKCircleMacros.h"
#import "XKView.h"
#import "XKCircleCell.h"
#import "XKCollectionViewLayout.h"
#import "XKCollectionView.h"
#import "XKBezierPathView.h"
#import "KTOneFingerRotationGestureRecognizer.h"
#import "RometeView.h"
@interface ViewController ()
<UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate,UIScrollViewAccessibilityDelegate>
@property (nonatomic ,strong)XKView *drawBackView;
@property (nonatomic ,strong)XKCollectionView *collectionView;
@property (nonatomic ,strong)XKCollectionViewLayout *layout;
@property (nonatomic, assign) CGFloat interitemSpacing;
@property (nonatomic, assign) int              stepNum;
@property (nonatomic, assign) int              value;
@property (nonatomic, assign) BOOL             scrollByHand;
@property (nonatomic, assign) float realValue;
@property (nonatomic, assign ,readonly) int minValue;
@property (nonatomic, assign ,readonly) int maxValue;
@property (nonatomic, assign ,readonly) int step;
@property (nonatomic, assign ,readonly) int num1;
@end
static NSString *XKCellId = @"cellId";
@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    _drawBackView = [[XKView  alloc]initWithFrame:CGRectMake(0,0,  XKUIScreenwidth,  XKUIScreenheight)];
    
    self.view.backgroundColor =[UIColor colorWithRed:32/255.0 green:180/255.0 blue:230/255.0 alpha:1.0];
    
    [self.view addSubview:_drawBackView];

    _layout = [[XKCollectionViewLayout alloc]init];
//    RometeView *romate = [RometeView sharedRometeView];
//    romate.center = CGPointMake(self.view.bounds.size.width/2, 100);
//    romate.backgroundColor = [UIColor clearColor];
//    [self.view addSubview:romate];
    _collectionView = [[XKCollectionView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.width)
                                                        collectionViewLayout:_layout];
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.backgroundColor = [UIColor clearColor];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
//    self.collectionView.decelerationRate = UIScrollViewDecelerationRateFast;
    self.collectionView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [_collectionView registerClass:[XKCircleCell class]
       forCellWithReuseIdentifier:XKCellId];

   [self.view addSubview:_collectionView];
    
    _minValue = 100;
    _maxValue = 0;
    _step = 100;
    _stepNum = (_maxValue-_minValue)/_step/10;
    _scrollByHand = NO;
    // Do any additional setup after loading the view, typically from a nib.
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

#pragma mark - UICollectionView DataSource & Delegate Methods
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
     return 129;
  
    
    

    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
        XKCircleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:XKCellId                                                                          forIndexPath:indexPath];

 
        cell.titleLabel.text = @"0个月";
        
        if (indexPath.row%4==0&&indexPath.row<=99) {
            
            for (int i=0; i<indexPath.row/4; i++) {
                
                cell.titleLabel.text = [NSString stringWithFormat:@"%d个月",i+1];
                
            }
            cell.rulerView.frame = CGRectMake(0, 5.5, 10, 1);
        }else if (indexPath.row == 100){
            cell.titleLabel.text = @"2岁半";
            cell.rulerView.frame = CGRectMake(0, 5.5, 10, 1);
        }else if (indexPath.row == 104){
            cell.titleLabel.text = @"3周岁";
            cell.rulerView.frame = CGRectMake(0, 5.5, 10, 1);
        }else if (indexPath.row == 108){
            cell.titleLabel.text = @"3岁半";
            cell.rulerView.frame = CGRectMake(0, 5.5, 10, 1);
        }else if (indexPath.row == 112){
            cell.titleLabel.text = @"4周岁";
            cell.rulerView.frame = CGRectMake(0, 5.5, 10, 1);
        }else if (indexPath.row == 116){
            cell.titleLabel.text = @"4岁半";
            cell.rulerView.frame = CGRectMake(0, 5.5, 10, 1);
        }else if (indexPath.row == 120){
            cell.titleLabel.text = @"5周岁";
            cell.rulerView.frame = CGRectMake(0, 5.5, 10, 1);
        }else if (indexPath.row == 124){
            cell.titleLabel.text = @"5岁半";
            cell.rulerView.frame = CGRectMake(0, 5.5, 10, 1);
        }else if (indexPath.row == 128){
            cell.titleLabel.text = @"6周岁";
            cell.rulerView.frame = CGRectMake(0, 5.5, 10, 1);
        }else{
            cell.rulerView.frame = CGRectMake(0, 5.5, 5, 1);
            cell.titleLabel.text = @"";
        }
        
        if (indexPath.row>=101) {
            if (!(indexPath.row%2==0)) {
                
                cell.rulerView.frame = CGRectMake(0, 5.5, 0, 0);
            }
        }
  

         return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@", @(indexPath.row));
    [self selectItem:indexPath.item animated:YES];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{

    
    return CGSizeMake(20, 12);

}


/**
 *  设置滚动锚点
 */

- (CGFloat)offsetForItem:(NSUInteger)item
{

    CGFloat offset = 0.0;
    for (NSInteger i = 0; i < item; i++) {
        NSIndexPath *_indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        XKCircleCell *cell = (XKCircleCell *)[self.collectionView cellForItemAtIndexPath:_indexPath];
//        offset += cell.bounds.size.width/2;
        offset =offset+((XKUIScreenwidth/2+12)*M_PI)/10;

//        NSLog(@"**********%f",offset);
    }
    
    if (item>=101) {
        if (!(item%2==0)) {
            
             offset =offset-((XKUIScreenwidth/2+12)*M_PI)/10;
        }
    }
    
   
    NSIndexPath *firstIndexPath = [NSIndexPath indexPathForItem:0 inSection:0];
    CGSize firstSize = [self.collectionView cellForItemAtIndexPath:firstIndexPath].bounds.size;
    NSIndexPath *selectedIndexPath = [NSIndexPath indexPathForItem:item inSection:0];
    CGSize selectedSize = [self.collectionView cellForItemAtIndexPath:selectedIndexPath].bounds.size;
//    offset -= (firstSize.width-selectedSize.width)/2-3;
// 
//    
//    offset += self.interitemSpacing * item-3;
    
//    offset -=((XKUIScreenwidth/2+12)*M_PI)/10 ;
//    
//    offset +=((XKUIScreenwidth/2+12)*M_PI)/10 ;
    
//    offset =offset+((XKUIScreenwidth/2+12)*M_PI)/10;
  
    return offset;
}

- (void)scrollToItem:(NSUInteger)item animated:(BOOL)animated
{
    
    
    
    if (item<=10) {
        [self.collectionView setContentOffset:CGPointMake([self offsetForItem:item],
                                                          self.collectionView.contentOffset.y)
                                     animated:animated];
        
    }else if(item>=10&&item<=30){
        [self.collectionView setContentOffset:CGPointMake([self offsetForItem:item]-3.5,
                                                          self.collectionView.contentOffset.y)
                                     animated:animated];
        
    }else if (item>30&&item<=40){
        [self.collectionView setContentOffset:CGPointMake([self offsetForItem:item]-4.5,
                                                          self.collectionView.contentOffset.y)
                                     animated:animated];
    }else if (item>40&&item<=50){
        [self.collectionView setContentOffset:CGPointMake([self offsetForItem:item]-6,
                                                          self.collectionView.contentOffset.y)
                                     animated:animated];
    }else if (item>50&&item<=60){
        [self.collectionView setContentOffset:CGPointMake([self offsetForItem:item]-7,
                                                          self.collectionView.contentOffset.y)
                                     animated:animated];
    }else if (item>60&&item<=70){
        [self.collectionView setContentOffset:CGPointMake([self offsetForItem:item]-12,
                                                          self.collectionView.contentOffset.y)
                                     animated:animated];
    }else if (item>71&&item<=81){
        [self.collectionView setContentOffset:CGPointMake([self offsetForItem:item]-12,
                                                          self.collectionView.contentOffset.y)
                                     animated:animated];
    }else if (item>81&&item<=91){
        [self.collectionView setContentOffset:CGPointMake([self offsetForItem:item]-12,
                                                          self.collectionView.contentOffset.y)
                                     animated:animated];
    }else if (item>91&&item<100){
        [self.collectionView setContentOffset:CGPointMake([self offsetForItem:item]-15,
                                                          self.collectionView.contentOffset.y)
                                     animated:animated];
    }else if (item>=100&&item<128){
        [self.collectionView setContentOffset:CGPointMake([self offsetForItem:item]-15,
                                                          self.collectionView.contentOffset.y)
                                     animated:animated];
    }




   
}

- (void)selectItem:(NSUInteger)item animated:(BOOL)animated
{
    [self.collectionView selectItemAtIndexPath:[NSIndexPath indexPathForItem:item inSection:0]
                                      animated:animated
                                scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
    [self scrollToItem:item animated:animated];

}

- (void)didEndScrolling
{
    for (NSUInteger i = 0; i < [self collectionView:self.collectionView numberOfItemsInSection:0]; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        XKCircleCell *cell = (XKCircleCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        
        
        if ([self offsetForItem:i] + ((XKUIScreenwidth/2+12)*M_PI)/10  > _collectionView.contentOffset.x) {
            [self selectItem:i animated:YES];
//            [self scrollToItem:i animated:YES];
            break;
        }
    }
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self didEndScrolling];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate) [self didEndScrolling];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [CATransaction begin];
    [CATransaction setValue:(id)kCFBooleanTrue
                     forKey:kCATransactionDisableActions];
    self.collectionView.layer.mask.frame = self.collectionView.bounds;
    [CATransaction commit];
    
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
