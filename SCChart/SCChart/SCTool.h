//
//  UUTool.h
//  DataCenter
//
//  Created by 2014-763 on 15/3/12.
//  Copyright (c) 2015年 meilishuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCTool : NSObject
/**
 *  返回图表适合分的行数(4|5|6行)
 *
 *  @param rangeMax 数组中的最大值
 *
 *  @return 图表适合分的行数
 */
+(NSInteger)rowCountWithValueMax:(CGFloat)valueMax;
/**
 *  返回适合图表分布的范围内最大值
 *
 *  @param rangeMax 数组中的最大值
 *
 *  @return 图表适合的范围内最大值
 */
+(CGFloat)rangeMaxWithValueMax:(CGFloat)valueMax;
@end
