//
//  Worker.m
//  DemoExamples
//
//  Created by Zaur Giyasov on 12/10/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import "Worker.h"

@interface Worker()
//
@end

@implementation Worker

-(instancetype)init {
    return [self initWithString:@""];
}

-(instancetype)initWithString:(NSString *)userString {
    self = [super init];
    if (self) {
        self.userString = userString;
    }
    return self;
}

// Всяческая абота с расчетами
// 1 Создать массив из строки
-(int)создайМассивИзСтрокиИВерниКоличествоСимволов:(NSString *)строка {
    printf("\n%s\n", __FUNCTION__);
    // Создать массив из строки
    // printf("Создать массив из строки:\n");
    // printf("Новый массив из константы по числу элементов в стороке\n");
    // cи массив пустой
    int count = (int)строка.length;
    int stringArray[count];
    // си строка
    // char *cstr = [строка cStringUsingEncoding:NSUTF8StringEncoding];
    char *cstr = [строка UTF8String];
    
    // printf("Заполнение массива: \n");
    for (int i = 0; i < count; i++) {
        char charFromString = cstr[i];
        stringArray[i] = charFromString;
    }
    // вывод на печать исходного массива
    printf("Вывод на печать си массива: \n");
    [self printCArray:stringArray numberOfElement:count asDigital:NO];
    printf("\n");
    printf("Элементов в массиве: %d\n", count);
    return count;
}

// 2 Создать реверс массив
-(NSString *)создайРеверсМассивИВерниСтрокойСРаспечаткойВЛоге:(NSString *)строка {
    printf("\n%s\n", __FUNCTION__);
    // 2 Создать реверс массив
    // Создать массив
    int count = (int)строка.length;
    int reverseTemp[count];
    int b; // буфер значения
    // меняем местами первый и последний элент, потом второй и предпоследний - парами!
    // если четно - то пары, если не четно - средний остается как есть
    for (int i = 0; i < count/2; i++) {
        b = reverseTemp[i];
        reverseTemp[i] = reverseTemp[count-i-1];
        reverseTemp[count-i-1] = b;
    }
    // вывод на печать нового массива (реверс)
    printf("Вывод на печать нового массива (реверс): \n");
    [self printCArray:reverseTemp numberOfElement:count asDigital:NO];
    printf("\n");
    
    // создание строки из строки (для лейбла)
    return [self reverseString:строка];
}

// 3 Создать отсортированный (по возрастанию) массив
-(NSString *)создайСортированныйМассивИВерниСтрокойСРаспечаткойВЛоге:(NSString *)строка {
    printf("\n%s\n", __FUNCTION__);
    // printf("Создать отсортированный (по возрастанию) массив:\n");

    // Создать массив
    int count = (int)строка.length;
    int sortTemp[count];

    // си строка
    // char *cstr = [строка cStringUsingEncoding:NSUTF8StringEncoding];
    char *cstr = [строка UTF8String];
    
    // printf("Заполнение массива: \n");
    for (int i = 0; i < count; i++) {
        char charFromString = cstr[i];
        sortTemp[i] = charFromString;
    }
    
    // печать исходного массива
    printf("Вывод на печать исходного массива (реверс): \n");
    [self printCArray:sortTemp numberOfElement:count asDigital:NO];
    printf("\n");
    
    // сортировка выбором наибольшего элемента и перемещением его в конец
    // за каждый проход просмотр элементов на 1 меньше - так как наибольший уже ставится в конец
    int j = count - 1;
    int ids; // индекс наибольшего
    int m; // буфер
    while (j > 0) {
        ids = 0;
        for (int i = 0; i <= j; i++) {
            if (sortTemp[i] > sortTemp[ids]) ids = i;
        }
        
        m = sortTemp[ids];
        sortTemp[ids] = sortTemp[j];
        sortTemp[j] = m;
        j -= 1;
    }
    
    // вывод нового отсортированного массива на печать
    printf("Вывод на печать отсортированного массива (реверс): \n");
    [self printCArray:sortTemp numberOfElement:count asDigital:NO];
    printf("\n");
    
    // создание стринга из си массива интов для лейбла
    NSMutableString *str1 = [[NSMutableString alloc] initWithCapacity:count];
    
    for (int i = 0; i < count; i++) {
        char charFromCArr = sortTemp[i];
        [str1 appendString:[NSString stringWithFormat:@"%c", charFromCArr]];
    }
    
    return str1.copy;
}

