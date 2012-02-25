#import "Kiwi.h"

#import "NSArray+Reverse.h"

SPEC_BEGIN(NSArrayReverseSpec)

describe(@"NSArray+Take", ^{
    NSArray *integers = [NSArray arrayWithObjects:theValue(1), theValue(2), theValue(3), nil];

    it(@"does not mutate the source array", ^{
        [integers reverse];

        [[[integers objectAtIndex:0] should] equal:theValue(1)];
        [[[integers objectAtIndex:1] should] equal:theValue(2)];
        [[[integers objectAtIndex:2] should] equal:theValue(3)];
    });
    
    it(@"reverses the order of elements in the array", ^{
        NSArray *reversed = [integers reverse];
        [[[reversed objectAtIndex:0] should] equal:theValue(3)];
        [[[reversed objectAtIndex:1] should] equal:theValue(2)];
        [[[reversed objectAtIndex:2] should] equal:theValue(1)];
    });
});

SPEC_END