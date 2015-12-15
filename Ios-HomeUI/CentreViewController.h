//
//  CentreViewController.h
//  Ios-HomeUI
//
//  Created by JiaPenghui on 15/12/15.
//  Copyright © 2015年 jph. All rights reserved.
//


#import <UIKit/UIKit.h>

//#import "ZBarSDK.h"
#import <CoreLocation/CoreLocation.h>

//#import "scanViewController2.h"

@class MainViewController;
@class NewOrderViewController;
@class ForFetchViewController;
@class DrawUpViewController;
@class SignInViewController;

@interface CentreViewController : UIViewController</*ZBarReaderDelegate,*/CLLocationManagerDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

//input
@property(nonatomic,strong) MainViewController *mainViewContor;

@property(nonatomic,strong) NewOrderViewController *rightViewContor1;
@property(nonatomic,strong) ForFetchViewController *rightViewContor2;
@property(nonatomic,strong) DrawUpViewController *rightViewContor3;
@property(nonatomic,strong) SignInViewController *rightViewContor4;

//@property(nonatomic,strong) scanViewController2 *addContor;

@property(nonatomic,assign) NSInteger clickIndex;

@property(nonatomic,strong)IBOutlet UIImageView *naviTittleView;  //tag 2:添加 ;  tag 3:setting
@property(nonatomic,strong)IBOutlet UIView *upView;
@property(nonatomic,strong)IBOutlet UIView *bottomView;
@property(nonatomic,strong)IBOutlet UIView *rightView1;
@property(nonatomic,strong)IBOutlet UIView *rightView2;
@property(nonatomic,strong)IBOutlet UIView *rightView3;
@property(nonatomic,strong)IBOutlet UIView *rightView4;
@property(nonatomic,strong)IBOutlet UIView *rightView11;
@property(nonatomic,strong)IBOutlet UILabel *rightLbl11;
@property(nonatomic,strong)IBOutlet UIButton *rightBtn11;   //tag 11
@property(nonatomic,strong)IBOutlet UIView *rightView22;
@property(nonatomic,strong)IBOutlet UILabel *rightLbl22;
@property(nonatomic,strong)IBOutlet UIButton *rightBtn22;  //tag 22
@property(nonatomic,strong)IBOutlet UIView *rightView33;
@property(nonatomic,strong)IBOutlet UILabel *rightLbl33;
@property(nonatomic,strong)IBOutlet UIButton *rightBtn33;   //tag 33
@property(nonatomic,strong)IBOutlet UIView *rightView44;
@property(nonatomic,strong)IBOutlet UILabel *rightLbl44;
@property(nonatomic,strong)IBOutlet UIButton *rightBtn44;   //tag 44


-(void)initUIView;
-(void)initNaiv;
-(void)tabBarImage:(int)stly;
-(IBAction)doBtnAction:(UIButton *)sender;
-(void)m_setRight2Lbl:(int)count index:(int)index;
-(void)scan;
-(void)flashAll;

@end
