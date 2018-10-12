//
//  Worker.h
//  DemoExamples
//
//  Created by Zaur Giyasov on 12/10/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Worker : NSObject

@property (nonatomic) NSString *userString;

-(instancetype)initWithString:(NSString *)userString;

//-(NSString *)createArrayFromString:(NSString *)string;
-(int)создайМассивИзСтрокиИВерниКоличествоСимволов:(NSString *)строка;
-(NSString *)создайРеверсМассивИВерниСтрокойСРаспечаткойВЛоге:(NSString *)строка;
-(NSString *)создайСортированныйМассивИВерниСтрокойСРаспечаткойВЛоге:(NSString *)строка;
-(NSString *)создайCдвигМассиаНа:(int)наСколькоЭлементов вПравую:(BOOL)вправоЛи изСтроки:(NSString *)строка иВерниСтрокойСРаспечаткойВЛоге:(BOOL)распечататьЛог;
-(NSString *)проверкаНаПалиндром:(NSString *)проверяемаяСтрока;

@end

NS_ASSUME_NONNULL_END
