//
//  AppDelegate.h
//  DJMTest
//
//  Created by 黄先超 on 2016/11/16.
//  Copyright © 2016年 DJBeauty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

