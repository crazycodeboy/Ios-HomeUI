//
//  DEFINE.h
//  ksudi
//
//  Created by MacroHong on 15/6/1.
//  Copyright (c) 2015年 com.oeffect. All rights reserved.
//

//#import "Preload.h"
#import "AppDelegate.h"

#ifndef ksudi_DEFINE_h
#define ksudi_DEFINE_h

// defines by macro
#define kWidth [[UIScreen mainScreen] bounds].size.width
#define kHeight [[UIScreen mainScreen] bounds].size.height

#define IOS7 [[[UIDevice currentDevice] systemVersion]floatValue]>=7

#define DebugLog(s, ...) if(ISDEBUG) {\
NSLog(@"*************DebugLog*************");\
NSLog(@"path:%s", __FILE__);\
NSLog(@"lines:%d, method:%s", __LINE__, __FUNCTION__);\
NSLog(s, ##__VA_ARGS__);\
NSLog(@"***********EndOfDebugLog**********");\
}


#define BelowView(view) ((view).frame.size.height + (view).frame.origin.y)

#define APPDELEGATE ((AppDelegate *)[[UIApplication sharedApplication] delegate])
#define SERVICETEL ((AppDelegate *)[[UIApplication sharedApplication] delegate]).custom_phone

#define WINDOW (((AppDelegate *)[[UIApplication sharedApplication] delegate]).window)
#define kUserDefaults                       [NSUserDefaults standardUserDefaults]
#define kCenterX self.view.center.x
#define kCenterY self.view.center.y

#define APP_FIRST @"APP_FIRST"

// tags by macro
enum {
    // 订单详情页
    TRUEBTN = 9000,
    TRUECONTINUEBTN
};
//#import "MyTool.h"

//Krisc.Zampono -----NSUserDefaults
#define time_out                                                                                       5
#define UserId             @"userId"  // 用户ID--登录时传
#define LoginTgt           @"tgt"
#define XG_deviceTokenStr                                                                              @"deviceTokenStr"         //信鸽的设备注册信息
#define login_phone                                                                                    @"phone"                  //当前用户账号
#define login_pass                                                                                     @"pass"                   //当前用户密码
#define Userauditcode [NSString stringWithFormat:@"%@auditcode",[[NSUserDefaults standardUserDefaults] objectForKey:login_phone]]//每个账号的审核状态 ---------------------
#define Configsound                                                                                    @"sound"                  //当前声音的设置 1是开启 0是关闭
#define Configvib                                                                                      @"vib"                    //当前震动的状态 同声音
#define Userplist [NSString stringWithFormat:@"%@.plist",[[NSUserDefaults standardUserDefaults]        objectForKey:login_phone]]//消息中心接到的推送消息---------------------
#define viewControllerStatus                                                                           @"viewControllerStatus"   //判断当前是从代取件进入的还是从代签收进入的
#define courierid                                                                                      @"courierid"              //当前快递员id
#define isstart                                                                                        @"isstart"                //当前快递员开工状态
#define SystemAlias                                                                                    @"alias"                  //系统返回的用户的别名

#define LoginDic                                                                                      @"loginDic"               //登录资料
//------------------------------各种颜色Define   colorWithRed:1/255.f green:2/255.f blue:3/255.f alpha:1
#define UIKsudiOrange [UIColor colorWithRed:255/255.f green:94/255.f blue:0/255.f alpha:1]

#define KsudiOrange  colorWithRed:255/255.f green:94/255.f blue:0/255.f              alpha:1//部分强调文字，按钮颜色，以及价格相关文字信息
#define KsudiBlack   colorWithRed:72/255.f green:72/255.f blue:72/255.f              alpha:1//标题黑，用于导航栏标题以及大模块标题
#define KsudiBlue   colorWithRed:33/255.f green:150/255.f blue:243/255.f             alpha:1//反馈回答，收件地址图标以及服务条款文字颜色、
#define KsudiGray   colorWithRed:150/255.f green:150/255.f blue:150/255.f            alpha:1//普通段落文字颜色，如收发件地址信息
#define KsudiLightgray   colorWithRed:200/255.f green:200/255.f blue:200/255.f       alpha:1//分割线、描边、提示信息、按钮不可点击状态
#define KsudiBackgroundColor   colorWithRed:240/255.f green:240/255.f blue:240/255.f alpha:1//部分界面背景颜色
#define KsudiButtonTextColor   colorWithRed:255/255.f green:255/255.f blue:255/255.f alpha:1//按钮文字颜色
#define KsudiHighlightedColor   colorWithRed:217/255.f green:87/255.f blue:0/255.f   alpha:1//按钮按下后显示颜色
#define KsudiTitleGray     [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:1]
#define KsudiTitleLightGray     [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:1]
#define KsudiFontName   @"Helivetica Neue"                    //要求字体
#define ButtonHeight                 40
#define ButtonDistance               20
#define ButtonCornerRadius           3
#define SepartorLine                 @"导航栏底边线.png"            // 导航栏底边线

//侯燕 ----- NSUserDefaults
#define tou                          @"tou"                   //当前用户的头像
#define tou2                         @"tou2"                  //当前用户的身份证正面信息
#define tou3                         @"tou3"                  //当前用户的身份证反面信息
#define Username                     @"name"                  //当前用户的名字
#define Useridentity                 @"identity"              //当前用户的身份证信息
#define Usercompanykey               @"companykey"            //当前账号的公司编号



//新版本参数
#define addVisionTip     @"addVisionTip"

#define Sel_City_Name [NSString stringWithFormat:@"%@_Sel_City_Name",[[NSUserDefaults standardUserDefaults] objectForKey:login_phone]]


#endif
