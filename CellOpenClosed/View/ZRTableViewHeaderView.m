//
//  ZRTableViewHeaderView.m
//  CellOpenClosed
//
//  Created by ZhongMeng on 17/2/20.
//  Copyright © 2017年 RuiZhang. All rights reserved.
//

#import "ZRTableViewHeaderView.h"

#import "ZRTitleModel.h"

#define kSCREENW  ([[UIScreen mainScreen] bounds].size.width)
#define kSCREENH  ([[UIScreen mainScreen] bounds].size.height)

@interface ZRTableViewHeaderView ()
{
    UIButton *_headerbgButton;
    UILabel *_numLabel;
    
}
@property (nonatomic, strong) ZRTableViewHeaderView *headerView;

@end


@implementation ZRTableViewHeaderView

+ (instancetype)headerViewWithTableView:(UITableView *)tableView {
    
    static NSString *headerId = @"header";
    ZRTableViewHeaderView *headerView;

    if (!headerView) {
        
        headerView = [[ZRTableViewHeaderView alloc] initWithReuseIdentifier:headerId];
    }
    
    return headerView;
}


- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {

    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        UIButton *bgButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [bgButton setImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
        [bgButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        bgButton.titleLabel.font = [UIFont systemFontOfSize:18];
        bgButton.imageView.contentMode = UIViewContentModeCenter;
        bgButton.imageView.clipsToBounds = NO;
        bgButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
        bgButton.contentEdgeInsets = UIEdgeInsetsMake(30, kSCREENW - 30, 30, 0);
        bgButton.titleEdgeInsets = UIEdgeInsetsMake(0, -kSCREENW + 30, 0, 50);
        [bgButton addTarget:self action:@selector(headerbgButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:bgButton];
        _headerbgButton = bgButton;
        
    }
    return self;

}

- (void)headerbgButtonClicked
{
    _titleModel.opened = !_titleModel.isOpened;
    
    if (self.headerDelegate && [self.headerDelegate respondsToSelector:@selector(tableHeaderViewIsClicked)]) {
        
        [self.headerDelegate tableHeaderViewIsClicked];
    }
}





- (void)setTitleModel:(ZRTitleModel *)titleModel {

    _titleModel = titleModel;
    
    [_headerbgButton setTitle:titleModel.titleStt forState:UIControlStateNormal];

}

- (void)didMoveToSuperview {
    
    _headerbgButton.imageView.transform = _titleModel.isOpened ? CGAffineTransformMakeRotation(M_PI_2 * 2) : CGAffineTransformMakeRotation(0);
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    _headerbgButton.frame = self.bounds;
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height - 0.5, self.frame.size.width, 0.5)];
    
    lineView.backgroundColor = [UIColor lightGrayColor];
    
    [self addSubview:lineView];
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
