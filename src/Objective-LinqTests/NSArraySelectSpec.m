#import "Kiwi.h"

#import "NSArray+Select.h"

SPEC_BEGIN(NSArraySelectSpec)

describe(@"NSArray+Select", ^{
    NSArray *integers = [NSArray arrayWithObjects:theValue(1), theValue(2), theValue(3), nil];
    
    it(@"does not mutate the source array", ^{
        [integers selectNumbers:^(NSNumber *input) {
            return (BOOL)([input intValue] % 2 == 0);
        }];
        
        [[[integers objectAtIndex:0] should] equal:theValue(1)];
        [[[integers objectAtIndex:1] should] equal:theValue(2)];
        [[[integers objectAtIndex:2] should] equal:theValue(3)];
    });
    
    it(@"creates a new array populated with the results of the mapping function", ^{
        NSArray *evenIntegers = [integers selectNumbers:^(NSNumber *input) {
            return (BOOL)([input intValue] % 2 == 0);
        }];
        
        [[[evenIntegers objectAtIndex:0] should] equal:theValue(2)];
    });
});

SPEC_END