//
//  YFCollectionViewTool.m
//  CollectionViewDemo
//
//  Created by zyh on 15/12/25.
//  Copyright © 2015年 zyh. All rights reserved.
//

#import "YFCollectionViewTool.h"

@implementation YFCollectionViewTool

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.yfCollectionViewToolDataList = [[NSMutableArray alloc]init];
        
        self.itemSize = CGSizeMake(80, 80);//默认itemSize
        self.headerViewSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 45);//默认的headerViewSize
        self.footerViewSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 45);//默认的footerViewSize

    }
    return self;
}
//设置item的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSString *classStr = NSStringFromClass(self.collectionViewCellClass);
    //注册cell
    UINib *nib = [UINib nibWithNibName:classStr bundle:nil];
    
    [collectionView registerNib:nib forCellWithReuseIdentifier:classStr];
    //注册headerView
    NSString *headerViewClassStr = NSStringFromClass(self.collectionViewHeaderView);
    UINib *headerNib = [UINib nibWithNibName:headerViewClassStr bundle:nil];
    [collectionView registerNib:headerNib forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerViewClassStr];
    //注册footerView
    NSString *footerViewClassStr = NSStringFromClass(self.collectionViewFooterView);
    UINib *footerNib = [UINib nibWithNibName:footerViewClassStr bundle:nil];
    [collectionView registerNib:footerNib forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerViewClassStr];
    return self.yfCollectionViewToolDataList.count;
}

//设置itemSize
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.itemSize;
}


//设置CollectionViewCell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    id object = [self.yfCollectionViewToolDataList objectAtIndex:[indexPath row]];
    id cell = [self.yfCollectViewDelegate yfCollectionViewCellFitByObject:object AtIndexPath:indexPath];
    return cell;
}
//Cell点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    id object = [self.yfCollectionViewToolDataList objectAtIndex:[indexPath row]];
    [self.yfCollectViewDelegate yfCollectionViewSelectedObject:object AtIndex:[indexPath row]];
}
//header and footer view
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    id object = [self.yfCollectionViewToolDataList objectAtIndex:[indexPath row]];
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        return [self.yfCollectViewDelegate yfCollectionViewHeaderOrFooterViewFitByObject:object headerOrFooterKind:kind AtIndexPath:indexPath];
    }else if ([kind isEqualToString:UICollectionElementKindSectionFooter])
    {
        return [self.yfCollectViewDelegate yfCollectionViewHeaderOrFooterViewFitByObject:object headerOrFooterKind:kind AtIndexPath:indexPath];
    }
    return nil;
    
}
//返回头headerView的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    return self.headerViewSize;
}
//返回头footerView的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return self.footerViewSize;
}


@end
