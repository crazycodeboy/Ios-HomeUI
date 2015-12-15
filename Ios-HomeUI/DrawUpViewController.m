//
//  NewOrderViewController.m
//  Ios-HomeUI
//
//  Created by JiaPenghui on 15/12/15.
//  Copyright © 2015年 jph. All rights reserved.
//


#import "DrawUpViewController.h"
#import "AppDelegate.h"
//#import "WaitingGetInDetailViewController.h"
//#import "WrongMsgViewController.h"
//#import "DataCell.h"
//#import "HttpUtils.h"
//#import "MHProgress.h"
//#import "DEFINE.h"
@interface DrawUpViewController ()
{
     float _tableCellHeight;
}
@end

@implementation DrawUpViewController

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        self.dataArr = [NSMutableArray arrayWithCapacity:0];
//        self.data = [NSMutableData dataWithCapacity:0];
//    }
//    return self;
//}
//
//
//
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
////    self.view.backgroundColor=[UIColor whiteColor];
////    [self initTable];
//}
//
//-(void)initTable{
//    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64-49) style:UITableViewStylePlain];
//    table.dataSource = self;
//    table.delegate = self;
//    table.backgroundColor=[UIColor colorWithRed:236/255.f green:236/255.f blue:236/255.f alpha:1];
//    table.tag = 6666;
//    [table setSeparatorStyle:UITableViewCellSeparatorStyleNone];
//    [self.view addSubview:table];
////    
////    //实例化header
////    _header = [MJRefreshHeaderView header];
////    _header.scrollView = table;
////    _header.delegate = self;
//}
//
//-(void)loadData2
//{
//    if (APPDELEGATE.isEnter == 1)
//    {
//        [self loadData];
//    }
//    else
//    {
//        [self performSelector:@selector(loadData2) withObject:nil afterDelay:1];
//    }
//}
//
//-(void)loadData{
//      //离线缓存
//    NSData *data = [APPDELEGATE.m_dataBaseOperation get_HomeList:@"2"];
//    [self showData:data isLocation:NO];
//        HttpUtils *htUtil = [[HttpUtils alloc] initWithShowLoadingView:self.view];
//        NSDictionary *paramDic = @{@"type":@"3"};
//        [htUtil sendJsonData:GET url:[NSString stringWithFormat:@"%@/ios/homeList/getExpressList/1",KSDURL] withParam:paramDic success:^(ResponseInfo * _Nonnull info, NSDictionary * _Nonnull responseData) {
////            [_header endRefreshing];
//            //离线缓存
//            [self showData:self.data isLocation:YES];
//        } failure:^(ResponseInfo * _Nonnull info, NSError * _Nonnull error) {
////            [_header endRefreshing];
////            MHProgress *progressHud = [[MHProgress alloc] init];
////            [progressHud showTips:@"亲,网络不流畅喔" intInterval:1];
//        }];
////    [self.data resetBytesInRange:NSMakeRange(0, self.data.length)];
////    [self.data setLength:0];
////    
////    NSMutableURLRequest *req = [PostAsynClass postAsynWithURL:KSDURL andInterface:@"ksudi-star-api/ios/homeList/getExpressList/1" andKeyArr:@[@"type"] andValueArr:@[@"3"]];
////    
////    _connection = [NSURLConnection connectionWithRequest:req delegate:self];
////    [_connection start];
//}
//
//-(void)deleteIdFreshTable:(NSString*)str_id
//{
//    UITableView *table = (UITableView*)[self.view viewWithTag:6666];
//    for (NSDictionary *modelHere in self.dataArr)
//    {
//        if ([str_id isEqualToString:[NSString stringWithFormat:@"%@",[[modelHere objectForKey:@"id"] description]]])
//        {
//            [self.dataArr removeObject:modelHere];
//            [table reloadData];
//            break;
//        }
//    }
//}
//
//
//#pragma mark table代理
//
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return 1;
//}
//
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return _tableCellHeight;
//}
//
//-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    static NSString *iden = @"DataCell";
//    DataCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
//    if(cell == nil){
//         cell = [[DataCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
//        cell.backgroundColor=[UIColor whiteColor];
//    }
//    
//    NSDictionary *modelHere = self.dataArr[indexPath.section];
//    [cell fillData:modelHere highFrame:3];
//   _tableCellHeight = [cell getCellHeight];
//    return cell;
//}
//
//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return self.dataArr.count;
//}
//
//-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    UIView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
//    img.backgroundColor=[UIColor clearColor];
//    return img;
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//    UIView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
//    img.backgroundColor=[UIColor clearColor];
//    return img;
//}
//
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 10;
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    if (section == self.dataArr.count-1)
//    {
//        return 10;
//    }
//    else
//    {
//        return 0;
//    }
//}
//
//
//
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    
//    NSDictionary *model = self.dataArr[indexPath.section];
//    NSString *m_id = [[model objectForKey:@"id"] description];
//    
//    WaitingGetInDetailViewController *detail = [[WaitingGetInDetailViewController alloc] init];
//    detail.expressid=m_id;
//    
//    UINavigationController *nav=[[UINavigationController alloc] initWithRootViewController:detail];
//    [APPDELEGATE.mainViewContor m_prsentViewContor:nav];
//}
//
////#pragma mark 网络代理
////-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
////   [WrongMsgViewController showCodeMsg:@"405"];
////    [_header endRefreshing];
////}
////
////-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
////    
////}
////
////-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
////    [self.data appendData:data];
////}
////
////-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
////    
////    [_header endRefreshing];
////    
////    //离线缓存
////    [self showData:self.data isLocation:YES];
////}
////
//-(void)showData:(NSData *)data isLocation:(BOOL)loction
//{
//    if (data == nil)
//    {
//        return;
//    }
//    
//    NSError *error = nil;
//    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:self.data options:NSJSONReadingMutableLeaves error:&error];
//  
//    if ([[[dic objectForKey:@"code"] description] isEqualToString:@"0"]) {
//        
//        [self.dataArr removeAllObjects];
//        [self.dataArr addObjectsFromArray:dic[@"data"]];
//        
//        //刷新table
//        UITableView *table = (UITableView*)[self.view viewWithTag:6666];
//        [table reloadData];
//        
//        [APPDELEGATE.mainViewContor.centreViewCtor m_setRight2Lbl:(int)self.dataArr.count index:3];
//        
//        if (loction == YES)
//        {
//            //离线缓存
//            [APPDELEGATE.m_dataBaseOperation addOrFlash_HomeList:@"2" data:self.data];
//        }
//        
//    } else {
////        MHProgress *progressHud = [[MHProgress alloc] init];
////        [progressHud showTips:@"亲,网络不流畅喔" intInterval:1];
//    }
//}

//
//#pragma mark MJRefresh的代理
////开始的代理
//-(void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
//{
//    [MobClick event:refresh_hand label:refresh_hand_Lbl];
//    [self loadData];
//}
//- (void)dealloc {
//    [_header free];
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
