//
//  ZRTitleModel.h
//  CellOpenClosed
//
//  Created by ZhongMeng on 17/2/20.
//  Copyright © 2017年 RuiZhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZRTitleModel : NSObject

@property (nonatomic, assign, getter = isOpened) BOOL opened;
@property (nonatomic, strong) NSArray *infoArray;
@property (nonatomic, copy)   NSString *titleStt;


+ (instancetype)initTitleWithDict:(NSDictionary *)dict;

- (instancetype)initWithDic:(NSDictionary *)dic;



@end
