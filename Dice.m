//
//  Dice.m
//  Threelow
//
//  Created by Esperanza on 2022-05-17.
//

#import "Dice.h"

@implementation Dice

- (instancetype)init
{
  self = [super init];
  if (self) {
    _value = @"";
  }
  return self;
}

- (NSString *) randomizeValue {
  NSArray *array = [[NSArray alloc]initWithObjects:@"⚀", @"⚁", @"⚂", @"⚃", @"⚄", @"⚅", nil];
  uint32_t rnd = arc4random_uniform(5);
  _value = [array objectAtIndex:rnd];
  return _value;
}
@end
