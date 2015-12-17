//  Ios-HomeUI
//  首页主控制器，负责侧拉栏的显示隐藏，内容页的翻页等。
//  Created by JiaPenghui on 15/12/15.
//  Copyright © 2015年 jph. All rights reserved.
//

#import "MainViewController.h"


@interface MainViewController ()<UIGestureRecognizerDelegate>

@property(nonatomic, strong) UITapGestureRecognizer *tapGestureRecognizer;
//活动开始的位置
@property(nonatomic, assign) CGPoint panGestureStartLocation;
//滑动开始时rightView 的x点
@property(nonatomic, assign) float rightStartX;
//滑动开始时centerView中rightView1 的x点
@property(nonatomic, assign) float right1StartX;
//滑动速度
@property(nonatomic, assign) float slideChangeSpeed;
@property(nonatomic, assign) float slideChangeSetting;
//侧边栏展开大小
@property(nonatomic, assign) float slideSettingMax;
@property(nonatomic, assign) float slideSettingTransform_x;
@property(nonatomic, assign) float slideSettingTransform_y;
//侧边栏展开过程中动画持续时间，越大展开速度越慢
@property(nonatomic, assign) float animationTime;
@property(nonatomic, assign) float slideLeftX;
@property(nonatomic, assign) float slideAlpha;
@property(nonatomic, assign) float isFirst;
@end


@implementation MainViewController

@synthesize leftView;
@synthesize rightView;
@synthesize centreViewCtor;
@synthesize menuViewCtor;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.isFirst = YES;
    
    self.rightView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.rightView.layer.shadowOffset = CGSizeMake(0,0);
    self.rightView.layer.shadowOpacity = 0.4;
    self.rightView.layer.shadowRadius = 4;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    float height = [UIScreen mainScreen].bounds.size.height;
    float width = [UIScreen mainScreen].bounds.size.width;
    CGPoint topLeft      = CGPointMake(0,0);
    CGPoint bottomLeft   = CGPointMake(0,height);
    CGPoint bottomMiddle = CGPointMake(width,height);

    [path moveToPoint:topLeft];
    [path addQuadCurveToPoint:bottomLeft
                 controlPoint:bottomMiddle];
    self.rightView.layer.shadowPath = path.CGPath;
    
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (self.isFirst == YES)
    {
        self.isFirst = NO;
        [self initUIView];
    }
}

-(void)initUIView
{
    self.slideChangeSpeed =800;
    CGSize size= [[UIScreen mainScreen] bounds].size;
    self.slideSettingMax=(size.width<size.height? size.width:size.height)-180;
    self.slideChangeSetting = self.slideSettingMax/2;
    self.animationTime = 0.2;
    self.slideSettingTransform_x = 0.7;
    self.slideSettingTransform_y = 0.7;
    self.slideLeftX = 30;
    self.slideAlpha = 0.1;
    
    UIStoryboard*mainSb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    centreViewCtor=[mainSb instantiateViewControllerWithIdentifier:@"sb_CentreView"];
    self.centreViewCtor.mainViewContor = self;
    //将centerView及对应的controller添加到rightView中
    [self.rightView addSubview:centreViewCtor.view];
    [self addChildViewController:centreViewCtor];
    menuViewCtor =[mainSb instantiateViewControllerWithIdentifier:@"sb_menuView"];
    
    //将菜单视图添加到leftView中
    [self.leftView addSubview:self.menuViewCtor.view];
    self.leftView.transform  = CGAffineTransformMakeScale(self.slideSettingTransform_x, self.slideSettingTransform_y);
    self.rightView.alpha = 1;
    
    self.tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognized:)];
    self.tapGestureRecognizer.delegate = self;
    self.tapGestureRecognizer.numberOfTapsRequired = 1;
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognized:)];
    panGestureRecognizer.delegate = self;
    [self.rightView addGestureRecognizer:panGestureRecognizer];
}

#pragma mark - Gesture recognizers
/***
 * 单击回调
 */
