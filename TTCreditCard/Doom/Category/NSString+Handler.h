//
//  NSString+Handler.h
//  AffiliatedBank
//
//  Created by Dian on 2017/12/27.
//  Copyright © 2017年 Dian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Handler)
//返回所属银行
+ (NSString *)returnBankName:(NSString*)idCard;
@end
