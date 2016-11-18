//
//  SubVC.m
//  DJMTest
//
//  Created by Alex on 2016/11/16.
//  Copyright © 2016年 DJBeauty. All rights reserved.
//

#import "SubVC.h"
#import "HXCSegmentedControl.h"
#import "CameraVC.h"
@interface SubVC ()<HXCSegmentedControlDelegate,UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic) NSArray *array;
@property (weak,nonatomic) HXCSegmentedControl *segmentControl;
@property (nonatomic,assign)SubCameraModel subCameraModel;
@property (nonatomic,assign)SubCameraQuatity subCameraQuatity;
@property (nonatomic,assign) NSInteger curIndex;
@property (weak,nonatomic) UITableView *tableView;

@end

#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height

@implementation SubVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.title = @"fillMode";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = NO;
}

- (instancetype)initWithCameraModel:(SubCameraModel)subCameraModel
                      cameraQuatity:(SubCameraQuatity)subCameraQuatity{
    
    if (!(self = [super init])) return nil;
    self.subCameraModel = subCameraModel;
    self.subCameraQuatity = subCameraQuatity;
    return self;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"subfiilModel:%ld",self.subCameraModel);
    NSLog(@"subCamera:%ld",self.subCameraQuatity);
    
    self.array = @[@"kGPUImageFillModeStretch",
                   @"kGPUImageFillModePreserveAspectRatio",
                   @"kGPUImageFillModePreserveAspectRatioAndFill"];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Width, Height) style:UITableViewStylePlain];
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
    // 拿到indexPath.row就知道是哪个模式，然后push过去
    
    //GPUImageStillCamera + AVCaptureSessionPresetPhoto
    
    int subCameraModel = self.subCameraModel;
    int subCameraQuatity = self.subCameraQuatity;
    CameraVC *vc = [[CameraVC alloc]initWithCameraModel:subCameraModel
                                          cameraQuatity:subCameraQuatity
                                              fillModel:indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
    
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