- (void)tapGestureRecognized:(UITapGestureRecognizer *)tapGestureRecognizer{
    UIGestureRecognizerState state = tapGestureRecognizer.state;
    CGPoint location = [tapGestureRecognizer locationInView:self.view];
    switch (state) {
        case UIGestureRecognizerStateEnded:
            if (self.rightView.frame.origin.x == self.slideSettingMax){//侧拉栏已展开
                if (location.x > self.slideSettingMax){//单击了侧拉栏以外的位置则关闭侧拉栏
                    [self onSwitchWithAnimaiton:YES];
                }
            }
            break;
        default:
            break;
    }
    
}
/**
 * 滑动回调
 */
-(void)panGestureRecognized:(UIPanGestureRecognizer *)panGestureRecognizer
{
    UIGestureRecognizerState state = panGestureRecognizer.state;
    CGPoint location = [panGestureRecognizer locationInView:self.view];
    CGPoint velocity;
    velocity = [panGestureRecognizer velocityInView:self.rightView];
    switch (state){
        case UIGestureRecognizerStateBegan:
        {
            self.panGestureStartLocation = location;
            self.rightStartX = self.rightView.frame.origin.x;
            self.right1StartX = self.centreViewCtor.rightView1.frame.origin.x;
            break;
        }
        case UIGestureRecognizerStateChanged:
        {
            CGFloat delta = location.x - self.panGestureStartLocation.x;
            if (delta > 0){//向右滑动
                if (self.rightView.frame.origin.x < self.slideSettingMax){//侧拉栏未展开
                    if (self.right1StartX >= 0){//centerView中rightView1位于屏幕中（当前显示的是第一页）
                        if (delta <= self.slideSettingMax){//如果滑动的距离小于侧拉栏展开宽度
                            [self onSliding:delta];
                        }
                    }else{//当前不是第一页
                        [self onPageChanging:self.right1StartX+delta];
                    }
                }
            }
            else if (delta < 0) {//向左滑动
                delta = -delta;
                if (self.rightView.frame.origin.x == 0){//如果侧边栏没打开，则滑动翻页页面
                    [self onPageChanging:self.right1StartX-delta];
                }else{//侧边栏在打开状态
                    if (self.panGestureStartLocation.x > self.slideSettingMax){//且滑动的是侧边栏以外的位置，则滑动关闭侧边栏
                        [self onSliding:self.rightStartX-delta];
                    }
                }
            }
            break;
        }
        case UIGestureRecognizerStateEnded:
        {
            if(velocity.x < -self.slideChangeSpeed) {//向左滑动速度大于slideChangeSpeed
                if (self.rightView.frame.origin.x != 0){//侧边栏处于打开状态则关闭侧边栏
                    [self onSwitchWithAnimaiton:YES];
                }else{
                    [self onPageChangedIsNeed:YES needNext:YES];
                }
            }else if(velocity.x > self.slideChangeSpeed){//向右滑动速度大于slideChangeSpeed
                if (self.rightView.frame.origin.x != self.slideSettingMax){//侧边栏不处于已打开状态
                    if (self.right1StartX == 0){//且当前显示的是第一页，则打开侧边栏
                        [self onSwitchWithAnimaiton:NO];
                    }else {
                        [self onPageChangedIsNeed:NO needNext:YES];
                    }
                }
            }else{
                CGFloat delta = 0.0f;
                delta = location.x - self.panGestureStartLocation.x;
                if (delta > 0){
                    if (self.right1StartX == 0){
                        if (delta > self.slideChangeSetting){
                            [self onSwitchWithAnimaiton:NO];
                        }else if(self.rightView.frame.origin.x<self.slideSettingMax){//如果侧边栏没有打开
                            [self onSwitchWithAnimaiton:YES];
                        }
                    }else{
                        if (delta < self.rightView.frame.size.width/2){
                            [self onPageChangedIsNeed:NO needNext:NO];
                        }else{
                            [self onPageChangedIsNeed:NO needNext:YES];
                        }
                    }
                }else if (delta < 0){
                    NSLog(@"%f",delta);
                    if (self.rightStartX == 0){
                        if (delta < -self.rightView.frame.size.width/2){
                            [self onPageChangedIsNeed:YES needNext:YES];
                        }else{
                            [self onPageChangedIsNeed:YES needNext:NO];
                        }
                    }else{
                        if (self.rightView.frame.origin.x >= self.slideChangeSetting){
                            [self onSwitchWithAnimaiton:NO];
                        }else{
                            [self onSwitchWithAnimaiton:YES];
                        }
                    }
                }
            }
            
            break;
        }
        default:
            break;
    }
}
#pragma mark - Menu Change
/**
 * 打开或关闭侧边栏,带动
 * @param isClose YES 关闭，NO 打开
 **/
