
#import "CentreViewController.h"
#import "AppDelegate.h"
@interface CentreViewController ()
{
}
@property(nonatomic, assign) float isFirst;

@end


@implementation CentreViewController

@synthesize mainViewContor;
@synthesize rightViewContor1;
@synthesize rightViewContor2;
@synthesize rightViewContor3;
@synthesize rightViewContor4;
@synthesize clickIndex;
@synthesize upView;
@synthesize bottomView;
@synthesize rightView1;
@synthesize rightView2;
@synthesize rightView3;
@synthesize rightView4;
@synthesize rightView11;
@synthesize rightLbl11;
@synthesize rightBtn11;
@synthesize rightView22;
@synthesize rightLbl22;
@synthesize rightBtn22;
@synthesize rightView33;
@synthesize rightLbl33;
@synthesize rightBtn33;
@synthesize rightView44;
@synthesize rightLbl44;
@synthesize rightBtn44;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    clickIndex = -1;
    self.isFirst = YES;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.isFirst == YES){
        self.isFirst = NO;
        [self initUIView];
    }
}
-(void)initUIView{
    UIStoryboard*mainSb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    rightViewContor1 =[mainSb instantiateViewControllerWithIdentifier:@"sb_new"];
    rightViewContor1.view.frame = self.rightView1.frame;
    [self.rightView1 addSubview:self.rightViewContor1.view];
//    [self.rightViewContor1 loadData];
    
    rightViewContor2 =[mainSb instantiateViewControllerWithIdentifier:@"sb_fetch"];
    rightViewContor2.view.frame = self.rightView1.frame;
    [self.rightView2 addSubview:self.rightViewContor2.view];
//    [self.rightViewContor2 loadData];
    
    rightViewContor3 = [mainSb instantiateViewControllerWithIdentifier:@"sb_draw"];
    rightViewContor3.view.frame = self.rightView1.frame;
    [self.rightView3 addSubview:self.rightViewContor3.view];
//    [self.rightViewContor3 loadData];
    
    rightViewContor4 = [mainSb instantiateViewControllerWithIdentifier:@"sb_sign"];;
    rightViewContor4.view.frame = self.rightView1.frame;
    [self.rightView4 addSubview:self.rightViewContor4.view];
//    [self.rightViewContor4 loadData];
    
    [self setTabBarSelectedImage:11];
    [self initTabBarIndicator];
}
/**
 * 初始化TabBar指示器
 **/
-(void)initTabBarIndicator{
    [self.rightLbl11 setClipsToBounds:YES];
    self.rightLbl11.layer.cornerRadius = self.rightLbl11.frame.size.height/2;
    [self.rightLbl22 setClipsToBounds:YES];
    self.rightLbl22.layer.cornerRadius = self.rightLbl22.frame.size.height/2;
    [self.rightLbl33 setClipsToBounds:YES];
    self.rightLbl33.layer.cornerRadius = self.rightLbl33.frame.size.height/2;
    [self.rightLbl44 setClipsToBounds:YES];
    self.rightLbl44.layer.cornerRadius = self.rightLbl44.frame.size.height/2;
    [self setTipNum:22 lab:self.rightLbl11];
    [self setTipNum:1 lab:self.rightLbl22];
    [self setTipNum:0 lab:self.rightLbl33];
    [self setTipNum:99 lab:self.rightLbl44];
}
/**
 * 设置TabBar选中时显示的图片
 */
-(void)setTabBarSelectedImage:(int)tag{
    if (tag == 11){
        [self.rightBtn11 setImage:[[UIImage imageNamed:@"新订单（点中）.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [self.rightBtn22 setImage:[[UIImage imageNamed:@"待取件.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [self.rightBtn33 setImage:[[UIImage imageNamed:@"待进站.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [self.rightBtn44 setImage:[[UIImage imageNamed:@"待签收.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    }else if (tag == 22){
        [self.rightBtn11 setImage:[[UIImage imageNamed:@"新订单.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [self.rightBtn22 setImage:[[UIImage imageNamed:@"待取件（点中）.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [self.rightBtn33 setImage:[[UIImage imageNamed:@"待进站.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [self.rightBtn44 setImage:[[UIImage imageNamed:@"待签收.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    }else if (tag == 33){
        [self.rightBtn11 setImage:[[UIImage imageNamed:@"新订单.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [self.rightBtn22 setImage:[[UIImage imageNamed:@"待取件.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [self.rightBtn33 setImage:[[UIImage imageNamed:@"待进站（点中）.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [self.rightBtn44 setImage:[[UIImage imageNamed:@"待签收.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    }else{
        [self.rightBtn11 setImage:[[UIImage imageNamed:@"新订单.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [self.rightBtn22 setImage:[[UIImage imageNamed:@"待取件.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [self.rightBtn33 setImage:[[UIImage imageNamed:@"待进站.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [self.rightBtn44 setImage:[[UIImage imageNamed:@"待签收（点中）.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    }
    clickIndex = tag;
}


- (IBAction)doBtnAction:(UIButton *)sender
{
  if (sender.tag == 3)
    {
        
        if (self.mainViewContor.rightView.frame.origin.x > 0)
        {
            [self.mainViewContor onSwitchWithAnimaiton:YES];
        }
        else
        {
            [self.mainViewContor onSwitchWithAnimaiton:NO];
        }
    }
    else
    {
        if (clickIndex != sender.tag)
        {
            clickIndex = sender.tag;
            [self.mainViewContor onPageSelected:(int)sender.tag finishAnimaiton:YES];
        }
    }
}
/**
 *  设置指示器显示的数字
 **/
-(void)setTipNum:(int)count lab:(UILabel*)lab{
    lab.text=[NSString stringWithFormat:@"%d",count];
    if (count == 0){
        [lab setHidden:YES];
    }else{
        [lab setHidden:NO];
    }
}
@end