// 4 Создать сдвиг массиа на N элементов
-(NSString *)создайCдвигМассиаНа:(int)наСколькоЭлементов вПравую:(BOOL)вправоЛи изСтроки:(NSString *)строка иВерниСтрокойСРаспечаткойВЛоге:(BOOL)распечататьЛог {
    
    printf("\n%s\n", __FUNCTION__);
    // printf("\nСоздать сдвиг массиа на N элементов:\n");
    // Создать массив
    int count = (int)строка.length;
    char *cstr = [строка UTF8String];
    
    int sdvig1Temp[count]; // заполняем исходными данными
    // printf("Заполнение массива: \n");
    for (int i = 0; i < count; i++) {
        char charFromString = cstr[i];
        sdvig1Temp[i] = charFromString;
    }
    
    if (распечататьЛог) {
        // печать исходного массива
        printf("Вывод на печать исходного массива: \n");
        [self printCArray:sdvig1Temp numberOfElement:count asDigital:NO];
        printf("\n");
    }
    
    ///////////////////////////////////
    // деление массва на 2 части
    // (1 2 3 4 5 6 7 8 9 0)
    // (1 2)(3 4 5 6 7 8 9 0)
    // реверс каждой части
    // (2 1)(0 9 8 7 6 5 4 3)
    // склейка и реверс всего что вышло
    // (3 4 5 6 7 8 9 0 1 2)
    ///////////////////////////////////
    
//    printf("сдвиг влево на %d элементов \n", наСколькоЭлементов);
//
//    int d = 0; // буфер
//    int c1 = count - наСколькоЭлементов; // 10-4 = 6
//
//    // реверс первой части
//    for (int l = 0; l < наСколькоЭлементов/2; l++) {
//        d = sdvig1Temp[l];
//        sdvig1Temp[l] = sdvig1Temp[наСколькоЭлементов-l-1];
//        sdvig1Temp[наСколькоЭлементов-l-1] = d;
//    }
//
//    // реверс второй часчти
//    for (int l = наСколькоЭлементов, s = 0; s < c1/2; l++, s++) {
//        d = sdvig1Temp[l];
//        sdvig1Temp[l] = sdvig1Temp[count-s-1];
//        sdvig1Temp[count-s-1] = d;
//    }
//
//    // реверс полного массива
//    for (int l = 0; l < count/2; l++) {
//        d = sdvig1Temp[l];
//        sdvig1Temp[l] = sdvig1Temp[count-l-1];
//        sdvig1Temp[count-l-1] = d;
//    }
//
//    // вывод нового отсортированного массива на печать
//    [self printCArray:sdvig1Temp numberOfElement:count asDigital:NO];
//    printf("\n");
//
//
//    printf("Исходный массив:\n");
//    [self printCArray:sdvig2Temp numberOfElement:count asDigital:NO];
//    printf("\n");
    
//    // сдвиг влево на 4 элемента
//    наСколькоЭлементов = 2;
//    printf("сдвиг вправо на %d элементов \n", наСколькоЭлементов);
//    // новый
//    c1 = count - наСколькоЭлементов; // 10-4 = 6
//
//    // реверс первой части
//    for (int l = c1, s = 0; s < наСколькоЭлементов/2; l++, s++) {
//        d = sdvig2Temp[l];
//        sdvig2Temp[l] = sdvig2Temp[count-s-1];
//        sdvig2Temp[count-s-1] = d;
//    }
//
//    // реверс второй часчти
//    for (int l = 0, s = 0; s < c1/2; l++, s++) {
//        d = sdvig2Temp[l];
//        sdvig2Temp[l] = sdvig2Temp[c1-s-1];
//        sdvig2Temp[c1-s-1] = d;
//    }
//
//    // реверс полного массива
//    for (int l = 0; l < count/2; l++) {
//        d = sdvig2Temp[l];
//        sdvig2Temp[l] = sdvig2Temp[count-l-1];
//        sdvig2Temp[count-l-1] = d;
//    }
    
    int boofer = 0;
    // сдвиг
    if (!вправоЛи) {
        for (int i = 0; i < наСколькоЭлементов/2; i++) {
            // реверс первой части массива
            boofer = sdvig1Temp[i];
            sdvig1Temp[i] = sdvig1Temp[наСколькоЭлементов - 1 - i];
            sdvig1Temp[наСколькоЭлементов - i - 1] = boofer;
        }
        
        for (int i = наСколькоЭлементов, s = 0; s < (count-наСколькоЭлементов)/2; i++, s++) {
            // реверс второй части массива
            boofer = sdvig1Temp[i];
            sdvig1Temp[i] = sdvig1Temp[count - 1 - s];
            sdvig1Temp[count - 1 - s] = boofer;
        }
        
    } else {
        
        for (int i = count-наСколькоЭлементов, s = 0; s < (наСколькоЭлементов)/2; i++, s++) {
            // реверс второй части массива
            boofer = sdvig1Temp[i];
            sdvig1Temp[i] = sdvig1Temp[count - 1 - s];
            sdvig1Temp[count - 1 - s] = boofer;
        }
        
        for (int i = 0, s = 0; i < (count-наСколькоЭлементов)/2; i++, s++) {
            // реверс первой части массива
            boofer = sdvig1Temp[i];
            sdvig1Temp[i] = sdvig1Temp[count-наСколькоЭлементов - 1 - i];
            sdvig1Temp[count-наСколькоЭлементов - i - 1] = boofer;
        }
    }
    // не зависимо от право/лево - реверс массива
    for (int i = 0; i < count / 2; i++) {
        // реверс массива
        boofer = sdvig1Temp[i];
        sdvig1Temp[i] = sdvig1Temp[count - 1 - i];
        sdvig1Temp[count - i - 1] = boofer;
    }
    
    if (распечататьЛог) {
        // вывод нового отсортированного массива на печать
        printf("Вывод на печать отсортированного массива: \n");
        [self printCArray:sdvig1Temp numberOfElement:count asDigital:NO];
        printf("\n");
    }
    
    // создание стринга из си массива интов для лейбла
    NSMutableString *str1 = [[NSMutableString alloc] initWithCapacity:count];
    
    for (int i = 0; i < count; i++) {
        char charFromCArr = sdvig1Temp[i];
        [str1 appendString:[NSString stringWithFormat:@"%c", charFromCArr]];
    }
    
    return str1.copy;
}

