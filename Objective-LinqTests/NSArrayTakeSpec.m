#import "Kiwi.h"

#import "NSArray+Take.h"

SPEC_BEGIN(NSArrayTakeSpec)

describe(@"NSArray+Take", ^{
    NSArray *integers = [NSArray arrayWithObjects:theValue(1), theValue(2), theValue(3), nil];

    it(@"takes the specified number of elements from the beginning of the array", ^{
        NSArray *firstTwo = [integers take:2];
        [[theValue([firstTwo count]) should] equal:theValue(2)];
        [[[firstTwo objectAtIndex:0] should] equal:theValue(1)];
    });
});

SPEC_END