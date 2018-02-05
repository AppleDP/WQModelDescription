//
//  ViewController.m
//  WQModelDescription
//
//  Created by iOS on 17/7/31.
//  Copyright © 2017年 shenbao. All rights reserved.
//

#import "ViewController.h"
#import "WQNewModel2.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    WQNewModel *newModel = [[WQNewModel alloc] init];
//    newModel.name = @"新模型";
//
//    NSSet *set = [NSSet setWithObjects:@1,@2, nil];
//    
//    WQModel *model0 = [[WQModel alloc] init];
//    model0.name = @"名字0";
//    model0.block = ^{
//        NSLog(@"log");
//    };
//    model0.age = 0;
//    model0.birth = [NSDate date];
//    model0.arr = @[@0, @0];
//    model0.set = set;
//    NSLog(@"model0 = %@",model0);
//
//    WQModel *model1 = [[WQModel alloc] init];
//    model1.name = @"name1";
//    model1.age = 1;
//    model1.birth = [NSDate date];
//    model1.arr = @[@1, @1];
//    
//    NSDictionary *dic = @{@"model0" : model0,
//                          @"model1" : model1};
//    NSLog(@"dic = %@", dic);
//    
//    NSArray *arr = @[model0];//, model1];
//    NSLog(@"arr = %@",arr);
    
    WQNewModel2 *newModel2 = [[WQNewModel2 alloc] init];
    newModel2.name = @"name0";
    newModel2.name1 = @"name1";
    newModel2.name2 = @"name2";
    newModel2.age = 0;
    newModel2.age1 = 1;
    newModel2.age2 = 2;
    newModel2.arr = @[self];
    NSLog(@"newModel2 = %@",newModel2);
}
@end










