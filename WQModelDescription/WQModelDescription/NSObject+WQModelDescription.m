//
//  NSObject+WQModelDescription.m
//  WQModelDescription
//
//  Created by iOS on 17/7/31.
//  Copyright © 2017年 shenbao. All rights reserved.
//

#import "NSObject+WQModelDescription.h"
#import <objc/runtime.h>


#pragma mark NSObject Description
@implementation NSObject (WQModelNSObjectDescription)
- (NSString *)description {
    return [self modelDescriptionWithIndent:0];
}

- (NSString *)debugDescription {
    return [self modelDescriptionWithIndent:0];
}

- (NSString *)modelDescriptionWithIndent:(NSInteger)level {
    uint count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    NSMutableString *mStr = [NSMutableString string];
    NSMutableString *tab = [NSMutableString stringWithString:@""];
    for (int index = 0; index < level; index ++) {
        [tab appendString:@"\t"];
    }
    [mStr appendString:@"{\n"];
    for (int index = 0; index < count; index ++) {
        NSString *lastSymbol = index + 1 == count ? @"" : @";";
        objc_property_t property = properties[index];
        NSString *name = @(property_getName(property));
        id value = [self valueForKey:name];
        [self dictionaryFormatWithMStr:mStr
                                   tab:tab
                                  name:name
                                 value:value
                            lastSymbol:lastSymbol
                                indent:level];
    }
    [mStr appendFormat:@"%@}",tab];
    free(properties);
    return [NSString stringWithFormat:@"<%@ : %p> %@",
            NSStringFromClass([self class]),
            self,
            mStr];
}

- (void)dictionaryFormatWithMStr:(NSMutableString *)mStr
                             tab:(NSMutableString *)tab
                            name:(id)name
                           value:(id)value
                      lastSymbol:(NSString *)lastSymbol
                          indent:(NSInteger)level{
    if ([NSBundle bundleForClass:[value class]] == [NSBundle mainBundle]) {
        // 自定义类
        if ([value respondsToSelector:@selector(modelDescriptionWithIndent:)]) {
            [mStr appendFormat:@"\t%@%@ = %@%@\n",
             tab,
             name,
             [value modelDescriptionWithIndent:level + 1],
             lastSymbol];
            return;
        }
    }else {
        // 系统类
        if ([value respondsToSelector:@selector(descriptionWithLocale:indent:)]) {
            [mStr appendFormat:@"\t%@%@ = %@%@\n",
             tab,
             name,
             [value descriptionWithLocale:[NSLocale systemLocale]
                                   indent:level + 1],
             lastSymbol];
            return;
        }
    }
    [mStr appendFormat:@"\t%@%@ = %@%@\n",
     tab,
     name,
     value,
     lastSymbol];
}

- (void)arrayFormatWithMStr:(NSMutableString *)mStr
                        tab:(NSMutableString *)tab
                      value:(id)value
                 lastSymbol:(NSString *)lastSymbol
                     indent:(NSInteger)level {
    if ([NSBundle bundleForClass:[value class]] == [NSBundle mainBundle]) {
        // 自定义类
        if ([value respondsToSelector:@selector(modelDescriptionWithIndent:)]) {
            [mStr appendFormat:@"\t%@%@%@\n",
             tab,
             [value modelDescriptionWithIndent:level + 1],
             lastSymbol];
            return;
        }
    }else {
        // 系统类
        if ([value respondsToSelector:@selector(descriptionWithLocale:indent:)]) {
            [mStr appendFormat:@"\t%@%@%@\n",
             tab,
             [value descriptionWithLocale:[NSLocale systemLocale]
                                   indent:level + 1],
             lastSymbol];
            return;
        }
    }
    [mStr appendFormat:@"\t%@%@%@\n",
     tab,
     value,
     lastSymbol];
}
@end


#pragma mark NSArray Description
@implementation NSArray (WQModelNSArrayDescription)
- (NSString *)descriptionWithLocale:(id)locale
                             indent:(NSUInteger)level {
    NSMutableString *mStr = [NSMutableString string];
    NSMutableString *tab = [NSMutableString stringWithString:@""];
    for (int index = 0; index < level; index ++) {
        [tab appendString:@"\t"];
    }
    [mStr appendString:@"(\n"];
    for (int index = 0; index < self.count; index ++) {
        NSString *lastSymbol = (self.count == index + 1) ? @"":@",";
        id value = self[index];
        [self arrayFormatWithMStr:mStr
                              tab:tab
                            value:value
                       lastSymbol:lastSymbol
                           indent:level];
    }
    [mStr appendFormat:@"%@)",tab];
    return mStr;
}

- (NSString *)debugDescription {
    return [self descriptionWithLocale:[NSLocale systemLocale]];
}
@end


#pragma mark NSDictionary Description
@implementation NSDictionary (WQModelNSDictionaryDescription)
- (NSString *)descriptionWithLocale:(id)locale
                             indent:(NSUInteger)level {
    NSMutableString *mStr = [NSMutableString string];
    NSMutableString *tab = [NSMutableString stringWithString:@""];
    for (int index = 0; index < level; index++) {
        [tab appendString:@"\t"];
    }
    [mStr appendString:@"{\n"];
    NSArray *allKey = self.allKeys;
    for (int index = 0; index < allKey.count; index++) {
        id value = self[allKey[index]];
        NSString *lastSymbol = (allKey.count == index + 1) ? @"":@";";
        [self dictionaryFormatWithMStr:mStr
                                   tab:tab
                                  name:allKey[index]
                                 value:value
                            lastSymbol:lastSymbol
                                indent:level];
    }
    [mStr appendFormat:@"%@}",tab];
    return mStr;
}

- (NSString *)debugDescription {
    return [self descriptionWithLocale:[NSLocale systemLocale]];
}
@end


#pragma mark NSSet Description
@implementation NSSet (WQModelNSSetDescription)
- (NSString *)descriptionWithLocale:(id)locale
                             indent:(NSUInteger)level {
    NSMutableString *mStr = [NSMutableString string];
    NSMutableString *tab = [NSMutableString stringWithString:@""];
    for (int index = 0; index <level; index ++) {
        [tab appendString:@"\t"];
    }
    [mStr appendString:@"{(\n"];
    for (id value in [self allObjects]) {
        NSString *lastSymbol = [value isEqual:[[self allObjects] lastObject]] ? @"" : @",";
        [self arrayFormatWithMStr:mStr
                              tab:tab
                            value:value
                       lastSymbol:lastSymbol
                           indent:level];
    }
    [mStr appendFormat:@"%@)}",tab];
    return mStr;
}

- (NSString *)debugDescription {
    return [self descriptionWithLocale:[NSLocale systemLocale]];
}
@end




