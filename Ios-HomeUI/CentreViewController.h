//
//  CentreViewController.h
//  Ios-HomeUI
//
//  Created by JiaPenghui on 15/12/15.
//  Copyright © 2015年 jph. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "ViewController.h"
@class MainViewController;
@interface CentreViewController : UIViewController
@property(nonatomic,strong) MainViewController *mainViewContor;

@property(nonatomic,strong)ViewController *rightViewContor1;
@property(nonatomic,strong) ViewController *rightViewContor2;
@property(nonatomic,strong) ViewController *rightViewContor3;
@property(nonatomic,strong) ViewController *rightViewContor4;
@property(nonatomic,assign) NSInteger clickIndex;
@property(nonatomic,strong)IBOutlet UIView *upView;
@property(nonatomic,strong)IBOutlet UIView *bottomView;
@property(nonatomic,strong)IBOutlet UIView *rightView1;
@property(nonatomic,strong)IBOutlet UIView *rightView2;
@property(nonatomic,strong)IBOutlet UIView *rightView3;
@property(nonatomic,strong)IBOutlet UIView *rightView4;
@property(nonatomic,strong)IBOutlet UILabel *rightLbl11;
@property(nonatomic,strong)IBOutlet UIButton *rightBtn11;   //tag 11
@property(nonatomic,strong)IBOutlet UILabel *rightLbl22;
@property(nonatomic,strong)IBOutlet UIButton *rightBtn22;  //tag 22
@property(nonatomic,strong)IBOutlet UILabel *rightLbl33;
@property(nonatomic,strong)IBOutlet UIButton *rightBtn33;   //tag 33
@property(nonatomic,strong)IBOutlet UILabel *rightLbl44;
@property(nonatomic,strong)IBOutlet UIButton *rightBtn44;   //tag 44
-(void)initNavBar;
-(void)initUIView;
-(void)setTabBarSelectedImage:(int)tag;
-(IBAction)doBtnAction:(UIButton *)sender;
-(void)setTipNum:(int)count lab:(UILabel*)lab;
@end
