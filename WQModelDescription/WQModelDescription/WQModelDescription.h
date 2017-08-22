//
//  NSObject+WQModelDescription.h
//  WQModelDescription
//
//  Created by iOS on 17/7/31.
//  Copyright © 2017年 shenbao. All rights reserved.
//

/**
 Console 输出模型内容分类工具,支持 LLDB 命令行
 */
#import <Foundation/Foundation.h>

#pragma mark Model Description
@interface WQModelDescription : NSObject
@end


#pragma mark NSArray Description
@interface NSArray (WQModelNSArrayDescription)
@end


#pragma mark NSDictionary Description
@interface NSDictionary (WQModelNSDictionaryDescription)
@end


#pragma mark NSSet Description
@interface NSSet (WQModelNSSetDescription)
@end
