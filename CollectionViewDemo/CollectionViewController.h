//
//  CollectionViewController.h
//  PropMng
//
//  Created by zyh on 15/12/25.
//  Copyright © 2015年 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewController : UIViewController

@property (nonatomic, strong) NSMutableArray *dataList;

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@end
