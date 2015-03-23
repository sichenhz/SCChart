//
//  UUTool.m
//  DataCenter
//
//  Created by 2014-763 on 15/3/12.
//  Copyright (c) 2015年 meilishuo. All rights reserved.
//

#import "SCTool.h"

@implementation SCTool

+(NSInteger)rowCountWithValueMax:(CGFloat)valueMax {
    NSInteger number1 = 0;
    NSInteger number2 = 0;
    NSInteger number3 = 0;
    NSInteger rowCount = 0;
    NSString *valueMaxStr = [NSString stringWithFormat:@"%f",valueMax];
    for (int i = 0; i < valueMaxStr.length; i++) {
        NSString *c = [NSString stringWithFormat:@"%c",[valueMaxStr characterAtIndex:i]];
        if (![c isEqualToString:@"0"]&&![c isEqualToString:@"."]) {
            if (number1 == 0) {
                number1 = [c integerValue];
                if (number1 > 2) {
                    break;
                }
            } else if (number2 == 0) {
                number2 = [c integerValue];
                if (number2 != 2) {
                    break;
                }
            } else if (number3 == 0) {
                number3 = [c integerValue];
                break;
            }
        }
    }
    if (number1 > 2) {
        switch (number1) {
            case 3:
            case 6:
            case 7:
            case 9:
                rowCount = 4;
                break;
            case 4:
            case 8:
                rowCount = 5;
                break;
            case 5:
                rowCount = 6;
            default:
                break;
        }
    } else if (number1 <= 2) {
        if (number1 == 1) {
            switch (number2) {
                case 0:
                case 1:
                case 2:
                {
                    if (number3 < 5) {
                        rowCount = 5;
                    } else if (number3 >= 5) {
                        rowCount = 6;
                    }
                    break;
                }
                case 3:
                case 4:
                    rowCount = 6;
                    break;
                case 5:
                case 6:
                case 7:
                case 8:
                case 9:
                    rowCount = 4;
                    break;
                default:
                    break;
            }
        } else if (number1 == 2) {
            switch (number2) {
                case 0:
                case 1:
                case 2:
                case 3:
                case 4:
                    rowCount = 5;
                    break;
                case 5:
                case 6:
                case 7:
                case 8:
                case 9:
                    rowCount = 6;
                    break;
                default:
                    break;
            }
        }
    }
    return rowCount;
}

+(CGFloat)rangeMaxWithValueMax:(CGFloat)valueMax {
    NSInteger number1 = 0;
    NSInteger number2 = 0;
    NSInteger number3 = 0;
    CGFloat rangeMax = 0.0;
    NSString *valueMaxStr = [NSString stringWithFormat:@"%f",valueMax];
    for (int i = 0; i < valueMaxStr.length; i++) {
        NSString *c = [NSString stringWithFormat:@"%c",[valueMaxStr characterAtIndex:i]];
        if (![c isEqualToString:@"0"]&&![c isEqualToString:@"."]) {
            if (number1 == 0) {
                number1 = [c integerValue];
                if (number1 > 2) {
                    break;
                }
            } else if (number2 == 0) {
                number2 = [c integerValue];
                if (number2 != 2) {
                    break;
                }
            } else if (number3 == 0) {
                number3 = [c integerValue];
                break;
            }
        }
    }
    if (number1 > 2) {
        switch (number1) {
            case 3:
                rangeMax = 4;
                break;
            case 4:
                rangeMax = 5;
                break;
            case 5:
                rangeMax = 6;
                break;
            case 6:
            case 7:
                rangeMax = 8;
                break;
            case 8:
            case 9:
                rangeMax = 10;
                break;
            default:
                break;
        }
    } else if (number1 <= 2) {
        if (number1 == 1) {
            switch (number2) {
                case 0:
                case 1:
                case 2:
                {
                    if (number3 < 5) {
                        rangeMax = 1.25;
                    } else if (number3 >= 5) {
                        rangeMax = 1.5;
                    }
                    break;
                }
                case 3:
                case 4:
                    rangeMax = 1.5;
                    break;
                case 5:
                case 6:
                case 7:
                case 8:
                case 9:
                    rangeMax = 2.0;
                    break;
                default:
                    break;
            }
        } else if (number1 == 2) {
            switch (number2) {
                case 0:
                case 1:
                case 2:
                case 3:
                case 4:
                    rangeMax = 2.5;
                    break;
                case 5:
                case 6:
                case 7:
                case 8:
                case 9:
                    rangeMax = 3.0;
                    break;
                default:
                    break;
            }
        }
    }
    CGFloat n = 1;
    for (int i = 0; i < valueMaxStr.length; i++) {
        if (valueMax > 1) {
            NSString *c = [NSString stringWithFormat:@"%c",[valueMaxStr characterAtIndex:i]];
            if (![c isEqualToString:@"."]) {
                n = n*10;
            } else {
                n = n/10;
                break;
            }
        } else {
            NSString *c = [NSString stringWithFormat:@"%c",[valueMaxStr characterAtIndex:i]];
            if ([c isEqualToString:@"0"]) {
                n = n/10;
            } else if (![c isEqualToString:@"."]){
                break;
            }
        }
    }
    return rangeMax*n;
}

@end
