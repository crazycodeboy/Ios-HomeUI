
#import "CentreViewController.h"
#import "AppDelegate.h"
//#import "NewOrderViewController.h"
//#import "ForFetchViewController.h"
//#import "DrawUpViewController.h"
//#import "SignInViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVFoundation/AVCaptureDevice.h>
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
    // Do any additional setup after loading the view from its nib.
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    clickIndex = -1;
    self.isFirst = YES;
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
    
    if (self.isFirst == YES)
    {
        self.isFirst = NO;
        [self initUIView];
    }
}
-(void)initUIView
{
    self.rightLbl22.layer.cornerRadius = self.rightLbl22.frame.size.height;
    
    CGRect rect = self.bottomView.frame;
    rect.origin.y = [UIScreen mainScreen].bounds.size.height-self.bottomView.frame.size.height-64;
    rect.size.width = [UIScreen mainScreen].bounds.size.width;
    self.bottomView.frame = rect;
    self.upView.frame = CGRectMake(0, 0, rect.size.width, self.view.frame.size.height-self.bottomView.frame.size.height);
    self.rightView1.frame = self.upView.frame;
    self.rightView2.frame = CGRectMake(self.rightView1.frame.size.width, 0, self.rightView1.frame.size.width,self.rightView1.frame.size.height);
    self.rightView3.frame = CGRectMake(self.rightView1.frame.size.width*2, 0, self.rightView1.frame.size.width,self.rightView1.frame.size.height);
    self.rightView4.frame = CGRectMake(self.rightView1.frame.size.width*3, 0, self.rightView1.frame.size.width,self.rightView1.frame.size.height);
    
    float widt1 = [UIScreen mainScreen].bounds.size.width/4;
    self.rightView11.frame = CGRectMake(0, 0, widt1, self.bottomView.frame.size.height);
    self.rightView22.frame = CGRectMake(widt1, 0, widt1, self.bottomView.frame.size.height);
    self.rightView33.frame = CGRectMake(2*widt1, 0, widt1, self.bottomView.frame.size.height);
    self.rightView44.frame = CGRectMake(3*widt1, 0, widt1, self.bottomView.frame.size.height);

    UIStoryboard*mainSb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    rightViewContor1 =[mainSb instantiateViewControllerWithIdentifier:@"sb_new"];
    rightViewContor1.view.frame = self.rightView1.frame;
    [self.rightView1 addSubview:self.rightViewContor1.view];
//    [self.rightViewContor1 loadData2];
    
    rightViewContor2 =[mainSb instantiateViewControllerWithIdentifier:@"sb_fetch"];
    rightViewContor2.view.frame = self.rightView1.frame;
    [self.rightView2 addSubview:self.rightViewContor2.view];
//    [self.rightViewContor2 loadData2];
    
    rightViewContor3 = [mainSb instantiateViewControllerWithIdentifier:@"sb_draw"];
    rightViewContor3.view.frame = self.rightView1.frame;
    [self.rightView3 addSubview:self.rightViewContor3.view];
//    [self.rightViewContor3 loadData2];
    
    rightViewContor4 = [mainSb instantiateViewControllerWithIdentifier:@"sb_sign"];;
    rightViewContor4.view.frame = self.rightView1.frame;
    [self.rightView4 addSubview:self.rightViewContor4.view];
//    [self.rightViewContor4 loadData2];
    
    [self tabBarImage:11];
    [self.rightLbl11 setClipsToBounds:YES];
    self.rightLbl11.layer.cornerRadius = self.rightLbl11.frame.size.height/2;
    [self.rightLbl22 setClipsToBounds:YES];
    self.rightLbl22.layer.cornerRadius = self.rightLbl22.frame.size.height/2;
    [self.rightLbl33 setClipsToBounds:YES];
    self.rightLbl33.layer.cornerRadius = self.rightLbl33.frame.size.height/2;
    [self.rightLbl44 setClipsToBounds:YES];
    self.rightLbl44.layer.cornerRadius = self.rightLbl44.frame.size.height/2;
    [self m_setRight2Lbl:0 index:1];
    [self m_setRight2Lbl:0 index:2];
    [self m_setRight2Lbl:0 index:3];
    [self m_setRight2Lbl:0 index:4];
}

