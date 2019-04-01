#import "TinyURL.h"

@interface TinyURL()

@property (nonatomic, retain) NSMutableDictionary* idWhithUrl;
@property (nonatomic, retain) NSMutableDictionary* NumbersWhithId;
@end

@implementation TinyURL
 static NSInteger ids = 0;
NSString *alph = @"0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
NSString *alphWithspaces = @"0 1 2 3 4 5 6 7 8 9 a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z";

- (NSURL *)encode:(NSURL *)originalURL{
    ids++;
    NSString *longStr = originalURL.absoluteString;

    [[self idWhithUrl] setObject:longStr forKey:[NSNumber numberWithInteger:ids]];
    NSInteger number;
  if  ( ([longStr length]+ids)%2==0 )
      number = [longStr length]+ids*2*(int)[longStr characterAtIndex:[longStr length]-1]*62;
      else
          number =[longStr length]+ids*(int)[longStr characterAtIndex:[longStr length]-2]*124;
    [[self NumbersWhithId] setObject:[NSNumber numberWithInteger:ids] forKey:[NSNumber numberWithInteger:number]];
    NSMutableArray *arrToDecode = [[NSMutableArray alloc] init];
    while(number>0){
        int reminder = number%61;
        [arrToDecode addObject:[NSNumber numberWithInteger: reminder]];
        number = number/61;
    }
    NSMutableString *shortStr = [[NSMutableString alloc] initWithString:@"http://vk.cc/"] ;
    for(int i = [arrToDecode count]-1;i>=0;i--){
        char a =[alph characterAtIndex: [[arrToDecode objectAtIndex:i]integerValue ]];
        [shortStr appendString:[NSString stringWithFormat:@"%c",a]];
    }
    [arrToDecode release];
    NSURL* shortUrl = [NSURL URLWithString:shortStr];
    [shortStr release];
    return  shortUrl;
}

- (instancetype)init{
    self = [super init];
    if (self) {
    self.idWhithUrl = [[NSMutableDictionary alloc] init];
    self.NumbersWhithId = [[NSMutableDictionary alloc] init];
    }
    return self;
}
- (void)dealloc
{
    [_idWhithUrl release];
    [_NumbersWhithId release];
    [super dealloc];
}

- (NSURL *)decode:(NSURL *)shortenedURL{
    NSString* shortUrlStr = shortenedURL.lastPathComponent;
    NSInteger val = 0;
    NSArray  *alphabet = [alphWithspaces componentsSeparatedByString:@" "];
    for(int i =0; i<[shortUrlStr length];i++)
    {
        val+= [alphabet indexOfObject:[NSString stringWithFormat:@"%c",[shortUrlStr characterAtIndex:i]]]*pow(61,([shortUrlStr length]-i-1));
    }
    return [NSURL URLWithString:[self.idWhithUrl objectForKey: [self.NumbersWhithId objectForKey:[NSNumber numberWithInteger: val]]]];
}

/* There was an idea for encoding a URL without using mapkeys.
 To do this, each character in the URL was translated into (ASCII code -23),
 so that each character was represented by a two-digit number.
 And then this number is decomposed in powers of 100,
 so we would shorten it by 1 symbol every 3 symbols.
 I use long arithmetic for this encode.
 But because of the lack of time, I could not finish the idea to the end.
 
 
 const int tf = 25;
const int base =10;

struct numberArr{
    NSArray *celoe;
    NSArray *ostatok;
};

NSArray * vichet(NSArray* first, NSArray* second){
    int carry =0;
    NSMutableArray *a = [[NSMutableArray alloc]initWithArray:first ];
    NSMutableArray *b = [[NSMutableArray alloc]initWithArray:second ];
    for(int i =0;i<[b count]|| carry;i++){
        NSInteger aa = [[a objectAtIndex:i] integerValue];
        aa-=carry + (i<[b count]? [[b objectAtIndex:i] integerValue]:0);
        [a replaceObjectAtIndex:i withObject:[NSNumber numberWithInteger:aa]];
        carry = aa<0;
        if (carry){
            NSNumber *aaa  = [NSNumber numberWithInteger:[[a objectAtIndex:i]integerValue ] +10];
            [a replaceObjectAtIndex:i withObject:aaa];
        }
    }
    while([a count]>1 && [a lastObject]==0){
        [a removeObjectAtIndex:[a count]];
    }
    return a;
}

NSArray* Devide(NSArray* first, int second){
    int carry =0;
    NSMutableArray *a = [[NSMutableArray alloc] initWithArray:first];
    for ( int i = [first count]-1;i>=0; i--){
        long long curr = [a[i] integerValue]+ carry * 1ll* 10;
        a[i] = [NSNumber numberWithInteger:curr/second];
        carry =  curr % second;
    }
    while ([a count]>1 && [[a lastObject] integerValue]==0) {
        [a removeObjectAtIndex:[a count]-1];
    }
    return a;
}

NSArray *Multiply(NSArray *first, int second){
    int carry = 0;
    NSMutableArray *a = [[NSMutableArray alloc] initWithArray:first];
    for (int i=0; i<[a count] || carry; ++i) {
        if (i == [a count])
            [a addObject:[NSNumber numberWithInteger:0]];
        long long cur = carry + [a[i] integerValue] * 1ll * second;
        a[i] =  [NSNumber numberWithInteger:cur % 10];
        carry = cur / 10;
    }
    
    while ([a count]>1 && [[a lastObject] integerValue]==0) {
        [a removeObjectAtIndex:[a count]-1];
    }
    return a;
}



NSArray* UrlToArrInt(NSURL* originalURL){
    NSString *str = originalURL.absoluteString;
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (int i =0;i<[str length];i++){
        char a = [str characterAtIndex:i];
        NSNumber *c = [NSNumber numberWithInteger:(int)a-tf];
        NSNumber *celoe = [NSNumber numberWithInteger:[c integerValue]/10];
        NSNumber *ostatok = [NSNumber numberWithInteger:[c integerValue]%10];
        [arr addObject:celoe];
        [arr addObject:ostatok];
        
    }
    
    return arr;
}


*/



@end

