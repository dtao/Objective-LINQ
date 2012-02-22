#import "Kiwi.h"

#import "NSArray+All.h"

SPEC_BEGIN(NSArrayAllSpec)

describe(@"NSArray+All", ^{
    NSArray *integers = [NSArray arrayWithObjects:theValue(1), theValue(2), theValue(3), nil];
    
    it(@"does not mutate the source array", ^{
        [integers allNumbers:^(NSNumber *input) {
            return (BOOL)([input intValue] > 0);
        }];
        
        [[[integers objectAtIndex:0] should] equal:theValue(1)];
        [[[integers objectAtIndex:1] should] equal:theValue(2)];
        [[[integers objectAtIndex:2] should] equal:theValue(3)];
    });
    
    it(@"returns YES if all elements in the source array match the predicate", ^{
        BOOL allPositiveIntegers = [integers allNumbers:^(NSNumber *input) {
            return (BOOL)([input intValue] > 0);
        }];
        
        [[theValue(allPositiveIntegers) should] beYes];
    });
    
    it(@"returns NO if the source array contains no element matching the predicate", ^{
        BOOL allEvenIntegers = [integers allNumbers:^(NSNumber *input) {
            return (BOOL)([input intValue] % 2 == 0);
        }];
        
        [[theValue(allEvenIntegers) should] beNo];
    });
});

SPEC_END