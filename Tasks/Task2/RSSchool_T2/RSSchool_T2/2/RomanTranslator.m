#import "RomanTranslator.h"

@implementation RomanTranslator
- (NSString *)romanFromArabic:(NSString *)arabicString{
    NSArray *roman = @[@"I",@"V",@"X",@"L",@"C",@"D",@"M"];
    NSArray *arabic = @[@"1",@"5",@"10",@"50",@"100",@"500",@"1000"];
    NSMutableString *str = [[[NSMutableString alloc] init] autorelease];

    NSInteger value = [arabicString integerValue];
 
    NSInteger reminder, intPart;
    
    for(int i = 6;i>=0;i--){
        reminder = value % [[arabic objectAtIndex:i] integerValue];
        intPart = value / [[arabic objectAtIndex:i] integerValue];
        if(intPart==0 && i%2 ==0 && i!=0){
            intPart = (value + [[arabic objectAtIndex:i-2] integerValue])/ [[arabic objectAtIndex:i] integerValue];
                if (intPart ==1){
                    [str appendString:[roman objectAtIndex:i-2]];
                    reminder = (value + [[arabic objectAtIndex:i-2] integerValue]) ;
                    i++;
                }
        }
        else if(intPart==0 && i-1%2==0 &&i>=1){
            intPart = (value + [[arabic objectAtIndex:i-1] integerValue])/ [[arabic objectAtIndex:i] integerValue];
            if (intPart ==1){
                [str appendString:[roman objectAtIndex:i-1]];
                reminder = (value + [[arabic objectAtIndex:i-1] integerValue]) ;
                i++;
                }
        }
        else{
            for(int j = 0;j<intPart;j++){
                [str appendString:[roman objectAtIndex:i]];
            }
            if( i>2 && i%2 ==0 && value + [[arabic objectAtIndex:i-2]integerValue] / [[arabic objectAtIndex:i] integerValue] !=0  )
            i++;
        }
        value = reminder;
    }
    
    return  str;
}


- (NSString *)arabicFromRoman:(NSString *)romanString{
    NSMutableString *reverseRoman = [[NSMutableString alloc] init ];
    NSArray *roman = @[@"I",@"V",@"X",@"L",@"C",@"D",@"M"];
    NSArray *arabic = @[@"1",@"5",@"10",@"50",@"100",@"500",@"1000"];
    while ([romanString length]!=[reverseRoman length]) {
        NSRange range = NSMakeRange([romanString length]-[reverseRoman length]-1, 1);
        [reverseRoman appendString: [romanString substringWithRange:range]];
    }
    NSMutableArray *reverseRomanArr = [[NSMutableArray alloc] init];
    [reverseRoman enumerateSubstringsInRange:NSMakeRange(0, [reverseRoman length])
                                options:(NSStringEnumerationByComposedCharacterSequences)
                             usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                 [reverseRomanArr addObject:substring];
                             }];
    [reverseRoman  release];
    
    NSInteger answer =0;
    for(int i =1;i<= [reverseRomanArr count];i++){
        answer += [[arabic objectAtIndex: [roman indexOfObject:[reverseRomanArr objectAtIndex:i-1]]] integerValue];
        if(i<[reverseRomanArr count]&&[[arabic objectAtIndex: [roman indexOfObject:[reverseRomanArr objectAtIndex:i-1]]] integerValue]>[[arabic objectAtIndex: [roman indexOfObject:[reverseRomanArr objectAtIndex:i]]] integerValue]){
            answer-=[[arabic objectAtIndex: [roman indexOfObject:[reverseRomanArr objectAtIndex:i]]] integerValue];
            i++;
        }
    }
    [reverseRomanArr release];
    NSString *answ = [[[NSString alloc] initWithFormat:@"%li", (long)answer] autorelease];
    return answ;
}



@end
