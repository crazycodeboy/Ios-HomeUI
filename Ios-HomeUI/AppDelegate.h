//
//  AppDelegate.h
//  ksudi
//
//  Created by Krisc.Zampono on 14/12/16.
//  Copyright (c) 2014年 com.oeffect. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
//#import "LoginViewController.h"
//#import "Upload.h"
//#import "BackgroundOperation.h"
//#import "DatabaseOperation.h"
#import <CoreData/CoreData.h>




//延时处理
typedef void(^doDelayTimer)(void);

#define UMENG_APPKEY @"56381d1367e58e2ff4004051"




@interface AppDelegate : UIResponder <UIApplicationDelegate,CLLocationManagerDelegate,UIAlertViewDelegate>{
    NSTimer *locationtimer;
}

@property(strong, nonatomic) IBOutlet UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property(nonatomic, assign)int flag;
@property(nonatomic, strong)NSString *assignid;
@property(nonatomic, strong)NSString *pushmessageid;
@property(nonatomic, strong)NSMutableData *data;


////yang
//@property (nonatomic, assign) BOOL isResinging;
//@property (nonatomic, strong) NSDictionary *m_launchOptions;
//@property (nonatomic, assign)float naviBarWitd;
//@property (nonatomic, assign)float m_deviceWide;
//@property (nonatomic, assign)float m_deviceHigh;
//@property (nonatomic, assign)int isEnter;            //0 未登录，  1 已登录，   2 缓存极光推送消息 连接成功后 再显示
//@property (nonatomic, strong)MainViewController *mainViewContor;
////@property (nonatomic, strong)LoginViewController *login;
//@property (nonatomic, assign)BOOL isFirstEnter;
//@property (nonatomic, strong) NSString *m_selectCity;
//@property (nonatomic, assign) int getCity_State;       //0:未获取;   1:正在获取;    2:获取成功;
//@property (nonatomic, strong) NSString *custom_phone;
//
@property (nonatomic, strong) IBOutlet UIView *tipShowView;
@property (nonatomic, strong) IBOutlet UILabel *tipLbl;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *tipIndictorView;
//@property (nonatomic, strong) NSString *gifPath;
//@property (nonatomic, strong) NSData *gifData;
//
//@property (nonatomic, strong) NSMutableArray *subControllers;
//@property (nonatomic, assign) int messageCount;
//@property (nonatomic, strong) UIImage *headCacheImage;
//
//@property (nonatomic, strong) NSString *m_quyuStr;
//
//@property (nonatomic, strong) Upload *pic_upload;
//@property (nonatomic, strong) BackgroundOperation *operation_upload;
//
//@property (nonatomic, strong) DatabaseOperation *m_dataBaseOperation;


//延时处理
@property(nonatomic,strong)NSTimer *delaytimer;
@property(nonatomic,strong)doDelayTimer delayBlock;



//custom
-(void)enterMyApp;
-(NSString *)getAppUuid;
-(BOOL)connectedToNetwork;
-(void)upLoadSystemData;
-(void)loadSystemMessage:(NSDictionary *)dic;
- (float)m_getWidt_str:(NSString *)str m_font:(UIFont *)font higt:(float)higt;
- (float)m_getHigh_str:(NSString *)str m_font:(UIFont *)font widt:(float)widt;
-(NSMutableAttributedString *)get_2_MutieLblStly:(NSString *)str changeLoction:(int)loction firstFont:(UIFont*)m_font1 firstColor:(UIColor*)m_color1 secondFont:(UIFont *)m_font2 secondColor:(UIColor*)m_color2;
-(NSMutableAttributedString *)get_3_MutieLblStly:(NSString *)str changeLoction1:(int)loction1 changeLoction2:(int)loction2 firstFont:(UIFont*)m_font1 firstColor:(UIColor*)m_color1 secondFont:(UIFont *)m_font2 secondColor:(UIColor*)m_color2 thirdFont:(UIFont *)m_font3 thirdColor:(UIColor*)m_color3;
-(NSMutableAttributedString *)get_MutieLbl:(NSArray *)strArray font:(NSArray *)fontArray color:(NSArray *)colorArray;
//-(void)setNaviGationItem:(UIViewController *)_controller isLeft:(BOOL)_isLeft button:(UIButton *)_button;
-(void)initConfig;
-(void)initDataBase;
-(void)enterMainView;
-(void)enterPassword;
-(void)enterPasswordStartAll;
-(void)showTip:(NSString*)tipStr;
-(void)showTip2:(NSString*)tipStr timeConut:(float)second;
-(void)showRefreshIndactor;
-(void)hideRefreshIndactor;
-(void)postMessageTip:(NSString *)c_id;
-(void)closeTip;
-(void)persentOrderDetail:(UIViewController *)m_viewConter;
-(void)doneOrderDetail:(UIViewController *)m_viewConter;
-(void)messageSoundShow;
-(void)addMessageCount;
-(void)showMessage;
-(void)duandianTimer;
-(void)operationTimer;
-(void)doSystemMessage:(NSDictionary *)dic isLanch:(BOOL)isLanch;
-(void)zhuceXinGe:(NSString *)bieMing isLogin:(BOOL)m_login;
-(void)checkVersion_isClick:(BOOL)isClick;
-(void)toLastestVisionUrl;
-(void)showNewVisionTip;
-(BOOL)checkNetWork;
-(void)cleanALL_Notifaction;
-(void)m_setDelayTimer:(float)count delayBlock:(void(^)(void))block;
-(void)stopDelayTimer;
-(int)getNetworkStly;       // 0:无网络     1：wifi      2:其他网络
-(BOOL)isCurrentCity:(NSString *)city;
-(void)loginSetting:(NSDictionary *)dic isLogin:(BOOL)m_login;

/**
 *  信鸽tokenstr处理：别名&标签
 */
-(void)updateTokenStr;

@end

