//
//  ViewController.m
//  DJMTest
//
//  Created by 黄先超 on 2016/11/16.
//  Copyright © 2016年 DJBeauty. All rights reserved.
//

#import "ViewController.h"
#import "HXCSegmentedControl.h"
#import "GPUImage.h"
#import "SubVC.h"
#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<HXCSegmentedControlDelegate,UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) NSArray *array;
@property (weak,nonatomic) HXCSegmentedControl *segmentControl;
@property (nonatomic,assign) NSInteger curIndex;
@property (weak,nonatomic) UITableView *tableView;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.array = @[@"AVCaptureSessionPresetPhoto",
                   @"AVCaptureSessionPresetHigh",
                   @"AVCaptureSessionPresetMedium",
                   @"AVCaptureSessionPresetLow",
                   @"AVCaptureSessionPreset352x288",
                   @"AVCaptureSessionPreset640x480",
                   @"AVCaptureSessionPreset1280x720",
                   @"AVCaptureSessionPreset1920x1080",
                   @"AVCaptureSessionPresetiFrame960x540",
                   @"AVCaptureSessionPresetiFrame1280x720",
                   @"AVCaptureSessionPresetInputPriority"];
    
    HXCSegmentedControl *segmentControl = [HXCSegmentedControl segmentedControlWithFrame:CGRectMake(0, 0, Width, 50) TitleArray:@[@"still",@"video"] lineColor:[UIColor greenColor] titleColor:[UIColor blackColor] titleSelectColor:[UIColor greenColor] font:[UIFont systemFontOfSize:15] delegate:self bottomLineColor:[UIColor blackColor]];
    self.segmentControl = segmentControl;
    [self.view addSubview:segmentControl];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, Width, Height - 50) style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    self.tableView = tableView;
    [self.view addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
    {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)])
    {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentify = @"myCellIdentify";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify];
    }
    cell.textLabel.text = self.array[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.拿到curindex就知道是still还是video， 2.拿到indexPath.row就知道是哪个分辨率，然后push过去
    
    //GPUImageStillCamera + AVCaptureSessionPresetPhoto
//    if (_curIndex == 0 && indexPath.row == 0) {
    
//    }
    SubVC *subVC = [[SubVC alloc]initWithCameraModel:self.curIndex cameraQuatity:indexPath.row];
    [self.navigationController pushViewController:subVC animated:YES];

}

- (void)hxcSegmentedControl:(HXCSegmentedControl *)hxcSegmentedControl index:(NSInteger)index
{
    self.curIndex = index;
}

@end