// Проверка на палиндром
-(NSString *)проверкаНаПалиндром:(NSString *)проверяемаяСтрока {
    if ([self этаСтрокаПалиндромИлиНет:проверяемаяСтрока]) {
        return [NSString stringWithFormat:@"%@", @"Это палиндром"];
    } else {
        return [NSString stringWithFormat:@"%@", @"Это не палиндром"];
    }
}

-(BOOL)этаСтрокаПалиндромИлиНет:(NSString *)проверяемаяСтрока {
    NSString *подговленнаяСтрокаБезПробеловСобеихСторон = [self строкаБезНевидимыхСимволовВключаяПробелыСпередиИСзади:проверяемаяСтрока];
    NSString *строкаСоВсемиБуквамиВНижнемРегистре = подговленнаяСтрокаБезПробеловСобеихСторон.lowercaseString;
    NSString *совсемБезПробелов = [self строкаСовсемБезПробелов:строкаСоВсемиБуквамиВНижнемРегистре];
    // так же как реверс массива, сравниваем символы первый и последний
    // для этого мы делим пополам строку/массив и начинаем сравнение
    NSInteger len = совсемБезПробелов.length; // длинна
    for (NSInteger i = 0; i < len/2; i++) {
        unichar времянка = [совсемБезПробелов characterAtIndex:i];
        if (времянка != [совсемБезПробелов characterAtIndex:len-i-1]) {
            return NO;
        }
    }
    return YES;
}

// Обрезание пробелов в начале и конце строки
-(NSString *)строкаБезНевидимыхСимволовВключаяПробелыСпередиИСзади:(NSString *)проверяемаяСтрока {
    NSCharacterSet *сетИзСимволовПустышекКоторыеНеВидны = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    // Обрезаем первые пробелы и сохраняем в новую строку
    NSUInteger i = 0;
    while (i < проверяемаяСтрока.length && [сетИзСимволовПустышекКоторыеНеВидны characterIsMember:[проверяемаяСтрока characterAtIndex:i]]) {
        i++;
    }
    
    NSString* строкаБезСимволовПустышек = [NSString stringWithString:[проверяемаяСтрока substringFromIndex:i]]; //полуготовый вариант
    
    // Обрезаем пробелы с конца строки и возвращаем уже полностью "готовую" строку из этого метода
    NSUInteger l = строкаБезСимволовПустышек.length;
    while (l > 0 && [сетИзСимволовПустышекКоторыеНеВидны characterIsMember:[строкаБезСимволовПустышек characterAtIndex:l - 1]]) {
        l--;
    }
    
    return [строкаБезСимволовПустышек substringToIndex:l];
}

// Обрезание пробелов по всей строке
-(NSString *)строкаСовсемБезПробелов:(NSString *)проверяемаяСтрока {
    return [проверяемаяСтрока stringByReplacingOccurrencesOfString:@" " withString:@""];
}



// https://stackoverflow.com/questions/6720191/reverse-nsstring-text
- (NSString *)reverseString:(NSString *)input {
    
    NSUInteger len = [input length];
    unichar *buffer = malloc(len * sizeof(unichar));
    if (buffer == nil) return nil; // error!
    [input getCharacters:buffer];
    
    // reverse string; only need to loop through first half
    for (NSUInteger stPos=0, endPos=len-1; stPos < len/2; stPos++, endPos--) {
        unichar temp = buffer[stPos];
        buffer[stPos] = buffer[endPos];
        buffer[endPos] = temp;
    }
    
    return [[NSString alloc] initWithCharactersNoCopy:buffer length:len freeWhenDone:YES];
}


// печать си массива
-(void)printCArray:(int *)arr numberOfElement:(int)num asDigital:(BOOL)digital
{
    if (digital) {
        for (int i = 0; i < num; i++) printf("%d ",arr[i]);
    } else {
        for (int i = 0; i < num; i++) printf("%s ",&arr[i]);
    }
}



@end
