//
//  MainViewController.h
//  Ios-HomeUI
//
//  Created by JiaPenghui on 15/12/15.
//  Copyright © 2015年 jph. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "CentreViewController.h"
#import "MenuViewController.h"


@interface MainViewController : UIViewController
{
    
}

@property(nonatomic,strong)IBOutlet UIView *leftView;
@property(nonatomic,strong)IBOutlet UIView *rightView;
//@property(nonatomic,strong)IBOutlet UIView *rightBackView;
@property(nonatomic,strong) CentreViewController *centreViewCtor;
@property(nonatomic,strong) MenuViewController *menuViewCtor;


-(void)initUIView;

-(void)onSwitchWithAnimaiton:(BOOL)isClose;
-(void)rightSlide_x:(float)x;
-(void)rightMoveStatu:(int)tag finishAnimaiton:(BOOL)haveAnimation needFresh:(BOOL)fresh;
-(void)rightMaxShow:(int)tag;
-(void)rightMoveSlide_x:(float)x;
-(void)rightSpeedSlide_isLeft:(BOOL)flag needNext:(BOOL)isNext;


@end
