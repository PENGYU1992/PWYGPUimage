//
//  SubVC.h
//  DJMTest
//
//  Created by Alex on 2016/11/16.
//  Copyright © 2016年 DJBeauty. All rights reserved.
//

#import <UIKit/UIKit.h>
// 相机模式
typedef enum : NSUInteger {
    SubCameraModelGPUImageStillCamera,
    SubCameraModelGPUImageVideoCamera,
} SubCameraModel;

// 分辨率
typedef enum : NSUInteger {
    SubCameraQuatityAVCaptureSessionPresetPhoto,
    SubCameraQuatityAVCaptureSessionPresetHigh,
    SubCameraQuatityAVCaptureSessionPresetMedium,
    SubCameraQuatityAVCaptureSessionPresetLow,
    SubCameraQuatityAVCaptureSessionPreset352x288,
    SubCameraQuatityAVCaptureSessionPreset640x480,
    SubCameraQuatityAVCaptureSessionPreset1280x720,
    SubCameraQuatityAVCaptureSessionPreset1920x1080,
    SubCameraQuatityAVCaptureSessionPresetiFrame960x540,
    SubCameraQuatityAVCaptureSessionPresetiFrame1280x720,
    SubCameraQuatityAVCaptureSessionPresetInputPriority,
} SubCameraQuatity;

// 相机view填充方式
typedef enum : NSUInteger {
    SubFillModelkGPUImageFillModeStretch,
    SubFillModelkGPUImageFillModePreserveAspectRatio,
    SubFillModelkGPUImageFillModePreserveAspectRatioAndFill,
} SubFillModel;


@interface SubVC : UIViewController


-(instancetype) initWithCameraModel:(SubCameraModel)subCameraModel
                      cameraQuatity:(SubCameraQuatity)subCameraQuatity;

@end
