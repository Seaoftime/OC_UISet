//
//  ZRContentModel.h
//  CellOpenClosed
//
//  Created by ZhongMeng on 17/2/20.
//  Copyright © 2017年 RuiZhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZRContentModel : NSObject

@property (nonatomic, copy) NSString *contentStt;

+ (instancetype)initContentWithDict:(NSDictionary *)dict;

- (instancetype)initWithDic:(NSDictionary *)dic;


@end
