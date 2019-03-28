#import <Foundation/Foundation.h>
/*
 A roman translator Brutus was hired by a merchant.
 Brutus will be responsible for translating arabic numerals to roman and vise-versa
 You need to help him and implement a couple of handy methods.
 Roman numbers are represented by 7 different letters:

 Symbol       Value
 I             1
 V             5
 X             10
 L             50
 C             100
 D             500
 M             1000

 For example, two is written as II in Roman numeral, just two one's added together. Twelve is written as, XII, which is simply X + II. The number twenty seven is written as XXVII, which is XX + V + II.

 Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

 I can be placed before V (5) and X (10) to make 4 and 9.
 X can be placed before L (50) and C (100) to make 40 and 90.
 C can be placed before D (500) and M (1000) to make 400 and 900.
 */

@interface RomanTranslator : NSObject
/**
 Arabic to roman numbers converter

 @param arabicString a regular (arabic) number string
 @return a roman representation
 */
- (NSString *)romanFromArabic:(NSString *)arabicString;
/**
 Roman to arabic numbers converter

 @param romanString a roman number string
 @return an arabic number string
 */
- (NSString *)arabicFromRoman:(NSString *)romanString;
@end
