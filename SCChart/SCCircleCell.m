//
//  SCCircleCell.m
//  SCChart
//
//  Created by 2014-763 on 15/3/24.
//  Copyright (c) 2015年 meilishuo. All rights reserved.
//

#import "SCCircleCell.h"
#import "SCChart.h"

@interface SCCircleCell()
{
    SCCircleChart *chartView;
}
@end

@implementation SCCircleCell

- (void)configUI:(NSIndexPath *)indexPath {
    if (chartView) {
        [chartView removeFromSuperview];
        chartView = nil;
    }
    chartView = [[SCCircleChart alloc] initWithFrame:CGRectMake(0, (self.frame.size.height-100)/2, SCREEN_WIDTH, 100.0)
                                               total:@100
                                             current:@60
                                           clockwise:YES];
    chartView.backgroundColor = [UIColor clearColor];
    [chartView setStrokeColor:SCGreen];
    [chartView strokeChart];
    [self addSubview:chartView];
}

@end
