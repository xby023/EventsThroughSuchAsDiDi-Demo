//
//  UITableView+Response.m
//  EventsThroughSuchAsDiDi-Demo
//
//  Created by 许必杨 on 2018/9/14.
//  Copyright © 2018年 xby023. All rights reserved.
//

#import "UITableView+Response.h"

@implementation UITableView (Response)

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    
    //KSCREEN_HEIGHT - 300 - 110 - KNAV_SPACE
    
    //在空白处可以滑动地图
    
    NSLog(@"y -- %f",point.y);
    
    if (point.y <= (KSCREEN_HEIGHT - 300)) {
        return nil;
    }else{
        return self;
    }
}

@end
