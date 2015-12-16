//  Ios-HomeUI
//
//  Created by JiaPenghui on 15/12/15.
//  Copyright © 2015年 jph. All rights reserved.
//

#import "MainViewController.h"


@interface MainViewController ()<UIGestureRecognizerDelegate>

@property(nonatomic, strong) UITapGestureRecognizer *tapGestureRecognizer;
@property(nonatomic, assign) CGPoint panGestureStartLocation;
@property(nonatomic, assign) float rightStartX;
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
    self.slideSettingMax = [[UIScreen mainScreen] bounds].size.width-180;
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

-(void)m_prsentViewContor:(UIViewController*)contor
{
    [self presentViewController:contor animated:YES completion:nil];
}

#pragma mark - Gesture recognizers
- (void)tapGestureRecognized:(UITapGestureRecognizer *)tapGestureRecognizer
{
    UIGestureRecognizerState state = tapGestureRecognizer.state;
    CGPoint location = [tapGestureRecognizer locationInView:self.view];
    
    switch (state)
    {
        case UIGestureRecognizerStateEnded:
        {
            if (self.rightView.frame.origin.x == self.slideSettingMax)
            {
                if (location.x > self.slideSettingMax)
                {
                    [self rightStatu_finishAnimaiton:YES];
                }
            }
            break;
        }
        default:
            break;
    }
    
}
-(void)panGestureRecognized:(UIPanGestureRecognizer *)panGestureRecognizer
{
    UIGestureRecognizerState state = panGestureRecognizer.state;
    CGPoint location = [panGestureRecognizer locationInView:self.view];
    CGPoint velocity;
    velocity = [panGestureRecognizer velocityInView:self.rightView];
    switch (state)
    {
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
            if (delta > 0)
            {
                if (self.rightView.frame.origin.x < self.slideSettingMax)
                {
                    if (self.right1StartX >= 0)
                    {
                        if (delta <= self.slideSettingMax)
                        {
                            [self rightSlide_x:delta];
                        }
                    }
                    else
                    {
                        [self rightMoveSlide_x:self.right1StartX+delta];
                    }
                }
            }
            else if (delta < 0)
            {
                delta = -delta;
                if (self.rightView.frame.origin.x == 0)
                {
                    [self rightMoveSlide_x:self.right1StartX-delta];
                }
                else
                {
                    if (self.panGestureStartLocation.x > self.slideSettingMax)
                    {
                        [self rightSlide_x:self.rightStartX-delta];
                    }
                }
            }
            break;
        }
        case UIGestureRecognizerStateEnded:
        {
            if(velocity.x < -self.slideChangeSpeed)
            {
                if (self.rightView.frame.origin.x != 0)
                {
                    [self rightStatu_finishAnimaiton:YES];
                }
                else
                {
                    [self rightSpeedSlide_isLeft:YES needNext:YES];
                }
            }
            else if(velocity.x > self.slideChangeSpeed)
            {
                if (self.rightView.frame.origin.x != self.slideSettingMax)
                {
                    if (self.right1StartX == 0)
                    {
                        [self rightStatu_finishAnimaiton:NO];
                    }
                    else
                    {
                        [self rightSpeedSlide_isLeft:NO needNext:YES];
                    }
                }
            }
            else
            {
                CGFloat delta = 0.0f;
                delta = location.x - self.panGestureStartLocation.x;
                if (delta > 0)
                {
                    if (self.right1StartX == 0)
                    {
                        if (delta > self.slideChangeSetting)
                        {
                            [self rightStatu_finishAnimaiton:NO];
                        }
                        else
                        {
                            [self rightStatu_finishAnimaiton:YES];
                        }
                    }
                    else
                    {
                        if (delta < self.rightView.frame.size.width/2)
                        {
                            [self rightSpeedSlide_isLeft:NO needNext:NO];
                        }
                        else
                        {
                            [self rightSpeedSlide_isLeft:NO needNext:YES];
                        }
                    }
                }
                else if (delta < 0)
                {
                    NSLog(@"%f",delta);
                    if (self.rightStartX == 0)
                    {
                        if (delta < -self.rightView.frame.size.width/2)
                        {
                            [self rightSpeedSlide_isLeft:YES needNext:YES];
                        }
                        else
                        {
                            [self rightSpeedSlide_isLeft:YES needNext:NO];
                        }
                    }
                    else
                    {
                        if (self.rightView.frame.origin.x >= self.slideChangeSetting)
                        {
                            [self rightStatu_finishAnimaiton:NO];
                        }
                        else
                        {
                            [self rightStatu_finishAnimaiton:YES];
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

//left & right
-(void)rightStatu_finishAnimaiton:(BOOL)isRight
{
    float x;
    if (isRight == NO)
    {
        x = self.slideSettingMax;
    }
    else
    {
        x = 0;
    }
    [UIView animateWithDuration:self.animationTime delay:0 options:UIViewAnimationOptionCurveLinear animations:^
     {
         CGRect rect = self.rightView.frame;
         rect.origin.x = x;
         self.rightView.frame = rect;
         
         if (isRight == NO)
         {
             self.leftView.transform  = CGAffineTransformMakeScale(1, 1);
         }
         else
         {
             self.leftView.transform  = CGAffineTransformMakeScale(self.slideSettingTransform_x, self.slideSettingTransform_y);
         }
     } completion:^(BOOL finished)
     {
         if (isRight == YES)
         {
             [self.rightView removeGestureRecognizer:self.tapGestureRecognizer];
         }
         else
         {
             [self.rightView addGestureRecognizer:self.tapGestureRecognizer];
         }
     }
     ];
}
-(void)rightSlide_x:(float)x
{
    x = x>self.slideSettingMax?self.slideSettingMax:x;
    x = x<=0?0:x;
    CGRect rect = self.rightView.frame;
    rect.origin.x = x;
    self.rightView.frame = rect;
    
    float trans_x = self.slideSettingTransform_x-(x/self.slideSettingMax)*(self.slideSettingTransform_x-1) ;
    float trans_y = self.slideSettingTransform_y+(x/self.slideSettingMax)*(1-self.slideSettingTransform_y) ;
    self.leftView.transform  = CGAffineTransformMakeScale(trans_x, trans_y);
//    x = (x/self.slideSettingMax)*self.slideLeftX;
//    x = x>self.slideLeftX?self.slideLeftX:x;
}

//right max
-(void)rightMoveStatu:(int)tag finishAnimaiton:(BOOL)haveAnimation needFresh:(BOOL)fresh
{
    if (haveAnimation == YES)
    {
        [UIView animateWithDuration:self.animationTime delay:0 options:UIViewAnimationOptionCurveLinear animations:^
         {
             [self rightMaxShow:tag];
         } completion:^(BOOL finished)
         {
             if (fresh == YES)
             {
                 if (tag == 11)
                 {
//                     [MobClick event:home_page_btn_open_new_express  label:home_page_btn_open_new_express_Lbl];
//                     [self.centreViewCtor.rightViewContor1 loadData2];
                 }
                 else if (tag == 22)
                 {
//                     [MobClick event:home_page_btn_open_tobe_picup label:home_page_btn_open_tobe_picup_Lbl];
//                     [self.centreViewCtor.rightViewContor2 loadData2];
                 }
                 else if (tag == 33)
                 {
//                     [MobClick event:home_page_btn_open_tobe_site label:home_page_btn_open_tobe_site_Lbl];
//                     [self.centreViewCtor.rightViewContor3 loadData2];
                 }
                 else
                 {
//                     [MobClick event:home_page_btn_open_tobe_confirm label:home_page_btn_open_tobe_confirm];
//                     [self.centreViewCtor.rightViewContor4 loadData2];
                 }
             }
         }
         ];
    }
    else
    {
        [self rightMaxShow:tag];
    }
}
-(void)rightMaxShow:(int)tag;
{
    CGRect rect = self.centreViewCtor.upView.frame;
    CGRect rect1 = rect;
    CGRect rect2 = rect;
    CGRect rect3 = rect;
    CGRect rect4 = rect;
    
    if (tag == 11)
    {
        rect1.origin.x = 0;
        rect2.origin.x = self.centreViewCtor.upView.frame.size.width;
        rect3.origin.x = self.centreViewCtor.upView.frame.size.width*2;
        rect4.origin.x = self.centreViewCtor.upView.frame.size.width*3;
    }
    else if (tag == 22)
    {
        rect1.origin.x = -self.centreViewCtor.upView.frame.size.width;
        rect2.origin.x = 0;
        rect3.origin.x = self.centreViewCtor.upView.frame.size.width;
        rect4.origin.x = self.centreViewCtor.upView.frame.size.width*2;
    }
    else if (tag == 33)
    {
        rect1.origin.x = -self.centreViewCtor.upView.frame.size.width*2;
        rect2.origin.x = -self.centreViewCtor.upView.frame.size.width;
        rect3.origin.x = 0;
        rect4.origin.x = self.centreViewCtor.upView.frame.size.width;
    }
    else if (tag == 44)
    {
        rect1.origin.x = -self.centreViewCtor.upView.frame.size.width*3;
        rect2.origin.x = -self.centreViewCtor.upView.frame.size.width*2;
        rect3.origin.x = -self.centreViewCtor.upView.frame.size.width;
        rect4.origin.x = 0;
    }
    [self changeViewHorizontalPosition:self.centreViewCtor.rightView1 rect:rect1];
    [self changeViewHorizontalPosition:self.centreViewCtor.rightView2 rect:rect2];
    [self changeViewHorizontalPosition:self.centreViewCtor.rightView3 rect:rect3];
    [self changeViewHorizontalPosition:self.centreViewCtor.rightView4 rect:rect4];
    [self.centreViewCtor tabBarImage:tag];
}
-(void)changeViewHorizontalPosition:(UIView*)view rect:(CGRect)rect{
    CGRect finalRect=view.frame;
    finalRect.origin.x=rect.origin.x;
    view.frame=finalRect;
}
//all rightViev move
-(void)rightMoveSlide_x:(float)x;
{
    if (x < -self.centreViewCtor.upView.frame.size.width*3)
    {
        [self rightMaxShow:44];
    }
    else if (x > 0)
    {
        [self rightMaxShow:11];
    }
    else
    {
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

-(void)rightSpeedSlide_isLeft:(BOOL)flag needNext:(BOOL)isNext
{
    float widt = self.centreViewCtor.upView.frame.size.width;
    int tag;
    if (isNext == YES)
    {
        if (flag == YES)
        {
            if (self.right1StartX == -3*widt)
            {
                tag = 44;
                isNext = NO;
            }
            else if (self.right1StartX == -2*widt)
            {
                tag = 44;
            }
            else if (self.right1StartX == -widt)
            {
                tag = 33;
            }
            else
            {
                tag = 22;
            }
        }
        else
        {
            if (self.right1StartX == -3*widt)
            {
                tag = 33;
            }
            else if (self.right1StartX == -2*widt)
            {
                tag = 22;
            }
            else if (self.right1StartX == -widt)
            {
                tag = 11;
            }
            else
            {
                tag = 11;
            }
        }
    }
    else
    {
        if (self.right1StartX == -3*widt)
        {
            tag = 44;
        }
        else if (self.right1StartX == -2*widt)
        {
            tag = 33;
        }
        else if (self.right1StartX == -widt)
        {
            tag = 22;
        }
        else
        {
            tag = 11;
        }
    }
    [self rightMoveStatu:tag finishAnimaiton:YES needFresh:isNext];
}



@end

