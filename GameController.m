//
//  GameController.m
//  Threelow
//
//  Created by Esperanza on 2022-05-17.
//

#import "GameController.h"
#import "Dice.h"
#import "InputCollector.h"
//@"⚀", @"⚁", @"⚂", @"⚃", @"⚄", @"⚅"
//typedef NS_ENUM(char, DiceType) {
//  // options
//  ⚀, // 0
//  VideoGameTypeStrategy, // 1
//  VideoGameTypeAction, // 2
//  VideoGameTypeFPS // 3
//};

@implementation GameController

- (instancetype)init
{
  self = [super init];
  if (self) {
    _array = [NSMutableArray new];
    _undoArr = [NSMutableArray new];
    _held = [NSMutableArray new];
    
  }
  return self;
}

- (void) playDice {
  Dice *dice1 = [[Dice alloc]init];
  Dice *dice2 = [[Dice alloc]init];
  Dice *dice3 = [[Dice alloc]init];
  Dice *dice4 = [[Dice alloc]init];
  Dice *dice5 = [[Dice alloc]init];
  
  NSString *one = [dice1 randomizeValue];
  NSString *two = [dice2 randomizeValue];
  NSString *three = [dice3 randomizeValue];
  NSString *four = [dice4 randomizeValue];
  NSString *five = [dice5 randomizeValue];

//  NSString *printformat = [NSString stringWithFormat:@"%@ %@ %@ %@ %@",one, two, three, four, five];
  [_array addObject:one];
  [_array addObject:two];
  [_array addObject:three];
  [_array addObject:four];
  [_array addObject:five];
//  NSLog(@"%@", printformat);
  
  _undoArr = [[NSMutableArray alloc] initWithArray:_array copyItems:YES];
//  for (NSString* i in _array) {
//    NSLog(@"%@", i);
//  }

}

- (void) holdDie:(NSUInteger) indexOfDice andHold: (BOOL) hold {
  if (hold) {
    NSNumber *anumber = [NSNumber numberWithInteger: (indexOfDice - 1)];
    [_held addObject: anumber];
    NSString *replaceDice = [NSString stringWithFormat:@"[%@]",[_array objectAtIndex:(indexOfDice - 1)]];
    [_array replaceObjectAtIndex: (indexOfDice - 1) withObject:replaceDice];
    
    NSString *printformat = [NSString stringWithFormat:@"%@ %@ %@ %@ %@",[_array objectAtIndex:0],[_array objectAtIndex:1],[_array objectAtIndex:2],[_array objectAtIndex:3],[_array objectAtIndex:4]];
    NSLog(@"%@", printformat);
  } else {
    for (NSNumber *index in _held) {
      NSString *replaceDice = [_undoArr objectAtIndex:[index integerValue]];
      [_array replaceObjectAtIndex: [index integerValue] withObject:replaceDice];
    }
    NSString *printformat = [NSString stringWithFormat:@"%@ %@ %@ %@ %@",[_array objectAtIndex:0],[_array objectAtIndex:1],[_array objectAtIndex:2],[_array objectAtIndex:3],[_array objectAtIndex:4]];
    NSLog(@"%@", printformat);
  }
}

- (void) resetDice {
  if ([_held count] == 0) {
    NSLog(@"nothing can reset.");
  } else {
    [self holdDie:0 andHold:NO];
  }
}

- (void) displayVal:(NSInteger) remainTimes {
  if ([_array count] == 0 ) {
    NSLog(@"Please at least roll once.");
  } else {
    NSString *printformat = [NSString stringWithFormat:@"%@ %@ %@ %@ %@",[_array objectAtIndex:0],[_array objectAtIndex:1],[_array objectAtIndex:2],[_array objectAtIndex:3],[_array objectAtIndex:4]];
    
    NSInteger sum = 0;
    for (NSNumber *index in _held) {
      // @"⚂", @"⚃", @"⚄", @"⚅"
      if ([[_array objectAtIndex:[index integerValue]] isEqualToString:@"[⚀]"]) {
        sum += 1;
      } else if ([[_array objectAtIndex:[index integerValue]] isEqualToString:@"[⚁]"]) {
        sum += 2;
      } else if ([[_array objectAtIndex:[index integerValue]] isEqualToString:@"[⚂]"]) {
        sum += 0;
      } else if ([[_array objectAtIndex:[index integerValue]] isEqualToString:@"[⚃]"]) {
        sum += 4;
      } else if ([[_array objectAtIndex:[index integerValue]] isEqualToString:@"[⚁]"]) {
        sum += 5;
      } else if ([[_array objectAtIndex:[index integerValue]] isEqualToString:@"[⚁]"]) {
        sum += 6;
      }
    }
    NSString *output = [NSString stringWithFormat:@"\nRemaining Rolls: %ld\n----------------------\n--   Current Dice   --\n %@\n\n--   Total Score   --\nScore: %ld\n----------------------",(long)(5 - remainTimes),printformat,(long)sum];
    NSLog(@"%@",output);
  }
}


@end
