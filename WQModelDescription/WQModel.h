//
//  WQModel.h
//  WQModelDescription
//
//  Created by iOS on 17/7/31.
//  Copyright © 2017年 shenbao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WQNewModel.h"

@interface WQModel : WQModelDescription
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, copy) NSDate *birth;
@property (nonatomic, copy) NSArray *arr;
@property (nonatomic, copy) NSSet *set;
@property (nonatomic, copy) dispatch_block_t block;

@property (nonatomic, strong) WQNewModel *model;
@end
