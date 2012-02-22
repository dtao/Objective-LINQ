#import "Kiwi.h"

#import "NSArray+Dictionary.h"

SPEC_BEGIN(NSArrayDictionarySpec)

describe(@"NSArrayDictionary", ^{
    NSArray *strings = [NSArray arrayWithObjects:@"apple", @"banana", @"cupcake", nil];

    it(@"does not mutate the source array", ^{
        [strings dictionaryOfStringsWithNumberKeys:^(NSString *input) {
            return [NSNumber numberWithInt:input.length];
        }];

        [[[strings objectAtIndex:0] should] equal:@"apple"];
        [[[strings objectAtIndex:1] should] equal:@"banana"];
        [[[strings objectAtIndex:2] should] equal:@"cupcake"];
    });

    it(@"creates a new dictionary populated with keys computed by the mapping function", ^{
        NSDictionary *stringsByLength = [strings dictionaryOfStringsWithNumberKeys:^(NSString *input) {
            return [NSNumber numberWithInt:input.length];
        }];

        [[[stringsByLength objectForKey:theValue(5)] should] equal:@"apple"];
        [[[stringsByLength objectForKey:theValue(6)] should] equal:@"banana"];
        [[[stringsByLength objectForKey:theValue(7)] should] equal:@"cupcake"];
    });
});

SPEC_END