-(void)tabBarImage:(int)stly
{
    if (stly == 11)
    {
        [self.rightBtn11 setImage:[[UIImage imageNamed:@"新订单（点中）.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [self.rightBtn22 setImage:[[UIImage imageNamed:@"待取件.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [self.rightBtn33 setImage:[[UIImage imageNamed:@"待进站.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [self.rightBtn44 setImage:[[UIImage imageNamed:@"待签收.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    }
    else if (stly == 22)
    {
        [self.rightBtn11 setImage:[[UIImage imageNamed:@"新订单.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [self.rightBtn22 setImage:[[UIImage imageNamed:@"待取件（点中）.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [self.rightBtn33 setImage:[[UIImage imageNamed:@"待进站.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [self.rightBtn44 setImage:[[UIImage imageNamed:@"待签收.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    }
    else if (stly == 33)
    {
        [self.rightBtn11 setImage:[[UIImage imageNamed:@"新订单.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [self.rightBtn22 setImage:[[UIImage imageNamed:@"待取件.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [self.rightBtn33 setImage:[[UIImage imageNamed:@"待进站（点中）.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [self.rightBtn44 setImage:[[UIImage imageNamed:@"待签收.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    }
    else
    {
        [self.rightBtn11 setImage:[[UIImage imageNamed:@"新订单.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [self.rightBtn22 setImage:[[UIImage imageNamed:@"待取件.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [self.rightBtn33 setImage:[[UIImage imageNamed:@"待进站.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [self.rightBtn44 setImage:[[UIImage imageNamed:@"待签收（点中）.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    }
    
    clickIndex = stly;
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
            [self.mainViewContor rightMoveStatu:(int)sender.tag finishAnimaiton:YES needFresh:YES];
        }
    }
}

-(void)m_setRight2Lbl:(int)count index:(int)index
{
    if (count == 0)
    {
        if (index == 1)
        {
            [self.rightLbl11 setHidden:YES];
        }
        else if (index == 2)
        {
            [self.rightLbl22 setHidden:YES];
        }
        else if (index == 3)
        {
            [self.rightLbl33 setHidden:YES];
        }
        else
        {
            [self.rightLbl44 setHidden:YES];
        }
        
    }
    else
    {
        float pianyi = 15;
        if (index == 1)
        {
            self.rightLbl11.text = [NSString stringWithFormat:@"%d",count];
            float widt = [self m_getWidt_str:self.rightLbl11.text m_font:self.rightLbl11.font higt:self.rightLbl11.frame.size.height]+4;
            widt = widt>self.rightView11.frame.size.width?self.rightView11.frame.size.width:widt;
            widt = widt<self.rightLbl11.frame.size.height?self.rightLbl11.frame.size.height:widt;
            self.rightLbl11.frame = CGRectMake((self.rightView11.frame.size.width-widt)/2+pianyi, self.rightLbl11.frame.origin.y, widt, self.rightLbl11.frame.size.height);
            [self.rightLbl11 setHidden:NO];
        }
        else if (index == 2)
        {
            self.rightLbl22.text = [NSString stringWithFormat:@"%d",count];
            float widt = [self m_getWidt_str:self.rightLbl22.text m_font:self.rightLbl22.font higt:self.rightLbl22.frame.size.height]+4;
            widt = widt>self.rightView22.frame.size.width?self.rightView22.frame.size.width:widt;
            widt = widt<self.rightLbl22.frame.size.height?self.rightLbl22.frame.size.height:widt;
            self.rightLbl22.frame = CGRectMake((self.rightView22.frame.size.width-widt)/2+pianyi, self.rightLbl22.frame.origin.y, widt, self.rightLbl22.frame.size.height);
            [self.rightLbl22 setHidden:NO];
        }
        else if (index == 3)
        {
            self.rightLbl33.text = [NSString stringWithFormat:@"%d",count];
            float widt = [self m_getWidt_str:self.rightLbl33.text m_font:self.rightLbl33.font higt:self.rightLbl33.frame.size.height]+4;
            widt = widt>self.rightView33.frame.size.width?self.rightView33.frame.size.width:widt;
            widt = widt<self.rightLbl33.frame.size.height?self.rightLbl33.frame.size.height:widt;
            self.rightLbl33.frame = CGRectMake((self.rightView33.frame.size.width-widt)/2+pianyi, self.rightLbl33.frame.origin.y, widt, self.rightLbl33.frame.size.height);
            [self.rightLbl33 setHidden:NO];
        }
        else
        {
            self.rightLbl44.text = [NSString stringWithFormat:@"%d",count];
            float widt = [self m_getWidt_str:self.rightLbl44.text m_font:self.rightLbl44.font higt:self.rightLbl44.frame.size.height]+4;
            widt = widt>self.rightView44.frame.size.width?self.rightView44.frame.size.width:widt;
            widt = widt<self.rightLbl44.frame.size.height?self.rightLbl44.frame.size.height:widt;
            self.rightLbl44.frame = CGRectMake((self.rightView44.frame.size.width-widt)/2+pianyi, self.rightLbl44.frame.origin.y, widt, self.rightLbl44.frame.size.height);
            [self.rightLbl44 setHidden:NO];
        }
    }
}

#pragma mark - 宽高度自适应
- (float)m_getWidt_str:(NSString *)str m_font:(UIFont *)font higt:(float)higt
{
    CGSize size;
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil];
    size=[str boundingRectWithSize:CGSizeMake(MAXFLOAT, higt) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    return size.width;
}
#pragma mark   scan 代理
-(void)get_scanData2:(NSString *)expressidStr
{
    
}







@end
