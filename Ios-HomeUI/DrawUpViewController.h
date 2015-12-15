//
//  DrawUpViewController.h
//  ksudi
//
//  Created by Krisc.Zampono on 14/12/19.
//  Copyright (c) 2014年 com.oeffect. All rights reserved.
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
