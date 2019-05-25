//
//  ZTViewController.m
//  ZTTextField
//
//  Created by zttina on 05/25/2019.
//  Copyright (c) 2019 zttina. All rights reserved.
//

#import "ZTViewController.h"
#import "ZTTextFieldsView.h"

@interface ZTViewController ()

@end

@implementation ZTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //外部调用
    ZTTextFieldsView *view = [[ZTTextFieldsView alloc] initWithFrame:CGRectMake(100, 100, 100, 50)
                                                           withColor:[UIColor redColor]];
    [self.view addSubview:view];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
