//
//  ViewController.m
//  CellOpenClosed
//
//  Created by ZhongMeng on 17/2/20.
//  Copyright © 2017年 RuiZhang. All rights reserved.
//

#import "ViewController.h"

#import "ZRTableViewHeaderView.h"
#import "ZRContentTableViewCell.h"
#import "ZRTitleModel.h"
#import "ZRContentModel.h"

#define kSCREENW  ([[UIScreen mainScreen] bounds].size.width)
#define kSCREENH  ([[UIScreen mainScreen] bounds].size.height)


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,ZRHeaderViewDelegate>

@property (nonatomic, strong) UITableView *openClosedtableView;
@property (nonatomic, strong) NSMutableArray *answersArray;
@property (nonatomic, assign) CGSize textSize;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupUI];
    
    [self loadCellData];
}


#pragma mark ------------------------ UI

- (void)setupUI {

    [self.view addSubview:self.openClosedtableView];
    
}

- (UITableView *)openClosedtableView {

    if (!_openClosedtableView) {
        _openClosedtableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kSCREENW, kSCREENH - 64)];
        
        _openClosedtableView.delegate = self;
        _openClosedtableView.dataSource = self;
        _openClosedtableView.sectionHeaderHeight = 50;
        
        _openClosedtableView.separatorStyle = UITableViewCellSelectionStyleNone;
    }
    return _openClosedtableView;

}

#pragma mark ------------------------ 数据
- (void)loadCellData {
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"contentInfo.plist" withExtension:nil];
    
    NSArray *tempArray = [NSArray arrayWithContentsOfURL:url];
    
    self.answersArray = [NSMutableArray array];
    
    for (NSDictionary *dict in tempArray) {
        
        ZRTitleModel *titleModel = [ZRTitleModel initTitleWithDict:dict];
        
        [self.answersArray addObject:titleModel];
        
    }
    
}


- (NSMutableArray *)answersArray {
    if (!_answersArray) {
        self.answersArray = [NSMutableArray array];
    }
    return _answersArray;
}



#pragma mark ---------------- tableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.answersArray.count;
    //return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    ZRTitleModel *titleModel = self.answersArray[section];
    NSInteger sectionCount = titleModel.isOpened ? titleModel.infoArray.count : 0;
    
    return sectionCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"cellID";
    
    ZRContentTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ZRContentTableViewCell" owner:self options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    ZRTitleModel *titleModel = self.answersArray[indexPath.section];
    
    ZRContentModel *answerModel = titleModel.infoArray[indexPath.row];
    
    cell.contentTextV.text = answerModel.contentStt;
    
    self.textSize = [self getLabelSizeFortextFont:[UIFont systemFontOfSize:16] textLabel:answerModel.contentStt];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return self.textSize.height ;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    ZRTableViewHeaderView *headerView = [ZRTableViewHeaderView headerViewWithTableView:tableView];
    
    headerView.headerDelegate = self;
    headerView.titleModel = self.answersArray[section];
    
    return headerView;
}


#pragma mark ---------------- headerView Delegate

- (void)tableHeaderViewIsClicked {
    
    [self.openClosedtableView reloadData];
}


- (CGSize)getLabelSizeFortextFont:(UIFont *)font textLabel:(NSString *)text {
    
    NSDictionary * totalMoneydic = [NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName,nil];
    CGSize totalMoneySize =[text boundingRectWithSize:CGSizeMake(kSCREENW - 16,1000) options:NSStringDrawingUsesLineFragmentOrigin  attributes:totalMoneydic context:nil].size;
    
    return totalMoneySize;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
