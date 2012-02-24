#import "NSArray+Drop.h"

@implementation NSArray(Drop)

- (NSArray *) drop:(int)count {
  NSMutableArray *result = [NSMutableArray arrayWithCapacity:[self count] - count];

  int counted = 0;
  for (id element in self) {
    if (++counted <= count) {
      continue;
    }

    [result addObject:element];
  }

  return result;
}

@end