//
//  TestViewController.m
//  EventsThroughSuchAsDiDi-Demo
//
//  Created by 许必杨 on 2018/9/14.
//  Copyright © 2018年 xby023. All rights reserved.
//

#import "TestViewController.h"
#import "AView.h"
#import "BView.h"
#import "CView.h"
#import "DView.h"
@interface TestViewController ()

@property (nonatomic,strong) UITextView *textView;

@property (nonatomic,strong) NSMutableString *infoString;

@end

@implementation TestViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Test Demo";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *clearItem = [[UIBarButtonItem alloc]initWithTitle:@"Clear" style:UIBarButtonItemStylePlain target:self action:@selector(actionForClear)];
    self.navigationItem.rightBarButtonItem = clearItem;
    
    self.infoString = [NSMutableString string];
    
    __weak __typeof(self) weakSelf = self;
    
    AView *a = [[AView alloc]initWithFrame:self.view.bounds];
    a.InfoBlock = ^(NSString *info) {
        [weakSelf.infoString appendString:info];
        self.textView.text = weakSelf.infoString;
        [self.textView scrollRangeToVisible:NSMakeRange(weakSelf.infoString.length, 1)];
    };
    [self.view addSubview:a];
    
    BView *b = [[BView alloc]initWithFrame:CGRectMake(10, KNAV_HEIGHT + 80, 150, 150)];
    b.InfoBlock = ^(NSString *info) {
        [weakSelf.infoString appendString:info];
        self.textView.text = weakSelf.infoString;
        [self.textView scrollRangeToVisible:NSMakeRange(weakSelf.infoString.length, 1)];
    };
    [a addSubview:b];
    
    CView *c = [[CView alloc]initWithFrame:CGRectMake(0, 37.5, 75, 75)];
    c.InfoBlock = ^(NSString *info) {
        [weakSelf.infoString appendString:info];
        self.textView.text = weakSelf.infoString;
        [self.textView scrollRangeToVisible:NSMakeRange(weakSelf.infoString.length, 1)];
    };
    [b addSubview:c];
    
    DView *d = [[DView alloc]initWithFrame:CGRectMake(10, KNAV_HEIGHT + 80 + 180, 150, 150)];
    d.InfoBlock = ^(NSString *info) {
        [weakSelf.infoString appendString:info];
        self.textView.text = weakSelf.infoString;
        [self.textView scrollRangeToVisible:NSMakeRange(weakSelf.infoString.length, 1)];
    };
    [a addSubview:d];
    // Do any additional setup after loading the view.
    
    self.textView = [[UITextView alloc]initWithFrame:CGRectMake(170, KNAV_HEIGHT,KSCREEN_WIDTH - 170, KSCREEN_HEIGHT - KTABBAR_SPACE - KNAV_HEIGHT)];
    self.textView.font = [UIFont systemFontOfSize:14];
    self.textView.textColor = [UIColor blackColor];
    self.textView.editable = NO;
//    self.textView.layoutManager.allowsNonContiguousLayout = YES;
    [self.view addSubview:self.textView];
    
}

#pragma mark ====================================event===================================

- (void)actionForClear{
    self.infoString = [NSMutableString string];
    self.textView.text = @"";
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
