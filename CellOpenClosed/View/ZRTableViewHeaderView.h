//
//  ZRTableViewHeaderView.h
//  CellOpenClosed
//
//  Created by ZhongMeng on 17/2/20.
//  Copyright © 2017年 RuiZhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZRTitleModel;

@protocol ZRHeaderViewDelegate <NSObject>

@optional
- (void)tableHeaderViewIsClicked;

@end

@interface ZRTableViewHeaderView : UITableViewHeaderFooterView

@property (nonatomic, weak) id<ZRHeaderViewDelegate> headerDelegate;

@property (nonatomic, strong) ZRTitleModel *titleModel;


+ (instancetype)headerViewWithTableView:(UITableView *)tableView;


@end
