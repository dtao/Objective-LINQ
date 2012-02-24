#import "Kiwi.h"

#import "NSArray+Drop.h"

SPEC_BEGIN(NSArrayDropSpec)

describe(@"NSArray+Drop", ^{
    NSArray *integers = [NSArray arrayWithObjects:theValue(1), theValue(2), theValue(3), nil];

    it(@"drops the specified number of elements from the beginning of the array", ^{
        NSArray *exceptFirst = [integers drop:1];
        [[theValue([exceptFirst count]) should] equal:theValue(2)];
        [[[exceptFirst objectAtIndex:0] should] equal:theValue(2)];
    });
});

SPEC_END