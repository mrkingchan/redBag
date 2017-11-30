//
//  RedBagView.m
//  redBag
//
//  Created by Chan on 2017/4/13.
//  Copyright © 2017年 Chan. All rights reserved.
//
#define kScreenWidth         [UIScreen mainScreen].bounds.size.width
#define kScreenHeight          [UIScreen mainScreen].bounds.size.height
#define kcellID @"cell"
#import "RedBagView.h"

@interface RedBagView()<UICollectionViewDataSource,UICollectionViewDelegate>{
    UICollectionView *_collectionView;
    NSArray  *_dataArray;
}

@end

@implementation RedBagView

+ (RedBagView *)redBagViwWithDataSource:(NSArray *)dataArray withcomplete:(void (^)(NSInteger))complete {
    RedBagView *view = [[RedBagView alloc] initWithDataSource:dataArray withcomplete:complete];
    return view;
}

- (instancetype)initWithDataSource:(NSArray *)dataArray withcomplete:(void (^)(NSInteger))complete {
    self = [super initWithFrame:[[UIScreen  mainScreen] bounds]];
    if (self) {
        _complete = complete;
        _dataArray = dataArray;
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
        [self setUI];
        [[UIApplication  sharedApplication].keyWindow addSubview:self];
    }
    return self;
}

///初始化UI
- (void)setUI {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.itemSize = CGSizeMake(80, 80);
        layout.minimumLineSpacing = 5;
        layout.minimumInteritemSpacing = 5.0;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake((kScreenWidth - 250)/2, -400, 250 , 400) collectionViewLayout:layout];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kcellID];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [self addSubview:_collectionView];
    }
    ///动画效果
    [UIView animateWithDuration:0.6
                     animations:^{
                         _collectionView.frame = CGRectMake((kScreenWidth - 250)/2, (kScreenHeight - 400)/2, 250, 400);
                     } completion:nil];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kcellID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor orangeColor];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    if (_complete) {
        _complete(indexPath.row);
    }
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [UIView animateWithDuration:0.5 animations:^{
        CGRect frame = _collectionView.frame;
        frame.origin.y = -400;
        _collectionView.frame = frame;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
@end
