//
//  UIView+Responder.m
//  EventsThroughSuchAsDiDi-Demo
//
//  Created by 许必杨 on 2018/9/14.
//  Copyright © 2018年 xby023. All rights reserved.
//

#import "UIView+Responder.h"

////交换方法
//static inline void swizzling_exchangeMethod(Class class ,SEL originalSelector, SEL swizzledSelector) {
//
//    Method originalMethod = class_getInstanceMethod(class, originalSelector);
//    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
//
//    BOOL success = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
//    if (success) {
//        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
//    }else {
//        method_exchangeImplementations(originalMethod, swizzledMethod);
//    }
//}

@implementation UIView (Responder)

//+ (void)load {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        swizzling_exchangeMethod([UIView class], @selector(touchesBegan:withEvent:), @selector(ds_touchesBegan:withEvent:));
//        swizzling_exchangeMethod([UIView class], @selector(touchesMoved:withEvent:), @selector(ds_touchesMoved:withEvent:));
//        swizzling_exchangeMethod([UIView class], @selector(touchesEnded:withEvent:), @selector(ds_touchesEnded:withEvent:));
//    });
//}
//
//
//#pragma mark -
//
//- (void)ds_touchesBegan: (NSSet *)touches withEvent: (UIEvent *)event
//{
//    NSLog(@"%@ touch begin", self.class);
//    UIResponder *next = [self nextResponder];
//    while (next) {
//        NSLog(@"%@",next.class);
//        next = [next nextResponder];
//    }
//}
//
//- (void)ds_touchesMoved: (NSSet *)touches withEvent: (UIEvent *)event
//{
//    NSLog(@"%@ touch move", self.class);
//}
//
//- (void)ds_touchesEnded: (NSSet *)touches withEvent: (UIEvent *)event
//{
//    NSLog(@"%@ touch end", self.class);
//}

@end
