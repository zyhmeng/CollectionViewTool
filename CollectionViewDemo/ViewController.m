//
//  ViewController.m
//  CollectionViewDemo
//
//  Created by zyh on 15/12/25.
//  Copyright © 2015年 zyh. All rights reserved.
//

#import "ViewController.h"
#include "CustomCollectionViewCell.h"
#import "CollectionSectionHeaerView.h"
#import "CollectionSectionFooterView.h"
#import "CollectionViewController.h"
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *collectView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 100);
    layout.itemSize = CGSizeMake(180, 100);
    
    collectView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:collectView];

    collectView.delegate = self;
    collectView.dataSource = self;
    
    
    UINib *cellNib = [UINib nibWithNibName:@"CustomCollectionViewCell" bundle:nil];
    [collectView registerNib:cellNib forCellWithReuseIdentifier:@"CustomCollectionViewCell"];
    UINib *headerNib = [UINib nibWithNibName:@"CollectionSectionHeaerView" bundle:nil];
    [collectView registerNib:headerNib forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CollectionSectionHeaerView"];
    UINib *footerNib = [UINib nibWithNibName:@"CollectionSectionFooterView" bundle:nil];
    [collectView registerNib:footerNib forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"CollectionSectionFooterView"];
    [collectView reloadData];
    

}
#pragma mark- UICollectionView代理方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return 6;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCollectionViewCell *cell = (CustomCollectionViewCell *)[collectView dequeueReusableCellWithReuseIdentifier:@"CustomCollectionViewCell" forIndexPath:indexPath];
    cell.cellLable.text = [NSString stringWithFormat:@"{Section%ld,Row%ld}",(long)indexPath.section,(long)indexPath.row];
    
    return cell;
}


-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        CollectionSectionHeaerView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CollectionSectionHeaerView" forIndexPath:indexPath];
        return headerView;
    }else if ([kind isEqualToString:UICollectionElementKindSectionFooter])
    {
        CollectionSectionFooterView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"CollectionSectionFooterView" forIndexPath:indexPath];
        return footer;
        
    }
    return nil;
}


#pragma mark - UICollectionViewDelegateFlowLayout
//定义每个UICollectionViewCell 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(160, 100);
}
//定义每个Section 的 margin
//-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
//    return UIEdgeInsetsMake(15, 15, 5, 15);//分别为上、左、下、右
//}
//返回头headerView的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGSize size={320,45};
    return size;
}
//返回头footerView的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    CGSize size={320,45};
    return size;
}
////每个section中不同的行之间的行间距
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 10;
//}
//每个item之间的间距
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 100;
//}
//选择了某个cell
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

//    NSString *message = [NSString stringWithFormat:@"Section%ld, Row%ld",(long)indexPath.section,(long)indexPath.row];
//    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"点击了CollectionView" message: message delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
//
//    [alertView show];
    CollectionViewController *collectionVC = [[CollectionViewController alloc]init];
    [self.navigationController pushViewController:collectionVC animated:YES];
}
//取消选择了某个cell
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
//    [cell setBackgroundColor:[UIColor redColor]];
}
@end
