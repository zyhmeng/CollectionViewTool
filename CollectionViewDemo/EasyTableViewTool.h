/**
 *   
 简便创建TableView的实现工具类
 
 使用方法
 1:
 self.easyTableViewTool=[[EasyTableViewTool alloc] init];

 2:
 self.easyTableViewTool.delegate=self;
 [self.easyTableViewTool.easyTableViewDataList addObjectsFromArray:@[@"a",@"b"]];
 self.easyTableViewTool.easyTableViewHeight=80;

 3:
 self.myTableView.delegate=self.easyTableViewTool;
 self.myTableView.dataSource=self.easyTableViewTool;
 
 4:在需要调用TableView的类里，实现EasyTableViewDelegate的代理方法.
 */

#import <Foundation/Foundation.h>
#import <UIKit/UITableView.h>

@protocol EasyTableViewDelegate <NSObject>
/**
 *  列表选中了某个元素object 和 所在列表的索引
 *
 *  @param object 该行需要展示的数据模型
 *  @param index  索引
 */
@optional
-(void)easyTableViewSelectedObject:(id)object AtIndex:(NSInteger)index;

/**
 *  设置Cell样式 并 匹配数据 后返回
 *
 *  @param object 该行需要展示的数据模型
 *  @param index  索引
 *
 *  @return 自定义TableViewCell类型的实例
 */
-(UITableViewCell*)easyTableViewCellFitByObject:(id)object AtIndex:(NSInteger)index;
@end

//代理执行类
@interface  EasyTableViewTool: NSObject<UITableViewDataSource,UITableViewDelegate>
//数据源
@property (nonatomic,strong) NSMutableArray *easyTableViewDataList;

//配置项
//各个列表元素高度
@property(readwrite,assign) int easyTableViewHeight;

@property(assign,nonatomic)id<EasyTableViewDelegate> delegate;


@end





