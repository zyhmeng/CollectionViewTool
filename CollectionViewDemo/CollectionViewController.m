//
//  CollectionViewController.m
//  PropMng
//
//  Created by zyh on 15/12/25.
//  Copyright © 2015年 IBM. All rights reserved.
//

#import "CollectionViewController.h"
#import "YFCollectionViewTool.h"
#import "CustomCollectionViewCell.h"
#import "CollectionSectionHeaerView.h"
#import "CollectionSectionFooterView.h"
@interface CollectionViewController ()<YFCollectionViewToolDelegate>

@property (nonatomic, strong)YFCollectionViewTool *yfCollectionViewTool;


@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"CollectionDemo";
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    self.yfCollectionViewTool = [[YFCollectionViewTool alloc]init];
    self.yfCollectionViewTool.yfCollectViewDelegate = self;
    self.collectionView.delegate = self.yfCollectionViewTool;
    self.collectionView.dataSource = self.yfCollectionViewTool;
    self.yfCollectionViewTool.yfCollectionViewToolDataList = self.dataList;
    //注册cell
    self.yfCollectionViewTool.collectionViewCellClass = [CustomCollectionViewCell class];
    self.yfCollectionViewTool.collectionViewHeaderView = [CollectionSectionHeaerView class];
    self.yfCollectionViewTool.collectionViewFooterView = [CollectionSectionFooterView class];
    NSArray *dataList = [[NSMutableArray alloc]init];
    dataList = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    self.yfCollectionViewTool.yfCollectionViewToolDataList = (NSMutableArray *)dataList;
            
}
- (void)viewWillAppear:(BOOL)animated
{
    [self.tabBarController.tabBar setHidden:YES];
}

#pragma mark - YFCollectionViewToolDelegate
//item的点击事件
- (void)yfCollectionViewSelectedObject:(id)object AtIndex:(NSInteger)index
{
    NSString *str = [NSString stringWithFormat:@"%@,index%ld",object,(long)index];
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"点击事件" message:str delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
    [alertView show];
    
}
//UICollectionViewCell
- (UICollectionViewCell *)yfCollectionViewCellFitByObject:(id)object AtIndexPath:(NSIndexPath *)indexPath
{
    CustomCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"CustomCollectionViewCell" forIndexPath:indexPath];

    cell.cellLable.text = object;
    
    return cell;
}
//headerView and footerView
- (UICollectionReusableView *)yfCollectionViewHeaderOrFooterViewFitByObject:(id)object headerOrFooterKind:(NSString *)kind AtIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        CollectionSectionHeaerView *header = [self.collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"CollectionSectionHeaerView" forIndexPath:indexPath];
        return header;
    }else if ([kind isEqualToString:UICollectionElementKindSectionFooter])
    {
        CollectionSectionFooterView *footer = [self.collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"CollectionSectionFooterView" forIndexPath:indexPath];
        return footer;
    }
    return nil;
}

@end