-(void)onSwitchWithAnimaiton:(BOOL)isClose{
    float x;
    if (isClose == NO){
        x = self.slideSettingMax;
    }else{
        x = 0;
    }
    [UIView animateWithDuration:self.animationTime delay:0 options:UIViewAnimationOptionCurveLinear animations:^ {
         CGRect rect = self.rightView.frame;
         rect.origin.x = x;
         self.rightView.frame = rect;
         
         if (isClose == NO) {
             self.leftView.transform  = CGAffineTransformMakeScale(1, 1);
         }else{
             self.leftView.transform  = CGAffineTransformMakeScale(self.slideSettingTransform_x, self.slideSettingTransform_y);
         }
     } completion:^(BOOL finished){
         if (isClose == YES){//侧边栏关闭后移除rightView的tapGestureRecognizer检测器，以便将单击事件监听权交出
             [self.rightView removeGestureRecognizer:self.tapGestureRecognizer];
             [self.centreViewCtor.view setUserInteractionEnabled:YES];
         }else{
             [self.rightView addGestureRecognizer:self.tapGestureRecognizer];
             [self.centreViewCtor.view setUserInteractionEnabled:NO];
         }
     } ];
}
/**
 * 通过滑动显示和隐藏侧边栏
 * @param x 滑动的距离
 **/
-(void)onSliding:(float)x
{
    x = x>self.slideSettingMax?self.slideSettingMax:x;
    x = x<=0?0:x;
    CGRect rect = self.rightView.frame;
    rect.origin.x = x;
    self.rightView.frame = rect;
    
    float trans_x = self.slideSettingTransform_x-(x/self.slideSettingMax)*(self.slideSettingTransform_x-1) ;
    float trans_y = self.slideSettingTransform_y+(x/self.slideSettingMax)*(1-self.slideSettingTransform_y) ;
    //缩放侧边栏视图
    self.leftView.transform  = CGAffineTransformMakeScale(trans_x, trans_y);
}
#pragma mark - Page Change
/**
 * 显示选择的页面
 * @param tag 要显示页面的标识
*  @param haveAnimation 是否需要动画
 **/
-(void)onPageSelected:(int)tag finishAnimaiton:(BOOL)haveAnimation{
    if (haveAnimation == YES) {
        [UIView animateWithDuration:self.animationTime delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
             [self onPageSelected:tag];
         } completion:^(BOOL finished){
             //根据相应的页面刷新数据
             if (tag == 11){
                 
             }else if (tag == 22){
                 
             }else if (tag == 33){
                 
             }else{
                 
             }

         }];
    }else{
        [self onPageSelected:tag];
    }
}
/**
 * 显示选择的页面
 * @param tag 要显示页面的标识
 **/
