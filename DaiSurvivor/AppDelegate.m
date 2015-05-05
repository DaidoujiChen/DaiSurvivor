//
//  AppDelegate.m
//  DaiSurvivor
//
//  Created by DaidoujiChen on 2015/4/29.
//  Copyright (c) 2015年 DaidoujiChen. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "DaiSurvivor.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    __block int count = 0;
	[DaiSurvivor shared].isNeedAliveInBackground = ^BOOL (void) {
        if (count++ < 3) {
            return YES;
        }
        else {
            return NO;
        }
	};
	[DaiSurvivor shared].totalAliveTime = ^(NSTimeInterval aliveTime) {
		NSLog(@"alive in background : %f sec", aliveTime);
	};
	self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
	self.window.rootViewController = [MainViewController new];
	[self.window makeKeyAndVisible];
	return YES;
}

@end
