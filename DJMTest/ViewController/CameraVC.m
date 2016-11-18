//
//  CameraVC.m
//  DJMTest
//
//  Created by Alex on 2016/11/17.
//  Copyright © 2016年 DJBeauty. All rights reserved.
//

#import "CameraVC.h"
#import "GPUImage.h"
#import <AssetsLibrary/ALAssetsLibrary.h>

@interface CameraVC ()

@property (nonatomic,strong) GPUImageStillCamera *pCamera;
@property (nonatomic,strong) GPUImageVideoCamera *pVideoCamera;
@property (nonatomic,strong) GPUImageView *pImageView;

// 单个滤镜
@property (nonatomic,strong) GPUImageExposureFilter *exposureFilter;
// 滤镜组合
@property (nonatomic,strong) GPUImageFilterGroup *pGroupFilter;

@property (nonatomic,assign) CameraModel cameraModel;
@property (nonatomic,assign) CameraQuatity cameraQuatity;
@property (nonatomic,assign) FillModel fillModel;

@property (nonatomic,strong) GPUImagePicture *sourcePicture;
@end

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@implementation CameraVC

- (instancetype) initWithCameraModel:(CameraModel)cameraModel
        cameraQuatity:(CameraQuatity)cameraQuatity
            fillModel:(FillModel)fillModel
{
    if (!(self = [super init])) return nil;
    self.cameraModel = cameraModel;
    self.cameraQuatity = cameraQuatity;
    self.fillModel = fillModel;
    
    return self;
}
#pragma mark - 系统方法
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initData];
    
    [self singleFilter];       // 单个滤镜
