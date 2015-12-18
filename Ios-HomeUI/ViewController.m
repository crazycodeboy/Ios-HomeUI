//
//  ViewController.m
//  Ios-HomeUI
//
//  Created by JiaPenghui on 15/12/15.
//  Copyright © 2015年 jph. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)open:(id)sender {
    TestViewController*vc=[self.storyboard instantiateViewControllerWithIdentifier:@"test"];
    [self.mainNav pushViewController:vc animated:true ];
}
@end
