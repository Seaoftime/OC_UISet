//
//  ZRTitleModel.m
//  CellOpenClosed
//
//  Created by ZhongMeng on 17/2/20.
//  Copyright © 2017年 RuiZhang. All rights reserved.
//

#import "ZRTitleModel.h"

#import "ZRContentModel.h"

@implementation ZRTitleModel


+ (instancetype)initTitleWithDict:(NSDictionary *)dict {

    return [[self alloc] initWithDic:dict];
}

- (instancetype)initWithDic:(NSDictionary *)dic {

    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dic];
        
        NSMutableArray *addArray = [NSMutableArray array];
        for (NSDictionary *dict in _infoArray) {
            
            ZRContentModel *contentModel = [ZRContentModel initContentWithDict:dict];
            [addArray addObject:contentModel];
        }
        _infoArray = addArray;
    }
    return self;

}





@end
