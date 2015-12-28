//
//  YFCollectionViewTool.h
//  CollectionViewDemo
//
//  Created by zyh on 15/12/25.
//  Copyright © 2015年 zyh. All rights reserved.
//
/**
 *   YFCollectionViewTool
 *
 *   self.yfCollectionViewTool = [[YFCollectionViewTool alloc]init];
 *
 *   //设置delegate
 *   self.yfCollectionViewTool.yfCollectViewDelegate = self;
 *   self.collectionView.delegate = self.yfCollectionViewTool;
 *   self.collectionView.dataSource =self.yfCollectionViewTool;
 
 *   //获得数据
 *   self.yfCollectionViewTool.yfCollectionViewToolDataList = self.dataList;
 */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol YFCollectionViewToolDelegate <NSObject>
@optional
/**
 *  列表选中了某个元素object 和 所在列表的索引
 *
 *  @param object 该Cell需要展示的数据模型
 *  @param index  索引
 */
- (void)yfCollectionViewSelectedObject:(id)object AtIndex:(NSInteger)index;
/**
 *  设置Cell样式，并且匹配相应的数据后返回Cell
 *
 *  @param object 该Cell需要展示的数据模型
 *  @param indexPath  索引
 *
 *  @return 自定义CollectionViewCell类型的实例
 */
- (UICollectionViewCell *)yfCollectionViewCellFitByObject:(id)object AtIndexPath:(NSIndexPath *)indexPath;
/**
 *  设置headerView and footerView
 *
 *  @param object    header and footer的数据模型
 *  @param kind      header or footer kind
 *  @param indexPath 索引
 *
 *  @return headerView or footerView
 */
- (UICollectionReusableView *)yfCollectionViewHeaderOrFooterViewFitByObject:(id)object headerOrFooterKind:(NSString *)kind AtIndexPath:(NSIndexPath *)indexPath;
@end

//代理执行类
@interface YFCollectionViewTool : NSObject<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
/**
 *  数据源
 */
@property (nonatomic, strong) NSMutableArray *yfCollectionViewToolDataList;
/**
 *  需要设置itemSize，
 */
@property (nonatomic, assign) CGSize itemSize;

@property (nonatomic, assign) CGSize headerViewSize;
@property (nonatomic, assign) CGSize footerViewSize;
/**
 *  设置需要注册的Cell的类名
 */
@property (nonatomic, strong) Class collectionViewCellClass;
/**
 *  设置需要注册的headerView的类名
 */
@property (nonatomic, strong) Class collectionViewHeaderView;
/**
 *  设置需要注册的footerView的类名
 */
@property (nonatomic, strong) Class collectionViewFooterView;

@property (nonatomic, weak) id<YFCollectionViewToolDelegate>yfCollectViewDelegate;
@end
