//
//  DrawUpViewController.h
//  Ios-HomeUI
//
//  Created by JiaPenghui on 15/12/15.
//  Copyright © 2015年 jph. All rights reserved.
//


#import <UIKit/UIKit.h>
//#import "PostAsynClass.h"
//#import "Preload.h"
//#import "NSString+URLEncoding.h"
//#import "MJRefresh.h"

@interface DrawUpViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,NSURLConnectionDataDelegate,NSURLConnectionDelegate>{
//    MJRefreshHeaderView *_header;
    NSURLConnection *_connection;
}

@property(nonatomic,retain)NSMutableArray *dataArr;
@property(nonatomic,retain)NSMutableData *data;

-(void)loadData2;
-(void)deleteIdFreshTable:(NSString*)str_id;

@end
