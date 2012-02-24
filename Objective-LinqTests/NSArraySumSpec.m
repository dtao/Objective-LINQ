#import "Kiwi.h"

#import "NSArray+Sum.h"

SPEC_BEGIN(NSArraySumSpec)

describe(@"NSArray+Select", ^{
    NSArray *integers = [NSArray arrayWithObjects:theValue(1), theValue(2), theValue(3), nil];

    it(@"calculates the sum of elements in the array", ^{
        [[theValue([integers sumInts]) should] equal:theValue(6)];
    });
});

SPEC_END