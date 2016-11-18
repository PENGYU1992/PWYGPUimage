//
//  CameraVC.h
//  DJMTest
//
//  Created by Alex on 2016/11/17.
//  Copyright © 2016年 DJBeauty. All rights reserved.
//

#import <UIKit/UIKit.h>


// 相机模式
typedef enum : NSUInteger {
    CameraModelGPUImageStillCamera,
    CameraModelGPUImageVideoCamera,
} CameraModel;

// 分辨率
typedef enum : NSUInteger {
    CameraQuatityAVCaptureSessionPresetPhoto,
    CameraQuatityAVCaptureSessionPresetHigh,
    CameraQuatityAVCaptureSessionPresetMedium,
    CameraQuatityAVCaptureSessionPresetLow,
    CameraQuatityAVCaptureSessionPreset352x288,
    CameraQuatityAVCaptureSessionPreset640x480,
    CameraQuatityAVCaptureSessionPreset1280x720,
    CameraQuatityAVCaptureSessionPreset1920x1080,
    CameraQuatityAVCaptureSessionPresetiFrame960x540,
    CameraQuatityAVCaptureSessionPresetiFrame1280x720,
    CameraQuatityAVCaptureSessionPresetInputPriority,
} CameraQuatity;

// 相机view填充方式
typedef enum : NSUInteger {
    FillModelkGPUImageFillModeStretch,
    FillModelkGPUImageFillModePreserveAspectRatio,
    FillModelkGPUImageFillModePreserveAspectRatioAndFill,
} FillModel;

@interface CameraVC : UIViewController

-(instancetype) initWithCameraModel:(CameraModel)cameraModel
        cameraQuatity:(CameraQuatity)cameraQuatity
            fillModel:(FillModel)fillModel;

@end
