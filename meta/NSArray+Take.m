@implementation NSArray(Take)

- (NSArray *) take:(int)count {
  NSMutableArray *result = [NSMutableArray arrayWithCapacity:[self count] - count];

  int counted = 0;
  for (id element in self) {
    if (++counted > count) {
      break;
    }

    [result addObject:element];
  }

  return result;
}

@end