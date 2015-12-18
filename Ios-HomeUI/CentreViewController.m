
#import "CentreViewController.h"
#import "AppDelegate.h"
@interface CentreViewController ()
{}
@property(nonatomic, assign) float isFirst;
@end

@implementation CentreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.clickIndex = -1;
    self.isFirst = YES;
   }
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//      UINavigationController *mainNavVC = [[UINavigationController alloc] initWithRootViewController:self];
    self.rightViewContor2.mainNav=self.navigationController;
    self.rightViewContor3.mainNav=self.navigationController;
    self.rightViewContor4.mainNav=self.navigationController;
    self.rightViewContor1.mainNav=self.navigationController;

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
    self.rightViewContor1 =[mainSb instantiateViewControllerWithIdentifier:@"sb_new"];
    self.rightViewContor1.view.frame = self.rightView1.frame;
    [self.rightView1 addSubview:self.self.rightViewContor1.view];
//    [self.self.rightViewContor1 loadData];
    
    self.rightViewContor2 =[mainSb instantiateViewControllerWithIdentifier:@"sb_fetch"];
    self.rightViewContor2.view.frame = self.rightView1.frame;
    [self.rightView2 addSubview:self.self.rightViewContor2.view];
//    [self.self.rightViewContor2 loadData];
    
    self.rightViewContor3 = [mainSb instantiateViewControllerWithIdentifier:@"sb_draw"];
    self.rightViewContor3.view.frame = self.rightView1.frame;
    [self.rightView3 addSubview:self.self.rightViewContor3.view];
//    [self.self.rightViewContor3 loadData];
    
    self.rightViewContor4 = [mainSb instantiateViewControllerWithIdentifier:@"sb_sign"];;
    self.rightViewContor4.view.frame = self.rightView1.frame;
    [self.rightView4 addSubview:self.self.rightViewContor4.view];
//    [self.self.rightViewContor4 loadData];
    
    [self setTabBarSelectedImage:11];
    [self initTabBarIndicator];
}
-(void)initNavBar{
    UIButton *leftNaviBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftNaviBtn.tag = 3;
    leftNaviBtn.frame = CGRectMake(0, 0, 44, 44);
    [leftNaviBtn setImage:[UIImage imageNamed:@"导航菜单.png"] forState:UIControlStateNormal];
    [leftNaviBtn setImage:[UIImage imageNamed:@"导航菜单-选中.png"] forState:UIControlStateHighlighted];
    [leftNaviBtn addTarget:self action:@selector(doBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftNaviBtn];
    UIBarButtonItem *flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    flexible.width = -15.f;
    self.navigationItem.title=@"Ios-Home UI";
    [self.navigationItem setLeftBarButtonItems:@[flexible,leftItem]];
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
    [self setTipNum:0 lab:self.rightLbl11];
    [self setTipNum:0 lab:self.rightLbl22];
    [self setTipNum:0 lab:self.rightLbl33];
    [self setTipNum:0 lab:self.rightLbl44];
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
    self.clickIndex = tag;
}


- (IBAction)doBtnAction:(UIButton *)sender{
  if (sender.tag == 3){
        if (self.mainViewContor.rightView.frame.origin.x > 0){
            [self.mainViewContor onSwitchWithAnimaiton:YES isOpenOtherView:false];
        }else{
            [self.mainViewContor onSwitchWithAnimaiton:NO isOpenOtherView:false];
        }
    }else {
        if (self.clickIndex != sender.tag){
            self.clickIndex = sender.tag;
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
