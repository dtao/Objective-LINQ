#import "Kiwi.h"

#import "NSArray+Map.h"

SPEC_BEGIN(NSArrayMapSpec)

describe(@"NSArray+Map", ^{
    NSArray *strings = [NSArray arrayWithObjects:@"1", @"2", @"3", nil];
    
    it(@"does not mutate the source array", ^{
        [strings mapStringsToNumbers:^(NSString *input) {
            return [NSNumber numberWithInt:[input intValue]];
        }];
        
        [[[strings objectAtIndex:0] should] equal:@"1"];
        [[[strings objectAtIndex:1] should] equal:@"2"];
        [[[strings objectAtIndex:2] should] equal:@"3"];
    });
    
    it(@"creates a new array populated with the results of the mapping function", ^{
        NSArray *numbers = [strings mapStringsToNumbers:^(NSString *input) {
            return [NSNumber numberWithInt:[input intValue]];
        }];
        
        [[[numbers objectAtIndex:0] should] equal:theValue(1)];
        [[[numbers objectAtIndex:1] should] equal:theValue(2)];
        [[[numbers objectAtIndex:2] should] equal:theValue(3)];
    });
});

SPEC_END