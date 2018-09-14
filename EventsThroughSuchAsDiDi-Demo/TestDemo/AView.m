//
//  AView.m
//  EventsThroughSuchAsDiDi-Demo
//
//  Created by 许必杨 on 2018/9/14.
//  Copyright © 2018年 xby023. All rights reserved.
//

#import "AView.h"

@implementation AView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, KNAV_HEIGHT + 50, 80, 30)];
        titleLabel.font = [UIFont systemFontOfSize:16];
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.text = @"AView";
        [self addSubview:titleLabel];
        
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSMutableString *info = [NSMutableString string];
    [info appendString:@"===========\n"];
    UIResponder *next = [self nextResponder];
    [info appendString:[NSString stringWithFormat:@"%@",self.class]];
    [info appendString:@"\n"];
    while (next) {
        [info appendString:[NSString stringWithFormat:@"%@",next.class]];
        [info appendString:@"\n"];
        next = [next nextResponder];
    }
    [info appendString:@"\n\n"];
    if (self.InfoBlock) {
        self.InfoBlock(info);
    }
}

@end
