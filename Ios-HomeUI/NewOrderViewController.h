//
//  NewOrderViewController.h
//  ksudi
//
//  Created by Krisc.Zampono on 14/12/19.
//  Copyright (c) 2014年 com.oeffect. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIViewController.h>
#import <UIKit/UIKitDefines.h>
#import <UIKit/UITableView.h>
//#import "PostAsynClass.h"
//#import "Preload.h"
//#import "NSString+URLEncoding.h"

@interface NewOrderViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,retain)NSMutableArray *dataArr;
@property(nonatomic,retain)NSMutableData *data;
@property(nonatomic,retain)NSMutableData *submitData;
@property(nonatomic,retain)NSString *assignid;

//-(void)loadData2;
//-(void)loadData;
-(void)deleteIdFreshTable:(NSString*)str_id;

@end
