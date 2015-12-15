//
//  AppDelegate.m
//  ksudi
//
//  Created by Krisc.Zampono on 14/12/16.
//  Copyright (c) 2014年 com.oeffect. All rights reserved.
//

#import "AppDelegate.h"
//#import "PostAsynClass.h"
//#import "Preload.h"
#import <AudioToolbox/AudioToolbox.h>
//#import "NewOrderDetailViewController.h"
//#import "MessageViewController.h"
#import "NewOrderViewController.h"
//#import "AFHTTPRequestOperationManager.h"
#import <netdb.h>
#import <arpa/inet.h>
#import <CommonCrypto/CommonHMAC.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import <AVFoundation/AVFoundation.h>
//#import "MD5.h"
//#import "XGPush.h"
//#import "XGSetting.h"
//#import "GuidePagesViewController.h"
//#import "MHProgress.h"
//#import "WrongMsgViewController.h"
#import "DEFINE.h"
//#import "DevicesKeyChain.h"
//#import "HttpUtils.h"
//#import "Reachability.h"
//#import "KLogin.h"

//#import <BaiduMapAPI_Map/BMKMapComponent.h>


#define _IPHONE80_ 80000


@interface AppDelegate ()
//{
////    NSString *lastestUrl;
////    UIView *m_AddNewTipView;
////    NSString *ipaSizeStr;
////    BOOL m_AppIsFirst;
////    BOOL get_Onec;
////    
//////    BMKMa[[UIScreen mainScreen] bounds].size.widthpManager *_manager;
////    NSString *_tgt;
//}
@end

@implementation AppDelegate

//@synthesize isResinging;
//@synthesize m_launchOptions;
//@synthesize naviBarWitd;
//@synthesize m_deviceWide;
//@synthesize m_deviceHigh;
//@synthesize isEnter;
//@synthesize mainViewContor;
//@synthesize login;
@synthesize tipShowView;
@synthesize tipLbl;
@synthesize tipIndictorView;
//@synthesize gifData;
//@synthesize gifPath;
//@synthesize subControllers;
//@synthesize messageCount;
//@synthesize headCacheImage;
//@synthesize m_selectCity;
//@synthesize getCity_State;
//@synthesize custom_phone;
//
//@synthesize m_quyuStr;
//@synthesize isFirstEnter;
//
//@synthesize pic_upload;
//@synthesize operation_upload;
//
//@synthesize managedObjectContext = _managedObjectContext;
//@synthesize managedObjectModel = _managedObjectModel;
//@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;
//@synthesize m_dataBaseOperation;

//延时处理
@synthesize delaytimer;
@synthesize delayBlock;



#pragma mark - Core Data stack



/**
 *  应用处于未启动状态
 *
 *  @param launchOptions 如果launchOptions不为空,则是点击推送的消息进入app,否则为直接点击app进入
 *
 */
//- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    // Override point for customization after application launch.
//    
////    m_launchOptions = launchOptions;
//    
//    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
//    NSString *key = [ud objectForKey:APP_FIRST];
////    if (!key) {
////        m_AppIsFirst = YES;
////        GuidePagesViewController *guideVC = [[GuidePagesViewController alloc] init];
//        self.window.rootViewController = [[MainViewController alloc] init];
//        [self.window makeKeyAndVisible];
////    } else {
////        m_AppIsFirst = NO;
////        [self enterMyApp];
////    }
//    
////    [self cleanALL_Notifaction];
//    
////    _manager = [[BMKMapManager alloc] init];
////    BOOL ret = [_manager start:BaiduKey generalDelegate:self];
////    if (!ret) {
////        DebugLog(@"主引擎对象初始化失败");
////    } else {
////        DebugLog(@"主引擎对象初始化成功");
////    }
//    
//    
//    return YES;
//}
@end
