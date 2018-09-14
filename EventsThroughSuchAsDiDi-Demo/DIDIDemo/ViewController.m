//
//  ViewController.m
//  EventsThroughSuchAsDiDi-Demo
//
//  Created by 许必杨 on 2018/9/14.
//  Copyright © 2018年 xby023. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MKMapView+ZoomLevel.h"
#import "TestViewController.h"
#import "NavBarView.h"
#import "UITableView+Response.h"

#import "InfoCell.h"
#import "EnterAddressCell.h"
#import "AlertCell.h"

#define GEORGIA_TECH_LATITUDE 33.777328
#define GEORGIA_TECH_LONGITUDE -84.397348

#define ZOOM_LEVEL 14

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) MKMapView *mapView;

@property (nonatomic ,strong) CLLocationManager *locationManager;

@property (nonatomic ,strong) NavBarView *navBarView;

@property (nonatomic,strong) UITableView *tableView;

@end

/*
 知识点
 
 事件链: UIApplication对象——>UIWindow对象——>rootVC.view对象——>view子对象1,View子对象2...。
 相应链:
       相应事件的View userInteractionEnabled必须为YES
       响应过程是和事件传递过程相反的。
       如果点击事件是在View1的范围内，就View来响应。不能响应就往上传传递.
       事件并不一定会传递给每一个子view，因为window是通过hitTest方法来判断点击事件发生在哪个view上面的，如果它第一个hitTest就命中了red view的话，这个事件就不会再被传递给blue view了
 */

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//
//    TestViewController *testVC = [[TestViewController alloc]init];
//    [self.navigationController pushViewController:testVC animated:YES];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapView = [[MKMapView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:self.mapView];
    
    self.mapView.mapType = MKMapTypeStandard;
    self.mapView.showsUserLocation = YES;
    self.mapView.showsTraffic = YES;
    self.mapView.showsBuildings = YES;
    self.mapView.showsPointsOfInterest = YES;
    
    //设置userTrackingMode 会自动缩放和显示定位方向
    self.mapView.userTrackingMode = MKUserTrackingModeFollowWithHeading;
    
    if ([CLLocationManager locationServicesEnabled]) {
        self.locationManager = [[CLLocationManager alloc]init];
        [self.locationManager requestAlwaysAuthorization];
        [self.locationManager requestWhenInUseAuthorization];
        self.locationManager.distanceFilter = 5;
        [self.locationManager startUpdatingLocation];
    }
    
    //添加头部
    [self.view addSubview:self.navBarView];
    [self.view addSubview:self.tableView];
       
}

- (NavBarView *)navBarView{
    if (!_navBarView) {
        _navBarView = [[NSBundle mainBundle] loadNibNamed:@"NavBarView" owner:self options:nil].lastObject;
        _navBarView.frame = CGRectMake(0, 0, KSCREEN_WIDTH, 110 + KNAV_SPACE);
    }
    return _navBarView;
}

#pragma mark ==================================== tableView ===================================

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
        return cell;
    }else{
        if (indexPath.row == 0) {
            InfoCell *cell = [tableView dequeueReusableCellWithIdentifier:KcellIdentifer_InfoCell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }else if (indexPath.row == 1) {
            EnterAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:KcellIdentifer_EnterAddressCell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }else{
            AlertCell *cell = [tableView dequeueReusableCellWithIdentifier:KcellIdentifer_AlertCell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return 3;
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return KSCREEN_HEIGHT - 300;
    }else{
        if (indexPath.row == 0) {
            return 61;
        }else if (indexPath.row == 1){
            return 165;
        }else{
            return 103;
        }
        
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 1) {
        TestViewController *testVC = [[TestViewController alloc]init];
        [self.navigationController pushViewController:testVC animated:YES];
    }
}

#pragma mark ====================================getter===================================

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0,KSCREEN_WIDTH,KSCREEN_HEIGHT)];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.delegate = self;
        _tableView.dataSource  = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([InfoCell class]) bundle:nil] forCellReuseIdentifier:KcellIdentifer_InfoCell];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([EnterAddressCell class]) bundle:nil] forCellReuseIdentifier:KcellIdentifer_EnterAddressCell];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([AlertCell class]) bundle:nil] forCellReuseIdentifier:KcellIdentifer_AlertCell];
        
        
        
    }
    return _tableView;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