-(void)onPageSelected:(int)tag;{
    CGRect rect = self.centreViewCtor.upView.frame;
    CGRect rect1 = rect;
    CGRect rect2 = rect;
    CGRect rect3 = rect;
    CGRect rect4 = rect;
    
    if (tag == 11) {
        rect1.origin.x = 0;
        rect2.origin.x = self.centreViewCtor.upView.frame.size.width;
        rect3.origin.x = self.centreViewCtor.upView.frame.size.width*2;
        rect4.origin.x = self.centreViewCtor.upView.frame.size.width*3;
    }else if (tag == 22) {
        rect1.origin.x = -self.centreViewCtor.upView.frame.size.width;
        rect2.origin.x = 0;
        rect3.origin.x = self.centreViewCtor.upView.frame.size.width;
        rect4.origin.x = self.centreViewCtor.upView.frame.size.width*2;
    }else if (tag == 33){
        rect1.origin.x = -self.centreViewCtor.upView.frame.size.width*2;
        rect2.origin.x = -self.centreViewCtor.upView.frame.size.width;
        rect3.origin.x = 0;
        rect4.origin.x = self.centreViewCtor.upView.frame.size.width;
    }else if (tag == 44) {
        rect1.origin.x = -self.centreViewCtor.upView.frame.size.width*3;
        rect2.origin.x = -self.centreViewCtor.upView.frame.size.width*2;
        rect3.origin.x = -self.centreViewCtor.upView.frame.size.width;
        rect4.origin.x = 0;
    }
    [self changeViewHorizontalPosition:self.centreViewCtor.rightView1 rect:rect1];
    [self changeViewHorizontalPosition:self.centreViewCtor.rightView2 rect:rect2];
    [self changeViewHorizontalPosition:self.centreViewCtor.rightView3 rect:rect3];
    [self changeViewHorizontalPosition:self.centreViewCtor.rightView4 rect:rect4];
    [self.centreViewCtor setTabBarSelectedImage:tag];
}
/**
 * 改变View的水平位置
 * @param view
 * @param rect 改变后View的CGRect
 **/
-(void)changeViewHorizontalPosition:(UIView*)view rect:(CGRect)rect{
    CGRect finalRect=view.frame;
    finalRect.origin.x=rect.origin.x;
    view.frame=finalRect;
}
/**
 * 根据第一页的位置和滑动的距离来进行滑动翻页
 * @ param x 页面相对x轴滑动的距离
 **/
-(void)onPageChanging:(float)x{
    if (x >= -self.centreViewCtor.upView.frame.size.width*3&&x<=0){//滑动到首末页的异常处理
        CGRect rect = self.centreViewCtor.upView.frame;
        rect.origin.x = x;
        [self changeViewHorizontalPosition:self.centreViewCtor.rightView1 rect:rect];
        rect.origin.x = x+rect.size.width;
        [self changeViewHorizontalPosition:self.centreViewCtor.rightView2 rect:rect];
        rect.origin.x = x+2*rect.size.width;
        [self changeViewHorizontalPosition:self.centreViewCtor.rightView3 rect:rect];
        rect.origin.x = x+3*rect.size.width;
        [self changeViewHorizontalPosition:self.centreViewCtor.rightView4 rect:rect];
    }
}
/**
 * 翻页
 * @param flag 向左还是向右翻页
 * @param isNext 是否需要翻页
 **/
-(void)onPageChangedIsNeed:(BOOL)flag needNext:(BOOL)isNext{
    float widt = self.centreViewCtor.upView.frame.size.width;
    int tag;
    if (isNext == YES){
        if (flag == YES){
            if (self.right1StartX == -3*widt){
                tag = 44;
                isNext = NO;
            }else if (self.right1StartX == -2*widt) {
                tag = 44;
            }
            else if (self.right1StartX == -widt){
                tag = 33;
            }else {
                tag = 22;
            }
        }else{
            if (self.right1StartX == -3*widt){
                tag = 33;
            }else if (self.right1StartX == -2*widt){
                tag = 22;
            }else if (self.right1StartX == -widt){
                tag = 11;
            }else{
                tag = 11;
            }
        }
    }else{
        if (self.right1StartX == -3*widt){
            tag = 44;
        }else if (self.right1StartX == -2*widt){
            tag = 33;
        }else if (self.right1StartX == -widt){
            tag = 22;
        }else{
            tag = 11;
        }
    }
    [self onPageSelected:tag finishAnimaiton:YES ];
}
/**
 * 屏幕旋转时重新计算slideSettingMax的大小
 */
-(void)willTransitionToTraitCollection:(UITraitCollection *)newCollection withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    [super willTransitionToTraitCollection:newCollection withTransitionCoordinator:coordinator];
    CGSize size= [[UIScreen mainScreen] bounds].size;
    self.slideSettingMax=(size.width<size.height? size.width:size.height)-180;
}
@end

