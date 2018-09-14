//
//  CView.h
//  EventsThroughSuchAsDiDi-Demo
//
//  Created by 许必杨 on 2018/9/14.
//  Copyright © 2018年 xby023. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CView : UIView

@property (nonatomic ,copy) void(^InfoBlock)(NSString *info);

@end
