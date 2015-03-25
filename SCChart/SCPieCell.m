//
//  SCPieCell.m
//  SCChart
//
//  Created by 2014-763 on 15/3/24.
//  Copyright (c) 2015年 meilishuo. All rights reserved.
//

#import "SCPieCell.h"
#import "SCChart.h"

@interface SCPieCell()
{
    SCPieChart *chartView;
}
@end

@implementation SCPieCell

- (void)configUI:(NSIndexPath *)indexPath {
    if (chartView) {
        [chartView removeFromSuperview];
        chartView = nil;
    }
    NSArray *items = @[[SCPieChartDataItem dataItemWithValue:10 color:SCRed description:@"A"],
                       [SCPieChartDataItem dataItemWithValue:20 color:SCBlue description:@"B"],
                       [SCPieChartDataItem dataItemWithValue:40 color:SCGreen description:@"C"],
                       ];
    
    chartView = [[SCPieChart alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-150)/2, (self.frame.size.height-150)/2, 150.0, 150.0) items:items];
    chartView.descriptionTextColor = [UIColor whiteColor];
    chartView.descriptionTextFont  = [UIFont fontWithName:@"Avenir-Medium" size:12.0];
    [chartView strokeChart];
    [self addSubview:chartView];
}

@end
