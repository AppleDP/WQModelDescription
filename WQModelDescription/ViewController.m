//
//  ViewController.m
//  WQModelDescription
//
//  Created by iOS on 17/7/31.
//  Copyright © 2017年 shenbao. All rights reserved.
//

#import "ViewController.h"
#import "WQModel.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WQNewModel *newModel = [[WQNewModel alloc] init];
    newModel.name = @"新模型";

    NSSet *set = [NSSet setWithObjects:@1,@2, nil];
    
    WQModel *model0 = [[WQModel alloc] init];
    model0.name = @"名字0";
    model0.block = ^{
        NSLog(@"log");
    };
    model0.age = 0;
    model0.birth = [NSDate date];
    model0.arr = @[@0, @0];
    model0.model = newModel;
    model0.set = set;
    NSLog(@"model0 = %@",model0);

    WQModel *model1 = [[WQModel alloc] init];
    model1.name = @"name1";
    model1.age = 1;
    model1.birth = [NSDate date];
    model1.arr = @[@1, @1];
    
    NSDictionary *dic = @{@"model0" : model0,
                          @"model1" : model1};
    NSLog(@"dic = %@", dic);
    
    NSArray *arr = @[model0];//, model1];
    NSLog(@"arr = %@",arr);
}
@end










