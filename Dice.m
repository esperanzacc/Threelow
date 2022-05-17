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
    _value = 0;
  }
  return self;
}

- (void) randomizeValue {
  NSInteger randomVal = arc4random_uniform(5) + 1;
  _value = randomVal;
}
@end
