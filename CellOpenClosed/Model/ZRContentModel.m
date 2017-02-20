//
//  ZRContentModel.m
//  CellOpenClosed
//
//  Created by ZhongMeng on 17/2/20.
//  Copyright © 2017年 RuiZhang. All rights reserved.
//

#import "ZRContentModel.h"

@implementation ZRContentModel

+ (instancetype)initContentWithDict:(NSDictionary *)dict {

    return [[self alloc] initWithDic:dict];
}

- (instancetype)initWithDic:(NSDictionary *)dic {

    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}


@end