//    [self groupFilter];      // 滤镜组合
    [self createUI];
    
    NSLog(@"cameraModel:%ld",self.cameraModel);
    NSLog(@"cameraQuatity:%ld",self.cameraQuatity);
    NSLog(@"fillModel:%ld",self.fillModel);
}
#pragma mark - 初始化UI
- (void)createUI{

    self.tabBarController.tabBar.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [[UIButton alloc]initWithFrame:
                     CGRectMake(SCREEN_WIDTH/2 - 40,SCREEN_HEIGHT - 80, 80, 40)];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"拍照" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(takePhoto) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
#pragma mark - 初始化数据
- (void)initData{
    
    self.pGroupFilter = [[GPUImageFilterGroup alloc]init];

}
#pragma mark - 交互方法
- (void)singleFilter{
    
    /*
     FillModelkGPUImageFillModeStretch,
     FillModelkGPUImageFillModePreserveAspectRatio,
     FillModelkGPUImageFillModePreserveAspectRatioAndFill
     */
    
    int fillModel = 0;
    switch (self.fillModel) {
        case FillModelkGPUImageFillModeStretch:
            fillModel = kGPUImageFillModePreserveAspectRatioAndFill;
            break;
        case FillModelkGPUImageFillModePreserveAspectRatio:
            fillModel = kGPUImageFillModePreserveAspectRatio;
            break;
        case FillModelkGPUImageFillModePreserveAspectRatioAndFill:
            fillModel = kGPUImageFillModePreserveAspectRatioAndFill;
            break;
        default:
            break;
    }

    NSString *cameraQuatityStr = @"";
    /*
     CameraQuatityAVCaptureSessionPresetPhoto,
     CameraQuatityAVCaptureSessionPresetHigh,
     CameraQuatityAVCaptureSessionPresetMedium,
     CameraQuatityAVCaptureSessionPresetLow,
     CameraQuatityAVCaptureSessionPreset320x240,    NO
     CameraQuatityAVCaptureSessionPreset352x288,
     CameraQuatityAVCaptureSessionPreset640x480,
     CameraQuatityAVCaptureSessionPreset960x540,    NO
     CameraQuatityAVCaptureSessionPreset1280x720,
     CameraQuatityAVCaptureSessionPreset1920x1080,
     CameraQuatityAVCaptureSessionPresetiFrame960x540,
     CameraQuatityAVCaptureSessionPresetiFrame1280x720,
     CameraQuatityAVCaptureSessionPresetInputPriority,
     */
    switch (self.cameraQuatity)
    {
        case CameraQuatityAVCaptureSessionPresetPhoto:
            cameraQuatityStr = AVCaptureSessionPresetPhoto;
            break;
        case CameraQuatityAVCaptureSessionPresetHigh:
            cameraQuatityStr = AVCaptureSessionPresetHigh;
            break;
        case CameraQuatityAVCaptureSessionPresetMedium:
            cameraQuatityStr = AVCaptureSessionPresetMedium;
            break;
        case CameraQuatityAVCaptureSessionPresetLow:
            cameraQuatityStr = AVCaptureSessionPresetLow;
            break;
//        case CameraQuatityAVCaptureSessionPreset320x240:
//            cameraQuatityStr = AVCaptureSessionPreset320x240;
//            break;
        case CameraQuatityAVCaptureSessionPreset352x288:
            cameraQuatityStr = AVCaptureSessionPreset352x288;
            break;
        case CameraQuatityAVCaptureSessionPreset640x480:
            cameraQuatityStr = AVCaptureSessionPreset640x480;
            break;
//        case CameraQuatityAVCaptureSessionPreset960x540:
//            cameraQuatityStr = AVCaptureSessionPreset960x540;
//            break;
        case CameraQuatityAVCaptureSessionPreset1280x720:
            cameraQuatityStr = AVCaptureSessionPreset1280x720;
            break;
        case CameraQuatityAVCaptureSessionPreset1920x1080:
            cameraQuatityStr = AVCaptureSessionPreset1920x1080;
            break;
        case CameraQuatityAVCaptureSessionPresetiFrame960x540:
            cameraQuatityStr = AVCaptureSessionPresetiFrame960x540;
            break;
        case CameraQuatityAVCaptureSessionPresetiFrame1280x720:
            cameraQuatityStr = AVCaptureSessionPresetiFrame1280x720;
            break;
        case CameraQuatityAVCaptureSessionPresetInputPriority:
            cameraQuatityStr = AVCaptureSessionPresetInputPriority;
            break;

        default:
            break;
    }
    
    // 静态相机
    if (self.cameraModel == CameraModelGPUImageStillCamera)
    {
        self.pCamera = [[GPUImageStillCamera alloc]
                        initWithSessionPreset:cameraQuatityStr
                        cameraPosition:AVCaptureDevicePositionBack];
        
        self.pImageView = [[GPUImageView alloc] initWithFrame:
                           CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        // 填充模式
        self.pImageView.fillMode = fillModel;
        [self.view addSubview:self.pImageView];
        // 横向输出
        self.pCamera.outputImageOrientation = UIDeviceOrientationPortrait;
        // 开始渲染
        [self.pCamera startCameraCapture];
        
        // 滤镜(曝光度)
        self.exposureFilter = [[GPUImageExposureFilter alloc]init];
        self.exposureFilter.exposure = 0.0;
        [self.pCamera addTarget:self.exposureFilter];
        [self.exposureFilter addTarget:self.pImageView];
        // 水印
        [self watermark];
    }
    // 动态相机
    else
    {
        
        self.pVideoCamera = [[GPUImageVideoCamera alloc]
                             initWithSessionPreset:cameraQuatityStr
                             cameraPosition:AVCaptureDevicePositionBack];
        
        self.pImageView = [[GPUImageView alloc] initWithFrame:
                           CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        // 填充模式
        self.pImageView.fillMode = fillModel;
        [self.view addSubview:self.pImageView];
        // 横向输出
        self.pVideoCamera.outputImageOrientation = UIDeviceOrientationPortrait;
        // 开始渲染
        [self.pVideoCamera startCameraCapture];
        
        // 滤镜(曝光度)
        self.exposureFilter = [[GPUImageExposureFilter alloc]init];
        self.exposureFilter.exposure = 0.0;
        [self.pVideoCamera addTarget:self.exposureFilter];
        [self.exposureFilter addTarget:self.pImageView];
    }
}

- (void)groupFilter{
    
    self.pCamera = [[GPUImageStillCamera alloc] initWithSessionPreset:AVCaptureSessionPresetHigh cameraPosition:AVCaptureDevicePositionBack];
    
    self.pImageView = [[GPUImageView alloc] initWithFrame:
                       CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:self.pImageView];
    // 横向输出
    self.pCamera.outputImageOrientation = UIDeviceOrientationPortrait;
    // 开始渲染
    [self.pCamera startCameraCapture];

    // 曝光度
    GPUImageExposureFilter *filter1 = [[GPUImageExposureFilter alloc] init];
    filter1.exposure = 0.2;
    // 对比度
    GPUImageContrastFilter *filter2 = [[GPUImageContrastFilter alloc] init];
    filter2.contrast = 1.2;
    
    [self.pCamera addTarget:filter1];
    [self.pCamera addTarget:filter2];
    [filter1 addTarget:self.pImageView];
    [filter2 addTarget:self.pImageView];
}

- (void)takePhoto{
    
    // 保存图片(单个滤镜)
//    [self.pCamera capturePhotoAsImageProcessedUpToFilter:self.exposureFilter withCompletionHandler:^(UIImage *processedImage, NSError *error) {
//        
//        if(UIGestureRecognizerStateBegan){
//            UIImageWriteToSavedPhotosAlbum(processedImage, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
//        }
//    }];
    
    // 保存图片(滤镜组合)
    [self.pCamera capturePhotoAsImageProcessedUpToFilter:self.exposureFilter withCompletionHandler:^(UIImage *processedImage, NSError *error) {
        
        UIImage *userImg = processedImage;
        UIImage *imags = [self addImage:userImg addMsakImage:userImg msakRect:CGRectMake(100, 100, 100, 20)];
        if(UIGestureRecognizerStateBegan){
            UIImageWriteToSavedPhotosAlbum(imags, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
        }
    }];
}

- (void)image: (UIImage *) image didFinishSavingWithError: (NSError *) error contextInfo: (void *) contextInfo
{
    NSString *msg = nil ;
    if(error != NULL){
        msg = @"保存图片失败" ;
    }else{
        msg = @"保存图片成功" ;
    }
    NSLog(@"%@",msg);
}

- (void)dealloc{
    
    [self.view removeFromSuperview];
}
#pragma mark - 网络请求
#pragma mark - 委托代理
#pragma mark - 懒加载
- (void)watermark{
    
    
}

- (UIImage *)addImage:(UIImage *)useImage addMsakImage:(UIImage *)maskImage msakRect:(CGRect)rect
{
    UIGraphicsBeginImageContext(useImage.size);
    [useImage drawInRect:CGRectMake(0, 0, useImage.size.width, useImage.size.height)];
    
    //四个参数为水印图片的位置
    [maskImage drawInRect:rect];
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resultingImage;
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
