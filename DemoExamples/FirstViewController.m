//
//  FirstViewController.m
//  DemoExamples
//
//  Created by Zaur Giyasov on 12/10/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import "FirstViewController.h"
#import "Worker.h"

@interface FirstViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
- (IBAction)перевернутьКнопка:(UIButton *)sender;
- (IBAction)сдвинутьВлевоКнопка:(UIButton *)sender;
- (IBAction)сдвинутьВправоКнопка:(UIButton *)sender;
- (IBAction)посчитатьСимволыКнопка:(UIButton *)sender;
- (IBAction)сортироватьКнопка:(UIButton *)sender;
- (IBAction)проверкаПалиндромКнопка:(UIButton *)sender;
- (IBAction)очиститьРезультатКнопка:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UILabel *выводРезультатаЛейбл;
@property (nonatomic) Worker *выполняйка;
@property (nonatomic) NSString *исходныеДанные;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self подготовитьСвоиПеременныеКРаботе];
}

-(void)подготовитьСвоиПеременныеКРаботе {
    self.выводРезультатаЛейбл.text = @"Здесь появится результат";
    self.исходныеДанные = [NSString stringWithFormat:@"%@", @""];
    self.выполняйка = [[Worker alloc] initWithString:self.исходныеДанные];
    self.textField.delegate = self;
    self.textField.placeholder = @"Введите сюда целое число";
}


- (IBAction)перевернутьКнопка:(UIButton *)sender {
    printf("%s\n", __FUNCTION__);
    NSString *результатВыполняйки = [NSString stringWithFormat:@"%@", [self.выполняйка создайРеверсМассивИВерниСтрокойСРаспечаткойВЛоге:self.исходныеДанные]];
    self.выводРезультатаЛейбл.text = результатВыполняйки;
}

- (IBAction)сдвинутьВлевоКнопка:(UIButton *)sender {
    printf("%s\n", __FUNCTION__);
    // двигаю на Х вправо - да
    int Х = 2;
    BOOL даВправоСЛогами = NO;
    
    NSString *результатВыполняйки = [NSString stringWithFormat:@"%@", [self.выполняйка создайCдвигМассиаНа:Х вПравую:даВправоСЛогами изСтроки:self.исходныеДанные иВерниСтрокойСРаспечаткойВЛоге:!даВправоСЛогами]];
    
    self.выводРезультатаЛейбл.text = результатВыполняйки;
}

- (IBAction)сдвинутьВправоКнопка:(UIButton *)sender {
    printf("%s\n", __FUNCTION__);
    // двигаю на Х вправо - да
    int Х = 2;
    BOOL даВправоСЛогами = YES;
    
    NSString *результатВыполняйки = [NSString stringWithFormat:@"%@", [self.выполняйка создайCдвигМассиаНа:Х вПравую:даВправоСЛогами изСтроки:self.исходныеДанные иВерниСтрокойСРаспечаткойВЛоге:даВправоСЛогами]];

    self.выводРезультатаЛейбл.text = результатВыполняйки;
}

- (IBAction)посчитатьСимволыКнопка:(UIButton *)sender {
    printf("%s\n", __FUNCTION__);
    NSString *результатВыполняйки = [NSString stringWithFormat:@"Символов : %d", [self.выполняйка создайМассивИзСтрокиИВерниКоличествоСимволов:self.исходныеДанные]];
    self.выводРезультатаЛейбл.text = результатВыполняйки;
}

- (IBAction)сортироватьКнопка:(UIButton *)sender {
    printf("%s\n", __FUNCTION__);
    NSString *результатВыполняйки = [NSString stringWithFormat:@"%@", [self.выполняйка создайСортированныйМассивИВерниСтрокойСРаспечаткойВЛоге:self.исходныеДанные]];
    self.выводРезультатаЛейбл.text = результатВыполняйки;
}

- (IBAction)очиститьРезультатКнопка:(UIButton *)sender {
    printf("%s\n", __FUNCTION__);
    self.выводРезультатаЛейбл.text = @"Очищено";
}

- (IBAction)проверкаПалиндромКнопка:(UIButton *)sender {
    printf("%s\n", __FUNCTION__);
    NSString *результат = [NSString stringWithString:[self.выполняйка проверкаНаПалиндром:self.исходныеДанные]];
    NSLog(@"%@", результат);
    self.выводРезультатаЛейбл.text = результат;
}

@end

@implementation FirstViewController (textFieldDelegate)

-(void)обновлениеИсходныхДанных:(UITextField *)textField {
    self.исходныеДанные = [NSString stringWithFormat:@"%d", [textField.text intValue]];
    NSLog(@"исходныеДанные = %@", self.исходныеДанные);
}

// UITextField Delegates
-(void)textFieldDidBeginEditing:(UITextField *)textField {
    printf("TextField did begin editing method called\n");
    [self обновлениеИсходныхДанных:textField];
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    printf("TextField did end editing method called\(textField.text!)\n");
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    printf("TextField should begin editing method called\n");
    return true;
}

-(BOOL)textFieldShouldClear:(UITextField *)textField {
    printf("TextField should clear method called\n");
    self.выводРезультатаЛейбл.text = @"Здесь появится результат";
    [self обновлениеИсходныхДанных:textField];
    return true;
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    printf("TextField should end editing method called\n");
    self.выводРезультатаЛейбл.text = @"Здесь появится результат";
    [self обновлениеИсходныхДанных:textField];
    return true;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    printf("While entering the characters this method gets called\n");
    
    if (string) {
        self.выводРезультатаЛейбл.text = @"Не забудь нажать \"продолжить\"";
    }
    return true;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    printf("TextField should return method called\n");
    [textField resignFirstResponder];
    return true;
}

@end
