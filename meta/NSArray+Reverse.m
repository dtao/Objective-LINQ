@implementation NSArray(Reverse)

- (NSArray *) reverse {
  NSMutableArray *reversed = [NSMutableArray arrayWithCapacity:[self count]];

  NSEnumerator *e = [self reverseObjectEnumerator];
  for (id element in e) {
    [reversed addObject:element];
  }

  return reversed;
}

@end