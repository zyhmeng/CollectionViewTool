//
//  EasyTableViewDelegate.m
//  abc
//
//  Created by jangbuk on 15/12/1.
//  Copyright © 2015年 jangbuk. All rights reserved.
//

#import "EasyTableViewTool.h"

@implementation EasyTableViewTool
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.easyTableViewDataList=[[NSMutableArray alloc] init];
        self.easyTableViewHeight=44;//默认高度
    }
    return self;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id object=[self.easyTableViewDataList objectAtIndex:[indexPath row]];
    id cell=    [self.delegate easyTableViewCellFitByObject:object AtIndex:[indexPath row]];

    return cell;
}

//列表中元素个数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.easyTableViewDataList.count;
}

//单元高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.easyTableViewHeight;
}

//点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    id object=[self.easyTableViewDataList objectAtIndex:[indexPath row]];
    [self.delegate easyTableViewSelectedObject:object AtIndex:[indexPath row]];
}



@end
