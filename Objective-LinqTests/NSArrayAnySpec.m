#import "Kiwi.h"

#import "NSArray+Any.h"

SPEC_BEGIN(NSArrayAnySpec)

describe(@"NSArray+Any", ^{
    NSArray *integers = [NSArray arrayWithObjects:theValue(1), theValue(2), theValue(3), nil];
    
    it(@"does not mutate the source array", ^{
        [integers anyNumber:^(NSNumber *input) {
            return (BOOL)([input intValue] % 2 == 0);
        }];
        
        [[[integers objectAtIndex:0] should] equal:theValue(1)];
        [[[integers objectAtIndex:1] should] equal:theValue(2)];
        [[[integers objectAtIndex:2] should] equal:theValue(3)];
    });
    
    it(@"returns YES if the source array contains any elements matching the predicate", ^{
        BOOL anyEvenInteger = [integers anyNumber:^(NSNumber *input) {
            return (BOOL)([input intValue] % 2 == 0);
        }];
        
        [[theValue(anyEvenInteger) should] beYes];
    });
    
    it(@"returns NO if the source array contains no element matching the predicate", ^{
        BOOL anyMultipleOfFive = [integers anyNumber:^(NSNumber *input) {
            return (BOOL)([input intValue] % 5 == 0);
        }];
        
        [[theValue(anyMultipleOfFive) should] beNo];
    });
});

SPEC_END